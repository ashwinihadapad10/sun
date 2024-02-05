<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
}

.container {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align: center;
}

h1 {
    color: #2196F3;
}

p {
    color: #555;
    margin-top: 10px;
}

a {
    display: inline-block;
    background-color: #2196F3;
    color: #fff;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 4px;
    margin-top: 20px;
    transition: background-color 0.3s ease;
}

a:hover {
    background-color: #1565C0;
}



</style>
</head>
<body>
<div class="container">
    <h1>Operation Successful</h1>
    <p>The customer has been successfully deleted.</p>
    <a href="home.jsp">Go back to Home</a>
</div>
</body>
</html>