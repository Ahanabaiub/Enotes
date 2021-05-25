package com.ENotes.Servlets;

import com.ENotes.DAO.UserDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(urlPatterns = "/registration")
public class registrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String uname = req.getParameter("uname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPass = req.getParameter("confirm-pass");

        Map<String, String> info = new HashMap<>();
        info.put("email",email);
        info.put("password",password);
        info.put("uname",uname);
        req.setAttribute("info",info);

        if(email.isEmpty() || password.isEmpty() || confirmPass.isEmpty() || uname.isEmpty()){

            /*req.setAttribute("email",email);
            req.setAttribute("password",password);
            req.setAttribute("email-msg","Email Required");
            req.setAttribute("pass-msg","Password Required");
*/
            if(uname.isEmpty())
                info.put("UnameMsg","User Name Required.");
            if(email.isEmpty())
              info.put("emailMsg","Email Required");
            if(password.isEmpty())
              info.put("passMsg","Password Required");


            RequestDispatcher dispatcher = req.getRequestDispatcher("registration.jsp");
            dispatcher.forward(req,resp);
        }
        else if(!password.equals(confirmPass)){

            info.put("msg3","Must be same as password.");

            RequestDispatcher dispatcher = req.getRequestDispatcher("registration.jsp");
            dispatcher.forward(req,resp);

        }
        else{

            UserDao userDao = new UserDao();

            if(userDao.registerUser(uname,email,password)){
                req.setAttribute("success","Registration Successful");
                //req.removeAttribute("info");
                RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
                dispatcher.include(req,resp);
            }
            else{

                RequestDispatcher dispatcher = req.getRequestDispatcher("registration.jsp");
                dispatcher.include(req,resp);

            }


        }



    }
}
