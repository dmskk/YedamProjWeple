<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<title>userInsert</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Raleway:wght@100;500&display=swap')
	;

* {
	box-sizing: border-box;
}

body {
	background: #EDEDEE;
	display: flex;
	justify-content: center;
	align-items: center;
	font-family: 'Raleway', sans-serif;
	height: 100vh;
}

h2 {
	font-weight: bold;
	margin: 0;
}

p {
	font-size: 10px;
}

a {
	font-size: 12px;
	text-decoration: none;
	margin: 15px;
}

.button {
	border: none;
	font-size: 12px;
	padding: 12px 45px;
	background-color: #a7a7ac;
}

form {
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 50px;
	height: 100%;
}

.input {
	border: 1px solid;
	padding: 12px;
	margin: 5px;
	width: 100%;
}

.container {
	border: 1px solid;
	border-radius: 10px;
	position: relative;
	width: 770px;
	max-width: 100%;
	min-height: 480px;
}

.form {
	position: absolute;
	top: 0;
	height: 100%;
}

.signup-container {
	right: 50px;
	width: 50%;
}

.container2 {
	position: absolute;
	top: 0;
	right: 65%;
	width: 35%;
	height: 100%;
	background-color: rgb(187, 187, 187);
}

.signup {
	text-align: center;
	padding: 180px 0px;
}

.gender {
	position: relative;
	margin: 0 auto;
	width: 100%;
	margin: 10px;
}

.adr {
	margin-bottom: 10px;
}
</style>
</head>


<body>
	<div class="container">

		<div class="container2">
			<div class="signup">
				<h2>Welcome to With+</h2>
				<p>test 공동구매는 가입이 필요합니다 tset</p>
				<button class="button" onclick="location.href='account/login.tiles' ">Login</button>
			</div>
				<a href="${pageContext.request.contextPath }/index.jsp">홈으로</a>

		</div>
		<div class="form signup-container">
			<form action="${pageContext.request.contextPath }/userInsert.do"
				method="post" name="signupForm">
				<h2>With+ Logo</h2>

				<input class="input" type="text" name="id" id="id" placeholder="User ID"> 
				<input type="button" value="중복체크" onclick="idCheck()">
				<input type="hidden" name="idDuplication" value="idUncheck">
				
				<input class="input" type="password" name="password" id="password" placeholder="Password">
				<input class="input" type="password" name="passwordCheck" id="passwordCheck" placeholder="Password Check">

				<input id="email-id" type="text" name="mail1" />
				@ <input id="domain-txt" type="text" name="mail2" />
				<select id="domain-list" name="domain-list">
					<option value="type">-select-</option>
					<option value="naver.com">naver.com</option>
					<option value="google.com">google.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
					<option value="kakao.com">kakao.com</option>
					<option value="type">직접 입력</option>
				</select>
				<input type="button" value="중복체크" onclick="mailCheck()">
				
				
				<input class="input" type="text" name="name" placeholder="Name" id="name">


				<div class="adr">
					<input type="text" id="postcode" placeholder="우편번호" name="post">
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="address" placeholder="주소" name="address1"><br>
					<input type="text" id="detailAddress" placeholder="상세주소" name="address2">
					<input type="text" id="extraAddress" placeholder="참고주소" name="address3">
				</div>


				<select id="phone-list">
					<option value="select">-select-</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="02">02</option>
					<option value="031">031</option>
					<option value="051">051</option>
					<option value="053">053</option>
					<option value="type2">직접 입력</option>
				</select>
				<input id="phone1" type="text" name="pnum1" />
				<input id="phone2" type="text" name="pnum2" />
				<input id="phone3" type="text" name="pnum3" />
				<input type="button" value="중복체크" onclick="phoneCheck()">
				
				<input class="input" type="date" name="birth" id="bday">

				<select class="gender" name="gender">
					<option value="">성별 선택</option>
					<option value="남">남</option>
					<option value="여">여</option>
					<option value="">미등록</option>

				</select>
				

				<button type="button" onclick="SignupCheck();" class="button">Sign up</button>


			</form>
		</div>
	</div>



	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	
		//Singup버튼 아웃풋
		function signupOutput(){
			window.open("userInsertOutput.jsp", "signup", "width=400, height=350")
		}
        //아이디 중복체크 새창
        function idCheck(){
		  window.open("<%= request.getContextPath() %>/user/idCheckForm.jsp", "idwin", "width=400, height=350");
		}
        
        //메일 중복체크 새창
        function mailCheck(){
        	window.open("<%= request.getContextPath() %>/user/mailCheckForm.jsp", "mlwin", "width=400, height=350");
  		}
        
        //전화 중복체크 새창
        function phoneCheck(){
        	window.open("<%= request.getContextPath() %>/user/phoneCheckForm.jsp", "phwin", "width=400, height=350");
  		}
        
	
    	/////유효성 검사//////
    	function SignupCheck() {
		  let id = document.getElementById("id");
		  let pw = document.getElementById("password");
		  let pwc = document.getElementById("passwordCheck");
		  let ml1 = document.getElementById("email-id");
		  let ml2 = document.getElementById("domain-txt");
		  let nm = document.getElementById("name");
		  let pt = document.getElementById("postcode");
		  let ad1 = document.getElementById("address");
		  let ad2 = document.getElementById("detailAddress");
		  let ad3 = document.getElementById("extraAddress");
		  let pn1 = document.getElementById("phone1");
		  let pn2 = document.getElementById("phone2");
		  let pn3 = document.getElementById("phone3");
		  let bd = document.getElementById("bday");
		
		  if (id.value == "") {
		    alert("아이디를 입력하세요.");
		    id.focus();
		    return false;
		  };
		
		  if (pw.value == "") {
		    alert("비밀번호를 입력하세요.");
		    pw.focus();
		    return false;
		  };
		
		  //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
		  let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
		
		  if (!pwdCheck.test(pw.value)) {
		    alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
		    pw.value="";
		    pw.focus();
		    return false;
		  };
		
		  if (pwc.value !== pw.value) {
		    alert("비밀번호가 일치하지 않습니다.");
		    pwc.value="";
		    pwc.focus();
		    return false;
		  };
		
		  if (ml1.value == "" || ml2.value == "" ) {
		    alert("이메일 주소를 입력하세요.");
		    ml1.value="";
		    ml1.focus();
		    return false;
		  }
		
		  if (nm.value == "") {
		    alert("이름을 입력하세요.");
		    nm.value="";
		    nm.focus();
		    return false;
		  };
		  
		  let kor_check = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20])/i;
		  if (kor_check.test(nm.value)) {
			  alert("이름은 한글만 입력가능합니다.");
			  nm.value="";
			  nm.focus();
			  return false;
		  }

		  if (ad1.value == ""||ad2.value == ""||ad3.value == "") {
			    alert("주소를 입력하세요.");
			    ad1.value="";
			    ad2.value="";
			    ad3.value="";
			    ad1.focus();
			    return false;
			  };
			  
		  if (pn1.value == ""||pn2.value == ""||pn3.value == "") {
			    alert("전화번호를 입력하세요.");
			    pn1.value="";
			    pn2.value="";
			    pn3.value="";
			    pn1.focus();
			    return false;
			  };
		  
		  let reg = /^[0-9]+/g; //숫자만 입력하는 정규식
		  if (!reg.test(pn1.value)&&!reg.test(pn2.value)&&!reg.test(pn3.value)) {
		    alert("전화번호는 숫자만 입력할 수 있습니다.");
		    pn1.value="";
		    pn2.value="";
		    pn3.value="";
		    pn1.focus();
		    return false;
		  }
		  if (bd.value == "" || bd.value == null) {
			    alert("생년월일을 선택하세요");
			    return false;
			  };
		  
		
		 /* if (!agree.checked) { //체크박스 미체크시
		    alert("약관 동의를 체크하세요.");
		    agree.focus();
		    return false;
		  }*/
		
		  //입력 값 전송
		  document.signupForm.submit();
		  alert("가입완료");
		  //window.open("userInsertOutput.jsp", "signup", "width=400, height=350");
		}
		    	        
        

    	
        //전화번호 선택
        const phoneListEl = document.querySelector('#phone-list')
        const phoneInputEl = document.querySelector('#phone1')

        phoneListEl.addEventListener('change', (event) => {

            if (event.target.value !== "type2") {
                phoneInputEl.value = event.target.value
                //phoneInputEl.disabled = true
            } else { // 직접 입력 시
                phoneInputEl.value = ""
                //phoneInputEl.disabled = false
            }
        })


        //이메일 선택
        // 도메인 직접 입력 or domain option 선택
        const domainListEl = document.querySelector('#domain-list')
        const domainInputEl = document.querySelector('#domain-txt')
        // select 옵션 변경 시
        domainListEl.addEventListener('change', (event) => {
            // option에 있는 도메인 선택 시
            if (event.target.value !== "type") {
                // 선택한 도메인을 input에 입력하고 disabled
                domainInputEl.value = event.target.value
                //domainInputEl.disabled = true
            } else { // 직접 입력 시
                // input 내용 초기화 & 입력 가능하도록 변경
                domainInputEl.value = ""
                //domainInputEl.disabled = false
            }
        })

        //우편번호 주소 api
        
        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data
                                .buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("extraAddress").value = extraAddr;

                    } else {
                        document.getElementById("extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("detailAddress").focus();
                }
            }).open();
        }
    </script>

</body>

</html>