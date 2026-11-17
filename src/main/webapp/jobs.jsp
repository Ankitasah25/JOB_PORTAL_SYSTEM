<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JobPortal - Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

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
        nav a:hover {
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
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-top: 3px solid #f58216;
            border-radius: 8px;
            box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.75);
            z-index: 1000;
            overflow: hidden;
        }
        .dropdown-content a {
            color: #e0e0e0;
            padding: 10px 15px;
            text-decoration: none;
            display: block;
            font-size: 13px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
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
        .trending a {
            cursor: pointer;
        }
        .hero-tagline {
            font-style: italic;
            font-family: 'Georgia', serif;
            font-size: 14px;
            color: #ddd;
            margin: 12px 0;
            letter-spacing: 0.5px;
        }

        .job-card {
            background: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 12px;
            padding: 22px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
        }
        .job-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(245, 130, 22, 0.15);
            border-color: #f58216;
        }
        .company-photo-box {
            width: 65px;
            height: 65px;
            border-radius: 10px;
            overflow: hidden;
            border: 1px solid #ddd;
            flex-shrink: 0;
        }
        .company-photo-box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
    </style>
</head>

<body>

    <!-- TOPBAR -->
    <header class="topbar">

        <a href="${pageContext.request.contextPath}/jobs.jsp" class="brand">
            JOB<span>PORTAL</span>
        </a>

        <nav>
            <a href="${pageContext.request.contextPath}/jobs.jsp">Home</a>

            <!-- Jobs Dropdown -->
            <div class="dropdown">
                <a href="javascript:void(0)" class="dropbtn"
                   onclick="toggleDropdown('jobsMenu')">Jobs ▾</a>

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
                <a href="javascript:void(0)" class="dropbtn"
                   onclick="toggleDropdown('companiesMenu')">Companies ▾</a>

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

    <!-- HERO SECTION -->
    <section class="hero">

        <h1>The Easiest Way To<br><span>Get Your Dream Job</span></h1>

        <p class="hero-tagline">
            ✨ "Your gateway to top tech careers. Connect with leading innovators and land your dream role effortlessly." ✨
        </p>

        <form action="${pageContext.request.contextPath}/search-jobs"
              method="GET" class="search-form">

            <input type="text" id="keywordInput" name="keyword"
                   placeholder="Job title, Company...">

            <select name="region">
                <option value="">Select Region</option>
                <option value="Kolkata">Kolkata</option>
                <option value="Bangalore">Bangalore</option>
                <option value="Hyderabad">Hyderabad</option>
            </select>

            <select name="type">
                <option value="">Select Job Type</option>
                <option value="Full Time">Full Time</option>
                <option value="Internship">Internship</option>
            </select>

            <button type="submit">Search Job</button>
        </form>

        <div class="trending">
            <span>Trending Keywords:</span>
            <a onclick="setKeyword('UI Designer')">UI Designer</a>
            <a onclick="setKeyword('Python')">Python</a>
            <a onclick="setKeyword('Developer')">Developer</a>
            <a onclick="setKeyword('Java')">Java</a>
            <a onclick="setKeyword('Marketing')">Marketing</a>
        </div>
    </section>

    <!-- JOB CARDS SECTION -->
    <div class="content">

        <div class="section-heading">
            <p>Available Jobs For You</p>
            <h2>Recommended Tech Jobs</h2>
        </div>

        <div class="job-grid">

            <!-- Job Card 1 - Google -->
            <div class="job-card">
                <div class="card-top">
                    <div class="company-photo-box">
                        <img src="https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=200"
                             alt="Google Office">
                    </div>
                    <div>
                        <h3>Google</h3>
                        <h2>Java Developer</h2>
                    </div>
                </div>

                <div class="meta">
                    <span>📍 Bangalore</span>
                    <span>🕒 Full Time</span>
                    <span>💰 6-10 LPA</span>
                </div>

                <div class="tags">
                    <span>Java</span>
                    <span>SQL</span>
                    <span>OOP</span>
                </div>

                <a href="${pageContext.request.contextPath}/job-details?id=1"
                   class="details-btn">View Details →</a>
            </div>

            <!-- Job Card 2 - Microsoft -->
            <div class="job-card">
                <div class="card-top">
                    <div class="company-photo-box">
                        <img src="https://images.unsplash.com/photo-1504384308090-c894fdcc538d?w=200"
                             alt="Microsoft Office">
                    </div>
                    <div>
                        <h3>Microsoft</h3>
                        <h2>Web Developer</h2>
                    </div>
                </div>

                <div class="meta">
                    <span>📍 Hyderabad</span>
                    <span>🕒 Internship</span>
                    <span>💰 15000/month</span>
                </div>

                <div class="tags">
                    <span>HTML</span>
                    <span>CSS</span>
                    <span>JavaScript</span>
                </div>

                <a href="${pageContext.request.contextPath}/job-details?id=2"
                   class="details-btn">View Details →</a>
            </div>

            <!-- Job Card 3 - TCS -->
            <div class="job-card">
                <div class="card-top">
                    <div class="company-photo-box">
                        <img src="https://images.unsplash.com/photo-1497366216548-37526070297c?w=200"
                             alt="TCS Office">
                    </div>
                    <div>
                        <h3>Tata Consultancy Services</h3>
                        <h2>Data Analyst</h2>
                    </div>
                </div>

                <div class="meta">
                    <span>📍 Kolkata</span>
                    <span>🕒 Full Time</span>
                    <span>💰 4-6 LPA</span>
                </div>

                <div class="tags">
                    <span>Python</span>
                    <span>SQL</span>
                    <span>Excel</span>
                </div>

                <a href="${pageContext.request.contextPath}/job-details?id=3"
                   class="details-btn">View Details →</a>
            </div>

        </div>
    </div>

    <!-- FOOTER -->
    <footer>
        <p>&copy; 2026 JobPortal. All Rights Reserved.</p>
    </footer>

    <script>
        function setKeyword(keyword) {
            document.getElementById('keywordInput').value = keyword;
            document.getElementById('keywordInput').focus();
        }

        function toggleDropdown(menuId) {
            const allDropdowns = document.querySelectorAll('.dropdown-content');

            allDropdowns.forEach(menu => {
                if (menu.id !== menuId) {
                    menu.classList.remove('show');
                }
            });

            document.getElementById(menuId).classList.toggle('show');
        }

        window.onclick = function(event) {
            if (!event.target.matches('.dropbtn')) {
                const dropdowns = document.querySelectorAll('.dropdown-content');

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