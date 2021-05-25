<%@ page import="com.ENotes.Util.DbConnectionProvider" %>
<%@ page import="java.sql.Connection" %>
<%--
  Created by IntelliJ IDEA.
  User: Ahanab
  Date: 4/23/2021
  Time: 10:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>ENotes</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
          integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/style.css">
    <style>
        #features h1{
            font-family: 'Orelega One', cursive;
            color: #66BB6A;
        }
    </style>
</head>
<body>
<%@include file="Components/nav.jsp"%>
<div class="banner">
    <div class="banner-area">
        <h1>Write Down Your Important Notes</h1>
        <p>Take notes and forget later where it was, Dont worry.</p>
        <p>To Get Started <a href="registration.jsp" class="btn btn-outline-info">Click Here</a></p>
    </div>
</div>
<div class="container">
    <div class="p-5" id="features">
        <h1>Whats makes Enotes Handy -</h1>
        <p>Easy to use and completely free. You can get started with it just after registration.</p>
        <br>
        <p>Create note and access it anytime from anywhere. <b>This is the right place where your messy thoughts can get handy.</b></p>
        <br>
        <p>Update and delete note according to your use. </p>
    </div>
</div>

<%@include file="Components/footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>
