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
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
}

h2 {
    text-align: center;
    color: #333;
    margin-top: 20px;
}

table {
    width: 80%;
    margin: 20px auto;
    border-collapse: collapse;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

thead {
    background-color: #4caf50;
    color: #fff;
}

th, td {
    padding: 12px;
    border: 1px solid #ddd;
    text-align: left;
}

tbody tr:nth-child(even) {
    background-color: #f9f9f9;
}

tbody tr:hover {
    background-color: #f0f0f0;
}


</style>

</head>
<body>

   
    
    <h2>All Customers:</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Street</th>
                <th>Address</th>
                <th>City</th>
                <th>State</th>
                <th>Email</th>
                <th>Phone Number</th>
            </tr>
        </thead>
        <tbody>
            <% List<Customer> customers = (List<Customer>) request.getAttribute("customers");
               for(Customer c : customers) { %>
                <tr>
                    <td><%= c.getUuid()%></td>
                    <td><%= c.getFirst_name() %></td>
                    <td><%= c.getLast_name()%></td>
                    <td><%= c.getStreet() %></td>
                    <td><%= c.getAddress() %></td>
                    <td><%= c.getCity() %></td>
                    <td><%= c.getState() %></td>
                    <td><%= c.getEmail() %></td>
                    <td><%= c.getPhone() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>