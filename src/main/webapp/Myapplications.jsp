<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="utilities.Application" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>My Applications | JobPortal</title>

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">



<style>
    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        background: #fffaf5;
        font-family: Arial, sans-serif;
        color: #1f2937;
    }

    /* ================= NAVBAR ================= */

    .navbar-custom {
        background: #111111;
        border-bottom: 1px solid #333333;
        padding: 15px 0;
    }

    .brand {
        text-decoration: none;
        font-size: 25px;
        font-weight: 800;
        color: #ff7900;
    }

    .brand span {
        color: #ffffff;
    }

    .nav-link-custom {
        text-decoration: none;
        color: #e5e5e5;
        font-weight: 600;
        margin-left: 25px;
    }

    .nav-link-custom:hover {
        color: #ff7900;
    }

    /* ================= MAIN ================= */

    .main-container {
        max-width: 1150px;
        margin: 45px auto 70px;
    }

    /* ================= PAGE HEADER ================= */

    .page-heading {
        margin-bottom: 30px;
    }

    .page-heading h1 {
        font-size: 34px;
        font-weight: 800;
        color: #111111;
        margin-bottom: 8px;
    }

    .page-heading p {
        color: #6b7280;
        margin: 0;
    }

    /* ================= STAT CARDS ================= */

    .stat-card {
        background: white;
        border: 1px solid #f0dfd0;
        border-radius: 14px;
        padding: 20px;
        height: 100%;
        box-shadow: 0 5px 20px rgba(0,0,0,0.04);
        transition: 0.3s;
    }

    .stat-card:hover {
        transform: translateY(-4px);
        box-shadow: 0 8px 25px rgba(244,119,0,0.10);
    }

    .stat-icon {
        width: 45px;
        height: 45px;
        border-radius: 10px;
        background: #fff0df;
        color: #f47700;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 20px;
        margin-bottom: 12px;
    }

    .stat-number {
        font-size: 25px;
        font-weight: 800;
        color: #111111;
    }

    .stat-label {
        color: #6b7280;
        font-size: 14px;
    }

    /* ================= APPLICATION CARD ================= */

    .applications-card {
        background: white;
        border: 1px solid #f0dfd0;
        border-radius: 18px;
        box-shadow: 0 8px 30px rgba(0,0,0,0.05);
        overflow: hidden;
        margin-top: 30px;
    }

    /* ================= CARD HEADER ================= */

    .card-heading {
        padding: 25px 28px;
        border-bottom: 1px solid #f0dfd0;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .card-heading h3 {
        margin: 0;
        font-size: 20px;
        font-weight: 800;
        color: #111111;
    }

    .card-heading p {
        margin: 5px 0 0;
        color: #6b7280;
        font-size: 14px;
    }

    /* ================= TABLE ================= */

    .table-container {
        padding: 0;
    }

    .table {
        margin: 0;
        vertical-align: middle;
    }

    .table thead th {
        background: #fff3e8;
        color: #7c4a20;
        font-size: 12px;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        font-weight: 700;
        padding: 17px 20px;
        border-bottom: 1px solid #f0dfd0;
        border-top: none;
    }

    .table tbody td {
        padding: 20px;
        border-bottom: 1px solid #f5eee8;
    }

    .table tbody tr:last-child td {
        border-bottom: none;
    }

    .table tbody tr:hover {
        background: #fffaf5;
    }

    /* ================= IDs ================= */

    .application-id {
        font-weight: 800;
        color: #f47700;
    }

    .job-id {
        font-weight: 700;
        color: #111111;
    }

    /* ================= DATE ================= */

    .date-text {
        color: #4b5563;
        font-size: 14px;
    }

    /* ================= STATUS ================= */

    .status-badge {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        padding: 7px 13px;
        border-radius: 30px;
        background: #fff0df;
        color: #c45b00;
        font-size: 12px;
        font-weight: 700;
    }

    /* ================= ACTION BUTTONS ================= */

    .action-btn {
        border-radius: 8px;
        padding: 8px 13px;
        font-size: 13px;
        font-weight: 600;
        margin: 2px;
    }

    .view-btn {
        background: #fff0df;
        color: #c45b00;
        border: 1px solid #ffd1a8;
    }

    .view-btn:hover {
        background: #f47700;
        color: white;
        border-color: #f47700;
    }

    .cancel-btn {
        background: #fff1f2;
        color: #dc2626;
        border: 1px solid #fecdd3;
    }

    .cancel-btn:hover {
        background: #dc2626;
        color: white;
    }

    /* ================= EMPTY STATE ================= */

    .empty-state {
        text-align: center;
        padding: 75px 25px;
    }

    .empty-icon {
        width: 75px;
        height: 75px;
        background: #fff0df;
        color: #f47700;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 32px;
        margin: 0 auto 20px;
    }

    .empty-state h3 {
        font-size: 22px;
        font-weight: 800;
        color: #111111;
        margin-bottom: 8px;
    }

    .empty-state p {
        color: #6b7280;
        margin-bottom: 25px;
    }

    .browse-btn {
        background: #f47700;
        color: white;
        border: none;
        padding: 11px 23px;
        border-radius: 9px;
        font-weight: 700;
        text-decoration: none;
        display: inline-block;
    }

    .browse-btn:hover {
        background: #d96100;
        color: white;
    }

    /* ================= FOOTER ================= */

    .footer {
        text-align: center;
        color: #9ca3af;
        font-size: 14px;
        margin-top: 30px;
    }

    /* ================= MOBILE ================= */

    @media (max-width: 768px) {

        .main-container {
            margin: 30px 15px 50px;
        }

        .page-heading h1 {
            font-size: 28px;
        }

        .card-heading {
            padding: 20px;
        }

        .table thead {
            display: none;
        }

        .table tbody tr {
            display: block;
            padding: 15px;
            border-bottom: 1px solid #f0dfd0;
        }

        .table tbody td {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 5px;
            border: none;
        }

        .table tbody td::before {
            content: attr(data-label);
            color: #6b7280;
            font-size: 12px;
            font-weight: 700;
            text-transform: uppercase;
        }

        .action-btn {
            width: auto;
        }
    }
</style>

</head>


<body>


<!-- ================= NAVBAR ================= -->

<nav class="navbar-custom">

    <div class="container
                d-flex
                justify-content-between
                align-items-center">

        <a href="Index.jsp"
           class="brand">

            Job<span>Portal</span>

        </a>


        <div>

            <a href="jobs.jsp"
               class="nav-link-custom">

                <i class="bi bi-search"></i>
                Browse Jobs

            </a>


            <a href="Index.jsp"
               class="nav-link-custom">

                <i class="bi bi-house"></i>
                Home

            </a>

        </div>

    </div>

</nav>


<!-- ================= MAIN ================= -->

<div class="container main-container">


    <!-- PAGE HEADING -->

    <div class="page-heading">

        <h1>
            My Applications
        </h1>

        <p>
            Track and manage your job applications in one place.
        </p>

    </div>


<%

    List<Application> applications =
        (List<Application>) request.getAttribute("applications");

    if (applications != null && !applications.isEmpty()) {

%>


    <!-- ================= STATISTICS ================= -->

    <div class="row g-3">


        <!-- TOTAL APPLICATIONS -->

        <div class="col-md-4">

            <div class="stat-card">

                <div class="stat-icon">

                    <i class="bi bi-file-earmark-text"></i>

                </div>

                <div class="stat-number">

                    <%= applications.size() %>

                </div>

                <div class="stat-label">

                    Total Applications

                </div>

            </div>

        </div>


        <!-- JOBS -->

        <div class="col-md-4">

            <div class="stat-card">

                <div class="stat-icon">

                    <i class="bi bi-briefcase"></i>

                </div>

                <div class="stat-number">

                    <%= applications.size() %>

                </div>

                <div class="stat-label">

                    Jobs Applied

                </div>

            </div>

        </div>


        <!-- STATUS -->

        <div class="col-md-4">

            <div class="stat-card">

                <div class="stat-icon">

                    <i class="bi bi-activity"></i>

                </div>

                <div class="stat-number">

                    Active

                </div>

                <div class="stat-label">

                    Application Tracking

                </div>

            </div>

        </div>

    </div>


    <!-- ================= APPLICATIONS ================= -->

    <div class="applications-card">


        <!-- CARD HEADER -->

        <div class="card-heading">

            <div>

                <h3>
                    Application History
                </h3>

                <p>
                    Review your submitted applications and their status.
                </p>

            </div>

            <i class="bi bi-layout-text-window-reverse"
               style="font-size:25px;color:#2563eb;">
            </i>

        </div>


        <!-- TABLE -->

        <div class="table-responsive table-container">

            <table class="table">


                <thead>

                    <tr>

                        <th>
                            Application
                        </th>

                        <th>
                            Job
                        </th>

                        <th>
                            Applied On
                        </th>

                        <th>
                            Status
                        </th>

                        <th>
                            Actions
                        </th>

                    </tr>

                </thead>


                <tbody>


                <%

                    for (Application app : applications) {

                %>


                    <tr>


                        <!-- APPLICATION ID -->

                        <td data-label="Application">

                            <span class="application-id">

                                #<%= app.getApplicationId() %>

                            </span>

                        </td>


                        <!-- JOB ID -->

                        <td data-label="Job">

                            <span class="job-id">

                                Job #<%= app.getJobId() %>

                            </span>

                        </td>


                        <!-- DATE -->

                        <td data-label="Applied On">

                            <span class="date-text">

                                <i class="bi bi-calendar3 me-1"></i>

                                <%= app.getApplyDate() %>

                            </span>

                        </td>


                        <!-- STATUS -->

                        <td data-label="Status">

                            <span class="status-badge">

                                <i class="bi bi-circle-fill"
                                   style="font-size:7px;">
                                </i>

                                <%= app.getStatus() %>

                            </span>

                        </td>


                        <!-- ACTIONS -->

                        <td data-label="Actions">


                            <a href="ApplicationStatusServlet?id=<%= app.getApplicationId() %>"
                               class="btn action-btn view-btn">

                                <i class="bi bi-eye me-1"></i>

                                View Status

                            </a>


                            <a href="CancelApplicationServlet?id=<%= app.getApplicationId() %>"
                               class="btn action-btn cancel-btn"
                               onclick="return confirm('Are you sure you want to cancel this application?');">

                                <i class="bi bi-x-circle me-1"></i>

                                Cancel

                            </a>


                        </td>


                    </tr>


                <%

                    }

                %>


                </tbody>

            </table>

        </div>

    </div>


<%

    } else {

%>


    <!-- ================= EMPTY STATE ================= -->

    <div class="applications-card">

        <div class="empty-state">


            <div class="empty-icon">

                <i class="bi bi-briefcase"></i>

            </div>


            <h3>
                No Applications Yet
            </h3>


            <p>
                You haven't applied for any jobs yet.
                Start exploring opportunities and submit your first application.
            </p>


            <a href="jobs.jsp"
               class="browse-btn">

                <i class="bi bi-search me-1"></i>

                Browse Available Jobs

            </a>


        </div>

    </div>


<%

    }

%>


    <!-- FOOTER -->

    <div class="footer">

        © 2026 JobPortal · Build your career with confidence.

    </div>


</div>


</body>

</html>