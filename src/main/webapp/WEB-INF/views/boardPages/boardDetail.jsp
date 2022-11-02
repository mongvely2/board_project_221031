<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-01
  Time: 오전 9:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardDetail.jsp</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
  <style>
    #detail {
      width: 800px;
      margin-top: 50px;
    }
  </style>

</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container" id="detail" >
  <table class="table table-hover">
    <tr>
      <th>번호(id)</th>
      <td>${result.id}</td>
    </tr>
    <tr>
      <th>작성자</th>
      <td>${result.boardWriter}</td>
    </tr>
    <tr>
      <th>비밀번호</th>
      <td>${result.boardPass}</td>
    </tr>
    <tr>
      <th>제목</th>
      <td>${result.boardTitle}</td>
    </tr>
    <tr>
      <th>내용</th>
      <td>${result.boardContents}</td>
    </tr>
    <tr>
      <th>작성시간</th>
      <td>${result.boardCreatedDate}</td>
    </tr>
    <tr>
      <th>조회수</th>
      <td>${result.boardHits}</td>
    </tr>
    <c:if test="${result.storedFileName != null}">
      <tr>
        <th>file</th>
        <td>
          <img src="${pageContext.request.contextPath}/upload/${result.storedFileName}"
               alt="" width="100" height="100">
        </td>
      </tr>
    </c:if>
  </table>
  <button class="btn btn-danger" onclick="listFn()">목록</button>
  <button class="btn btn-primary" onclick="updateFn()">수정</button>
  <button class="btn btn-danger" onclick="deleteFn()">삭제</button>
  <a href="/" class="btn btn-dark">홈으로 이동</a>
</div>
</body>
<script>
  const listFn = () => {
    location.href = "/board/";
  }

  const updateFn = () => {
    location.href = "/board/update?id="+'${result.id}';
  }
  const deleteFn = () => {
    const id = '${result.id}';
    location.href = "/board/deleteForm?id="+ id;


  }
</script>
</html>
