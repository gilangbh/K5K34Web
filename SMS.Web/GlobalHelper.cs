using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Queue;
using SMSCommon;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace SMS.Web
{
    public class GlobalHelper
    {
        static CloudQueue queue;

        public static void QueueSMS(string itemID)
        {
            var storageAccount = CloudStorageAccount.Parse(ConfigurationManager.ConnectionStrings["AzureWebJobsStorage"].ToString());

            CloudQueueClient queueClient = storageAccount.CreateCloudQueueClient();
            queue = queueClient.GetQueueReference("smsqueue");
            queue.CreateIfNotExists();
            var queueMessage = new CloudQueueMessage(itemID);
            queue.AddMessage(queueMessage);
        }

        public static void SaveSMS(string noHP, string message, string uniqueID, string sender)
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
                    UniqueKey = uniqueID,
                    SendFrom = !string.IsNullOrEmpty(sender) ? sender : null
                };
                uniqueID = item.UniqueKey;
                itemID = item.Id;
                context.SMSitems.Add(item);
                context.SaveChanges();
            }

            QueueSMS(itemID);
        }
    }
}