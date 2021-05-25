
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>
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
                        <h1>Login</h1>
                    </div>
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger" role="alert">
                            <c:out value="${error}"/>
                        </div>
                    </c:if>
                    <c:if test="${not empty success}">
                        <div class="alert alert-success" role="alert">
                            <c:out value="${success}"/>
                        </div>
                    </c:if>
                    <div class="card-body">
                        <% request.removeAttribute("success");
                           request.removeAttribute("error");
                        %>
                        <form action="${pageContext.request.contextPath}/login" method="post">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input name="email" type="email" class="form-control" id="exampleInputEmail1"
                                       aria-describedby="emailHelp" placeholder="Enter email">
                            </div>
                            <div class="form-group">
                                <label for="InputPassword">Password</label>
                                <input name="password" type="password" class="form-control" id="InputPassword"
                                       placeholder="Password">
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
