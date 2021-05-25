package com.ENotes.Servlets;

import com.ENotes.DAO.NoteDao;
import com.ENotes.DAO.UserDao;
import com.ENotes.Entity.Note;
import com.ENotes.Entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

@WebServlet(urlPatterns = "/save")
public class SaveNote extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        NoteDao noteDao = new NoteDao();
        UserDao userDao = new UserDao();

        String  nId = req.getParameter("nId");
        String title = req.getParameter("title");
        String note = req.getParameter("note");

        HttpSession session  = req.getSession();

        User user = (User)session.getAttribute("user");

       // System.out.println("Note Id: "+nId);



        if(!title.isEmpty() && !note.isEmpty()){

            if(nId.isEmpty()){
                noteDao.saveNote(user.getuId(),title, note);
            }
            else{

                noteDao.updateNote(Integer.parseInt(nId), title, note);

            }
        }


        //if(noteDao.getNote())

        ArrayList<Note> notes = noteDao.getUserNotes(user.getuId());

        session.setAttribute("notes",notes);
        //req.setAttribute("notes",notes);
        req.getRequestDispatcher("home.jsp").forward(req, resp);


    }
}
