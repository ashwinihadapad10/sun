<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.customer.model.Customer" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
    <style>
    body {
    font-family: 'Arial', sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
    text-align: center;
}

h1 {
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
    background-color: #2196F3;
    color: #fff;
}

th, td {
    padding: 12px;
    border: 1px solid #ddd;
    text-align: left;
}

tbody tr:nth-child(even) {
    background-color: #ddd;
}

tbody tr:hover {
    background-color: #f0f0f0;
}

td[colspan="9"] {
    text-align: center;
    color: #555;
    padding: 20px;
}
    
    
    </style>
</head>
<body>
    <h1>Search Results</h1>
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
            <%@ page import="java.util.List" %>
            <%@ page import="com.customer.model.Customer" %>
            <% 
                List<Customer> searchResults = (List<Customer>) request.getAttribute("searchResults");
                if(searchResults != null && !searchResults.isEmpty()) {
                    for(Customer customer : searchResults) {
            %>
            
                        <tr>
                            <td><%= customer.getUuid() %></td>
                            <td><%= customer.getFirst_name() %></td>
                            <td><%= customer.getLast_name() %></td>
                            <td><%= customer.getStreet() %></td>
                            <td><%= customer.getAddress() %></td>
                            <td><%= customer.getCity() %></td>
                            <td><%= customer.getState() %></td>
                            <td><%= customer.getEmail() %></td>
                            <td><%= customer.getPhone() %></td>
                        </tr>
                        
            <% 
                    }
                } else {
            %>
                    <tr>
                        <td colspan="9">No results found.</td>
                    </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>