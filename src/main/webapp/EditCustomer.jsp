<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.customer.model.Customer" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Customer</title>
    <link rel="stylesheet" type="text/css" href="css/EditCustomer.css">
    
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

form {
    width: 30%;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

label {
    display: block;
    margin: 10px 0;
    font-weight: bold;
    color: #000; /* Label text color */
    text-align: left; /* Align label text to the left */
}

input {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    box-sizing: border-box;
    border: 1px solid #ddd;
    border-radius: 4px;
}

input[type="submit"] {
    background-color: #2196F3; /* Blue color for submit button */
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #1769aa; /* Darker blue color on hover */
}

/* Optional: Add more styling for better aesthetics */

/* Optional: Add more styling for better aesthetics */
</style>
    
</head>
<body>
    <h1>Edit Customer</h1>
    <%
        Customer customer = (Customer) request.getAttribute("customer");
    %>
    <form action="UpdateCustomerServlet" method="post">
        <input type="hidden" name="id" value="<%= customer.getUuid()%>">
        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="firstName" value="<%= customer.getFirst_name()%>"><br><br>
        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lastName" value="<%= customer.getLast_name()%>"><br><br>
        <label for="street">Street:</label>
        <input type="text" id="street" name="street" value="<%= customer.getStreet() %>"><br><br>
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" value="<%= customer.getAddress() %>"><br><br>
        <label for="city">City:</label>
        <input type="text" id="city" name="city" value="<%= customer.getCity() %>"><br><br>
        <label for="state">State:</label>
        <input type="text" id="state" name="state" value="<%= customer.getState() %>"><br><br>
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" value="<%= customer.getEmail() %>"><br><br>
        <label for="phoneNumber">Phone Number:</label>
        <input type="text" id="phoneNumber" name="phoneNumber" value="<%= customer.getPhone() %>"><br><br>
        <input type="submit" value="Update">
    </form>
</body>
</html>