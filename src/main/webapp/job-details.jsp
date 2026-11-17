<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Job Details - JobPortal</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        .topbar {
            justify-content: space-between;
            padding: 0 4%;
        }

        nav {
            display: flex;
            align-items: center;
            margin-left: auto;
            margin-right: 25px;
            gap: 25px;
        }

        nav a {
            color: #ffffff;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        nav a:hover, nav a.orange {
            color: #f58216;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropbtn {
            cursor: pointer;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            top: 35px;
            left: 0;
            background-color: #181818;
            min-width: 230px;
            border: 1px solid rgba(255,255,255,0.15);
            border-top: 3px solid #f58216;
            border-radius: 8px;
            box-shadow: 0px 10px 25px rgba(0,0,0,0.75);
            z-index: 1000;
            overflow: hidden;
        }

        .dropdown-content a {
            color: #e0e0e0;
            padding: 10px 15px;
            text-decoration: none;
            display: block;
            font-size: 13px;
            border-bottom: 1px solid rgba(255,255,255,0.05);
            transition: all 0.2s ease;
        }

        .dropdown-content a:last-child {
            border-bottom: none;
        }

        .dropdown-content a:hover {
            background-color: #f58216;
            color: #ffffff;
            padding-left: 18px;
        }

        .show {
            display: block;
        }

        .user-profile {
            display: flex;
            align-items: center;
            gap: 8px;
            color: white;
            background: #1a1b22;
            padding: 8px 16px;
            border-radius: 6px;
            border: 1px solid #333;
            font-size: 13px;
        }

        .user-profile span {
            color: #f58216;
            font-weight: bold;
        }

        .detail-layout {
            display: flex;
            gap: 25px;
            align-items: stretch;
        }

        .detail-panel {
            flex: 2;
            background: rgba(255,255,255,0.03);
            border: 1px solid rgba(255,255,255,0.1);
            padding: 25px;
            border-radius: 12px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .side-wrapper {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .side-panel {
            background: rgba(255,255,255,0.03);
            border: 1px solid rgba(255,255,255,0.1);
            padding: 20px;
            border-radius: 12px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            flex-grow: 1;
        }

        .apply-btn-box {
            text-align: right;
            margin-top: auto;
        }

        .apply-now-btn {
            background-color: #f58216;
            color: #ffffff;
            padding: 12px 32px;
            font-size: 15px;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            box-shadow: 0px 5px 15px rgba(245,130,22,0.4);
            transition: background 0.3s ease, transform 0.2s ease;
            text-decoration: none;
            display: inline-block;
        }

        .apply-now-btn:hover {
            background-color: #e06d06;
            transform: translateY(-2px);
        }

        .apply-btn-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 25px;
            padding-top: 15px;
            border-top: 1px solid rgba(255,255,255,0.1);
        }

        .dynamic-text {
            color: #cccccc;
            line-height: 1.7;
            overflow-wrap: anywhere;
        }

        .info-value {
            overflow-wrap: anywhere;
        }

        .similar-search-box {
            background: #1a1b22;
            border: 1px solid rgba(255,255,255,0.12);
            padding: 22px;
            border-radius: 10px;
        }

        /* Responsibilities and Skills Lists */
        .detail-list {
            padding-left: 22px;
            margin-top: 12px;
            color: #cccccc;
            line-height: 1.9;
        }

        .detail-list li {
            padding-left: 5px;
            margin-bottom: 7px;
        }

        .detail-list li::marker {
            color: #f58216;
        }

        /* Individual skill tags */
        .skill-tag {
            display: inline-block;
            background: rgba(245,130,22,0.12);
            color: #f58216;
            border: 1px solid rgba(245,130,22,0.3);
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 12px;
            margin: 3px;
        }

        /* COMPANY LOGO BOX */
        .company-logo.large {
            width: 70px;
            height: 70px;
            min-width: 70px;
            background: #ffffff;
            color: #000000;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 10px;
            overflow: hidden;
            font-weight: bold;
            font-size: 20px;
            flex-shrink: 0;
        }

        /* COMPANY LOGO IMAGE */
        .company-logo.large img {
            width: 100%;
            height: 100%;
            object-fit: contain;
            padding: 3px;
            box-sizing: border-box;
            display: block;
        }

        @media (max-width: 768px) {
            .detail-layout {
                flex-direction: column;
            }

            .topbar {
                flex-wrap: wrap;
                gap: 15px;
                padding: 15px 4%;
            }

            nav {
                margin: 0;
                gap: 12px;
                flex-wrap: wrap;
            }

            .job-heading {
                align-items: flex-start !important;
                flex-wrap: wrap;
            }
        }
    </style>
</head>

<body class="dark-page">

    <!-- TOPBAR -->
    <header class="topbar dark-topbar">

        <a href="${pageContext.request.contextPath}/jobs.jsp"
           class="brand">
            JOB<span>PORTAL</span>
        </a>

        <nav>

            <a href="${pageContext.request.contextPath}/jobs.jsp">
                Home
            </a>

            <!-- Jobs Dropdown -->
            <div class="dropdown">

                <a href="javascript:void(0)"
                   class="dropbtn"
                   onclick="toggleDropdown('jobsMenu')">
                    Jobs ▾
                </a>

                <div id="jobsMenu" class="dropdown-content">

                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Java%20Developer">Java Developer</a>

                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Full%20Stack%20Developer">Full Stack Developer</a>

                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Software%20Engineer">Software Engineer</a>

                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Python%20Developer">Python Developer</a>

                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Data%20Analyst">Data Analyst</a>

                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=UI%2FUX%20Designer">UI/UX Designer</a>

                </div>
            </div>

            <!-- Companies Dropdown -->
            <div class="dropdown">

                <a href="javascript:void(0)"
                   class="dropbtn"
                   onclick="toggleDropdown('companiesMenu')">
                    Companies ▾
                </a>

                <div id="companiesMenu" class="dropdown-content">

                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Google">Google</a>
                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Microsoft">Microsoft</a>
                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=TCS">Tata Consultancy Services (TCS)</a>
                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Infosys">Infosys</a>
                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Accenture">Accenture</a>
                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Wipro">Wipro</a>
                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=HCL">HCL Technologies</a>
                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Cognizant">Cognizant</a>
                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Tech%20Mahindra">Tech Mahindra</a>
                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Capgemini">Capgemini</a>
                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=IBM">IBM India</a>
                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Amazon">Amazon</a>

                </div>
            </div>

        </nav>

        <div class="user-profile">
            <span>👤</span> Ankita
        </div>

    </header>


    <!-- MAIN DETAIL WRAPPER -->
    <div class="detail-wrap">

        <!-- BREADCRUMB -->
        <div class="breadcrumb" style="margin-bottom: 15px;">

            <a href="${pageContext.request.contextPath}/jobs.jsp">Home</a>

            /

            <a href="${pageContext.request.contextPath}/search-jobs">Jobs</a>

            /

            <span>Job Details</span>

        </div>


        <!-- JOB HEADING -->
        <div class="job-heading"
             style="margin-bottom: 20px; display: flex; gap: 20px; align-items: center;">

            <!-- COMPANY LOGO -->
            <div class="company-logo large">

                <c:choose>

                    <c:when test="${not empty job.logoImage}">

                        <img
                            src="${pageContext.request.contextPath}/images/${job.logoImage}"
                            alt="${job.companyName} Logo"
                            onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">

                        <span style="display:none;">
                            <c:out value="${job.logoText}" />
                        </span>

                    </c:when>

                    <c:otherwise>

                        <c:out value="${job.logoText}" />

                    </c:otherwise>

                </c:choose>

            </div>

            <div class="heading-info">

                <span class="orange">
                    <c:out value="${job.companyName}" />
                </span>

                <h1>
                    <c:out value="${job.title}" />
                </h1>

                <div class="heading-meta">

                    <span>
                        📍
                        <c:out value="${job.location}" />,
                        <c:out value="${job.region}" />
                    </span>

                    <span>
                        🕒
                        <c:out value="${job.jobType}" />
                    </span>

                    <span>
                        💰
                        <c:out value="${job.salary}" />
                    </span>

                </div>

                <div class="tags dark-tags"
                     style="display:flex; gap:5px; margin-top:8px; flex-wrap:wrap;">

                    <c:if test="${not empty job.category}">
                        <span>
                            <c:out value="${job.category}" />
                        </span>
                    </c:if>

                    <c:if test="${not empty job.skills}">
                        <c:forTokens items="${job.skills}" delims=";" var="skill">
                            <span class="skill-tag">
                                <c:out value="${fn:trim(skill)}" />
                            </span>
                        </c:forTokens>
                    </c:if>

                </div>

            </div>

        </div>


        <!-- TABS -->
        <div class="tabs" style="margin-bottom: 20px;">

            <a href="javascript:void(0)"
               class="active"
               onclick="switchTab('descTab', this)"
               id="tabDescBtn">
                Job Description
            </a>

            <a href="javascript:void(0)"
               onclick="switchTab('similarTab', this)"
               id="tabSimilarBtn">
                Similar Jobs
            </a>

        </div>


        <!-- JOB DESCRIPTION TAB -->
        <div id="descTab" class="tab-pane">

            <div class="detail-layout">

                <!-- LEFT DETAIL PANEL -->
                <div class="detail-panel">

                    <div>

                        <h3>Job Description</h3>

                        <p class="dynamic-text">

                            <c:choose>

                                <c:when test="${not empty job.description}">
                                    <c:out value="${job.description}" />
                                </c:when>

                                <c:otherwise>
                                    Description not available.
                                </c:otherwise>

                            </c:choose>

                        </p>


                        <div class="two-cols">

                            <!-- RESPONSIBILITIES -->
                            <div>

                                <h3 class="orange">
                                    Responsibilities
                                </h3>

                                <c:choose>

                                    <c:when test="${not empty job.responsibilities}">

                                        <ul class="detail-list">

                                            <c:forTokens
                                                items="${job.responsibilities}"
                                                delims=";"
                                                var="item">

                                                <li>
                                                    <c:out value="${fn:trim(item)}" />
                                                </li>

                                            </c:forTokens>

                                        </ul>

                                    </c:when>

                                    <c:otherwise>

                                        <p class="dynamic-text">
                                            Responsibilities not specified.
                                        </p>

                                    </c:otherwise>

                                </c:choose>

                            </div>


                            <!-- REQUIRED SKILLS -->
                            <div>

                                <h3 class="orange">
                                    Required Skills
                                </h3>

                                <c:choose>

                                    <c:when test="${not empty job.skills}">

                                        <ul class="detail-list">

                                            <c:forTokens
                                                items="${job.skills}"
                                                delims=";"
                                                var="skill">

                                                <li>
                                                    <c:out value="${fn:trim(skill)}" />
                                                </li>

                                            </c:forTokens>

                                        </ul>

                                    </c:when>

                                    <c:otherwise>

                                        <p class="dynamic-text">
                                            Skills not specified.
                                        </p>

                                    </c:otherwise>

                                </c:choose>

                            </div>

                        </div>

                    </div>


                    <!-- JOB FACTS -->
                    <div class="facts" style="margin-top: 20px;">

                        <div>
                            <small>Experience</small>
                            <b class="info-value">
                                <c:out value="${empty job.experience ? 'Not specified' : job.experience}" />
                            </b>
                        </div>

                        <div>
                            <small>Work Mode</small>
                            <b class="info-value">
                                <c:out value="${empty job.workMode ? 'Not specified' : job.workMode}" />
                            </b>
                        </div>

                        <div>
                            <small>Posted On</small>
                            <b class="info-value">
                                <c:out value="${empty job.postedOn ? 'Not specified' : job.postedOn}" />
                            </b>
                        </div>

                        <div>
                            <small>Job Type</small>
                            <b class="info-value">
                                <c:out value="${job.jobType}" />
                            </b>
                        </div>

                        <div>
                            <small>Education</small>
                            <b class="info-value">
                                <c:out value="${empty job.education ? 'Not specified' : job.education}" />
                            </b>
                        </div>

                        <div>
                            <small>Last Date</small>
                            <b class="info-value">
                                <c:out value="${empty job.lastDate ? 'Not specified' : job.lastDate}" />
                            </b>
                        </div>

                    </div>

                </div>


                <!-- RIGHT SIDE PANEL -->
                <div class="side-wrapper">

                    <div class="side-panel">

                        <div>

                            <h3 style="margin-top: 0; color: #fff; font-size: 16px;">

                                Office Location:
                                <c:out value="${job.location}" />

                            </h3>

                            <!-- DYNAMIC GOOGLE MAP -->
                            <div class="map-placeholder"
                                 style="border-radius: 8px; overflow: hidden; height: 230px; border: 1px solid #444; margin-top: 12px;">

                                <iframe
                                    width="100%"
                                    height="100%"
                                    style="border:0;"
                                    allowfullscreen=""
                                    loading="lazy"
                                    referrerpolicy="no-referrer-when-downgrade"
                                    src="https://www.google.com/maps?q=${job.location},${job.region}&amp;output=embed">
                                </iframe>

                            </div>

                        </div>


                        <!-- COMPANY LOCATION -->
                        <div class="company-side"
                             style="margin-top: 15px; padding-top: 12px; border-top: 1px solid rgba(255,255,255,0.1);">

                            <strong style="color: #fff; font-size: 14px;">

                                <c:out value="${job.companyName}" />

                            </strong>

                            <br>

                            <span style="color: #aaa; font-size: 12px; display: inline-block; margin-top: 3px;">

                                <c:out value="${job.location}" />,
                                <c:out value="${job.region}" />

                            </span>

                        </div>

                    </div>


                    <!-- APPLY BUTTON -->
                    <div class="apply-btn-box">

                        <a href="javascript:void(0)"
                           class="apply-now-btn"
                           onclick="showApplyMessage()">

                            Apply Now 🚀

                        </a>

                    </div>

                </div>

            </div>

        </div>


        <!-- SIMILAR JOBS TAB -->
        <div id="similarTab"
             class="tab-pane"
             style="display: none; padding: 20px 0;">

            <h3 style="color: #f58216; margin-bottom: 20px;">

                Similar Jobs Based on Your Category

            </h3>

            <div class="similar-search-box">

                <h4 style="color: #f58216; margin: 0 0 10px 0;">

                    <c:out value="${job.category}" />

                </h4>

                <p style="color: #aaa; font-size: 14px; margin-bottom: 15px;">

                    Explore more jobs in the same category.

                </p>

                <c:url var="similarJobsUrl" value="/search-jobs">
                    <c:param name="keyword" value="${job.category}" />
                </c:url>

                <a href="${similarJobsUrl}"
                   style="color: #f58216; text-decoration: none; font-weight: 600; font-size: 14px;">

                    Explore Similar Jobs →

                </a>

            </div>

        </div>


        <!-- BACK LINK -->
        <div class="apply-btn-container">

            <a href="${pageContext.request.contextPath}/search-jobs"
               class="back-link">

                ← Back to Jobs

            </a>

        </div>

    </div>


    <!-- FOOTER -->
    <footer>

        <p>
            &copy; 2026 JobPortal. All Rights Reserved.
        </p>

    </footer>


    <!-- JAVASCRIPT -->
    <script>

        // Dropdown Function
        function toggleDropdown(menuId) {

            const allDropdowns =
                document.querySelectorAll('.dropdown-content');

            allDropdowns.forEach(menu => {

                if (menu.id !== menuId) {
                    menu.classList.remove('show');
                }

            });

            document.getElementById(menuId).classList.toggle('show');

        }


        // Close Dropdown
        window.onclick = function(event) {

            if (!event.target.matches('.dropbtn')) {

                const dropdowns =
                    document.querySelectorAll('.dropdown-content');

                dropdowns.forEach(menu => {
                    menu.classList.remove('show');
                });

            }

        };


        // Switch Tabs
        function switchTab(tabId, element) {

            document.getElementById('descTab').style.display = 'none';

            document.getElementById('similarTab').style.display = 'none';

            document.getElementById('tabDescBtn').classList.remove('active');

            document.getElementById('tabSimilarBtn').classList.remove('active');

            document.getElementById(tabId).style.display = 'block';

            element.classList.add('active');

        }


        // Apply Button Message
        function showApplyMessage() {

            alert('The application feature is not connected yet.');

        }

    </script>

</body>
</html>