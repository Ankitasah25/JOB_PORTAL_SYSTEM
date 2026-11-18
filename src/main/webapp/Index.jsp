<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>


<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1">

<title>JobPortal - Find Your Dream Career</title>

<!-- Bootstrap -->
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<!-- Bootstrap Icons -->
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">


<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: #fffaf5;
        color: #1f2937;
    }

    /* ================= NAVBAR ================= */
    .navbar-custom {
        background: #111111;
        box-shadow: 0 2px 15px rgba(0,0,0,0.12);
        padding: 15px 0;
    }

    .brand {
        font-size: 25px;
        font-weight: 800;
        color: #ff7900;
        text-decoration: none;
        letter-spacing: 0.5px;
    }

    .brand span {
        color: #ffffff;
    }

    .nav-link {
        color: #f3f4f6 !important;
        font-weight: 500;
        margin-left: 15px;
    }

    .nav-link:hover {
        color: #ff7900 !important;
    }

    .login-btn {
        border: 1px solid #ff7900;
        color: #ff7900;
        border-radius: 8px;
        padding: 8px 18px;
        font-weight: 600;
    }

    .login-btn:hover {
        background: #ff7900;
        color: #111111;
    }

    /* ================= HERO ================= */
    .hero {
        background: linear-gradient(135deg, #fff0df, #ffffff);
        padding: 90px 0 80px;
    }

    .hero-title {
        font-size: 52px;
        font-weight: 800;
        line-height: 1.15;
        color: #111111;
    }

    .hero-title span {
        color: #f47700;
    }

    .hero-text {
        font-size: 18px;
        color: #6b7280;
        line-height: 1.7;
        max-width: 600px;
    }

    .primary-btn {
        background: #f47700;
        border: none;
        color: white;
        padding: 13px 28px;
        border-radius: 9px;
        font-weight: 600;
        text-decoration: none;
        display: inline-block;
    }

    .primary-btn:hover {
        background: #d96100;
        color: white;
    }

    .secondary-btn {
        background: white;
        border: 1px solid #d1d5db;
        color: #222222;
        padding: 13px 28px;
        border-radius: 9px;
        font-weight: 600;
        text-decoration: none;
        display: inline-block;
    }

    .secondary-btn:hover {
        border-color: #f47700;
        color: #f47700;
    }

    /* ================= HERO CARD ================= */
    .hero-card {
        background: white;
        border-radius: 18px;
        padding: 35px;
        box-shadow: 0 15px 40px rgba(244,119,0,0.13);
    }

    .hero-card-icon {
        width: 65px;
        height: 65px;
        background: #fff0df;
        color: #f47700;
        border-radius: 15px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 30px;
        margin-bottom: 20px;
    }

    .hero-card h4 {
        font-weight: 700;
        color: #111111;
    }

    .hero-card p {
        color: #6b7280;
    }

    /* ================= STATS ================= */
    .stats {
        background: white;
        padding: 35px 0;
        border-bottom: 1px solid #f0dfd0;
    }

    .stat-box {
        text-align: center;
    }

    .stat-number {
        font-size: 30px;
        font-weight: 800;
        color: #f47700;
    }

    .stat-text {
        color: #6b7280;
        font-size: 14px;
    }

    /* ================= FEATURES ================= */
    .section {
        padding: 75px 0;
    }

    .section-title {
        font-size: 34px;
        font-weight: 800;
        text-align: center;
        color: #111111;
    }

    .section-subtitle {
        text-align: center;
        color: #6b7280;
        max-width: 650px;
        margin: 10px auto 45px;
    }

    .feature-card {
        background: white;
        border: 1px solid #f0dfd0;
        border-radius: 15px;
        padding: 30px;
        height: 100%;
        transition: 0.3s;
    }

    .feature-card:hover {
        transform: translateY(-7px);
        box-shadow: 0 12px 30px rgba(244,119,0,0.12);
        border-color: #ffb36b;
    }

    .feature-icon {
        width: 55px;
        height: 55px;
        background: #fff0df;
        color: #f47700;
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 25px;
        margin-bottom: 20px;
    }

    .feature-card h5 {
        font-weight: 700;
        color: #111111;
    }

    .feature-card p {
        color: #6b7280;
        line-height: 1.6;
    }

    /* ================= CTA ================= */
    .cta {
        background: linear-gradient(135deg, #ff8500, #e65c00);
        color: white;
        padding: 65px 20px;
        text-align: center;
    }

    .cta h2 {
        font-weight: 800;
        font-size: 35px;
    }

    .cta p {
        opacity: 0.9;
        margin: 15px auto 30px;
        max-width: 600px;
    }

    .cta-btn {
        background: #111111;
        color: white;
        padding: 13px 30px;
        border-radius: 8px;
        text-decoration: none;
        font-weight: 700;
        display: inline-block;
    }

    .cta-btn:hover {
        background: #292929;
        color: #ff9a35;
    }

    /* ================= FOOTER ================= */
    footer {
        background: #111111;
        color: #b0b0b0;
        padding: 45px 0 20px;
    }

    .footer-brand {
        color: #ff7900;
        font-size: 23px;
        font-weight: 800;
    }

    .footer-title {
        color: white;
        font-weight: 600;
        margin-bottom: 15px;
    }

    .footer-link {
        color: #b0b0b0;
        text-decoration: none;
        display: block;
        margin-bottom: 8px;
    }

    .footer-link:hover {
        color: #ff7900;
    }

    .copyright {
        border-top: 1px solid #333333;
        margin-top: 30px;
        padding-top: 20px;
        text-align: center;
        font-size: 14px;
    }

    /* ================= RESPONSIVE ================= */
    @media (max-width: 768px) {
        .hero {
            padding: 60px 0;
        }

        .hero-title {
            font-size: 38px;
        }

        .hero-card {
            margin-top: 40px;
        }

        .section-title {
            font-size: 28px;
        }
    }
</style>


</head>

<body>

<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg navbar-custom">


<div class="container">

    <a href="index.jsp" class="brand">
        Job<span>Portal</span>
    </a>


    <button class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarMenu">

        <span class="navbar-toggler-icon"></span>

    </button>


    <div class="collapse navbar-collapse"
         id="navbarMenu">

        <ul class="navbar-nav ms-auto align-items-lg-center">

            <li class="nav-item">
                <a class="nav-link"
                   href="Index.jsp">
                    Home
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link"
                   href="jobs.jsp">
                    Find Jobs
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link"
                   href="Myapplications.jsp">
                    My Applications
                </a>
            </li>

            <li class="nav-item ms-lg-3 mt-2 mt-lg-0">

                <a href="login.jsp"
                   class="btn login-btn">
                    Login
                </a>

            </li>

        </ul>

    </div>

</div>
```

</nav>

<!-- ================= HERO ================= -->

<section class="hero">


<div class="container">

    <div class="row align-items-center">


        <!-- LEFT -->

        <div class="col-lg-7">

            <p class="fw-bold mb-3" style="color: orange;">
                YOUR CAREER STARTS HERE
            </p>

            <h1 class="hero-title">

                Find the job that
                <span>fits your future.</span>

            </h1>

            <p class="hero-text mt-4">

                Discover exciting career opportunities,
                explore jobs from trusted employers and
                manage your applications from one simple platform.

            </p>


            <div class="mt-4">

                <a href="jobs.jsp"
                   class="primary-btn me-2">

                    <i class="bi bi-search"></i>
                    Explore Jobs

                </a>


                <a href="Myapplications.jsp"
                   class="secondary-btn">

                    My Applications

                </a>

            </div>

        </div>


        <!-- RIGHT -->

        <div class="col-lg-5">

            <div class="hero-card">

                <div class="hero-card-icon">

                    <i class="bi bi-briefcase-fill"></i>

                </div>

                <h4>
                    Build your next career move
                </h4>

                <p>
                    Search opportunities, apply with confidence
                    and keep track of every application in one place.
                </p>


                <hr>


                <div class="d-flex align-items-center mb-3">

                    <i class="bi bi-check-circle-fill text-success me-2"></i>

                    <span>
                        Easy job search
                    </span>

                </div>


                <div class="d-flex align-items-center mb-3">

                    <i class="bi bi-check-circle-fill text-success me-2"></i>

                    <span>
                        Simple application process
                    </span>

                </div>


                <div class="d-flex align-items-center">

                    <i class="bi bi-check-circle-fill text-success me-2"></i>

                    <span>
                        Track applications easily
                    </span>

                </div>

            </div>

        </div>

    </div>

</div>


</section>

<!-- ================= STATS ================= -->

<section class="stats">


<div class="container">

    <div class="row">

        <div class="col-6 col-md-3 mb-3 mb-md-0">

            <div class="stat-box">

                <div class="stat-number">
                    100+
                </div>

                <div class="stat-text">
                    Job Opportunities
                </div>

            </div>

        </div>


        <div class="col-6 col-md-3">

            <div class="stat-box">

                <div class="stat-number">
                    50+
                </div>

                <div class="stat-text">
                    Companies
                </div>

            </div>

        </div>


        <div class="col-6 col-md-3">

            <div class="stat-box">

                <div class="stat-number">
                    500+
                </div>

                <div class="stat-text">
                    Applicants
                </div>

            </div>

        </div>


        <div class="col-6 col-md-3">

            <div class="stat-box">

                <div class="stat-number">
                    24/7
                </div>

                <div class="stat-text">
                    Platform Access
                </div>

            </div>

        </div>

    </div>

</div>


</section>

<!-- ================= FEATURES ================= -->

<section class="section">


<div class="container">

    <h2 class="section-title">
        Everything you need for your job search
    </h2>

    <p class="section-subtitle">

        JobPortal makes finding and managing career
        opportunities simple, organized and convenient.

    </p>


    <div class="row g-4">


        <!-- Feature 1 -->

        <div class="col-md-4">

            <div class="feature-card">

                <div class="feature-icon">

                    <i class="bi bi-search"></i>

                </div>

                <h5>
                    Find Opportunities
                </h5>

                <p>
                    Explore available jobs and find opportunities
                    that match your skills and career goals.
                </p>

            </div>

        </div>


        <!-- Feature 2 -->

        <div class="col-md-4">

            <div class="feature-card">

                <div class="feature-icon">

                    <i class="bi bi-file-earmark-text"></i>

                </div>

                <h5>
                    Apply Easily
                </h5>

                <p>
                    Submit your application through a simple
                    and convenient online application process.
                </p>

            </div>

        </div>


        <!-- Feature 3 -->

        <div class="col-md-4">

            <div class="feature-card">

                <div class="feature-icon">

                    <i class="bi bi-graph-up-arrow"></i>

                </div>

                <h5>
                    Track Applications
                </h5>

                <p>
                    Keep track of your submitted applications
                    and monitor their current status.
                </p>

            </div>

        </div>

    </div>

</div>


</section>

<!-- ================= CTA ================= -->

<section class="cta">


<div class="container">

    <h2>
        Ready to find your next opportunity?
    </h2>

    <p>
        Start exploring jobs today and take the next step
        toward your career goals.
    </p>

    <a href="jobs.jsp"
       class="cta-btn">

        Browse Available Jobs

    </a>

</div>


</section>

<!-- ================= FOOTER ================= -->

<footer>


<div class="container">

    <div class="row">


        <div class="col-md-6 mb-4">

            <div class="footer-brand">
                JobPortal
            </div>

            <p class="mt-3">
                Connecting talented people with
                meaningful career opportunities.
            </p>

        </div>


        <div class="col-md-3 mb-4">

            <div class="footer-title">
                Quick Links
            </div>

            <a href="Index.jsp"
               class="footer-link">
                Home
            </a>

            <a href="jobs.jsp"
               class="footer-link">
                Find Jobs
            </a>

            <a href="Myapplications.jsp"
               class="footer-link">
                My Applications
            </a>

        </div>


        <div class="col-md-3">

            <div class="footer-title">
                Account
            </div>

            <a href="login.jsp"
               class="footer-link">
                Login
            </a>

            <a href="register.jsp"
               class="footer-link">
                Register
            </a>

        </div>

    </div>


    <div class="copyright">

        © 2026 JobPortal. All Rights Reserved.

    </div>

</div>


</footer>

<!-- Bootstrap JS -->

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>
</html>
