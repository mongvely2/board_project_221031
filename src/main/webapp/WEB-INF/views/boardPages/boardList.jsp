
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-31
  Time: 오후 4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>boardList.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <script src="/resources/js/jquery.js"></script>
    <style>
        #list{
            width: 800px;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container" id="list">
    <table class="table table-striped table-hover text-center">
        <tr>
            <th>번호</th>
            <th>작성자</th>
            <th>비밀번호</th>
            <th>제목</th>
            <th>내용</th>
            <th>작성시간</th>
            <th>조회수</th>
<%--            <th>상세조회</th>--%>
        </tr>
        <c:forEach items="${boardList}" var="board">
        <tr>
            <td>${board.id}</td>
            <td>${board.boardWriter}</td>
            <td>${board.boardPass}</td>
            <td>
                <a href="/board?id=${board.id}" onclick="hit('${board.id}')" id="boardHit">${board.boardTitle}</a>
            </td>
            <td>${board.boardContents}</td>
            <td>
                    <fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate>
            </td>
            <td>${board.boardHits}</td>
            <td>
<%--                <a href="/board?id=${board.id}">조회</a>--%>
<%--                <button class="btn btn-success" id="findById" onclick="findBoard('${board.id}')">조회</button>--%>
            </td>
        </tr>
        </c:forEach>
    </table>
<%--    <div id="detail-area"></div>--%>
    <a href="/" class="btn btn-dark">홈으로 이동</a>
</div>
</body>
<%--<script>--%>
<%--    const findBoard = findId => {--%>
<%--        const detailArea = document.getElementById("detail-area");--%>
<%--        console.log("findId", findId)--%>

<%--        $.ajax({--%>
<%--            --%>
<%--        });--%>
<%--    }--%>
<%--</script>--%>
</html>
