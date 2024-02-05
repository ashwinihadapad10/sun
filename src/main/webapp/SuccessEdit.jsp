<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.customer.model.Customer,java.util.List" %>
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
    text-align: center; /* Center-align the content */
}

h1 {
    margin-top: 20px;
    color: #333; /* Heading color */
}

p {
    color: #555; /* Paragraph text color */
}

/* Optional: Add more styling for better aesthetics */


</style>
</head>
<body>
<h1>Success Edit</h1>
     <h1>Customer details updated successfully!</h1>
    <p>Redirecting to Home...</p>
    <%
        // Redirect to home.jsp after a delay
        response.setHeader("Refresh", "3;url=HomeServlet");
    %>
</body>
</html>