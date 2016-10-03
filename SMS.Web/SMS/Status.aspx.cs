using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SMSCommon;

namespace SMS.Web.SMS
{
    public partial class Status : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                k5k34_dbEntities context = new k5k34_dbEntities();

                ListViewSentSMS.DataSource = context.SMSitems.OrderByDescending(x => x.CreatedAt).Take(10).Select(x => new SMSinformation() { Content = x.Content, CreatedAt = x.CreatedAt, SendTo = x.SendTo, SMSId = x.SMSID, Status = x.Status }).ToList();
                ListViewSentSMS.DataBind();
            }
        }
    }
}