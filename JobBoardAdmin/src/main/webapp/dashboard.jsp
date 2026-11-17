<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jobportal.bean.Admin" %>
<%@ page import="com.jobportal.dao.AdminDAO" %>
<%
    // Session Security Check: Redirect to login if admin is not logged in
    Admin currentAdmin = (Admin) session.getAttribute("adminSession");
    if (currentAdmin == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }
    AdminDAO adminDAO = new AdminDAO();
    int totalUsers = adminDAO.getTotalUsers();
    int activeJobs = adminDAO.getActiveJobsCount();
    int pendingJobs = adminDAO.getPendingJobsCount();
    int totalRecruiters = adminDAO.getRecruitersCount();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - JOBBOARD.in</title>
    <!-- Bootstrap 5.3 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome Icons CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f8fafc;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        /* Sidebar Styles */
        .sidebar {
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            width: 260px;
            background: #0f172a;
            color: #cbd5e1;
            z-index: 100;
            padding-top: 20px;
        }
        .sidebar .brand {
            font-size: 20px;
            font-weight: 700;
            color: #ffffff;
            padding: 10px 20px 25px 20px;
            display: flex;
            align-items: center;
            border-bottom: 1px solid #1e293b;
        }
        .sidebar .brand i {
            color: #3b82f6;
            margin-right: 10px;
            font-size: 24px;
        }
        .sidebar .nav-link {
            color: #94a3b8;
            padding: 12px 20px;
            font-weight: 500;
            display: flex;
            align-items: center;
            transition: all 0.2s ease;
        }
        .sidebar .nav-link i {
            width: 25px;
            margin-right: 10px;
        }
        .sidebar .nav-link:hover, .sidebar .nav-link.active {
            color: #ffffff;
            background: #1e293b;
            border-left: 4px solid #3b82f6;
        }
        /* Main Content Area */
        .main-content {
            margin-left: 260px;
            padding: 20px 30px;
        }
        /* Top Navbar */
        .top-navbar {
            background: #ffffff;
            border-radius: 10px;
            padding: 15px 25px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.02);
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        /* Metric Cards */
        .metric-card {
            background: #ffffff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.02);
            border-left: 4px solid #3b82f6;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .metric-card.success { border-left-color: #10b981; }
        .metric-card.warning { border-left-color: #f59e0b; }
        .metric-card.danger { border-left-color: #ef4444; }
        .metric-info h6 {
            color: #64748b;
            font-size: 13px;
            font-weight: 600;
            text-transform: uppercase;
            margin-bottom: 5px;
        }
        .metric-info h3 {
            color: #1e293b;
            font-weight: 700;
            margin: 0;
        }
        .metric-icon {
            width: 50px;
            height: 50px;
            border-radius: 8px;
            background: #eff6ff;
            color: #3b82f6;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
        }
        .metric-card.success .metric-icon { background: #ecfdf5; color: #10b981; }
        .metric-card.warning .metric-icon { background: #fffbeb; color: #f59e0b; }
        .metric-card.danger .metric-icon { background: #fef2f2; color: #ef4444; }
        /* Tables & Cards */
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.02);
        }
        .card-header {
            background: #ffffff;
            border-bottom: 1px solid #f1f5f9;
            font-weight: 600;
            padding: 15px 20px;
            border-top-left-radius: 10px !important;
            border-top-right-radius: 10px !important;
        }
    </style>
</head>
<body>

   <!-- Sidebar Navigation -->
<div class="sidebar">
    <div class="brand">
        <i class="fa-solid fa-shield-halved"></i> JOBBOARD.in
    </div>
    <ul class="nav flex-column mt-3">
        <li class="nav-item">
            <a class="nav-link" href="dashboard.jsp">
                <i class="fa-solid fa-chart-line"></i> Dashboard
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="ManageUsersServlet">
                <i class="fa-solid fa-users-gear"></i> Manage Users
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="ManageJobsServlet">
                <i class="fa-solid fa-briefcase"></i> Manage Jobs
            </a>
        </li>
        <li class="nav-item">
           <a class="nav-link" href="${pageContext.request.contextPath}/ReportsServlet">
    <i class="fa-solid fa-chart-column"></i> Reports & Stats
</a>
        </li>
        <li class="nav-item mt-5">
            <a class="nav-link text-danger" href="AdminLoginServlet?action=logout">
                <i class="fa-solid fa-right-from-bracket"></i> Logout
            </a>
        </li>
    </ul>
</div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Top Navbar -->
        <div class="top-navbar">
            <h5 class="fw-bold m-0 text-dark">Dashboard Overview</h5>
            <div class="dropdown">
                <button class="btn btn-light dropdown-toggle border-0 fw-semibold" type="button" data-bs-toggle="dropdown">
                    <i class="fa-solid fa-user-shield text-primary me-2"></i> <%= currentAdmin.getUsername() %> (<%= currentAdmin.getRole() %>)
                </button>
                <ul class="dropdown-menu dropdown-menu-end shadow-sm">
                    <li><a class="dropdown-item text-danger" href="AdminLoginServlet?action=logout"><i class="fa-solid fa-right-from-bracket me-2"></i> Logout</a></li>
                </ul>
            </div>
        </div>

        <!-- Metric Summary Cards Row -->
        <div class="row g-4 mb-4">
            <div class="col-xl-3 col-md-6">
                <div class="metric-card">
                    <div class="metric-info">
                        <h6>Total Users</h6>
                        <h3>1,248</h3>
                    </div>
                    <div class="metric-icon">
                        <i class="fa-solid fa-users"></i>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="metric-card success">
                    <div class="metric-info">
                        <h6>Active Jobs</h6>
                        <h3>342</h3>
                    </div>
                    <div class="metric-icon">
                        <i class="fa-solid fa-briefcase"></i>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="metric-card warning">
                    <div class="metric-info">
                        <h6>Pending Jobs</h6>
                        <h3>18</h3>
                    </div>
                    <div class="metric-icon">
                        <i class="fa-solid fa-clock-rotate-left"></i>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="metric-card danger">
                    <div class="metric-info">
                        <h6>Total Recruiters</h6>
                        <h3>84</h3>
                    </div>
                    <div class="metric-icon">
                        <i class="fa-solid fa-building-user"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Recent Activities & Job Postings Table Section -->
        <div class="row g-4">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header bg-white d-flex justify-content-between align-items: center;">
                        <span><i class="fa-solid fa-list-check me-2 text-primary"></i> Recent Job Postings for Approval</span>
                        <a href="manage-jobs.jsp" class="btn btn-sm btn-outline-primary">View All</a>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover align-middle mb-0">
                                <thead class="table-light text-secondary small">
                                    <tr>
                                        <th class="ps-3">Job Title</th>
                                        <th>Company</th>
                                        <th>Status</th>
                                        <th class="text-end pe-3">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="ps-3 fw-semibold">Java 17 Developer</td>
                                        <td>TechCorp Solutions</td>
                                        <td><span class="badge bg-warning text-dark">PENDING</span></td>
                                        <td class="text-end pe-3">
                                            <a href="manage-jobs.jsp" class="btn btn-sm btn-outline-success me-1"><i class="fa-solid fa-check"></i></a>
                                            <a href="manage-jobs.jsp" class="btn btn-sm btn-outline-danger"><i class="fa-solid fa-xmark"></i></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="ps-3 fw-semibold">Frontend Engineer</td>
                                        <td>WebFlow Inc</td>
                                        <td><span class="badge bg-success">APPROVED</span></td>
                                        <td class="text-end pe-3">
                                            <a href="manage-jobs.jsp" class="btn btn-sm btn-light border"><i class="fa-solid fa-eye"></i></a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header bg-white">
                        <i class="fa-solid fa-bolt me-2 text-warning"></i> System Quick Stats
                    </div>
                    <div class="card-body">
                        <p class="text-muted small mb-3">System status is fully operational. Database connection is healthy via JDBC.</p>
                        <div class="d-flex justify-content-between mb-2">
                            <span class="text-secondary small">Server Runtime</span>
                            <span class="fw-semibold small">Apache Tomcat 9.0</span>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <span class="text-secondary small">Java Version</span>
                            <span class="fw-semibold small">JDK 17</span>
                        </div>
                        <div class="d-flex justify-content-between">
                            <span class="text-secondary small">Database Engine</span>
                            <span class="fw-semibold small">MySQL InnoDB</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5.3 JS Bundle CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>