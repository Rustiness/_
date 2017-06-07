<%--
   Created
   User: KJK
   Date: 2017-06-07
   Time: 오후 7:18
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="admin/_css/counsel.css" rel="stylesheet" type="text/css"/>
<script src="admin/_js/counsel.js" rel="script" type="text/javascript"></script>
<%-- ad_coun_modify.jsp --%>
<h3>::상담 정보 수정::</h3>
<hr style="color: deeppink">
<center>
	<form id="counModForm" method="post">
		<table border="1" cellpadding="5" id="counModify">
			<tr id="tableHead">
				<th>항목</th>
				<th>정보</th>
			</tr>
			<c:forEach items="${counlist}" var="counInfo">
				<tr>
					<td>cNO</td>
					<td>${counInfo.cNO}</td>
				</tr>
				<tr>
					<td>회원번호</td>
					<td>${counInfo.mNO}</td>
				</tr>
				<tr>
					<td>관심분야</td>
					<td>
							<%-- 상태 --%>
						<select name="pTypeNO">
							<option value="EY" <c:if test="${counInfo.pTypeNO eq 'EY'}">selected</c:if>>눈성형</option>
							<option value="NO" <c:if test="${counInfo.pTypeNO eq 'NO'}">selected</c:if>>코성형</option>
							<option value="FA" <c:if test="${counInfo.pTypeNO eq 'FA'}">selected</c:if>>안면윤각성형</option>
							<option value="BO" <c:if test="${counInfo.pTypeNO eq 'BO'}">selected</c:if>>체형성형</option>
							<option value="BR" <c:if test="${counInfo.pTypeNO eq 'BR'}">selected</c:if>>가슴성형</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>글 작성일</td>
					<td>${counInfo.cDate}</td>
				</tr>
				<tr>
					<td>글 제목</td>
					<td><input name="cTitle" type="text" value="${counInfo.cTitle}"></td>
				</tr>
				<tr>
					<td>글 내용</td>
					<td><textarea name="cContent">${counInfo.cContent}</textarea></td>
				</tr>
				<tr>
					<td>글 조회수</td>
					<td>${counInfo.cCount}</td>
				</tr>
				<tr>
					<td>글 첨부 이미지</td>
					<td><input name="imageURL" type="url" value="${counInfo.imageURL}"></td>
				</tr>
				<tr>
					<td>답변일자</td>
					<td>${fn:substring(counInfo.eDate,0,19)}</td>
				</tr>
				<tr>
					<td>답변자 번호</td>
					<td>${counInfo.eNO}</td>
				</tr>
				<tr>
					<td>답변 코멘트</td>
					<td>${counInfo.eComent}</td>
				</tr>
				<tr>
					<td>state</td>
						<%-- 상태 --%>
					<td>
						<select name="state">
							<option value="1" <c:if test="${counInfo.state eq '1'}">selected</c:if>>공개</option>
							<option value="2" <c:if test="${counInfo.state eq '2'}">selected</c:if>>비공개</option>
							<option value="3" <c:if test="${counInfo.state eq '3'}">selected</c:if>>유저비공개</option>
							<option value="4" <c:if test="${counInfo.state eq '4'}">selected</c:if>>삭제</option>
						</select>
					</td>

				</tr>
			</c:forEach>
			<tr align="center">
				<td id="btnSet" colspan="2">
					<input type="button" id="btnModifyON" value="수정완료">
					<input type="reset" value="초기값 설정">
					<input type="button" id="btnModCancel" value="수정취소">
					<input type="button" id="btnList" value="상담목록">
				</td>
			</tr>
		</table>
	</form>
</center>