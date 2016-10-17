using hbehr.recaptcha;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Queue;
using SMSCommon;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SMS.Web.SMS
{
    public partial class BulkSend : BasePage
    {
        
        string noHP = "";
        string message = "";
        string serverStatus = "";

        CloudQueue queue;

        protected void Page_Load(object sender, EventArgs e)
        {
            //ClientScript.GetPostBackEventReference(LinkButtonSendMessage, string.Empty);

            if (!IsPostBack)
            {
                TextAreaNomorHP.Value = "";
                TextAreaMessageContent.Value = "";
                TextAreaNomorHP.Attributes.Add("placeholder", "08XXXXXXXXX\n08XXXXXXXXX");

                serverStatus = Common.GetServerStatus();
                LiteralServerStatus.Text = serverStatus;

                if (serverStatus == "Dalam Perbaikan")
                {
                    H6ServerStatus.Attributes["class"] = "text-warning text-center";
                }
                if (serverStatus == "Offline")
                {
                    H6ServerStatus.Attributes["class"] = "text-danger text-center";
                }
                if (serverStatus == "Online")
                {
                    H6ServerStatus.Attributes["class"] = "text-success text-center";
                }

                if (Request.QueryString["exceedmax"] == null)
                {
                    PanelError.Visible = false;
                }

                String userAgent;
                userAgent = Request.UserAgent;

                //LabelUserAgent.Text = userAgent;

                if (!this.IsUserAgentMatch)
                {
                    Response.Redirect("Update");
                }
            }
        }

        protected void LinkButtonSendMessage_Click(object sender, EventArgs e)
        {
            HttpRequest req = HttpContext.Current.Request;

            string userResponse = req.Params["g-recaptcha-response"];
            bool validCaptcha = ReCaptcha.ValidateCaptcha(userResponse);

            if (validCaptcha)
            {
                string[] noHPs = TextAreaNomorHP.Value.Split(new string[] { Environment.NewLine }, StringSplitOptions.None);
                message = TextAreaMessageContent.Value;

                if (Common.GetServerStatus() != "Online")
                {
                    Response.Redirect("Send");
                }
                if (TextAreaMessageContent.InnerText.Length < 135)
                {
                    if (noHPs.Length > 5)
                    {
                        Response.Redirect("Bulk?exceedmax=true");
                    }
                    else
                    {
                        string uniqueID = Common.GetUniqueKey(6);
                        for (int i = 0; i < noHPs.Length; i++)
                        {
                            GlobalHelper.SaveSMS(noHPs[i], message, uniqueID, "");

                            Response.Redirect("BulkSent?uniqueid=" + uniqueID);
                        }
                    }
                }
            }
            else
            {
                // Bot Attack, non validated !
                Response.Redirect("Bulk");
            }
        }
    }
}