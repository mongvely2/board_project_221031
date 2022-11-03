<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-03
  Time: 오전 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
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
                    <a href="/board?id=${board.id}&page=${paging.page}" onclick="hit('${board.id}')" id="boardHit">${board.boardTitle}</a>
                </td>
                <td>${board.boardContents}</td>
                <td>
                    <fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
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
<div class="container">
    <ul class="pagination justify-content-center">
        <c:choose>
            <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌 --%>
            <c:when test="${paging.page<=1}">
<%--                disabled : 비활성화 하겠다, 이전 버튼 비활성화         --%>
                <li class="page-item disabled">
                    <a class="page-link">[이전]</a>
                </li>
            </c:when>
            <%-- 1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 --%>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/board/paging?page=${paging.page-1}">[이전]</a>
                </li>
            </c:otherwise>
        </c:choose>

        <%--  for(int i=startPage; i<=endPage; i++)     step: i++ 역할 수행 --%>
        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <c:choose>
                <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 --%>
                <c:when test="${i eq paging.page}">
<%--                                     active: 파란배경에 버튼 비활성화 역할 수행       --%>
                    <li class="page-item active">
                        <a class="page-link">${i}</a>
                    </li>
                </c:when>

                <c:otherwise>
                    <li class="page-item">
<%--                                                                    i>i: 클릭한 페이지로 이동하는 코드         --%>
                        <a class="page-link" href="/board/paging?page=${i}">${i}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose>
            <c:when test="${paging.page>=paging.maxPage}">
                <li class="page-item disabled">
                    <a class="page-link">[다음]</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/board/paging?page=${paging.page+1}">[다음]</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>

</body>
</html>
