package com.customer.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.customer.dao.CustomerDAO;
import com.customer.daoimpl.CustomerDaoImpl;
import com.customer.model.Customer;

@WebServlet("/AddCustomerServlet")
public class AddCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 // Instantiate a CustomerDAO object to interact with the database
    private CustomerDAO customerDao;

 // Initialization method called when the servlet is first created
    public void init() {
    	 // Initialize the CustomerDAO implementation
        customerDao = new CustomerDaoImpl();
    }

 // Handle POST requests
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	// Retrieve customer information from request parameters
    	 String customerid = request.getParameter("customerid");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String street = request.getParameter("street");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        
     // Create a new Customer object with the retrieved information
        Customer newCustomer = new Customer(customerid,firstName, lastName, street, address, city, state, email, phoneNumber);
        
        // Adding  the new customer information to the database
        customerDao.addCustomer(newCustomer);
        
        // Go back to the home page after adding the customer.
        response.sendRedirect("HomeServlet");
    }
}
