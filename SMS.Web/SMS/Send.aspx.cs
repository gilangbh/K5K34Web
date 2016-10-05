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
    public partial class Send : System.Web.UI.Page
    {
        string noHP = "";
        string message = "";

        CloudQueue queue;

        protected void Page_Load(object sender, EventArgs e)
        {
            //ClientScript.GetPostBackEventReference(LinkButtonSendMessage, string.Empty);

            if (!IsPostBack)
            {
                TextBoxNomorHP.Value = "";
                TextAreaMessageContent.Value = "";

                if (Request.QueryString["hp"] != null)
                {
                    noHP = Request.QueryString["hp"].ToString();

                    TextBoxNomorHP.Value = Regex.Replace(noHP, @"\D", "");
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
                noHP = TextBoxNomorHP.Value;
                message = TextAreaMessageContent.Value;
                string uniqueID = Common.GetUniqueKey(6);

                GlobalHelper.SaveSMS(noHP, message, uniqueID);

                Response.Redirect("Success?uniqueid=" + uniqueID);
            }
            else
            {
                // Bot Attack, non validated !
                Response.Redirect("Send");
            }
        }
    }
}