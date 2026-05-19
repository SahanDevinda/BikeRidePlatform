<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - BikeRide Platform</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .stats-card {
            border-radius: 10px;
            padding: 20px;
            color: white;
            margin-bottom: 20px;
            transition: transform 0.3s;
        }
        .stats-card:hover {
            transform: translateY(-5px);
        }
        .stats-card h3 {
            font-size: 2rem;
            margin: 10px 0;
        }
        .bg-primary-gradient {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .bg-success-gradient {
            background: linear-gradient(135deg, #84fab0 0%, #8fd3f4 100%);
        }
        .bg-warning-gradient {
            background: linear-gradient(135deg, #f6d365 0%, #fda085 100%);
        }
        .bg-info-gradient {
            background: linear-gradient(135deg, #a1c4fd 0%, #c2e9fb 100%);
        }
        .action-card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .action-card .card-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 10px 10px 0 0;
            padding: 15px;
        }
        .btn-custom {
            margin: 5px;
            padding: 10px 20px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <jsp:include page="navbar.jsp" />
    </div>
</nav>

<div class="container mt-4">
    <div class="row mb-4">
        <div class="col-12">
            <h1 class="display-5">Admin Dashboard</h1>
            <p class="lead">Welcome back, ${sessionScope.loggedUser.name}!</p>
            <hr>
        </div>
    </div>

    <!-- Statistics Cards -->
    <div class="row mb-4">
        <div class="col-md-3">
            <div class="stats-card bg-primary-gradient">
                <div class="d-flex justify-content-between align-items-center">
                    <h6>Total Users</h6>
                    <i class="bi bi-people-fill" style="font-size: 24px;"></i>
                </div>
                <h3>${totalUsers != null ? totalUsers : 0}</h3>
                <small>Registered Members</small>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stats-card bg-success-gradient">
                <div class="d-flex justify-content-between align-items-center">
                    <h6>Total Bikes</h6>
                    <i class="bi bi-bicycle" style="font-size: 24px;"></i>
                </div>
                <h3>${totalBikes != null ? totalBikes : 0}</h3>
                <small>Available Bikes</small>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stats-card bg-warning-gradient">
                <div class="d-flex justify-content-between align-items-center">
                    <h6>Active Reservations</h6>
                    <i class="bi bi-calendar-check" style="font-size: 24px;"></i>
                </div>
                <h3>${activeReservations != null ? activeReservations : 0}</h3>
                <small>Current Bookings</small>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stats-card bg-info-gradient">
                <div class="d-flex justify-content-between align-items-center">
                    <h6>Total Revenue</h6>
                    <i class="bi bi-currency-dollar" style="font-size: 24px;"></i>
                </div>
                <h3>$${totalRevenue != null ? totalRevenue : 0}</h3>
                <small>Lifetime Revenue</small>
            </div>
        </div>
    </div>

    <!-- Admin Actions -->
    <div class="row">
        <div class="col-md-6">
            <div class="card action-card">
                <div class="card-header">
                    <h4 class="mb-0">User Management</h4>
                </div>
                <div class="card-body">
                    <p>Manage all registered users, view profiles, and control access.</p>
                    <div class="mt-3">
                        <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-primary btn-custom">
                            <i class="bi bi-people"></i> View All Users
                        </a>
                        <a href="${pageContext.request.contextPath}/admin/users/add" class="btn btn-success btn-custom">
                            <i class="bi bi-person-plus"></i> Add New User
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card action-card">
                <div class="card-header">
                    <h4 class="mb-0">Bike Management</h4>
                </div>
                <div class="card-body">
                    <p>Add, edit, or remove bikes from the inventory system.</p>
                    <div class="mt-3">
                        <a href="${pageContext.request.contextPath}/admin/bikes" class="btn btn-primary btn-custom">
                            <i class="bi bi-bicycle"></i> View All Bikes
                        </a>
                        <a href="${pageContext.request.contextPath}/admin/bikes/add" class="btn btn-success btn-custom">
                            <i class="bi bi-plus-circle"></i> Add New Bike
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Recent Activities -->
    <div class="row mt-4">
        <div class="col-md-12">
            <div class="card action-card">
                <div class="card-header">
                    <h4 class="mb-0">Recent Activities</h4>
                </div>
                <div class="card-body">
                    <c:if test="${not empty recentActivities}">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Activity</th>
                                    <th>User</th>
                                    <th>Date</th>
                                    <th>Status</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${recentActivities}" var="activity">
                                    <tr>
                                        <td>${activity.description}</td>
                                        <td>${activity.userName}</td>
                                        <td>${activity.date}</td>
                                        <td>
                                            <span class="badge bg-success">Completed</span>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                    <c:if test="${empty recentActivities}">
                        <p class="text-muted text-center">No recent activities to display.</p>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>