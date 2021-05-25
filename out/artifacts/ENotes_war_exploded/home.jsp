<%@ page import="com.ENotes.Entity.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ENotes.Entity.Note" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Home</title>

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <!-- Our Custom CSS-->
    <link rel="stylesheet" href="CSS/style1.css">
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>

</head>

<body>

<div class="wrapper">
    <!-- Sidebar  -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <h3><span class="mlogo">ENotes</span></h3>
        </div>

        <ul class="list-unstyled components">
            <p>Save Yor Notes</p>
            <li class="active">
                <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">My Notes</a>
                <ul class="collapse list-unstyled" id="homeSubmenu">

                     <c:forEach var="note" items="${sessionScope.notes}">
                         <li>
                             <a href="${pageContext.request.contextPath}/update?nId=${note.getNoteId()}"><c:out value="${note.getTitle()}"/></a>
                         </li>
                     </c:forEach>
                </ul>
            </li>
            <li>
                <a href="#"  data-toggle="modal" data-target="#exampleModal">About</a>
            </li>
            <li>
                <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Important</a>
                <ul class="collapse list-unstyled" id="pageSubmenu">
                    <li>
                        <a href="#">Not added yet</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/logout">Logout</a>
            </li>
        </ul>
    </nav>

    <!-- Page Content  -->
    <div id="content">

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">

                <button type="button" id="sidebarCollapse" class="btn btn-info">
                    <i class="fas fa-align-left"></i>
                </button>
                <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-align-justify"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="nav navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link top-nav-uname" href="#"  data-toggle="modal" data-target="#exampleModal">
                               <i class="fas fa-user mx-2"></i><c:out value="${sessionScope.user.uname}"/>
                            </a>
                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header" style="background-color: #4DB6AC; color: white">
                                            <h5 class="modal-title" id="exampleModalLabel">User Details</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body text-center py-5">

                                                <table class="table">
                                                    <tr>
                                                        <td><p>User Id :</p></td>
                                                        <td><c:out value="${sessionScope.user.uId}"/></td>
                                                    </tr>
                                                    <tr>
                                                       <td><p>User Name :</p></td>
                                                        <td><c:out value="${sessionScope.user.uname}"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p>Email :</p></td>
                                                        <td><c:out value="${sessionScope.user.email}"/></td>
                                                    </tr>

                                                </table>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/logout">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <form action="${pageContext.request.contextPath}/save" method="post">
           <div class="form-group">
               <c:if test="${empty nId}">
                   <input type="submit" class="btn btn-primary mb-3 cscolor" value="Save">
               </c:if>
               <c:if test="${not empty nId}">
                   <input type="submit" class="btn btn-primary mb-3 cscolor" value="Update">
                   <a href="${pageContext.request.contextPath}/delete?nId=${nId}" style="color: #D32F2F" id="delete" class="px-3"><i class="fas fa-trash fa-2x"></i></a>
                   <a href="home.jsp" style="color: #66BB6A"><i class="fas fa-plus fa-2x"></i></a>
               </c:if>

               <input name="nId" type="hidden" value="${nId}">
               <input name="title" value="${nTitle}" class="form-control shadow-none" type="text" placeholder="Title">
               <br>
               <textarea name="note" class="form-control shadow-none" spellcheck="false" rows="20" cols="20" style="resize: none;">${nContent}</textarea>
           </div>
        </form>

    </div>
</div>


<!-- jQuery CDN - Slim version (=without AJAX) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<!-- Popper.JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<!-- jQuery Custom Scroller CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#sidebar").mCustomScrollbar({
            theme: "minimal"
        });

        $("#delete").click(function (e) {
            e.preventDefault();
            var choice = confirm("Are you sure to delete this?");

            if(choice)
            {
                window.location.href = $(this).attr('href');
            }
        });

        $('#sidebarCollapse').on('click', function () {
            $('#sidebar, #content').toggleClass('active');
            $('.collapse.in').toggleClass('in');
            $('a[aria-expanded=true]').attr('aria-expanded', 'false');
        });
    });
</script>
</body>

</html>