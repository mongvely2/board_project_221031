<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-01
  Time: 오전 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardUpdate.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <style>
        #updateFn {
            width: 800px;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container" id="updateFn">
    <form action="/board/update" name="updateResult" method="post">
        번호: <input type="text" name="id" value="${result.id}" class="form-control" readonly>
        작성자: <input type="text" name="boardWriter" value="${result.boardWriter}" class="form-control" readonly>
        비밀번호: <input type="text" name="boardPass" id="boardPass" class="form-control"> <%-- value 빼야함_비밀번호 노출 방지 --%>
        제목: <input type="text" name="boardTitle" value="${result.boardTitle}" class="form-control">
        내용: <textarea name="boardContents" cols="30" rows="10" class="form-control">${result.boardContents}</textarea>
<%--        <input type="text" name="boardContents" value="${member.boardContents}" class="form-control">--%>
        <input type="button" value="수정" class="btn btn-warning" onclick="update()">
    </form>
    <a href="/" class="btn btn-dark">홈으로 이동</a>

</div>
</body>
<script>
const resultWriter = '${result.boardWriter}';
console.log(resultWriter);

    const update = () => {
        const dbPass = '${result.boardPass}';
        const inputPass = document.getElementById("boardPass").value;
        if (dbPass == inputPass) {
            document.updateResult.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다")
        }
    }
</script>
</html>
