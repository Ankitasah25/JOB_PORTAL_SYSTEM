<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Jobs - JobPortal</title>

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

        .job-card {
            background: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 12px;
            padding: 22px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            transition: all 0.3s ease;
        }

        .job-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(245,130,22,0.25);
            border-color: #f58216;
        }

        /* COMPANY LOGO BOX */
        .company-photo-box {
            width: 65px;
            height: 65px;
            min-width: 65px;
            border-radius: 10px;
            overflow: hidden;
            border: 1px solid #ddd;
            flex-shrink: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #ffffff;
            color: #f58216;
            font-size: 20px;
            font-weight: bold;
        }

        /* COMPANY IMAGE */
        .company-photo-box img {
            width: 100%;
            height: 100%;
            object-fit: contain;
            display: block;
            padding: 3px;
            box-sizing: border-box;
        }

        .no-results-box {
            text-align: center;
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(255,255,255,0.12);
            border-top: 3px solid #f58216;
            border-radius: 12px;
            padding: 45px 25px;
            margin: 20px auto;
            max-width: 600px;
            color: #ffffff;
        }

        .no-results-box h3 {
            font-size: 22px;
            margin-bottom: 10px;
            color: #f58216;
        }

        .no-results-box p {
            font-size: 14px;
            color: #cccccc;
            line-height: 1.6;
            margin-bottom: 22px;
        }

        .explore-btn {
            display: inline-block;
            background: #f58216;
            color: #ffffff;
            padding: 10px 22px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            font-size: 14px;
            transition: background 0.3s ease;
        }

        .explore-btn:hover {
            background: #e06d06;
        }

        .job-description {
            color: #555;
            font-size: 14px;
            margin: 12px 0;
            line-height: 1.5;
        }

        .job-tags {
            overflow-wrap: anywhere;
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
                   class="dropbtn orange"
                   onclick="toggleDropdown('jobsMenu')">
                    Jobs ▾
                </a>

                <div id="jobsMenu" class="dropdown-content">

                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Java%20Developer">
                        Java Developer
                    </a>

                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Full%20Stack%20Developer">
                        Full Stack Developer
                    </a>

                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Software%20Engineer">
                        Software Engineer
                    </a>

                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Python%20Developer">
                        Python Developer
                    </a>

                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Data%20Analyst">
                        Data Analyst
                    </a>

                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=UI%2FUX%20Designer">
                        UI/UX Designer
                    </a>

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

                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=TCS">
                        Tata Consultancy Services (TCS)
                    </a>

                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Infosys">
                        Infosys
                    </a>

                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Accenture">
                        Accenture
                    </a>

                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Wipro">
                        Wipro
                    </a>

                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=HCL">
                        HCL Technologies
                    </a>

                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Cognizant">
                        Cognizant
                    </a>

                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Tech%20Mahindra">
                        Tech Mahindra
                    </a>

                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Capgemini">
                        Capgemini
                    </a>

                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=IBM">
                        IBM India
                    </a>

                    <a href="${pageContext.request.contextPath}/search-jobs?keyword=Amazon">
                        Amazon
                    </a>

                </div>
            </div>

        </nav>

        <div class="user-profile">
            <span>👤</span> Ankita
        </div>

    </header>


    <!-- MAIN CONTENT -->
    <div class="content">

        <div class="section-heading">

            <p>Find Your Perfect Job</p>

            <h2>Search Results</h2>

            <span class="count" id="resultCountText">

                <c:choose>

                    <c:when test="${not empty jobs}">
                        Showing ${fn:length(jobs)} matching opportunities
                    </c:when>

                    <c:otherwise>
                        Search available job opportunities
                    </c:otherwise>

                </c:choose>

            </span>

        </div>


        <!-- SEARCH FORM -->
        <form action="${pageContext.request.contextPath}/search-jobs"
              method="GET"
              class="search-form"
              style="margin-bottom: 30px;">

            <input type="text"
                   id="searchKeyword"
                   name="keyword"
                   placeholder="Job title, Company..."
                   value="<c:out value='${keyword}'/>">


            <select id="searchRegion" name="region">

                <option value="">Select Region</option>

                <option value="Kolkata"
                    <c:if test="${selectedRegion == 'Kolkata'}">selected</c:if>>
                    Kolkata
                </option>

                <option value="Bangalore"
                    <c:if test="${selectedRegion == 'Bangalore'}">selected</c:if>>
                    Bangalore
                </option>

                <option value="Hyderabad"
                    <c:if test="${selectedRegion == 'Hyderabad'}">selected</c:if>>
                    Hyderabad
                </option>

            </select>


            <select id="searchType" name="type">

                <option value="">Select Job Type</option>

                <option value="Full Time"
                    <c:if test="${selectedType == 'Full Time'}">selected</c:if>>
                    Full Time
                </option>

                <option value="Internship"
                    <c:if test="${selectedType == 'Internship'}">selected</c:if>>
                    Internship
                </option>

            </select>


            <button type="submit">
                Search Jobs
            </button>

        </form>


        <!-- DATABASE JOB RESULTS -->
        <div class="job-grid" id="jobGrid">

            <c:forEach var="job" items="${jobs}">

                <div class="job-card">

                    <div class="card-top">

                        <!-- COMPANY LOGO -->
                        <div class="company-photo-box">

                            <c:choose>

                                <c:when test="${not empty job.logoImage}">

                                    <img
                                        src="${pageContext.request.contextPath}/images/${job.logoImage}"
                                        alt="${job.companyName} Logo"
                                        onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">

                                    <span style="display:none;">
                                        <c:out value="${job.logoText}"/>
                                    </span>

                                </c:when>

                                <c:otherwise>

                                    <c:out value="${job.logoText}"/>

                                </c:otherwise>

                            </c:choose>

                        </div>

                        <div>

                            <h3>
                                <c:out value="${job.companyName}"/>
                            </h3>

                            <h2>
                                <c:out value="${job.title}"/>
                            </h2>

                        </div>

                    </div>


                    <div class="meta">

                        <span>
                            📍 <c:out value="${job.location}"/>
                        </span>

                        <span>
                            🕒 <c:out value="${job.jobType}"/>
                        </span>

                        <span>
                            💰 <c:out value="${job.salary}"/>
                        </span>

                    </div>


                    <c:if test="${not empty job.description}">

                        <p class="job-description">
                            <c:out value="${job.description}"/>
                        </p>

                    </c:if>


                    <div class="tags job-tags">

                        <c:if test="${not empty job.category}">
                            <span>
                                <c:out value="${job.category}"/>
                            </span>
                        </c:if>

                        <c:if test="${not empty job.skills}">
                            <span>
                                <c:out value="${job.skills}"/>
                            </span>
                        </c:if>

                    </div>


                    <!-- JOB DETAILS LINK -->
                    <a href="${pageContext.request.contextPath}/job-details?id=${job.jobId}"
                       class="details-btn">

                        View Details →

                    </a>

                </div>

            </c:forEach>

        </div>


        <!-- NO RESULTS MESSAGE -->
        <c:if test="${empty jobs}">

            <div id="noResultsBox" class="no-results-box">

                <h3>No Matching Jobs Found</h3>

                <p>
                    We couldn't find any openings matching your search
                    criteria.<br>
                    Explore more available jobs or reset your filters!
                </p>

                <a href="${pageContext.request.contextPath}/search-jobs"
                   class="explore-btn">

                    Explore All Available Jobs

                </a>

            </div>

        </c:if>

    </div>


    <!-- FOOTER -->
    <footer>

        <p>
            &copy; 2026 JobPortal. All Rights Reserved.
        </p>

    </footer>


    <!-- JAVASCRIPT -->
    <script>

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


        window.onclick = function(event) {

            if (!event.target.matches('.dropbtn')) {

                const dropdowns =
                    document.querySelectorAll('.dropdown-content');

                dropdowns.forEach(menu => {

                    if (menu.classList.contains('show')) {
                        menu.classList.remove('show');
                    }

                });

            }

        };

    </script>

</body>
</html>