<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View ToDo Item List</title>

    <!-- Bootstrap & Toastr -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <!-- Single style block -->
    <style>
        body {
            background-image: url('<c:url value="/images/b1.jpg" />');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            /* color: white; */
        }
        a {
            color: white;
            text-decoration: none;
        }
        a:hover {
            color: white;
            text-decoration: none;
        }
        table {
            border: 8px solid black;
            box-shadow: 0 4px 12px rgba(0,0,0,0.4);
            background-color: rgba(0,0,0,0.3);
        }
        th {
            border: 1px solid black;
            text-align: center;
            color: white;
        }
        td {
            border: 1px solid black;
            color: white;
        }
        tr:hover {
            background-color: rgba(255, 255, 255, 0.2);
            transition: background-color 0.3s ease;
        }
    </style>
</head>
<body>

<div class="container">
   <h1 class="p-3 text-center font-weight-bold" style="text-shadow: 2px 2px 4px black;">ToDo Item List</h1>


    <form:form>
        <table class="table table-bordered">
            <tr>
                <th>Id</th>
                <th>Title</th>
                <th>Date</th>
                <th>Status</th>
                <th>Mark Completed</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <c:forEach var="todo" items="${list}">
                <tr>
                    <td>${todo.id}</td>
                    <td>${todo.title}</td>
                    <td>${todo.date}</td>
                    <td>${todo.status}</td>
                    <td><button type="button" class="btn btn-success">
                        <a href="/updateToDoStatus/${todo.id}">Mark Complete</a>
                    </button></td>
                    <td><button type="button" class="btn btn-primary">
                        <a href="/editToDoItem/${todo.id}">Edit</a>
                    </button></td>
                    <td><button type="button" class="btn btn-danger">
                        <a href="/deleteToDoItem/${todo.id}">Delete</a>
                    </button></td>
                </tr>
            </c:forEach>
        </table>
    </form:form>

    <button type="button" class="btn btn-primary btn-block">
        <a href="/addToDoItem">Add New ToDo Item</a>
    </button>
</div>

<script th:inline="javascript">
    window.onload = function () {
        var msg = "${message}";
        if (msg == "Save Success") {
            toastr["success"]("Item added successfully!!");
        } else if (msg == "Delete Success") {
            toastr["success"]("Item deleted successfully!!");
        } else if (msg == "Delete Failure") {
            toastr["error"]("Some error occurred, couldn't delete item");
        } else if (msg == "Edit Success") {
            toastr["success"]("Item updated successfully!!");
        }
        toastr.options = {
            "closeButton": true,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "timeOut": "5000"
        };
    }
</script>

</body>
</html>
