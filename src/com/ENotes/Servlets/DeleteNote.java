package com.ENotes.Servlets;

import com.ENotes.DAO.NoteDao;
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

@WebServlet(urlPatterns = "/delete")
public class DeleteNote extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int noteId = Integer.parseInt(req.getParameter("nId"));

        NoteDao noteDao = new NoteDao();

        noteDao.deleteNote(noteId);

        HttpSession session  = req.getSession();

        User user = (User)session.getAttribute("user");

        ArrayList<Note> notes = noteDao.getUserNotes(user.getuId());

        session.setAttribute("notes",notes);

        req.getRequestDispatcher("home.jsp").forward(req, resp);



    }
}
