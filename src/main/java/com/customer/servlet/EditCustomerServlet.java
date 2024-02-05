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

@WebServlet("/EditCustomerServlet")
public class EditCustomerServlet extends HttpServlet {
    
	// Initialize the CustomerDAO implementation upon servlet initialization
    private CustomerDAO customerDAO;

    public void init() {
        customerDAO = new CustomerDaoImpl();
    }

 // Handle GET requests for customer editing
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	// Retrieve the customer ID parameter from the request
        String customerId = request.getParameter("id");

     // Check if customerId is not null and not empty
        if (customerId != null && !customerId.isEmpty()) {
        	// Convert customerId to a string for processing
            String id = customerId;
         // Retrieve the customer information by ID
            Customer customer = customerDAO.getAllCustomerByID(id);
         // Set the customer attribute for use in the EditCustomer.jsp page
            request.setAttribute("customer", customer);
         // Forward the request to the EditCustomer.jsp page for editing
            request.getRequestDispatcher("/EditCustomer.jsp").forward(request, response);
        } else {
        	// Redirect to the EditFailure.jsp page if customerId is null or empty
            response.sendRedirect("EditFailure.jsp");
        }
    }
}
