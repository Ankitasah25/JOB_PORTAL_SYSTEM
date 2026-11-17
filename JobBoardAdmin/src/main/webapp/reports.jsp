<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.jobportal.bean.Admin" %>
<%
    com.jobportal.bean.Admin currentAdmin = (com.jobportal.bean.Admin) session.getAttribute("adminSession");
    if (currentAdmin == null) {
        response.sendRedirect(request.getContextPath() + "/admin-login.jsp");
        return;
    }
    if (request.getAttribute("users") == null) {
        // A direct JSP request must not enter a redirect loop.
        response.sendError(404, "Open Reports & Stats through ReportsServlet.");
        return;
    }
    int users = (Integer) request.getAttribute("users");
    int recruiters = (Integer) request.getAttribute("recruiters");
    int seekers = (Integer) request.getAttribute("seekers");
    int jobs = (Integer) request.getAttribute("jobs");
    int activeJobs = (Integer) request.getAttribute("activeJobs");
    int applications = (Integer) request.getAttribute("applications");
    int shortlisted = (Integer) request.getAttribute("shortlisted");
    String error = (String) request.getAttribute("error");
%><!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Reports &amp; Stats - JOBBOARD.in</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body { background:#f8fafc; font-family:'Segoe UI',Tahoma,sans-serif; }
    .sidebar { position:fixed; inset:0 auto 0 0; width:260px; background:#0f172a; color:#cbd5e1; padding-top:20px; }
    .brand { font-size:20px; font-weight:700; color:white; padding:10px 20px 25px; border-bottom:1px solid #1e293b; }
    .brand i { color:#3b82f6; margin-right:10px; }
    .sidebar .nav-link { color:#94a3b8; padding:12px 20px; font-weight:500; }
    .sidebar .nav-link i { width:30px; }
    .sidebar .nav-link:hover,.sidebar .nav-link.active { color:white; background:#1e293b; border-left:4px solid #3b82f6; }
    .main-content { margin-left:260px; padding:30px; }
    .top-navbar,.stat-card { background:white; border-radius:12px; padding:24px; box-shadow:0 2px 6px rgba(0,0,0,.04); }
    .stat-card .number { font-size:32px; font-weight:700; color:#0f172a; }
    .stat-card .label { color:#64748b; }
    @media(max-width:800px) { .sidebar { position:static; width:100%; } .main-content { margin-left:0; padding:16px; } }
  </style>
</head>
<body>
  <nav class="sidebar">
    <div class="brand"><i class="fa-solid fa-shield-halved"></i>JOBBOARD.in</div>
    <ul class="nav flex-column mt-3">
      <li><a class="nav-link" href="dashboard.jsp"><i class="fa-solid fa-chart-line"></i>Dashboard</a></li>
      <li><a class="nav-link" href="ManageUsersServlet"><i class="fa-solid fa-users-gear"></i>Manage Users</a></li>
      <li><a class="nav-link" href="ManageJobsServlet"><i class="fa-solid fa-briefcase"></i>Manage Jobs</a></li>
      <li><a class="nav-link active" href="ReportsServlet"><i class="fa-solid fa-file-invoice"></i>Reports &amp; Stats</a></li>
      <li class="mt-5"><a class="nav-link text-danger" href="AdminLoginServlet?action=logout"><i class="fa-solid fa-right-from-bracket"></i>Logout</a></li>
    </ul>
  </nav>
  <main class="main-content">
    <div class="top-navbar mb-4 d-flex justify-content-between align-items-center">
      <h4 class="m-0">Reports &amp; Statistics</h4><span class="text-muted">Administrator dashboard</span>
    </div>
    <% if (error != null) { %>
      <div class="alert alert-danger"><%= error %></div>
    <% } else { %>
      <div class="row g-4">
        <div class="col-md-6 col-xl-4"><div class="stat-card"><div class="label">Total Users</div><div class="number"><%= users %></div></div></div>
        <div class="col-md-6 col-xl-4"><div class="stat-card"><div class="label">Recruiters</div><div class="number"><%= recruiters %></div></div></div>
        <div class="col-md-6 col-xl-4"><div class="stat-card"><div class="label">Job Seekers</div><div class="number"><%= seekers %></div></div></div>
        <div class="col-md-6 col-xl-4"><div class="stat-card"><div class="label">Total Jobs</div><div class="number"><%= jobs %></div></div></div>
        <div class="col-md-6 col-xl-4"><div class="stat-card"><div class="label">Active Jobs</div><div class="number"><%= activeJobs %></div></div></div>
        <div class="col-md-6 col-xl-4"><div class="stat-card"><div class="label">Total Applications</div><div class="number"><%= applications %></div></div></div>
        <div class="col-md-6 col-xl-4"><div class="stat-card"><div class="label">Shortlisted Applications</div><div class="number"><%= shortlisted %></div></div></div>
      </div>
    <% } %>
  </main>
</body>
</html>
