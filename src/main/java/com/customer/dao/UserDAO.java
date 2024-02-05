package com.customer.dao;

import java.util.List;


import com.customer.model.User;

public interface UserDAO {
//boolean validateLogin(String username, String password);
	List<User> getAllUser();
}
