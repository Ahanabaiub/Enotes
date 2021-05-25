package com.ENotes.Servlets;

import com.ENotes.DAO.NoteDao;
import com.ENotes.Entity.Note;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/update")
public class UpdateNote extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int noteId = Integer.parseInt(req.getParameter("nId"));

        NoteDao noteDao = new NoteDao();

        Note note = noteDao.getNote(noteId);

        req.setAttribute("nId",noteId);
        req.setAttribute("nTitle",note.getTitle());
        req.setAttribute("nContent",note.getContent());

        req.getRequestDispatcher("home.jsp").forward(req,resp);



    }
}
