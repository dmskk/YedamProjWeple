
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
      #container{
        width: 1100px;
        margin: 0 auto;
        padding: 0;
      }
      /* header */
      header{
      text-align: center;
      height: 20px;
      width: 1100px;
      text-align: right;
      font-size: 12px;
      margin: 0;
      padding: 0;
      }
      #logo{
        float: left;
        font-size: 20px;
        font-weight: bold;
        margin: 0;
        color: rgb(0, 0, 0);
      }
      header nav{
        float: right;
      }
      header ul{
        margin: 0;
      }
      header li{
        display:inline-block;
        margin-right: 15px;
      }
      header nav a{
        text-decoration: none;
        color: rgb(0, 0, 0);
      }
      .search{
        float: left;
        margin-left: 20px;
        margin-top: 8px;
      }
      .header2{
      height: 100px;
      width: 1100px;
      text-align: right;
      font-size: 11px;
      margin: 0;
      padding: 0;
      margin-top: 30px;
      }
      .header2 nav{
        float: right;
      }
      .heaer2 ul{
        text-align: center;
      }
      .header2 li{
        display:inline-block;
        margin-right: 15px;
      }
      .header2 nav a{
        text-decoration: none;
        color: rgb(0, 0, 0);
      }
      .search{
        float: left;
        margin-left: 90px;
        margin-top: 8px;
      }
      div input{
        border: 1px solid;
        width: 300px;
        height: 30px;
      }
      div button{
        border: none;
        height: 35px;
        width: 100px;
      }
      .menu1{
        border: 1px solid;
        border-radius: 50%;
        display: inline-flex;
        justify-content: center;
        align-items: center;
        margin: 0 5px;
        height: 40px;
        width: 40px;
      }
      .header3 nav{
        clear: both;
        height: 50px;
      }
      .header3 ul{
        margin: 0;
        text-align: left;
      }
     .header3 li{
        margin-top: 12px;
        display:inline-block;
      }
      .header3 nav a{
        text-decoration: none;
        color: rgb(0, 0, 0);
        margin-left: 50px;
        margin-right: 50px;
      }
      /* secion */
      section{
        width : 65%;
        padding: 0px;
        float : left;
        margin: 0;
      }
      /* aside */
      aside{
        width: 35%;
        padding : 0;
        float : right;
        margin: 0;
        background-color: rgb(219, 219, 219);
      }
      .buy{
        text-align: center;
        margin: 10px 30px;
      }
      table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 20px 20px;
      }
      th{
        text-align: left;
      }
      td{
        text-align: center;
      }
      .buybutton{
        border: none;
        width: 50px;
      }
      /* article */
      .detail{
      border: 1px solid;
      clear: both;
      width: 100%;
      height: 800px;
      margin: 0;
      padding: 0;
      }
      /* footer */
      footer{
      clear: both;
      width: 100%;
      height: 100px;
      margin: 0;
      padding: 0;
      border: 1px solid;
      clear:both;
      text-align: center;
      background-color: rgb(202, 202, 202);
      color: white;
      padding: 1px; 
      font-size: 15px; 
      }
    </style>
</head>
<body>
    <div id="container">
      <header>
        <a href="#" id="logo">with+</a>
        <nav>
          <ul>
            <li><a href="#">로그인</a></li>
            <li><a href="#">회원 가입</a></li>
            <li><a href="#">My Page</a></li>
            <li><a href="#">장바구니</a></li>
            <li><a href="#">고객센터</a></li>
          </ul>
        </nav>
      </header>
      <header2 class="header2">
        <a href="#" id="logo">Logo to home</a>
        <div class="search">
        <input type="text">
        <button>search</button>
        </div>
        <div>
          <a class="menu1" href="#"><p>지역</p></a>
          <a class="menu1" href="#"><p>찜</p></a>
          <a class="menu1" href="#"><p>바구니</p></a>
        </div>
      </header2>
      <header3 class="header3">
        <nav>
          <ul>
            <li><a href="#">CATEGORY</a></li>
            <li><a href="#">MENU1</a></li>
            <li><a href="#">MENU2</a></li>
            <li><a href="#">MENU3</a></li>
            <li><a href="#">MENU4</a></li>
            <li><a href="#">MENU5</a></li>
          </ul>
        </nav>
      </header3>

      <section>
        <img src="#" width="700px" height="500px">
        <p>product1</p>
        <p>상품간략 설명test test test test test test test</p>
      </section>

      <aside>
        <h3>[VITRO] 냉동 혼합 감자당근</h3>
        <p>감자 80%, 당근 20% / 1kg</p>
        <p>KU85UA7000FXKR</p>
        <p>5,530 원</p>
        <table>
          <tr>
            <th>배송</th>
            <td>멤버쉽 차등</td>
          </tr>
          <tr>
            <th>중량</th>
            <td>1kg</td>
          </tr>
          <tr>
            <th>발주처</th>
            <td>위플</td>
          </tr>
          <tr>
            <th>판매지역</th>
            <td>대구</td>
          </tr>
          <tr>
            <th>구매수량</th>
            <td>
            <form action="../mappings한 주소 넣어라">
            	<input class="buybutton"  type="number" id="prodAmount" name="prodAmount" value="1" min="1">
            </form>
            </td>
          </tr>
        </table>
        <b4>혜택가 5,530 원</b4>
        <div class="buy">
          <button id="share" onclick="submitData()" value="share">공동구매</button>
          <button id="notShare" onclick="submitData()" value="notShare">일반구매</button>

          <button id="noShow" onclick="submitData()" value="noShow">장바구니</button>

        </div>
      </aside>

      <div class="detail">
        <p>상품 디테일</p>
      </div>
      <div class="detail">
        <p>상품 디테일</p>
      </div>
      <div class="detail">
        <p>상품 디테일</p>
      </div>

      <footer>
        <p><i>Page last reviewed: June 9, 2022<br>
          National Center for Emerging and Zoonotic Infectious Diseases (NCEZID)</p></i>
      </footer>
    </div>
  </body>
  <script>
  
  let prodAmount = document.querySelector("#prodAmount").value;
  const searchParams = new URLSearchParams(location.search);
  const prodId = searchParams.get("prodId");

  
  function submitData() {
    if (this.value == "share") {
      location.href =

        "../insertCart.do?&prodId=" + prodId + "&isshare=1&prodAmount=" + prodAmount + "&clickCart=false";
    }
    if (this.value == "notShare") {
      location.href = "../insertCart.do?&prodId=" + prodId + "&isshare=0&prodAmount=" + prodAmount + "&clickCart=false";
    }
    if(this.value == "noShow") {
    	location.href = "../insertCarts.do&prodId=" + prodId + "&isShare=0&prodAmount=" + prodAmount + "&clickCart=true";

    }
  }
  
  </script>
</html>