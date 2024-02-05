package com.customer.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.customer.dao.CustomerDAO;
import com.customer.daoimpl.CustomerDaoImpl;
import com.customer.model.Customer;

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 // Initialize the CustomerDAO implementation upon servlet initialization
    private CustomerDAO customerDao;

    public void init() {
        customerDao = new CustomerDaoImpl();
    }
    
 // Handle GET requests for displaying the home page
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve all customers from the database
        List<Customer> customers = customerDao.getAllCustomer();
        
        //Set the list of customers in the session attribute
        request.getSession().setAttribute("customers", customers);
        
        // Forward the request to the home page (home.jsp)
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}