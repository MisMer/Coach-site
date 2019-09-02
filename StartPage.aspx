<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StartPage.aspx.cs" Inherits="TreningCo1.StartPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Стартовая страница</title>
    <style>
        body {
            background: url(Images/StartPage.jpg), rgba(255,255,255,0.9);
            background-size: 100%;
            background-blend-mode: screen;
        }
        .t1{
            font-size:50px;
            color:#BF3030;
            text-align:center;
        }
        .t2{
            font-size:30px;
            color:#892F3B;
            text-align:center;
        }
        .links{
            text-align:center;
            font-family: Century;
            font-size: 20px;
        }

        .t1,.t2,.links{

	opacity:0; /*Элемент полностью прозрачный (невидимый)*/
	transition: 2s; /*Скорость перехода состояния элемента*/
	
	animation: zoomIn 1s 1; /* Указываем название анимации, её время и количество повторов*/
    animation-fill-mode: forwards; /* Чтобы элемент оставался в конечном состоянии анимации */
    /*animation-delay: 1s;*/ /* Задержка перед началом */
    animation-timing-function: linear; 
}

.t1, .t2, .links
{
  animation-delay: 1s;
}

.t2
{
  animation-delay: 2s;

}

.links{
    animation-delay: 3s;

}

        .zoomIn {
  -webkit-animation-name: zoomIn;
  animation-name: zoomIn;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
  }
  @-webkit-keyframes zoomIn {
  0% {
  opacity: 0;
  -webkit-transform: scale3d(.3, .3, .3);
  transform: scale3d(.3, .3, .3);
  }
  50% {
  opacity: 1;
  }
  }
  @keyframes zoomIn {
  0% {
  opacity: 0;
  -webkit-transform: scale3d(.3, .3, .3);
  transform: scale3d(.3, .3, .3);
  }
  100% {
  opacity: 1;
  }
  } 
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="t1">
            Академия коучинга вас приветствует!
            </div>
        <br />
        <br />
        <div class ="t2">
            Пожалуйста, выберите здание, в котором хотите заниматься
        </div>
        <br />
        <br />
        <div class="links">
            <a href="Default-center.aspx">Центр Академии (Москва)</a>
            <br />
            <a href="Default-oblast.aspx">Филиал Академии (Казань)</a>
        </div>

    </form>
</body>
</html>
