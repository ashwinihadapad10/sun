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

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    private CustomerDAO customerDAO;

 // Initialize the CustomerDAO implementation upon servlet initialization
    public void init() {
        customerDAO = new CustomerDaoImpl();
    }

 // Handle GET requests for conducting searches
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	// Retrieve parameters for search criteria and input
        String searchBy = request.getParameter("searchBy");
        String searchInput = request.getParameter("searchInput");
     // Extract the first three characters of the search input
        String searchKeyword = searchInput.substring(0, Math.min(searchInput.length(), 3)); // Take first three characters


     // Check if searchBy and searchInput are not null and not empty
        if (searchBy != null && !searchBy.isEmpty() && searchInput != null && !searchInput.isEmpty()) {
            List<Customer> searchResults = null;

         // Perform searches based on the specified search criteria
            switch (searchBy) {
                case "firstName":
                    searchResults = customerDAO.searchByFirstName(searchInput);
                    break;
                case "city":
                    searchResults = customerDAO.searchByCity(searchInput);
                    break;
                case "email":
                    searchResults = customerDAO.searchByEmail(searchInput);
                    break;
                case "phoneNumber":
                    try {
                        int phoneNumber = Integer.parseInt(searchInput);
                        searchResults = customerDAO.searchByPhoneNumber(phoneNumber);
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                    }
                    break;
                default:
                	// Redirect to InvalidSearchCriteria.jsp for unknown search criteria
                	 response.sendRedirect("InvalidSearchCriteria.jsp");
                    break;
            }

         // Check if searchResults are not null and not empty
            if (searchResults != null && !searchResults.isEmpty()) {
            	// Set the searchResults attribute and forward to the Search.jsp page
                request.setAttribute("searchResults", searchResults);
                request.getRequestDispatcher("/Search.jsp").forward(request, response);
            } else {
            	// Redirect to NoResults.jsp if no search results are found
                response.sendRedirect("NoResults.jsp");
            }
        } else {
        	// Redirect to the home.jsp page if searchBy or searchInput is null or empty
            response.sendRedirect("home.jsp");
        }
    }
}
