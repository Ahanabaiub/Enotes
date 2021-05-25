<%--
  Created by IntelliJ IDEA.
  User: CCB
  Date: 4/24/2021
  Time: 4:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
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
        .card-header{
            color: white;
            font-family: 'Noto Serif', serif;
        }
    </style>
</head>
<body>
<%@include file="Components/nav.jsp" %>
<div class="banner">
    <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4 pt-5">
                <div class="card">
                    <div class="card-header">
                        <h1>Registration</h1>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/registration" method="post">
                            <div class="form-group">
                                <label for="exampleInputUname">User Name</label>
                                <input name="uname"  value="${info.uname}" type="text" class="form-control" id="exampleInputUname"
                                       placeholder="Enter User Name">
                                <span style="color: #D32F2F">${info.UnameMsg}</span>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input name="email"  value="${info.email}" type="email" class="form-control" id="exampleInputEmail1"
                                       aria-describedby="emailHelp" placeholder="Enter email">
                                <span style="color: #D32F2F">${info.emailMsg}</span>
                            </div>
                            <div class="form-group">
                                <label for="InputPassword">Password</label>
                                <input name="password" value="${info.password}" type="password" class="form-control" id="InputPassword"
                                       placeholder="Password" >
                                <span style="color: #D32F2F">${info.passMsg}</span>
                            </div>
                            <div class="form-group">
                                <label for="ConfirmInputPassword1">Confirm Password</label>
                                <input name="confirm-pass" type="password" class="form-control" id="ConfirmInputPassword1"
                                       placeholder="Confirm Password" >
                                <span style="color: #D32F2F">${info.msg3}</span>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>
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
