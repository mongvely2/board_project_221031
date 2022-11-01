<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-31
  Time: 오후 2:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
</head>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>
<div class="container">
<h3>회원제 게시판</h3>

<button class="btn btn-primary" onclick="boardSaveForm()" >글작성</button>
<button class="btn btn-primary" onclick="boardList()" >글목록</button>
<%--<button class="btn btn-primary" onclick="boardDetail()" >상세조회</button>--%>
</div>
</body>
<script>
    const boardSaveForm = () => {
        location.href = "/board/save";
    }

    const boardList = () => {
        location.href = "/board/";
    }

    // const boardDetail = () => {
    //     location.href = "/board"
    // }
</script>
</html>
