using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Azure.WebJobs;
using System.Net;
using System.Xml;
using SMSCommon;
using System.Diagnostics;

namespace SMSJob
{
    public class Functions
    {
        // This function will get triggered/executed when a new message is written 
        // on an Azure Queue called queue.
        public static void ProcessSendSMS([QueueTrigger("smsqueue")] string message, TextWriter log)
        {
            string userkey= Environment.GetEnvironmentVariable("ZENZIVAKEY");
            string passkey = Environment.GetEnvironmentVariable("ZENZIVASECRET");
            
            k5k34_dbEntities context = new k5k34_dbEntities();
            List<SMSitem> items = context.SMSitems.Where(x => x.Id == message).ToList();

            foreach (var item in items)
            {
                string appendedMessage = item.Content + " - http://s.id/smsgratis";
                HttpWebRequest request = WebRequest.Create("https://reguler.zenziva.net/apps/smsapi.php?userkey=" + userkey + "&passkey=" + passkey + "&nohp=" + item.SendTo + "&pesan=" + appendedMessage) as HttpWebRequest;
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();

                XmlDocument xmlDoc = new XmlDocument();
                xmlDoc.Load(response.GetResponseStream());

                XmlNode status = xmlDoc.SelectSingleNode("response//status");

                if (status.InnerText == "0")
                {
                    
                    log.WriteLine("SMS ID: " + message);
                    log.WriteLine("STATUS: SENT");
                    log.WriteLine("SMS Sent: " + DateTimeOffset.UtcNow);
                    item.SendDate = DateTimeOffset.UtcNow;
                    item.Status = "Sent";
                    context.SaveChanges();
                }
                else
                {
                    log.WriteLine("SMS ID: " + message);
                    log.WriteLine("STATUS: FAILED");
                    item.Status = "Failed";
                    context.SaveChanges();
                }

                response.Close();
            }
        }
    }
}