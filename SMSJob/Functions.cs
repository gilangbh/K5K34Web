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
            string userkey = "u2eif5";
            string passkey = "k5k341hfgj";

            k5k34_dbEntities context = new k5k34_dbEntities();
            List<SMSitem> items = context.SMSitems.Where(x => x.Id == message).ToList();

            foreach (var item in items)
            {
                string appendedMessage = item.Content + " - SMS Gratis PRO app";
                HttpWebRequest request = WebRequest.Create("https://reguler.zenziva.net/apps/smsapi.php?userkey=" + userkey + "&passkey=" + passkey + "&nohp=" + item.SendTo + "&pesan=" + appendedMessage) as HttpWebRequest;
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();

                XmlDocument xmlDoc = new XmlDocument();
                xmlDoc.Load(response.GetResponseStream());

                XmlNode status = xmlDoc.SelectSingleNode("response//status");

                if (status.InnerText == "0")
                {
                    Trace.TraceInformation("SMS ID: " + message);
                    Trace.TraceInformation("STATUS: SENT");
                    Trace.TraceInformation("SMS Sent: " + DateTimeOffset.UtcNow);
                    item.SendDate = DateTimeOffset.UtcNow;
                    item.Status = "Sent";
                    context.SaveChanges();
                }
                else
                {
                    Trace.TraceError("SMS ID: " + message);
                    Trace.TraceError("STATUS: FAILED");
                    item.Status = "Failed";
                }

                response.Close();
            }
        }
    }
}