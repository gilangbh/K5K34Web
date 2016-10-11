using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SMS.Web.SMS
{
    public partial class FeedbackSent : BasePage
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
    }
}