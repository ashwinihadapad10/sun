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
        }

        

        h1 {
            text-align: center;
        margin: 20px 0;
        font-size: 24px; /* Adjust the font size as needed */
        }
        

        form {
            max-width: 400px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #2196F3;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #1565C0;
        }
    </style>

</head>

<body>

<h1>Add New Customer</h1>


   
    <form action="AddCustomerServlet" method="post">
    <label for="customerid">Customer ID:</label>
        <input type="text" id="customerid" name="customerid" required><br><br>
        
        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="firstName" required><br><br>
        
        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lastName" required><br><br>
        
        <label for="street">Street:</label>
        <input type="text" id="street" name="street" required><br><br>
        
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required><br><br>
        
        <label for="city">City:</label>
        <input type="text" id="city" name="city" required><br><br>
        
        <label for="state">State:</label>
        <input type="text" id="state" name="state" required><br><br>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="phoneNumber">Phone Number:</label>
        <input type="text" id="phoneNumber" name="phoneNumber" required><br><br>
        
        <input type="submit" value="Submit">
    </form>
</body>
</html>