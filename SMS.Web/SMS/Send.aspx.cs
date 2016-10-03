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

                SaveSMS(noHP, message);
            }
            else
            {
                // Bot Attack, non validated !
                Response.Redirect("~/Default.aspx");
            }
        }

        private void SaveSMS(string noHP, string message)
        {
            string itemID = "";
            using (k5k34_dbEntities context = new k5k34_dbEntities())
            {
                SMSitem item = new SMSitem()
                {
                    Id = Guid.NewGuid().ToString().ToUpper(),
                    SendTo = noHP,
                    Content = message,
                    SendDate = null,
                    SendSchedule = null,
                    Deleted = false,
                    CreatedAt = DateTimeOffset.UtcNow,
                    Status = "Pending",
                    UniqueKey = Common.GetUniqueKey(6)
                };
                itemID = item.Id;
                context.SMSitems.Add(item);
                context.SaveChanges();
            }

            QueueSMS(itemID);

            Response.Redirect("Success");
        }

        private void QueueSMS(string itemID)
        {
            var storageAccount = CloudStorageAccount.Parse(ConfigurationManager.ConnectionStrings["AzureWebJobsStorage"].ToString());

            CloudQueueClient queueClient = storageAccount.CreateCloudQueueClient();
            queue = queueClient.GetQueueReference("smsqueue");
            queue.CreateIfNotExists();
            var queueMessage = new CloudQueueMessage(itemID);
            queue.AddMessage(queueMessage);
        }
    }
}