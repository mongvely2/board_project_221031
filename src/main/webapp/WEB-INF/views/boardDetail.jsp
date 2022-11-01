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
</head>
<body>
<div class="container">
  <table class="table">
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
  </table>
  <button class="btn btn-danger" onclick="deleteBoard(${board.id})">삭제</button>
  <button class="btn btn-primary" onclick="updateBoard(${board.id})">수정</button>
  <a href="/" class="btn btn-dark">홈으로 이동</a>
</div>
</body>
<script>
  const deleteBoard = boardId => {
    console.log("delete 실행")
    location.href = "/deleteCheckPage";
  }
</script>
</html>
