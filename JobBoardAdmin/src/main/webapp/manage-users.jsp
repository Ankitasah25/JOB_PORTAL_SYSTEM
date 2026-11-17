<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.jobportal.bean.User" %>
<%@ page import="com.jobportal.bean.Admin" %>
<%
    // Session Security Check
    Admin currentAdmin = (Admin) session.getAttribute("adminSession");
    if (currentAdmin == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }

    List<User> userList = (List<User>) request.getAttribute("userList");
    // If accessed directly without servlet, redirect to servlet to load data
    if (userList == null) {
        response.sendRedirect("ManageUsersServlet");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users - JOBBOARD.in</title>
    <!-- Bootstrap 5.3 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome Icons CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { background-color: #f8fafc; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .sidebar { position: fixed; top: 0; bottom: 0; left: 0; width: 260px; background: #0f172a; color: #cbd5e1; z-index: 100; padding-top: 20px; }
        .sidebar .brand { font-size: 20px; font-weight: 700; color: #ffffff; padding: 10px 20px 25px 20px; display: flex; align-items: center; border-bottom: 1px solid #1e293b; }
        .sidebar .brand i { color: #3b82f6; margin-right: 10px; font-size: 24px; }
        .sidebar .nav-link { color: #94a3b8; padding: 12px 20px; font-weight: 500; display: flex; align-items: center; transition: all 0.2s ease; }
        .sidebar .nav-link i { width: 25px; margin-right: 10px; }
        .sidebar .nav-link:hover, .sidebar .nav-link.active { color: #ffffff; background: #1e293b; border-left: 4px solid #3b82f6; }
        .main-content { margin-left: 260px; padding: 20px 30px; }
        .top-navbar { background: #ffffff; border-radius: 10px; padding: 15px 25px; box-shadow: 0 2px 4px rgba(0,0,0,0.02); display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px; }
        .card { border: none; border-radius: 10px; box-shadow: 0 2px 4px rgba(0,0,0,0.02); }
        .card-header { background: #ffffff; border-bottom: 1px solid #f1f5f9; font-weight: 600; padding: 15px 20px; border-top-left-radius: 10px !important; border-top-right-radius: 10px !important; }
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
                <a class="nav-link active" href="ManageUsersServlet">
                    <i class="fa-solid fa-users-gear"></i> Manage Users
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="manage-jobs.jsp">
                    <i class="fa-solid fa-briefcase"></i> Manage Jobs
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="reports.jsp">
                    <i class="fa-solid fa-file-invoice"></i> Reports & Stats
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
            <h5 class="fw-bold m-0 text-dark">User Management</h5>
            <div class="dropdown">
                <button class="btn btn-light dropdown-toggle border-0 fw-semibold" type="button" data-bs-toggle="dropdown">
                    <i class="fa-solid fa-user-shield text-primary me-2"></i> <%= currentAdmin.getUsername() %>
                </button>
                <ul class="dropdown-menu dropdown-menu-end shadow-sm">
                    <li><a class="dropdown-item text-danger" href="AdminLoginServlet?action=logout"><i class="fa-solid fa-right-from-bracket me-2"></i> Logout</a></li>
                </ul>
            </div>
        </div>

        <!-- Users Table Card -->
        <div class="card">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <span><i class="fa-solid fa-users me-2 text-primary"></i> Registered Platform Users</span>
                <span class="badge bg-primary px-3 py-2">Total: <%= userList.size() %></span>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead class="table-light text-secondary small">
                            <tr>
                                <th class="ps-3">ID</th>
                                <th>Full Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Role</th>
                                <th>Status</th>
                                <th class="text-end pe-3">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                if (userList.isEmpty()) {
                            %>
                                <tr>
                                    <td colspan="7" class="text-center py-4 text-muted">No registered users found in database.</td>
                                </tr>
                            <% 
                                } else {
                                    for (User u : userList) {
                            %>
                                <tr>
                                    <td class="ps-3 fw-semibold">#<%= u.getUserId() %></td>
                                    <td><%= u.getFullName() %></td>
                                    <td><%= u.getEmail() %></td>
                                    <td><%= u.getPhone() != null ? u.getPhone() : "N/A" %></td>
                                    <td><span class="badge bg-light text-dark border"><%= u.getRole() %></span></td>
                                    <td>
                                        <% if ("ACTIVE".equalsIgnoreCase(u.getStatus())) { %>
                                            <span class="badge bg-success">ACTIVE</span>
                                        <% } else if ("INACTIVE".equalsIgnoreCase(u.getStatus())) { %>
                                            <span class="badge bg-warning text-dark">INACTIVE</span>
                                        <% } else { %>
                                            <span class="badge bg-danger">BLOCKED</span>
                                        <% } %>
                                    </td>
                                    <td class="text-end pe-3">
                                        <% if ("ACTIVE".equalsIgnoreCase(u.getStatus())) { %>
                                            <a href="ManageUsersServlet?action=status&id=<%= u.getUserId() %>&status=INACTIVE" class="btn btn-sm btn-outline-warning me-1" title="Deactivate User">
                                                <i class="fa-solid fa-ban"></i>
                                            </a>
                                        <% } else { %>
                                            <a href="ManageUsersServlet?action=status&id=<%= u.getUserId() %>&status=ACTIVE" class="btn btn-sm btn-outline-success me-1" title="Activate User">
                                                <i class="fa-solid fa-check"></i>
                                            </a>
                                        <% } %>
                                        <a href="ManageUsersServlet?action=delete&id=<%= u.getUserId() %>" class="btn btn-sm btn-outline-danger" onclick="return confirm('Are you sure you want to delete this user?');" title="Delete User">
                                            <i class="fa-solid fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            <% 
                                    }
                                } 
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5.3 JS Bundle CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>