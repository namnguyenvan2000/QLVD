package com.poly.Service;

import javax.servlet.ServletContext;

import com.poly.Entity.User;

public interface EmailService {
   void sendMail(ServletContext context,User recipient,String type);
}
