package com.ENotes.Entity;

public class Note {
    private int noteId;
    private int userId;
    private String title;
    private String content;

    public Note() {
    }

    public Note(int noteId, int userId, String title, String content) {
        this.noteId=noteId;
        this.userId = userId;
        this.title = title;
        this.content = content;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getNoteId() {
        return noteId;
    }

    public void setNoteId(int noteId) {
        this.noteId = noteId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
