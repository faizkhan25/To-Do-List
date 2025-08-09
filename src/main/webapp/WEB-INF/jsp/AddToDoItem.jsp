<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add ToDo Item</title>

    <!-- Bootstrap & Toastr -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <style>
        body {
            background-image: url('<c:url value="/images/b1.jpg" />');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: white;
        }
        .form-container {
            background-color: rgba(0, 0, 0, 0.2);
            border: 2px solid black;
            box-shadow: 0 4px 12px rgba(0,0,0,0.5);
            border-radius: 10px;
            padding: 30px;
            margin-top: 60px;
        }
        h1 {
            text-align: center;
            font-weight: bold;
            text-shadow: 2px 2px 4px black;
            margin-bottom: 30px;
        }
        label {
            font-weight: bold;
            color: white;
        }
        .form-control {
            background-color: rgba(255, 255, 255, 0.8);
            border: 1px solid black;
        }
        .btn-success {
            width: 100%;
            font-weight: bold;
        }
        .btn-success:hover {
            box-shadow: 0 0 10px rgba(0,255,0,0.7);
            transform: scale(1.02);
            transition: all 0.3s ease;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="col-md-6 offset-md-3 form-container">
        <h1>Add a ToDo Item</h1>

        <form:form action="/saveToDoItem" method="post" modelAttribute="todo">
            <div class="form-group">
                <label for="title">Title</label>
                <form:input type="text" path="title" id="title" class="form-control" required="required" />
            </div>

            <div class="form-group">
                <label for="date">Date</label>
                <form:input type="date" path="date" id="date" class="form-control" required="required" />
            </div>
            
            <div class="form-group">
                <label for="status">Status</label>
                <form:input type="text" path="status" id="status" class="form-control" value="Incomplete" />
            </div>

            <button type="submit" class="btn btn-success">Save</button>
        </form:form>
    </div>
</div>

<script th:inline="javascript">
    window.onload = function() {
        var msg = "${message}";
        if (msg == "Save Failure") {
            toastr["error"]("Something went wrong with the save.");
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
