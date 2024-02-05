<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.customer.model.Customer, java.util.List " %>
  <%
    // Check if the customer list has been updated
    String updated = request.getParameter("updated");
    if (updated != null && updated.equals("true")) {
        // Retrieve the updated customer list from wherever it's stored
        List<Customer> updatedCustomers = (List<Customer>) request.getAttribute("customers");
        session.setAttribute("customers", updatedCustomers);
    }
%>
<%

    // Pagination variables
    int pageSize = 5; // Number of records per page
    List<Customer> customers = (List<Customer>) session.getAttribute("customers");
    int totalCustomers = customers.size();
    int totalPages = (int) Math.ceil((double) totalCustomers / pageSize);
    int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

    // Ensure currentPage is within valid bounds
    currentPage = Math.min(Math.max(currentPage, 1), totalPages);

    // Calculate start and end index of records for the current page
    int startIndex = (currentPage - 1) * pageSize;
    int endIndex = Math.min(startIndex + pageSize, totalCustomers);

    // Get the sublist of customers for the current page
    List<Customer> currentCustomers = customers.subList(startIndex, endIndex);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
 <style>
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    text-align: center; /* Center-align the content */
}

.container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px;
}

button{
    background-color: #2196F3; /* Set the button color to the previous blue color */
    color: #fff;
    padding: 10px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-right: 10px; /* Adjust spacing as needed */
}

/* Hover effect for "Add Customer" button */
button.add-customer:hover {
    background-color: #6895D2; /* Darker green on hover */
}


div.logout button {
    background-color: #D24545; /* Set the button color to red */
    color: #fff;
    padding: 10px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

form {
    display: flex;
    align-items: center;
}

select[name="searchBy"],
input[type="text"],
input[type="submit"] {
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
}
select[name="searchBy"] + input[type="text"] {
    margin-left: 10px;
}

form input[type="text"] {
    margin-right: 10px; /* Adjust the margin as needed */
}

/* Style for Search bar */
form input[type="text"] {
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

/* Hover effect for Search bar */
form input[type="text"]:focus {
    outline: none;
    border-color: #2196F3; /* Change border color on focus */
}

form input[type="submit"] {
    background-color: #4CAF50; /* Set the button color to green */
    color: #fff;
    padding: 10px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-right: 10px; 
}

/* Hover effect for Search button */
form input[type="submit"]:hover {
    background-color: #45a049; /* Darker green on hover */
}

div.sync button {
    background-color: #000; /* Set the button color to black */
    color: #fff; /* Set the text color to white */
    padding: 10px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-left: 10px; /* Add space to the left of the sync button */
}

/* Hover effect for Sync button */
div.sync button:hover {
    background-color: #333; /* Darker color on hover */
}



.logout {
    margin-left: auto;
}




h1 {
    margin-top: 20px;
}

table {
    margin-top: 20px;
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 10px;
    text-align: left;
    border: 1px solid #ddd;
}

th {
    background-color: #2196F3;
    color: white;
}
tbody tr:nth-child(even){
    background-color: #ddd; /* Grey color for table body */
}

.pagination {
    margin-top: 20px;
    display: flex;
    justify-content: center; /* Center-align pagination */
    align-items: center; /* Align items vertically */
}

.pagination a {
    padding: 8px;
    margin: 0 5px;
    text-decoration: none;
    color: #333;
    display: inline-block; /* Ensure pagination items are on the same line */
	background-color: #ddd; /* Background color behind pagination numbers */
    border-radius: 4px;
}

.pagination a:hover {
    background-color: #2196F3;
    color: #fff;
}

.delete-link,
.edit-link {
    text-decoration: none;
    color: #333;
    margin-right: 5px;
}

.delete-link:hover {
    color: red; /* Set the delete symbol color to red */
}

.edit-link:hover {
    color: black; /* Set the edit symbol color to black */
}


 
 </style>
</head>
<body>
   

    
    
       
    
     <h1>Customer Records</h1>
     
     <div class="container">
        <button class="add-customer" onclick="window.location.href='AddCustomer.jsp'">Add Customer</button>
        <form action="SearchServlet" method="get">
            <select name="searchBy">
                <option value="">Search By</option>
                <option value="firstName">First Name</option>
                <option value="city">City</option>
                <option value="email">Email</option>
                <option value="phoneNumber">Phone Number</option>
            </select>
            <input type="text" name="searchInput" placeholder="Enter search term">
            <input type="submit" value="Search">
        </form>
        
        
        
        <div class=sync">
         <form action="SyncCustomerServlet" method="post">
            <button type="submit" class="sync-button">sync</button>
        </form>
        </div>
        
        <div class="logout">
         <form action="LogoutServlet" method="post">
            <button type="submit">Logout</button>
        </form>
        </div>
        
    
    </div>
    
   
    
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
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% for(Customer customer : currentCustomers) { %>
                <tr>
                    <td><%= customer.getUuid()%></td>
                    <td><%= customer.getFirst_name() %></td>
                    <td><%= customer.getLast_name()%></td>
                    <td><%= customer.getStreet() %></td>
                    <td><%= customer.getAddress() %></td>
                    <td><%= customer.getCity() %></td>
                    <td><%= customer.getState() %></td>
                    <td><%= customer.getEmail() %></td>
                    <td><%= customer.getPhone()%></td>
                    <td>
                        <a href="DeleteCustomerServlet?id=<%= customer.getUuid() %>" class="delete-link"><i class="fas fa-trash-alt"></i></a>
                        |
                        <a href="EditCustomerServlet?id=<%= customer.getUuid() %>" class="edit-link"><i class="fas fa-edit"></i></a>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
    
    <%-- Pagination links --%>
    <% if (totalPages > 1) { %>
        <div class="pagination">
            <strong>Pages:</strong>
            <% for (int pageLink = 1; pageLink <= totalPages; pageLink++) { %>
                <a href="HomeServlet?page=<%= pageLink %>"><%= pageLink %></a>
            <% } %>
        </div>
    <% } %>
   

</body>
</html>