package com.ENotes.Servlets;

import com.ENotes.DAO.NoteDao;
import com.ENotes.DAO.UserDao;
import com.ENotes.Entity.Note;
import com.ENotes.Entity.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

@WebServlet(urlPatterns = "/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();


        UserDao userDao = new UserDao();
        NoteDao noteDao = new NoteDao();


        String email = req.getParameter("email");
        String pass = req.getParameter("password");

        if(userDao.validateUser(email,pass)){
            HttpSession session = req.getSession();
            User user = userDao.getUser(email);
            session.setAttribute("user",user);
            ArrayList<Note> notes = noteDao.getUserNotes(user.getuId());

            session.setAttribute("notes",notes);

            req.getRequestDispatcher("home.jsp").include(req,resp);


        }
        else{
            req.setAttribute("error","Invalid Email or Password.");
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }


    }
}
