<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="navbar-brand d-flex align-items-center gap-2">
    <a href="${pageContext.request.contextPath}/" style="text-decoration: none;">
        <span style="background:#FFC200;color:#1a1a1a;font-weight:900;padding:4px 10px;border-radius:6px;font-size:1.1rem;">BikeRide</span>
    </a>
</div>
<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
    <span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ms-auto">
        <c:if test="${not empty sessionScope.loggedUser}">
            <li class="nav-item">
                <span class="nav-link text-white" style="font-size:0.9rem;">
                    Hello, ${sessionScope.loggedUser.userName}
                </span>
            </li>
            <c:if test="${sessionScope.loggedUser.role == 'ADMIN'}">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-sm ms-2" style="background:#FFC200;color:#1a1a1a;font-weight:600;">Admin</a>
                </li>
            </c:if>
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/bikes" class="btn btn-sm btn-outline-light ms-2">Bikes</a>
            </li>
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/my_reservations" class="btn btn-sm btn-outline-light ms-2">My Bookings</a>
            </li>
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/profile/update" class="btn btn-sm btn-outline-light ms-2">Profile</a>
            </li>
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-sm btn-outline-danger ms-2">Logout</a>
            </li>
        </c:if>
        <c:if test="${empty sessionScope.loggedUser}">
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/login" class="btn btn-sm btn-outline-light ms-2">Login</a>
            </li>
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/register" class="btn btn-sm ms-2" style="background:#FFC200;color:#1a1a1a;font-weight:600;">Register</a>
            </li>
        </c:if>
    </ul>
</div>