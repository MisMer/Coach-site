using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TreningCo1
{
    public partial class Company : System.Web.UI.Page
    {
        HttpCookie metka = null;
        Control lichkab = null;
        Control vhod = null;
        Control registr = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            metka = Request.Cookies["authorize"];
            lichkab = FindControl("LichKab");
            vhod = FindControl("Login");
            registr = FindControl("Reg");

            if (metka != null)
            {
                lichkab.Visible = true;
                Button2.Visible = true;
                vhod.Visible = false;
                registr.Visible = false;
            }
            else
            {
                lichkab.Visible = false;
                Button2.Visible = false;
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