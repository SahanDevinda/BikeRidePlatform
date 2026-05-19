<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html><html><head>
<title>Update Profile — BikeRide</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background:#f5f5f5; font-family:'Segoe UI',sans-serif; }
    .form-card { max-width:500px; margin:60px auto; background:#fff;
        border-radius:16px; box-shadow:0 4px 24px rgba(0,0,0,0.10); overflow:hidden; }
    .form-header { background:#1a1a1a; padding:24px 30px; }
    .form-header h4 { color:#FFC200; font-weight:800; margin:0; }
    .form-body { padding:36px; }
    .form-control:focus { border-color:#FFC200; box-shadow:0 0 0 3px rgba(255,194,0,0.2); }
    .btn-main { background:#FFC200; color:#1a1a1a; font-weight:700;
        border:none; width:100%; padding:12px; border-radius:8px; }
    .btn-main:hover { background:#e6ae00; color:#1a1a1a; }
    .current-info { background:#fffbf0; border-radius:8px; padding:16px; margin-bottom:24px; }
</style>
</head><body>
<%@ include file="navbar.jsp" %>
<div class="form-card">
    <div class="form-header">
        <h4>✏️ Update Profile</h4>
    </div>
    <div class="form-body">
        <c:if test="${not empty message}">
            <div class="alert alert-success py-2">${message}</div>
        </c:if>
        <div class="current-info">
            <small class="text-muted">Current Info</small>
            <div class="fw-bold">${user.username}</div>
            <div style="color:#666;font-size:0.9rem;">${user.email}</div>
            <div style="color:#FFC200;font-size:0.8rem;font-weight:700;">${user.role}</div>
        </div>
        <form action="/profile/update" method="post">
            <div class="mb-3">
                <label class="form-label fw-bold">New Email</label>
                <input type="email" name="email" class="form-control" placeholder="Enter new email">
            </div>
            <div class="mb-4">
                <label class="form-label fw-bold">New Password</label>
                <input type="password" name="password" class="form-control" placeholder="Enter new password">
            </div>
            <button type="submit" class="btn-main">Save Changes</button>
        </form>
    </div>
</div>
</body></html>
