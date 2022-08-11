<%@page import="com.dev.dao.UserDAO"%>
<%@page import="com.dev.service.user.UserService"%>
<%@page import="com.dev.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<%
// 세션값 제어
String id = (String) session.getAttribute("userId");

if (id == null) {
	response.sendRedirect("login.jsp");
}

// 해당 회원의 모든정보를 가져와서 화면에 출력

UserDAO mdao = new UserDAO();
UserService service = UserService.getInstance();
User userVO = service.getUserInfo(id);
%>
<div class="p-t-40">
	<h5 class="mtext-113 cl2 p-b-12" style="font-weight: bold;">배송지 관리</h5>

	<p class="stext-107 cl6 p-b-40">소중한 내 배송지를 최신으로 관리하세요.</p>


	<form action="addressListDefault.do">
	<table border="1">
		<h4>기본 배송지</h4>
		<p>한건만 등록 가능합니다.</p>
		<tr style="center">
			<th>배송지명</th>
			<th>배송지</th>
			<th>우편번호</th>
		</tr>
			
		<c:forEach var="vo2" items="${list2}">
		<tr>
			<td><input type="text" value="${vo2.addrName}"  name="addr_name"></td>
			<td>${vo2.addr} ${vo2.addr2} ${vo2.addrDetail}</td>
			<td>${vo2.zipCode}</td>
			<th>
		</tr>
		</c:forEach>
	</table>
	</form>


	<form action="addressUpdate.do" id="updateForm" name="updateForm">
		<table border="1">
	<h4>주소록 추가</h4>
	<tr style="center">
		<th>아이디</th>
		<th>배송지명</th>
		<th>배송지</th>
		<th>추가하기</th>
	</tr>
	
		<tr>
			<th>
				<input class="input" type="text" name="id" id="id"
				placeholder="User ID" value="<%=userVO.getUserId()%>"
				style="border: none" readonly>
			</th>
			<th>
				<input type="text" placeholder="AddressName" id="addr_name" name="addr_name">
			</th>

			<th>
				<div class="adr">
					<input type="text" id="postcode" value="0000" name="post">
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
					<input type="text" id="address" placeholder="주소" name="address1">
					<input type="text" id="detailAddress" placeholder="상세주소" name="address2">
					<input type="text" id="extraAddress" placeholder="참고주소" name="address3">
				</div>
			</th>
	
			<th>
			<button onclick="updateCheck()" style="background-color:grey;">
			추가</button>
			</th>
		</tr>
	</table>
	</form>
	<br>


	
	<form action="addressDelete.do" id="deleteForm" name="deleteForm">
	<table border="1">
		<h4>배송지 목록</h4>
		<tr style="center">
			<th>배송지명</th>
			<th>배송지</th>
			<th>우편번호</th>

		</tr>
			
		<c:forEach var="vo" items="${list}">
		<tr>
			<td><input type="text" value="${vo.addrName}" id="addr_name" name="addr_name"></td>
			<td>${vo.addr} ${vo.addr2} ${vo.addrDetail}</td>
			<td>${vo.zipCode}</td>
				

			<th>
			<button onclick="return submit2()" style="background-color:grey;">
			기본주소 지정</button>
			</th>
			<th>
			<input type='submit' value='삭제'>
			</th>
			
	
		</tr>
		</c:forEach>
	</table>
	</form>
	<br>
</div>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function submit3(frm) { 
    frm.action='addressOut.do'; 
    frm.submit(); 
	alert("제외완료");
    return true; 
  }

function submit2() { 
    let addrName = event.target.parentElement.parentElement.firstElementChild.firstElementChild.value;
    location.href='addressChange.do?addrName='+addrName;
	alert("등록완료");
    return false;
  } 

function deleteCheck(){
	  deleteForm.submit();
	  alert("삭제완료");
}
function updateCheck() {

	  let pt = document.getElementById("postcode");
	  let ad1 = document.getElementById("address");
	  let ad2 = document.getElementById("detailAddress");
	  let ad3 = document.getElementById("extraAddress");
	  let adn = document.getElementById("addr_name");

	  if (ad1.value == ""||ad2.value == ""||ad3.value == ""||pt.value == ""||adn.value == "") {
		    alert("주소를 입력하세요.");
		    ad1.focus();
		    return false;
		  };
		  
	  updateForm.submit();
	  alert("추가완료");
	}

        
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
