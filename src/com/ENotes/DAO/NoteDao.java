package com.ENotes.DAO;

import com.ENotes.Entity.Note;
import com.ENotes.Util.DbConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class NoteDao {

    Connection con;


    public boolean saveNote(int uId, String title, String note){

        try{
            con = DbConnectionProvider.getConnection();
            PreparedStatement ps = con.prepareStatement("insert into notes(uId,title,note) values(?, ?, ?)");
            ps.setInt(1,uId);
            ps.setString(2,title);
            ps.setString(3,note);

            ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }

        return true;

    }

    public boolean updateNote(int noteId, String title, String note){

        try{
            con = DbConnectionProvider.getConnection();
            PreparedStatement ps = con.prepareStatement("update notes set title = ? , note = ? where idNotes = ?");
            ps.setString(1,title);
            ps.setString(2,note);
            ps.setInt(3, noteId);

            ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }

        return true;

    }

    public boolean deleteNote(int idNote){
        try{
            con = DbConnectionProvider.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from notes where idNotes = ?");
            ps.setInt(1, idNote);

            ps.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }

        return true;
    }

    public ArrayList<Note> getUserNotes(int uId){

        ArrayList<Note> notes = new ArrayList<>();

         try{
             con = DbConnectionProvider.getConnection();

             PreparedStatement ps = con.prepareStatement("select idNotes, title, note from notes where uId = ?");
             ps.setInt(1,uId);

             ResultSet rs =  ps.executeQuery();

             while(rs.next()){
                 notes.add(new Note(rs.getInt("idNotes"), uId,rs.getString("title"),rs.getString("note")));
             }

        } catch (SQLException throwables) {
             throwables.printStackTrace();
         }

        return notes;
    }


    public Note getNote(int nId){

        Note note = null;
        try{
            con = DbConnectionProvider.getConnection();

            PreparedStatement ps = con.prepareStatement("select title, note from notes where idNotes = ?");
            ps.setInt(1,nId);

            ResultSet rs =  ps.executeQuery();





            if(rs.next()){
                note = new Note();
                note.setNoteId(nId);
                note.setTitle(rs.getString("title"));
                note.setContent(rs.getString("note"));

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return note;


    }



}
