<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html><html><head>
<title>My Bookings — BikeRide</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background:#f9f9f9; font-family:'Segoe UI',sans-serif; }
    .page-hero { background:#1a1a1a; color:#fff; padding:40px 0; }
    .page-hero h1 { font-weight:800; } .page-hero span { color:#FFC200; }
    .booking-card { background:#fff; border-radius:12px; margin-bottom:16px;
        box-shadow:0 2px 10px rgba(0,0,0,0.07); padding:20px 24px; }
    .booking-header { display:flex; justify-content:space-between; align-items:center; }
    .badge-active { background:#FFC200; color:#1a1a1a; font-weight:700;
        padding:5px 14px; border-radius:20px; font-size:0.85rem; }
    .badge-cancelled { background:#f8d7da; color:#721c24; padding:5px 14px;
        border-radius:20px; font-size:0.85rem; }
    .badge-completed { background:#d4edda; color:#155724; padding:5px 14px;
        border-radius:20px; font-size:0.85rem; }
    .btn-cancel { background:#1a1a1a; color:#fff; border:none; padding:7px 18px;
        border-radius:8px; font-size:0.85rem; font-weight:600; }
    .btn-cancel:hover { background:#333; color:#fff; }
    .cost-label { color:#FFC200; font-weight:800; font-size:1.1rem; }
</style>
</head><body>
<%@ include file="navbar.jsp" %>
<div class="page-hero">
    <div class="container">
        <h1>My <span>Bookings</span></h1>
        <p style="color:#ccc;margin:0;">Track your reservations</p>
    </div>
</div>
<div class="container" style="padding:40px 0;">
    <c:if test="${empty reservations}">
        <div class="text-center py-5">
            <div style="font-size:4rem;">📋</div>
            <h4 class="mt-3">No bookings yet</h4>
            <a href="/bikes" class="btn mt-3"
               style="background:#FFC200;color:#1a1a1a;font-weight:700;padding:10px 30px;">
                Browse Bikes</a>
        </div>
    </c:if>
    <c:forEach var="r" items="${reservations}">
        <div class="booking-card">
            <div class="booking-header">
                <div>
                    <h5 style="font-weight:700;margin:0;">${r.bikeName}</h5>
                    <span style="color:#999;font-size:0.85rem;">ID: ${r.reservationId} &bull; Bike: ${r.bikeId}</span>
                </div>
                <c:choose>
                    <c:when test="${r.status=='ACTIVE'}">
                        <span class="badge-active">Active</span>
                    </c:when>
                    <c:when test="${r.status=='CANCELLED'}">
                        <span class="badge-cancelled">Cancelled</span>
                    </c:when>
                    <c:otherwise>
                        <span class="badge-completed">Completed</span>
                    </c:otherwise>
                </c:choose>
            </div>
            <hr style="margin:12px 0;">
            <div class="row">
                <div class="col-sm-3"><small class="text-muted">From</small>
                    <div class="fw-bold">${r.startDate}</div></div>
                <div class="col-sm-3"><small class="text-muted">To</small>
                    <div class="fw-bold">${r.endDate}</div></div>
                <div class="col-sm-3"><small class="text-muted">Total Cost</small>
                    <div class="cost-label">LKR ${r.totalCost}</div></div>
                <div class="col-sm-3 text-end">
                    <c:if test="${r.status=='ACTIVE'}">
                        <form action="/reservations/cancel" method="post">
                            <input type="hidden" name="reservationId" value="${r.reservationId}">
                            <input type="hidden" name="bikeId" value="${r.bikeId}">
                            <button class="btn-cancel"
                                    onclick="return confirm('Cancel this booking?')">Cancel Booking</button>
                        </form>
                    </c:if>
                </div>
            </div>
        </div>
    </c:forEach>
    <div class="text-center mt-4">
        <a href="/bikes" class="btn"
           style="background:#1a1a1a;color:#FFC200;font-weight:700;padding:10px 30px;">
            ← Browse More Bikes</a>
    </div>
</div>
<footer style="background:#1a1a1a;color:#aaa;padding:20px 0;text-align:center;">
    <p style="margin:0;">&copy; 2025 BikeRide Platform</p>
</footer>
</body></html>
