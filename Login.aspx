<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TreningCo1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Вход</title>

    <style type="text/css">

        body {
            background: url(Images/background.jpg), rgba(255,255,255,0.7);
            background-size: 100%;
            background-blend-mode: screen;
        }

        @import url('https://fonts.googleapis.com/css?family=Cormorant');
        @import url('https://fonts.googleapis.com/css?family=Spectral');

        ul {
  list-style: none; /*убираем маркеры списка*/
  margin: 0; /*убираем верхнее и нижнее поле, равное 1em*/
  padding-left: 0; /*убираем левый отступ, равный 40px*/
}
a {text-decoration: none; /*убираем подчеркивание текста ссылок*/}

.menu-main {
  list-style: none;
  margin: 10px 0 5px;
  padding: 10px 0 5px;
  text-align: right;
}
.menu-main li {display: inline-block;}
.menu-main li:after {
  content: "|";
  color: #A03737;
  display: inline-block;
  vertical-align:top;
}
.menu-main li:last-child:after {content: none;}
.menu-main a {
  text-decoration: none;
  font-family: 'Cormorant', serif;
  letter-spacing: 2px;
  position: relative;
  padding-bottom: 5px;
  margin: 0 10px 0 10px;
  font-size: 20px;
  text-transform: uppercase;
  display: inline-block;
  transition: color .2s;
}
.menu-main a, .menu-main a:visited {color: #A03737;}
.menu-main a.current, .menu-main a:hover{color: #F0CA51;}
.menu-main a:before,
.menu-main a:after {
  content: "";
  position: absolute;
  height: 2px;
  top: auto;
  right: 50%;
  bottom: -3px;
  left: 50%;
  background: #F0CA51;
  transition: .8s;
}
.menu-main a:hover:before, .menu-main .current:before {left: 0;}
.menu-main a:hover:after, .menu-main .current:after {right: 0;}   
@media (max-width: 550px) {
.menu-main {padding-top: 0;}
.menu-main li {display: block;}
.menu-main li:after {content: none;}
.menu-main a {
  padding: 20px 0 20px; 
  margin: 0 30px;
}
}

.link1,.link2,.link3{

  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
  }
  @-webkit-keyframes fadeInDown {
  0% {
  opacity: 0;
  -webkit-transform: translate3d(0, -100%, 0);
  transform: translate3d(0, -100%, 0);
  }
  100% {
  opacity: 1;
  -webkit-transform: none;
  transform: none;
  }
  }
  @keyframes fadeInDown {
  0% {
  opacity: 0;
  -webkit-transform: translate3d(0, -100%, 0);
  transform: translate3d(0, -100%, 0);
  }
  100% {
  opacity: 1;
  -webkit-transform: none;
  transform: none;
  }
  } 

.link1, .link2, .link3
{
  animation-delay: 0s;
}

.link1{
     animation-delay: 1s;
}

.link2
{
  animation-delay: 2s;
}
.link3
{
  animation-delay: 3s;
}

.LogReg {
    list-style: none;
    padding: 0px 20px 0px;
    text-align: right;
    float:right; /* Выравнивание с обтеканием элементов */
}
.LogReg li{
    display: inline-block; /* Отображать как строчный элемент */
}

.LogReg a {
  font-family: 'Cormorant', serif;
  color: #A03737;
  padding-bottom: 0px;
  margin: 0 0px 0 10px;
  font-size: 17px;
  font-style:italic;
}



fieldset{
  font-size:1em;
  border: 2px solid #474842;
  height:186px;
    width:350px;
    top: 144px;
    left: 496px;

}
fieldset legend{
  padding: 0 1em;
  text-transform: uppercase;
  text-align:center; 
  font-family: 'Cormorant', serif;
  letter-spacing: 2px;
  color: #474842;
}

.transform-bounch-in {
      animation-delay: 0ms;
    animation-duration: 3000ms;
    animation-fill-mode: both;
    animation-name: transform-bounch-in;
  }
  @keyframes transform-bounch-in {

   0% { transform: rotate(0deg) scale(0.3,0.3) ; opacity: 0;  }
   50% { transform: rotate(0deg) scale(1.05,1.05) ; opacity: 1;  }
   70% { transform: rotate(0deg) scale(0.9,0.9) ;  }
   100% { transform: rotate(0deg) scale(1.0,1.0) ;  }
}


    </style>

</head>
<body>
    <form id="form1" runat="server">
        <header>
           
            <ul class="LogReg">
            <li><a id="Login" href="/Login.aspx">Вход</a></li>
            <li><a id="Registration" href="/Registration.aspx">Регистрация</a></li>
            </ul>
            <br />
            <ul class="menu-main">
                <li><a href="/Trening.aspx" class="link1">Тренинги</a></li>                 
                <li><a href="/Treneri.aspx" class="link2" runat="server">Наши тренеры</a></li>
                <li><a href="/Company.aspx" class="link3" runat="server">О компании</a></li>     
            </ul>
            </header>
        <br />
        <br />
        <br />
        <br />
        
        <fieldset class="transform-bounch-in" style="position:absolute;">
            <legend>Вход</legend><br />
            <asp:Table ID="Table1" runat="server" HorizontalAlign="Center" style="text-align: left">
            
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    <asp:Label ID="Label2" runat="server" Text="Логин" Font-Names="Cormorant, serif"></asp:Label>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text=" "></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text=" "></asp:TableCell>
                </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server"><asp:Label ID="Label3" runat="server"  Text="Пароль" Font-Names="Cormorant, serif"></asp:Label>
                </asp:TableCell>
                <asp:TableCell runat="server"><asp:TextBox ID="TextBox2" TextMode="Password" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text=" "></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text=" "></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text=" "></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text=" "></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text=" "></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text=" "></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text=" "></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text=" "></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text=" "></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text=" "></asp:TableCell>
                </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell>
                    <asp:HyperLink ID="HyperLink1" NavigateUrl ="~/Registration.aspx"  runat="server" Font-Names="Cormorant, serif">Зарегистрироваться</asp:HyperLink>
                </asp:TableCell>
            <asp:TableCell runat="server" ColumnSpan="2" HorizontalAlign="Right">
                <asp:Button ID="Button1" runat="server" Height="30" Width="60" Text="Войти" Font-Names="Cormorant, serif" OnClick="Button1_Click" />
                </asp:TableCell>
                </asp:TableRow>
        </asp:Table>
</fieldset>
    </form>
</body>
</html>
