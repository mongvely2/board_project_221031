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
    <style>
        #st {
            width: 500px;
            margin-top: 50px;
            position: center;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container" id="st">
<%--    하나만 비교하면 되기 때문에 굳이 form 태그 사용하지 않아도 됨--%>
<%--    <form action="board/delete" name="deleteFn">--%>
        <input type="text" name="boardPass" id="boardPass" placeholder="글작성비밀번호입력" class="form-control">
<%--        <input type="button" onclick="boardDelete()" value="확인">--%>
<%--    form 태그 안에서 button 사용하게 되면 넘어가기만 하기 때문에 사용금지
        지금은 form태그 없이 input만 사용했기에 button 태그 사용 가능--%>
        <button class="btn btn-secondary" onclick="boardDelete()" >확인</button>
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
