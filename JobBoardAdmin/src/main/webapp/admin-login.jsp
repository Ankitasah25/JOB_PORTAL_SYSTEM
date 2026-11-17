<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head><!-- Google Fonts: Inter -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<!-- FontAwesome Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
    :root {
        --primary-color: #4f46e5;
        --primary-hover: #4338ca;
        --bg-body: #f8fafc;
        --card-bg: #ffffff;
        --text-main: #0f172a;
        --text-muted: #64748b;
        --border-color: #e2e8f0;
    }

    body {
        background-color: var(--bg-body);
        font-family: 'Inter', sans-serif;
        color: var(--text-main);
        -webkit-font-smoothing: antialiased;
    }

    /* Modern Navbar */
    .navbar {
        background: rgba(255, 255, 255, 0.85) !important;
        backdrop-filter: blur(12px);
        border-bottom: 1px solid var(--border-color);
        box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.02);
    }
    .navbar-brand {
        font-weight: 700;
        letter-spacing: -0.5px;
        color: var(--text-main) !important;
    }

    /* Cards & Containers */
    .card {
        border: 1px solid var(--border-color);
        border-radius: 1rem;
        background-color: var(--card-bg);
        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.02), 0 2px 4px -1px rgba(0, 0, 0, 0.01);
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }
    .card:hover {
        transform: translateY(-2px);
        box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.05), 0 4px 6px -2px rgba(0, 0, 0, 0.025);
    }

    /* Buttons */
    .btn-primary {
        background-color: var(--primary-color);
        border-color: var(--primary-color);
        border-radius: 0.6rem;
        font-weight: 600;
        padding: 0.6rem 1.25rem;
        box-shadow: 0 1px 2px 0 rgba(79, 70, 229, 0.2);
        transition: all 0.2s ease;
    }
    .btn-primary:hover {
        background-color: var(--primary-hover);
        border-color: var(--primary-hover);
        transform: translateY(-1px);
        box-shadow: 0 4px 6px -1px rgba(79, 70, 229, 0.3);
    }
    .btn-outline-primary {
        color: var(--primary-color);
        border-color: var(--border-color);
        border-radius: 0.6rem;
        font-weight: 600;
    }
    .btn-outline-primary:hover {
        background-color: #eef2ff;
        border-color: var(--primary-color);
        color: var(--primary-color);
    }

    /* Forms & Inputs */
    .form-control, .form-select {
        border-radius: 0.6rem;
        border: 1px solid var(--border-color);
        padding: 0.75rem 1rem;
        font-size: 0.95rem;
        background-color: #f8fafc;
        transition: all 0.2s ease;
    }
    .form-control:focus, .form-select:focus {
        background-color: #ffffff;
        border-color: var(--primary-color);
        box-shadow: 0 0 0 4px rgba(79, 70, 229, 0.1);
    }

    /* Badges */
    .badge {
        font-weight: 600;
        padding: 0.5em 0.8em;
        border-radius: 0.5rem;
        letter-spacing: 0.3px;
    }
    .badge.bg-light {
        background-color: #f1f5f9 !important;
        color: #475569 !important;
        border: 1px solid var(--border-color);
    }
</style>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - JOBBOARD.in</title>
    <!-- Bootstrap 5.3 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome Icons CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .login-card {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 420px;
            padding: 40px;
        }
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .login-header i {
            font-size: 40px;
            color: #0d6efd;
            margin-bottom: 10px;
        }
        .login-header h3 {
            font-weight: 700;
            color: #1e293b;
        }
        .login-header p {
            color: #64748b;
            font-size: 14px;
        }
        .form-control:focus {
            box-shadow: none;
            border-color: #0d6efd;
        }
        .btn-primary {
            padding: 12px;
            font-weight: 600;
            border-radius: 8px;
        }
        .alert {
            font-size: 14px;
        }
    </style>
</head>
<body>

    <div class="login-card">
        <div class="login-header">
            <i class="fa-solid fa-shield-halved"></i>
            <h3>JOBBOARD.in</h3>
            <p>Administrator Portal Login</p>
        </div>

        <!-- Display error message if authentication fails -->
        <% 
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) { 
        %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="fa-solid fa-triangle-exclamation me-2"></i> <%= errorMessage %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } %>

        <!-- Login Form mapping to AdminLoginServlet -->
        <form action="AdminLoginServlet" method="post">
            <div class="mb-3">
                <label for="username" class="form-label fw-semibold text-secondary small">Username or Email</label>
                <div class="input-group">
                    <span class="input-group-text bg-light border-end-0"><i class="fa-solid fa-user text-muted"></i></span>
                    <input type="text" class="form-control border-start-0 bg-light" id="username" name="username" placeholder="Enter admin username" required>
                </div>
            </div>

            <div class="mb-4">
                <label for="password" class="form-label fw-semibold text-secondary small">Password</label>
                <div class="input-group">
                    <span class="input-group-text bg-light border-end-0"><i class="fa-solid fa-lock text-muted"></i></span>
                    <input type="password" class="form-control border-start-0 bg-light" id="password" name="password" placeholder="Enter password" required>
                </div>
            </div>

            <button type="submit" class="btn btn-primary w-100 shadow-sm">
                <i class="fa-solid fa-right-to-bracket me-2"></i> Secure Login
            </button>
        </form>

        <div class="text-center mt-4">
            <small class="text-muted">&copy; 2026 JOBBOARD.in. All Rights Reserved.</small>
        </div>
    </div>

    <!-- Bootstrap 5.3 JS Bundle CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>