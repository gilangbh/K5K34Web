using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace SMSCommon
{
    public class Common
    {
        public static string GetUniqueKey(int maxSize)
        {
            char[] chars = new char[62];
            chars =
            "ABCDEFGHJKLMNPQRTUVWXYZ1234567890".ToCharArray();
            byte[] data = new byte[1];
            using (RNGCryptoServiceProvider crypto = new RNGCryptoServiceProvider())
            {
                crypto.GetNonZeroBytes(data);
                data = new byte[maxSize];
                crypto.GetNonZeroBytes(data);
            }
            StringBuilder result = new StringBuilder(maxSize);
            foreach (byte b in data)
            {
                result.Append(chars[b % (chars.Length)]);
            }
            return result.ToString();
        }

        public static string GetServerStatus()
        {
            string status = "Offline";
            using (k5k34_dbEntities context = new SMSCommon.k5k34_dbEntities())
            {
                try
                {
                    status = context.ServiceAvailabilities.Where(x => x.ServiceName == "WebServerStatus").First().Value;
                }
                catch (Exception)
                {
                    return "Offline";
                }
            }

            return status;
        }
    }
}
