<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html><html><head>
<title>Login — BikeRide</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background:#f5f5f5; font-family:'Segoe UI',sans-serif; }
    .auth-card { max-width:440px; margin:80px auto; background:#fff;
        border-radius:16px; box-shadow:0 4px 24px rgba(0,0,0,0.10); overflow:hidden; }
    .auth-header { background:#1a1a1a; padding:30px; text-align:center; }
    .auth-header .logo-yellow { color:#FFC200; font-weight:900; font-size:1.8rem; }
    .auth-body { padding:36px; }
    .form-label { font-weight:600; }
    .form-control:focus { border-color:#FFC200; box-shadow:0 0 0 3px rgba(255,194,0,0.2); }
    .btn-main { background:#FFC200; color:#1a1a1a; font-weight:700;
        border:none; width:100%; padding:12px; border-radius:8px; font-size:1rem; }
    .btn-main:hover { background:#e6ae00; color:#1a1a1a; }
</style>
</head><body>
<%@ include file="navbar.jsp" %>
<div class="auth-card">
    <div class="auth-header">
        <div class="logo-yellow">BikeRide</div>
        <p style="color:#aaa;margin:4px 0 0;">Welcome back!</p>
    </div>
    <div class="auth-body">
        <c:if test="${not empty error}">
            <div class="alert alert-danger py-2">${error}</div>
        </c:if>
        <c:if test="${not empty message}">
            <div class="alert alert-success py-2">${message}</div>
        </c:if>
        <form action="/login" method="post">
            <div class="mb-3">
                <label class="form-label">Username</label>
                <input type="text" name="username" class="form-control" required placeholder="Your username">
            </div>
            <div class="mb-4">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" required placeholder="••••••••">
            </div>
            <button type="submit" class="btn-main">Login</button>
        </form>
        <p class="text-center mt-3 mb-0" style="color:#777;">
            New here? <a href="/register" style="color:#1a1a1a;font-weight:700;">Create account</a>
        </p>
    </div>
</div>
</body></html>
