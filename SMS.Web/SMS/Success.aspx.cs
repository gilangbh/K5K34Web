using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SMS.Web.SMS
{
    public partial class Success : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["uniqueid"] != null)
                {
                    string uniqueID = Request.QueryString["uniqueid"];
                    LiteralUniqueID.Text = uniqueID;
                }
            }
        }
    }
}