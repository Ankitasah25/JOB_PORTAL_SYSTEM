<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="utilities.Application" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>Application Status | JobPortal</title>

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
    background: #f5f5f5;
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
    color: #ff8c00;
}

.brand span {
    color: #ffffff;
}

.home-link {
    text-decoration: none;
    color: #ffffff;
    font-weight: 500;
}

.home-link:hover {
    color: #ff8c00;
}

/* ================= MAIN ================= */

.main-container {
    max-width: 850px;
    margin: 50px auto 70px;
}

/* ================= SUCCESS HEADER ================= */

.success-card {
    background: #ffffff;
    border-radius: 20px;
    border: 1px solid #e5e5e5;
    box-shadow: 0 10px 35px rgba(0,0,0,0.08);
    overflow: hidden;
}

.success-header {
    background: linear-gradient(135deg, #ff8c00, #e65c00);
    color: white;
    text-align: center;
    padding: 45px 25px;
}

.success-icon {
    width: 75px;
    height: 75px;
    background: rgba(255,255,255,0.18);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 20px;
    font-size: 38px;
}

.success-header h1 {
    font-size: 30px;
    font-weight: 800;
    margin-bottom: 10px;
}

.success-header p {
    margin: 0;
    opacity: 0.95;
}

/* ================= BODY ================= */

.application-body {
    padding: 40px;
}

/* ================= APPLICATION ID ================= */

.application-number {
    background: #fff4e5;
    border: 1px solid #ffd6a3;
    border-radius: 12px;
    padding: 18px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
}

.application-number-label {
    color: #666666;
    font-size: 13px;
    margin-bottom: 3px;
}

.application-number-value {
    color: #e66b00;
    font-size: 19px;
    font-weight: 800;
}

/* ================= SECTION TITLE ================= */

.section-title {
    font-size: 20px;
    font-weight: 800;
    margin-bottom: 20px;
    color: #111111;
}

/* ================= INFO CARDS ================= */

.info-card {
    background: #fafafa;
    border: 1px solid #e5e5e5;
    border-radius: 12px;
    padding: 18px;
    height: 100%;
    transition: 0.3s;
}

.info-card:hover {
    border-color: #ff8c00;
    box-shadow: 0 5px 15px rgba(255,140,0,0.12);
    transform: translateY(-3px);
}

.info-icon {
    width: 42px;
    height: 42px;
    background: #fff0dc;
    color: #f58216;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 19px;
    margin-bottom: 12px;
}

.info-label {
    color: #777777;
    font-size: 13px;
    margin-bottom: 5px;
}

.info-value {
    color: #111111;
    font-size: 16px;
    font-weight: 700;
}

/* ================= STATUS ================= */

.status-section {
    margin-top: 35px;
}

.status-box {
    background: #fafafa;
    border: 1px solid #e5e5e5;
    border-radius: 12px;
    padding: 25px;
}

.status-badge {
    display: inline-flex;
    align-items: center;
    gap: 7px;
    padding: 9px 18px;
    border-radius: 30px;
    background: #fff0dc;
    color: #d96b00;
    font-weight: 700;
    font-size: 14px;
}

/* ================= TIMELINE ================= */

.timeline {
    margin-top: 30px;
}

.timeline-item {
    display: flex;
    align-items: flex-start;
    position: relative;
    padding-bottom: 25px;
}

.timeline-item:last-child {
    padding-bottom: 0;
}

.timeline-icon {
    width: 38px;
    height: 38px;
    min-width: 38px;
    border-radius: 50%;
    background: #ff8c00;
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 15px;
    z-index: 2;
}

.timeline-item:not(:last-child)::before {
    content: "";
    position: absolute;
    left: 18px;
    top: 38px;
    width: 2px;
    height: calc(100% - 38px);
    background: #ffd6a3;
}

.timeline-content h6 {
    font-weight: 700;
    margin-bottom: 4px;
    color: #111111;
}

.timeline-content p {
    color: #777777;
    font-size: 14px;
    margin: 0;
}

/* ================= ACTIONS ================= */

.actions {
    border-top: 1px solid #e5e5e5;
    margin-top: 35px;
    padding-top: 30px;
    text-align: center;
}

.btn-primary-custom {
    background: #ff8c00;
    color: white;
    border: none;
    border-radius: 9px;
    padding: 12px 25px;
    font-weight: 700;
    text-decoration: none;
    display: inline-block;
    margin: 5px;
    transition: 0.3s;
}

.btn-primary-custom:hover {
    background: #e66b00;
    color: white;
    transform: translateY(-2px);
}

.btn-secondary-custom {
    background: #111111;
    color: white;
    border: 1px solid #111111;
    border-radius: 9px;
    padding: 11px 25px;
    font-weight: 600;
    text-decoration: none;
    display: inline-block;
    margin: 5px;
    transition: 0.3s;
}

.btn-secondary-custom:hover {
    background: #333333;
    border-color: #ff8c00;
    color: #ff8c00;
}

/* ================= FOOTER ================= */

.footer {
    text-align: center;
    color: #888888;
    font-size: 14px;
    margin-top: 30px;
}

/* ================= RESPONSIVE ================= */

@media (max-width: 576px) {
    .main-container {
        margin: 30px 15px 50px;
    }

    .success-header {
        padding: 35px 20px;
    }

    .success-header h1 {
        font-size: 25px;
    }

    .application-body {
        padding: 25px 20px;
    }

    .application-number {
        display: block;
    }

    .application-number-value {
        margin-top: 5px;
    }
}

    </style>

</head>


<body>


<!-- ================= NAVBAR ================= -->

<nav class="navbar-custom">

    <div class="container d-flex
                justify-content-between
                align-items-center">

        <a href="Index.jsp"
           class="brand">

            Job<span>Portal</span>

        </a>

        <a href="Index.jsp"
           class="home-link">

            <i class="bi bi-house"></i>
            Home

        </a>

    </div>

</nav>


<!-- ================= MAIN ================= -->

<div class="container main-container">


<%

    Application app =
        (Application) request.getAttribute("application");

    if (app != null) {

%>


<!-- ================= APPLICATION CARD ================= -->

<div class="success-card">


    <!-- SUCCESS HEADER -->

    <div class="success-header">

        <div class="success-icon">

            <i class="bi bi-check-lg"></i>

        </div>

        <h1>
            Application Submitted!
        </h1>

        <p>
            Your job application has been successfully received.
        </p>

    </div>


    <!-- BODY -->

    <div class="application-body">


        <!-- APPLICATION NUMBER -->

        <div class="application-number">

            <div>

                <div class="application-number-label">
                    APPLICATION NUMBER
                </div>

                <div class="application-number-value">

                    #<%= app.getApplicationId() %>

                </div>

            </div>

            <div>

                <i class="bi bi-file-earmark-check"
                   style="font-size:35px;color:#2563eb;">
                </i>

            </div>

        </div>


        <!-- APPLICATION DETAILS -->

        <div class="section-title">

            Application Details

        </div>


        <div class="row g-3">


            <!-- JOB ID -->

            <div class="col-md-6">

                <div class="info-card">

                    <div class="info-icon">

                        <i class="bi bi-briefcase"></i>

                    </div>

                    <div class="info-label">
                        Job ID
                    </div>

                    <div class="info-value">

                        #<%= app.getJobId() %>

                    </div>

                </div>

            </div>


            <!-- DATE -->

            <div class="col-md-6">

                <div class="info-card">

                    <div class="info-icon">

                        <i class="bi bi-calendar-event"></i>

                    </div>

                    <div class="info-label">
                        Application Date
                    </div>

                    <div class="info-value">

                        <%= app.getApplyDate() %>

                    </div>

                </div>

            </div>


        </div>


        <!-- ================= STATUS ================= -->

        <div class="status-section">

            <div class="section-title">
                Current Status
            </div>


            <div class="status-box">

                <span class="status-badge">

                    <i class="bi bi-hourglass-split"></i>

                    <%= app.getStatus() %>

                </span>


                <!-- TIMELINE -->

                <div class="timeline">


                    <!-- STEP 1 -->

                    <div class="timeline-item">

                        <div class="timeline-icon">

                            <i class="bi bi-check"></i>

                        </div>

                        <div class="timeline-content">

                            <h6>
                                Application Submitted
                            </h6>

                            <p>
                                Your application has been received successfully.
                            </p>

                        </div>

                    </div>


                    <!-- STEP 2 -->

                    <div class="timeline-item">

                        <div class="timeline-icon">

                            <i class="bi bi-search"></i>

                        </div>

                        <div class="timeline-content">

                            <h6>
                                Under Review
                            </h6>

                            <p>
                                The employer may review your application.
                            </p>

                        </div>

                    </div>


                    <!-- STEP 3 -->

                    <div class="timeline-item">

                        <div class="timeline-icon">

                            <i class="bi bi-person-check"></i>

                        </div>

                        <div class="timeline-content">

                            <h6>
                                Interview / Selection
                            </h6>

                            <p>
                                If shortlisted, the employer may contact you.
                            </p>

                        </div>

                    </div>


                </div>

            </div>

        </div>


        <!-- ================= ACTIONS ================= -->

        <div class="actions">

            <a href="jobs.jsp"
               class="btn-primary-custom">

                <i class="bi bi-search me-1"></i>

                Browse More Jobs

            </a>


            <a href="Myapplication.jsp"
               class="btn-secondary-custom">

                <i class="bi bi-file-text me-1"></i>

                My Applications

            </a>


            <a href="index.jsp"
               class="btn-secondary-custom">

                <i class="bi bi-house me-1"></i>

                Back to Home

            </a>

        </div>


    </div>

</div>


<%

    } else {

%>


<!-- ================= NOT FOUND ================= -->

<div class="success-card">


    <div class="success-header">

        <div class="success-icon">

            <i class="bi bi-question-lg"></i>

        </div>

        <h1>
            Application Not Found
        </h1>

        <p>
            We couldn't find the requested application.
        </p>

    </div>


    <div class="application-body text-center">

        <p class="text-muted">

            The application may not exist or the session
            information may no longer be available.

        </p>


        <a href="jobs.jsp"
           class="btn-primary-custom">

            <i class="bi bi-search me-1"></i>

            Browse Jobs

        </a>


        <a href="Index.jsp"
           class="btn-secondary-custom">

            <i class="bi bi-house me-1"></i>

            Back to Home

        </a>

    </div>

</div>


<%

    }

%>


<div class="footer">

    © 2026 JobPortal · Your career, your future.

</div>


</div>


</body>

</html>