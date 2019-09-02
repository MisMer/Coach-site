using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TreningCo1
{
    public partial class Default : System.Web.UI.Page
    {
        HttpCookie metka = null;
        Control lichkab = null;
        Control nad3 = null;
        Control vhod = null;
        Control registr = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            metka = Request.Cookies["authorize"];
            lichkab = FindControl("LichKab");
            nad3 = FindControl("t3");
            vhod = FindControl("Login");
            registr = FindControl("Reg");
            lichkab.Visible = false;


            if (metka != null)
            {
                lichkab.Visible = true;
                Button2.Visible = true;
                nad3.Visible = false;
                vhod.Visible = false;
                registr.Visible = false;
            }
            else
            {
                lichkab.Visible = false;
                Button2.Visible = false;
                nad3.Visible = true;
                vhod.Visible = true;
                registr.Visible = true;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Cookies.Add(metka);
            Response.Redirect("Logout.aspx");
        }

    }
}