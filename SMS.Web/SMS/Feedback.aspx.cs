using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SMSCommon;

namespace SMS.Web.SMS
{
    public partial class Feedback : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!this.IsUserAgentMatch)
                {
                    Response.Redirect("Update");
                }
            }
        }

        protected void LinkButtonSendMessage_Click(object sender, EventArgs e)
        {
            SMSCommon.Feedback feedback = new SMSCommon.Feedback();

            feedback.Id = Guid.NewGuid().ToString();
            feedback.Name = TextBoxName.Value;
            feedback.Content = TextAreaFeedback.Value;
            feedback.CreatedAt = DateTimeOffset.UtcNow;
            feedback.Deleted = false;

            k5k34_dbEntities context = new k5k34_dbEntities();
            context.Feedbacks.Add(feedback);
            context.SaveChanges();

            Response.Redirect("FeedbackSent");
        }
    }
}