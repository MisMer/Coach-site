using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TreningCo1
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie login = new HttpCookie("login", string.Empty); //кукисы заменяются просроченными и перенаправляются на страницу авторизации
            HttpCookie sign = new HttpCookie("sign", string.Empty);
            HttpCookie metka = new HttpCookie("authorize", string.Empty);

            login.Expires = DateTime.Now.AddDays(-1);
            sign.Expires = DateTime.Now.AddDays(-1);
            metka.Expires = DateTime.Now.AddDays(-1);

            Response.Cookies.Add(login);
            Response.Cookies.Add(sign);
            Response.Cookies.Add(metka);

            string referrer = HttpContext.Current.Request.UrlReferrer.ToString();
            Response.Redirect(referrer);

        }
    }
}