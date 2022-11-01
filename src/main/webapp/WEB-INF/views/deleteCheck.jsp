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
<div class="container">
    <form action="deleteBoard">
        <input type="text" name="boardPass" placeholder="글작성비밀번호입력">
        <button onclick="delete()"></button>

    </form>
</div>
</body>
</html>
