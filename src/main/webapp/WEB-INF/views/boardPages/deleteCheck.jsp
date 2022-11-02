<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-01
  Time: 오전 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>deleteCheck</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <form action="board/delete" name="deleteFn">
        <input type="text" name="boardPass" id="boardPass" placeholder="글작성비밀번호입력">
        <input type="button" onclick="boardDelete()" value="확인">
    </form>
</div>
</body>
<script>
    const boardDelete = () => {
        const pass = document.getElementById("boardPass").value;
        const dbPass = '${result.boardPass}'
        if (pass == dbPass) {
            location.href = "/board/delete?id=" + '${result.id}'
        } else {
            alert("비밀번호가 일치하지 않습니다")
        }
    }
</script>

</html>
