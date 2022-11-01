<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-31
  Time: 오후 3:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardSave.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <script src="/resources/js"></script>
</head>
<body>
<div class="container" id="save-form">
    <h2>글작성</h2>
    <form action="/board/save" method="post" name="saveForm">
        작성자: <input type="text" name="boardWriter" placeholder="작성자입력" class="form-control"><br>
        글비밀번호: <input type="text" name="boardPass" placeholder="글비밀번호입력" class="form-control"><br>
        제목: <input type="text" name="boardTitle" placeholder="제목입력" class="form-control"><br>
        내용: <input type="text" name="boardContents" placeholder="내용입력" class="form-control"><br>
        <input type="button" value="작성하기" onclick="save()" class="btn btn-primary">
    </form>
    <a href="/" class="btn btn-dark">홈으로 이동</a>
    
</div>
</body>
<script>
    const save = () => {
        document.saveForm.submit();
    }
</script>
</html>
