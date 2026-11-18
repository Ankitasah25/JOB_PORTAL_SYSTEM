<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>Apply for Job | JobPortal</title>

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

    .back-link {
        text-decoration: none;
        color: #ffffff;
        font-weight: 500;
    }

    .back-link:hover {
        color: #ff8c00;
    }

    /* ================= MAIN ================= */
    .main-section {
        padding: 50px 0 70px;
    }

    /* ================= PAGE TITLE ================= */
    .page-title {
        text-align: center;
        margin-bottom: 35px;
    }

    .page-title h1 {
        font-size: 36px;
        font-weight: 800;
        margin-bottom: 10px;
        color: #111111;
    }

    .page-title p {
        color: #6b7280;
        margin: 0;
    }

    /* ================= STEPS ================= */
    .steps {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-bottom: 35px;
    }

    .step {
        display: flex;
        align-items: center;
        color: #e87500;
        font-weight: 600;
        font-size: 14px;
    }

    .step-number {
        width: 34px;
        height: 34px;
        border-radius: 50%;
        background: #ff8c00;
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 8px;
        font-weight: bold;
    }

    .step-line {
        width: 70px;
        height: 2px;
        background: #ffd6a3;
        margin: 0 12px;
    }

    /* ================= CARD ================= */
    .application-card {
        background: white;
        border-radius: 18px;
        border: 1px solid #e5e5e5;
        box-shadow: 0 10px 35px rgba(0,0,0,0.08);
        overflow: hidden;
    }

    /* ================= LEFT PANEL ================= */
    .job-panel {
        background: linear-gradient(160deg, #ff8c00, #e65c00);
        color: white;
        padding: 40px 32px;
        height: 100%;
    }

    .job-icon {
        width: 65px;
        height: 65px;
        background: rgba(255,255,255,0.18);
        border-radius: 15px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 30px;
        margin-bottom: 25px;
    }

    .job-panel h3 {
        font-size: 25px;
        font-weight: 800;
        margin-bottom: 10px;
    }

    .job-panel-description {
        color: rgba(255,255,255,0.9);
        line-height: 1.6;
    }

    .job-id {
        margin-top: 30px;
        background: rgba(0,0,0,0.15);
        border-radius: 10px;
        padding: 15px;
    }

    .job-id small {
        display: block;
        color: rgba(255,255,255,0.8);
        margin-bottom: 4px;
    }

    .job-id strong {
        font-size: 18px;
    }

    /* ================= BENEFITS ================= */
    .benefit {
        display: flex;
        align-items: center;
        margin-top: 20px;
    }

    .benefit i {
        font-size: 18px;
        margin-right: 12px;
    }

    .benefit span {
        color: rgba(255,255,255,0.9);
    }

    /* ================= FORM PANEL ================= */
    .form-panel {
        padding: 40px;
    }

    .form-title {
        font-size: 24px;
        font-weight: 800;
        margin-bottom: 6px;
        color: #111111;
    }

    .form-subtitle {
        color: #6b7280;
        margin-bottom: 30px;
    }

    /* ================= FORM ================= */
    .form-label {
        font-weight: 600;
        color: #222222;
        margin-bottom: 8px;
    }

    .input-group-text {
        background: #fff4e5;
        border-color: #e5c49f;
        color: #e87500;
    }

    .form-control,
    .form-select {
        border-color: #d1d5db;
        border-radius: 8px;
        padding: 11px 13px;
    }

    .input-group .form-control {
        border-radius: 0 8px 8px 0;
    }

    .input-group .input-group-text {
        border-radius: 8px 0 0 8px;
    }

    .form-control:focus,
    .form-select:focus {
        border-color: #ff8c00;
        box-shadow: 0 0 0 0.2rem rgba(255,140,0,0.12);
    }

    textarea.form-control {
        resize: vertical;
        min-height: 130px;
    }

    /* ================= INFO BOX ================= */
    .info-box {
        background: #fff4e5;
        border: 1px solid #ffd6a3;
        border-radius: 10px;
        padding: 15px 18px;
        color: #333333;
        font-size: 14px;
    }

    .info-box i {
        color: #e87500;
        margin-right: 8px;
    }

    /* ================= BUTTONS ================= */
    .apply-btn {
        background: #ff8c00;
        color: white;
        border: none;
        border-radius: 9px;
        padding: 12px 28px;
        font-weight: 700;
        transition: 0.2s;
    }

    .apply-btn:hover {
        background: #e66b00;
        color: white;
        transform: translateY(-1px);
    }

    .cancel-btn {
        background: #111111;
        color: white;
        border: 1px solid #111111;
        border-radius: 9px;
        padding: 11px 25px;
        font-weight: 600;
    }

    .cancel-btn:hover {
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
    @media (max-width: 991px) {
        .job-panel {
            height: auto;
        }
    }

    @media (max-width: 576px) {
        .main-section {
            padding: 30px 0 50px;
        }

        .page-title h1 {
            font-size: 29px;
        }

        .form-panel {
            padding: 25px;
        }

        .job-panel {
            padding: 30px 25px;
        }

        .step-line {
            width: 25px;
            margin: 0 6px;
        }

        .step {
            font-size: 12px;
        }

        .step-number {
            width: 30px;
            height: 30px;
        }
    }
</style>
   

</head>

<body>


<!-- ================= NAVBAR ================= -->

<nav class="navbar-custom">

    <div class="container d-flex justify-content-between align-items-center">

        <a href="Index.jsp" class="brand">
            Job<span>Portal</span>
        </a>

        <a href="jobs.jsp" class="back-link">
            <i class="bi bi-arrow-left"></i>
            Back to Jobs
        </a>

    </div>

</nav>


<!-- ================= MAIN ================= -->

<section class="main-section">

    <div class="container">


        <!-- PAGE TITLE -->

        <div class="page-title">

            <h1>
                Apply for a Job
            </h1>

            <p>
                Take the next step toward your career
            </p>

        </div>


        <!-- ================= STEPS ================= -->

        <div class="steps">

            <div class="step">

                <div class="step-number">
                    1
                </div>

                Your Details

            </div>

            <div class="step-line"></div>

            <div class="step">

                <div class="step-number">
                    2
                </div>

                Application

            </div>

            <div class="step-line"></div>

            <div class="step">

                <div class="step-number">
                    3
                </div>

                Submit

            </div>

        </div>


        <!-- ================= APPLICATION CARD ================= -->

        <div class="application-card">

            <div class="row g-0">


                <!-- ================= LEFT JOB PANEL ================= -->

                <div class="col-lg-4">

                    <div class="job-panel">

                        <div class="job-icon">

                            <i class="bi bi-briefcase-fill"></i>

                        </div>

                        <h3>
                            Job Application
                        </h3>

                        <p class="job-panel-description">

                            You're one step closer to your next
                            career opportunity. Complete your
                            information carefully before submitting.

                        </p>


                        <div class="job-id">

                            <small>
                                SELECTED JOB
                            </small>

                            <strong>

                                <%
                                    String jobId = request.getParameter("jobId");

                                    if (jobId != null &&
                                        !jobId.trim().isEmpty()) {
                                %>

                                    Job ID #<%= jobId %>

                                <%
                                    } else {
                                %>

                                    Job Not Selected

                                <%
                                    }
                                %>

                            </strong>

                        </div>


                        <div class="benefit">

                            <i class="bi bi-check-circle-fill"></i>

                            <span>
                                Simple application process
                            </span>

                        </div>


                        <div class="benefit">

                            <i class="bi bi-shield-check"></i>

                            <span>
                                Your information is protected
                            </span>

                        </div>


                        <div class="benefit">

                            <i class="bi bi-clock"></i>

                            <span>
                                Quick and easy application
                            </span>

                        </div>

                    </div>

                </div>


                <!-- ================= RIGHT FORM ================= -->

                <div class="col-lg-8">

                    <div class="form-panel">


                        <%
                            if (jobId == null ||
                                jobId.trim().isEmpty()) {
                        %>


                            <!-- ERROR -->

                            <div class="text-center py-5">

                                <div class="mb-3">

                                    <i class="bi bi-exclamation-circle"
                                       style="font-size:55px;color:#dc3545;">
                                    </i>

                                </div>

                                <h3 class="fw-bold">
                                    Job Not Found
                                </h3>

                                <p class="text-muted">
                                    We could not identify the job
                                    you selected.
                                </p>

                                <a href="jobs.jsp"
                                   class="btn orange-btn">

                                    <i class="bi bi-arrow-left"></i>
                                    Back to Jobs

                                </a>

                            </div>


                        <%
                            } else {
                        %>


                        <div class="form-title">
                            Applicant Information
                        </div>

                        <p class="form-subtitle">
                            Please provide your details below.
                        </p>


                        <!-- FORM -->

                        <form action="ApplyJobServlet"
                              method="post">


                            <!-- HIDDEN JOB ID -->

                            <input type="hidden"
                                   name="jobId"
                                   value="<%= jobId %>">


                            <div class="row">


                                <!-- FULL NAME -->

                                <div class="col-md-6 mb-4">

                                    <label for="name"
                                           class="form-label">

                                        Full Name

                                    </label>

                                    <div class="input-group">

                                        <span class="input-group-text">

                                            <i class="bi bi-person"></i>

                                        </span>

                                        <input type="text"
                                               id="name"
                                               name="name"
                                               class="form-control"
                                               placeholder="Your full name"
                                               required>

                                    </div>

                                </div>


                                <!-- EMAIL -->

                                <div class="col-md-6 mb-4">

                                    <label for="email"
                                           class="form-label">

                                        Email Address

                                    </label>

                                    <div class="input-group">

                                        <span class="input-group-text">

                                            <i class="bi bi-envelope"></i>

                                        </span>

                                        <input type="email"
                                               id="email"
                                               name="email"
                                               class="form-control"
                                               placeholder="you@example.com"
                                               required>

                                    </div>

                                </div>


                                <!-- PHONE -->

                                <div class="col-md-6 mb-4">

                                    <label for="phone"
                                           class="form-label">

                                        Phone Number

                                    </label>

                                    <div class="input-group">

                                        <span class="input-group-text">

                                            <i class="bi bi-telephone"></i>

                                        </span>

                                        <input type="tel"
                                               id="phone"
                                               name="phone"
                                               class="form-control"
                                               placeholder="Your phone number"
                                               required>

                                    </div>

                                </div>


                                <!-- QUALIFICATION -->

                                <div class="col-md-6 mb-4">

                                    <label for="qualification"
                                           class="form-label">

                                        Highest Qualification

                                    </label>

                                    <select id="qualification"
                                            name="qualification"
                                            class="form-select"
                                            required>

                                        <option value="">
                                            Select qualification
                                        </option>

                                        <option value="Diploma">
                                            Diploma
                                        </option>

                                        <option value="B.Tech">
                                            B.Tech
                                        </option>

                                        <option value="BCA">
                                            BCA
                                        </option>

                                        <option value="MCA">
                                            MCA
                                        </option>

                                        <option value="M.Tech">
                                            M.Tech
                                        </option>

                                        <option value="Other">
                                            Other
                                        </option>

                                    </select>

                                </div>


                                <!-- EXPERIENCE -->

                                <div class="col-md-6 mb-4">

                                    <label for="experience"
                                           class="form-label">

                                        Experience

                                    </label>

                                    <select id="experience"
                                            name="experience"
                                            class="form-select"
                                            required>

                                        <option value="">
                                            Select experience
                                        </option>

                                        <option value="Fresher">
                                            Fresher
                                        </option>

                                        <option value="0-1">
                                            0 - 1 Year
                                        </option>

                                        <option value="1-3">
                                            1 - 3 Years
                                        </option>

                                        <option value="3-5">
                                            3 - 5 Years
                                        </option>

                                        <option value="5+">
                                            5+ Years
                                        </option>

                                    </select>

                                </div>


                                <!-- COVER LETTER -->

                                <div class="col-12 mb-4">

                                    <label for="coverLetter"
                                           class="form-label">

                                        Cover Letter / Message

                                    </label>

                                    <textarea id="coverLetter"
                                              name="coverLetter"
                                              class="form-control"
                                              rows="5"
                                              placeholder="Tell the employer why you are a good fit for this position..."
                                              required></textarea>

                                </div>

                            </div>


                            <!-- INFO -->

                            <div class="info-box mb-4">

                                <i class="bi bi-info-circle-fill"></i>

                                Please review your information carefully
                                before submitting your application.

                            </div>


                            <!-- BUTTONS -->

                            <div class="d-flex justify-content-end gap-2">

                                <a href="jobs.jsp"
                                   class="cancel-btn">

                                    Cancel

                                </a>

                                <button type="submit"
                                        class="apply-btn">

                                    <i class="bi bi-send-fill me-1"></i>

                                    Submit Application

                                </button>

                            </div>


                        </form>


                        <%
                            }
                        %>


                    </div>

                </div>

            </div>

        </div>


        <!-- FOOTER -->

        <div class="footer">

            © 2026 JobPortal · Find your opportunity, build your future.

        </div>


    </div>

</section>


<!-- Bootstrap JS -->

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>
</html>