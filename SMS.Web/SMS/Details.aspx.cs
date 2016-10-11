using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SMSCommon;

namespace SMS.Web.SMS
{
    public partial class Details : BasePage
    {
        string uniqueID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["uniqueid"] != null)
                {
                    uniqueID = Request.QueryString["uniqueid"];

                    if (!string.IsNullOrEmpty(uniqueID))
                    {
                        BindPageControls();
                    }
                }
                else
                {
                    DivTrackContent.Style.Add("display", "none");
                }

                if (!this.IsUserAgentMatch)
                {
                    Response.Redirect("Update");
                }
            }
        }

        private void BindPageControls()
        {
            var context = new k5k34_dbEntities();

            TextBoxKodeSMS.Value = uniqueID;
            TextAreaMessageContent.Value = context.SMSitems.Where(x => x.UniqueKey == uniqueID).First().Content;

            ListViewRecipients.DataSource = context.SMSitems.Where(x => x.UniqueKey == uniqueID).OrderByDescending(x => x.CreatedAt).Select(x => new SMSinformation() { Content = x.Content, CreatedAt = x.CreatedAt, SendTo = x.SendTo, SMSId = x.SMSID, Status = x.Status }).ToList();
            ListViewRecipients.DataBind();
        }

        protected void LinkButtonTrackSMS_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TextBoxKodeSMS.Value))
            {
                Response.Redirect("Details?uniqueid=" + TextBoxKodeSMS.Value);
            }
        }
    }
}