using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SMSCommon
{
    public class SMSinformation
    {
        public int SMSId { get; set; }
        public string SendTo { get; set; }
        public string SendToTrimmed
        {
            get
            {
                return SendTo.Length > 4 ? SendTo.Substring(0, SendTo.Length - 4) + "XXXX" : "(Invalid)";
            }
        }
        public string Content { get; set; }
        public DateTimeOffset CreatedAt { get; set; }
        public string RequestTime
        {
            get
            {
                TimeSpan span = new TimeSpan(7, 0, 0);

                return CreatedAt.ToOffset(span).ToString("HH:mm:ss");
            }
        }
        public DateTimeOffset? SendDate { get; set; }
        public DateTimeOffset SendSchedule { get; set; }
        public string Status { get; set; }
    }
}
