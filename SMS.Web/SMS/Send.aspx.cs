using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using hbehr.recaptcha;
using SMS.Web;
using Microsoft.WindowsAzure.Storage.Queue;
using Microsoft.WindowsAzure.Storage;
using System.Configuration;
using System.Diagnostics;
using SMSCommon;
using System.Text.RegularExpressions;

namespace SMS.Web.SMS
{
    public partial class Send : BasePage
    {
        string noHP = "";
        string message = "";
        string sendFrom = "";
        string serverStatus = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            //ClientScript.GetPostBackEventReference(LinkButtonSendMessage, string.Empty);

            if (!IsPostBack)
            {
                TextBoxNomorHP.Value = "";
                TextAreaMessageContent.Value = "";
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

                if (Request.QueryString["hp"] != null)
                {
                    noHP = Request.QueryString["hp"].ToString();

                    TextBoxNomorHP.Value = Regex.Replace(noHP, @"\D", "");
                }

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
                if (Common.GetServerStatus() != "Online")
                {
                    Response.Redirect("Send");
                }
                if (TextAreaMessageContent.InnerText.Length < 135)
                {
                    noHP = TextBoxNomorHP.Value;
                    message = TextAreaMessageContent.Value;
                    sendFrom = TextBoxSender.Value;

                    string uniqueID = Common.GetUniqueKey(6);

                    GlobalHelper.SaveSMS(noHP, message, uniqueID, sendFrom);

                    Response.Redirect("Success?uniqueid=" + uniqueID);
                }
                else
                {
                    Response.Redirect("Send");
                }
            }
            else
            {
                // Bot Attack, non validated !
                Response.Redirect("Send");
            }
        }
    }
}