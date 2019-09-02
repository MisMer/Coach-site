<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Company.aspx.cs" Inherits="TreningCo1.Company" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>О компании</title>

    <style>
        body {
            background: url(Images/company.jpg), rgba(255,255,255,0.7);
            background-size: cover;
            background-blend-mode: screen;
        }

              @import url('https://fonts.googleapis.com/css?family=Cormorant');


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

.link1,.link2,.link3, .infa{

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
.infa{
     animation-delay: 4s;
     text-indent: 23px;  /* Делаем отступ строки*/
     font-family: Century;
     font-style: italic;
     color: #474842;
     font-size: 25px;
}

@keyframes show{
	 0%{
		 opacity:0;
	 }

	 100% {
		 opacity:1;
	 }
}

.LogReg {
  list-style: none;
    padding: 0px 10px 0px;
    text-align: right;
    float:right; /* Выравнивание с обтеканием элементов */
}
.LogReg li{
    display: inline-block; /* Отображать как строчный элемент */
}

.LogReg a {
  font-family: 'Cormorant', serif;
  color: #A03737;
  position: relative;
  padding-bottom: 0px;
  margin: 0 0px 0 10px;
  font-size: 17px;
  font-style:italic;
}

.Lk{
    list-style: none;
    padding: 0px 10px 0px;
    text-align: left;
    float:left;
}

.Lk li{
    display: inline-block; /* Отображать как строчный элемент */
}

.Lk a {
  font-family: 'Cormorant', serif;
  color: #A03737;
  position: relative;
  padding-bottom: 0px;
  margin: 0 40px 0 10px;
  font-size: 17px;
  font-style:italic;
}


    </style>


</head>
<body>
    <form id="form1" runat="server">
        <header>
             <br />
            <ul class="Lk">
                <li><a id="LichKab" href="UserPage.aspx" runat="server">Личный кабинет</a></li>
                <li><asp:Button ID="Button2" runat="server" Text="Выйти" Font-Size="15px" Height="30px" OnClick="Button2_Click" Visible="False" Width="60px" /></li>
            </ul>
            <ul class="LogReg">
            <li><a id="Login" href="/Login.aspx" runat="server">Вход</a></li>
            <li><a id="Reg" href="/Registration.aspx" runat="server">Регистрация</a></li>
            </ul>
            <br />
            <ul class="menu-main">
                <li><a href="/Trening.aspx" class="link1">Тренинги</a></li>                 
                <li><a href="/Treneri.aspx" class="link2" runat="server">Наши тренеры</a></li>
                <li><a href="#" class="link3" runat="server">О компании</a></li>     
            </ul>
        </header>
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="infa">
            Академия Тренингов трансформирует знания и понимание людей своих установок и мотивации. Мы обучаем  способам взаимодействия с командой в бизнес-формате, применение изученных навыков в работе с людьми и помогаем постигать новые грани осознанности в максимально произвольной неформальной обстановке. Наша работа направлена на изучение людьми своих целей и на обучение позитивному взаимодействию в коллективе или с подчиненными. Мы практикуем как бизнес-тренинги, так и направленные на работу с самостоятельным развитием тех или иных компетенций.
        </div>
    </form>
</body>
</html>
