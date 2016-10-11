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
                HttpWebRequest requestSmsQuota = WebRequest.Create("https://reguler.zenziva.net/apps/smsapibalance.php?userkey=" + userkey + "&passkey=" + passkey) as HttpWebRequest;
                HttpWebResponse responseSmsQuota = (HttpWebResponse)requestSmsQuota.GetResponse();
                XmlDocument xmlDocSmsQuota = new XmlDocument();
                xmlDocSmsQuota.Load(responseSmsQuota.GetResponseStream());

                XmlNode smsQuotaTotalLeft = xmlDocSmsQuota.SelectSingleNode("response//value");
                XmlNode smsQuotaExpiryDate = xmlDocSmsQuota.SelectSingleNode("response//text");

                ServerStatus serverStatus = context.ServerStatus.FirstOrDefault();

                ServiceAvailability smsService = context.ServiceAvailabilities.Where(x => x.ServiceName == "SmsLeft").FirstOrDefault();

                if (smsService != null)
                {
                    smsService.Value = smsQuotaTotalLeft.InnerText;
                }
                else
                {
                    smsService = new ServiceAvailability() { ServiceName = "SmsLeft", Value = smsQuotaTotalLeft.InnerText };
                    context.ServiceAvailabilities.Add(smsService);
                }

                ServiceAvailability smsExpiryDate = context.ServiceAvailabilities.Where(x => x.ServiceName == "SmsExpiryDate").FirstOrDefault();

                if (smsExpiryDate != null)
                {
                    smsExpiryDate.Value = smsQuotaExpiryDate.InnerText;
                }
                else
                {
                    smsExpiryDate = new ServiceAvailability() { ServiceName = "SmsExpiryDate", Value = smsQuotaExpiryDate.InnerText };
                    context.ServiceAvailabilities.Add(smsExpiryDate);
                }

                context.SaveChanges();
                responseSmsQuota.Close();

                if (Convert.ToInt32(smsQuotaTotalLeft.InnerText) > 97 && Convert.ToInt32(smsQuotaTotalLeft.InnerText) < 101)
                {
                    log.WriteLine("SMS Left:" + smsQuotaTotalLeft.InnerText);
                    HttpWebRequest requestAlert = WebRequest.Create("https://reguler.zenziva.net/apps/smsapi.php?userkey=" + userkey + "&passkey=" + passkey + "&nohp=" + item.SendTo + "&pesan=SMS Mau Habis!") as HttpWebRequest;
                    HttpWebResponse responseAlert = (HttpWebResponse)requestAlert.GetResponse();
                    responseAlert.Close();
                }

                string appendedMessage = item.Content + " - http://s.id/smsgratis";
                HttpWebRequest request = WebRequest.Create("https://reguler.zenziva.net/apps/smsapi.php?userkey=" + userkey + "&passkey=" + passkey + "&nohp=" + item.SendTo + "&pesan=" + appendedMessage) as HttpWebRequest;
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();

                XmlDocument xmlDoc = new XmlDocument();
                xmlDoc.Load(response.GetResponseStream());

                XmlNode status = xmlDoc.SelectSingleNode("response//status");

                if (status.InnerText == "0")
                {
                    log.WriteLine("SMS ID: " + message);
                    log.WriteLine("Status: Sent");
                    log.WriteLine("Date: " + DateTimeOffset.UtcNow);
                    item.SendDate = DateTimeOffset.UtcNow;
                    item.Status = "Sent";
                    context.SaveChanges();
                }
                else
                {
                    log.WriteLine("SMS ID: " + message);
                    log.WriteLine("Status: Failed");
                    log.WriteLine("Date: " + DateTimeOffset.UtcNow);
                    item.Status = "Failed";
                    context.SaveChanges();
                }

                response.Close();
            }
        }
    }
}