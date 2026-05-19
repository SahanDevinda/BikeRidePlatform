<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html><html><head>
<title>User Management — Admin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background:#f9f9f9; font-family:'Segoe UI',sans-serif; }
    .page-hero { background:#1a1a1a; color:#fff; padding:40px 0; }
    .page-hero h1 { font-weight:800; } .page-hero span { color:#FFC200; }
    table { background:#fff; border-radius:12px; overflow:hidden;
        box-shadow:0 2px 12px rgba(0,0,0,0.08); }
    thead { background:#1a1a1a; color:#FFC200; }
    thead th { font-weight:700; padding:14px 16px !important; border:none !important; }
    tbody tr:hover { background:#fffbf0; }
    .btn-del { background:#1a1a1a; color:#fff; border:none; padding:5px 14px;
        border-radius:6px; font-size:0.85rem; }
    .btn-del:hover { background:#c0392b; color:#fff; }
    .badge-admin { background:#FFC200; color:#1a1a1a; font-weight:700;
        padding:3px 10px; border-radius:12px; font-size:0.8rem; }
    .badge-regular { background:#e9ecef; color:#555; padding:3px 10px;
        border-radius:12px; font-size:0.8rem; }
</style>
</head><body>
<%@ include file="navbar.jsp" %>
<div class="page-hero">
    <div class="container d-flex justify-content-between align-items-center">
        <div>
            <h1>User <span>Management</span></h1>
            <p style="color:#ccc;margin:0;">Manage all registered users</p>
        </div>
        <a href="/register" class="btn"
           style="background:#FFC200;color:#1a1a1a;font-weight:700;padding:10px 24px;">
            + Add User</a>
    </div>
</div>
<div class="container" style="padding:40px 0;">
    <table class="table table-hover">
        <thead>
        <tr><th>User ID</th><th>Username</th><th>Email</th>
            <th>Type</th><th>Role</th><th>Action</th></tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${users}">
            <tr>
                <td style="color:#999;font-size:0.85rem;">${user.userId}</td>
                <td style="font-weight:600;">${user.userName}</td>
                <td>${user.email}</td>
                <td>
                    <c:choose>
                        <c:when test="${user.userType=='ADMIN'}">
                            <span class="badge-admin">ADMIN</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge-regular">REGULAR</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td style="color:#666;">${user.role}</td>
                <td>
                    <form action="/admin/users/delete" method="post" style="display:inline;">
                        <input type="hidden" name="userId" value="${user.userId}">
                        <button type="submit" class="btn-del"
                                onclick="return confirm('Delete ${user.username}?')">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="text-center mt-3">
        <a href="/admin" style="color:#1a1a1a;font-weight:600;">← Back to Dashboard</a>
    </div>
</div>
</body></html>
