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

namespace SMS.Web.Dev
{
    public partial class Bulk : System.Web.UI.Page
    {
        
        string noHP = "";
        string message = "";

        CloudQueue queue;

        protected void Page_Load(object sender, EventArgs e)
        {
            //ClientScript.GetPostBackEventReference(LinkButtonSendMessage, string.Empty);

            if (!IsPostBack)
            {
                TextAreaNomorHP.Value = "";
                TextAreaMessageContent.Value = "";
                TextAreaNomorHP.Attributes.Add("placeholder", "08XXXXXXXXX\n08XXXXXXXXX");

                if (Request.QueryString["exceedmax"] == null)
                {
                    PanelError.Visible = false;
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

                if (noHPs.Length > 5)
                {
                    Response.Redirect("Bulk?exceedmax=true");
                }
                else
                {
                    string uniqueID = Common.GetUniqueKey(6);
                    for (int i = 0; i < noHPs.Length; i++)
                    {
                        GlobalHelper.SaveSMS(noHPs[i], message, uniqueID);
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