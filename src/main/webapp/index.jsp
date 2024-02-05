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
    text-align: center;
}

.login-box {
    width: 300px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
}

h2 {
    color: #333;
    margin-bottom: 20px;
}

form {
    display: flex;
    flex-direction: column;
}

label {
    margin-bottom: 8px;
    color: #555;
    text-align: left; /* Align labels to the left */
}

input {
    padding: 10px;
    margin-bottom: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

input[type="text"],
input[type="password"] {
    width: 100%;
    box-sizing: border-box;
}

input[type="submit"] {
    background-color: #40A2E3; /* Green color */
    color: #fff;
    cursor: pointer;
    border: none;
    border-radius: 4px;
}

input[type="submit"]:hover {
    background-color: #525CEB; /* Darker shade on hover */
}

</style>
</head>
<body>

    <div class="container">
    <div class="login-box">
        <h2>Login</h2>
        <form action="LoginServlet" method="get">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br><br>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br><br>
            
            <input type="submit" value="Submit">
        </form>
    </div>
</div>
    
</body>
</html>