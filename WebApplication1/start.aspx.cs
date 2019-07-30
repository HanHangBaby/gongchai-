using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace start
{
    public partial class start : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button3_Click(object sender, EventArgs e)
        {

            Response.Redirect("system_allocate.aspx");

        }
        protected void Button4_Click(object sender, EventArgs e)
        {

            Response.Redirect("user_defined.aspx");

        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            Response.Redirect("score.aspx");

        }
        protected void Button2_Click(object sender, EventArgs e)
        {

            Response.Redirect("people_information.aspx");

        }
       
    }
}