using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMS.Web
{
    public class BasePage : System.Web.UI.Page
    {
        public bool IsUserAgentMatch
        {
            get
            {
                String userAgent;
                userAgent = Request.UserAgent;
                
                return userAgent.Contains(SMSCommon.SMSConstants.Version);
            }
        }
    }
}