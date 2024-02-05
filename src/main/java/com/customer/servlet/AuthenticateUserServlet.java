package com.customer.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class AuthenticateUserServlet {
    public static void main(String[] args) throws IOException {
        // Obtain the bearer token by invoking the getBearerToken() method
        String bearerToken = getBearerToken();
        
        // Display the received token in the console
        System.out.println("Bearer Token: " + bearerToken);
    }

    //Method to retrieve the bearer token through an authentication API call
    public static String getBearerToken() throws IOException {
        // Define the URL for the authentication API endpoint
        String authUrl = "https://qa.sunbasedata.com/sunbase/portal/api/assignment_auth.jsp";
        
        // User credentials for authentication
        String loginId = "test@sunbasedata.com";
        String password = "Test@123";
        
        // Create a JSON object containing the login credentials
        String requestBody = "{\"login_id\":\"" + loginId + "\",\"password\":\"" + password + "\"}";

        // Make a POST request to the authentication API and obtain the token
        String token = sendGetRequest(authUrl, requestBody);
        
        return token;
    }

 // Private method to send a GET request to a specified API URL with a request body
    private static String sendGetRequest(String apiUrl, String requestBody) {
        try {
        	// Establish a connection to the specified API URL
            URL url = new URL(apiUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);
            
            // Write request body to output stream
            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = requestBody.getBytes("utf-8");
                os.write(input, 0, input.length);			
            }
            
            // Check the HTTP response code
            int responseCode = conn.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
            	// Read and process the successful response
                StringBuilder response = new StringBuilder();
                try (BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        response.append(line.trim());
                    }
                }
                return response.toString();
            } else if (responseCode == HttpURLConnection.HTTP_BAD_REQUEST) {
            	 // Read and handle the error response for a bad request
                try (BufferedReader errorReader = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8"))) {
                    StringBuilder errorResponse = new StringBuilder();
                    String errorLine;
                    while ((errorLine = errorReader.readLine()) != null) {
                        errorResponse.append(errorLine.trim());
                    }
                    System.out.println("Failed to fetch customer list. HTTP error code: " + responseCode);
                    System.out.println("Error response: " + errorResponse.toString());
                }
                return null;
            } else {
                // Handle other HTTP error responses
                System.out.println("Failed to fetch customer list. HTTP error code: " + responseCode);
                return null;
            }
        } catch (IOException e) {
            // Handle IOException
            System.out.println("An error occurred while fetching customer list: " + e.getMessage());
            return null;
        }
    }

    private static String extractToken(String response) {
        // Assuming the response contains the token in a specific format Example: "token":"abc123"
        int startIndex = response.indexOf("\"token\":\"") + "\"token\":\"".length();
        int endIndex = response.indexOf("\"", startIndex);
        
     // Check if the token is found in the response
        if (startIndex != -1 && endIndex != -1) {
            return response.substring(startIndex, endIndex);
        } else {
            return null; // Token not found in response
        }
    }
}
