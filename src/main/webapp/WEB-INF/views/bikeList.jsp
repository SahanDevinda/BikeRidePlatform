<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html><html><head>
<title>Bikes — BikeRide</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background:#f9f9f9; font-family:'Segoe UI',sans-serif; }
    .page-hero { background:#1a1a1a; color:#fff; padding:50px 0; }
    .page-hero h1 { font-weight:800; } .page-hero span { color:#FFC200; }
    .bike-card { background:#fff; border-radius:12px;
        box-shadow:0 2px 12px rgba(0,0,0,0.08); overflow:hidden;
        transition:transform 0.2s; border:none; }
    .bike-card:hover { transform:translateY(-4px); }
    .bike-card-header { background:#1a1a1a; color:#fff; padding:20px; text-align:center; font-size:3rem; }
    .bike-card-body { padding:20px; }
    .price-badge { background:#FFC200; color:#1a1a1a; font-weight:700;
        padding:4px 12px; border-radius:20px; font-size:0.85rem; }
    .btn-book { background:#FFC200; color:#1a1a1a; font-weight:700;
        border:none; width:100%; padding:10px; border-radius:8px; }
    .btn-book:hover { background:#e6ae00; color:#1a1a1a; }
    .badge-available { background:#d4edda; color:#155724; }
    .badge-unavailable { background:#f8d7da; color:#721c24; }
</style>
</head><body>
<%@ include file="navbar.jsp" %>
<div class="page-hero">
    <div class="container">
        <h1>Find Your <span>Perfect Bike</span></h1>
        <p style="color:#ccc;margin:0;">Browse our fleet and book instantly</p>
    </div>
</div>
<div class="container" style="padding:50px 0;">
    <c:if test="${empty bikes}">
        <div class="text-center py-5">
            <div style="font-size:4rem;">🚲</div>
            <h4 class="mt-3">No bikes available yet</h4>
            <c:if test="${user.userType == 'ADMIN'}">
                <a href="/admin/bikes/add" class="btn btn-book mt-3" style="width:auto;padding:10px 30px;">Add First Bike</a>
            </c:if>
        </div>
    </c:if>
    <div class="row g-4">
        <c:forEach var="bike" items="${bikes}">
            <div class="col-md-4 col-sm-6">
                <div class="bike-card">
                    <div class="bike-card-header">
                        <c:choose>
                            <c:when test="${bike.bikeType == 'MOUNTAIN'}">🏔️</c:when>
                            <c:otherwise>🚲</c:otherwise>
                        </c:choose>
                    </div>
                    <div class="bike-card-body">
                        <div class="d-flex justify-content-between align-items-start mb-2">
                            <h5 style="font-weight:700;margin:0;">${bike.bikeName}</h5>
                            <span class="price-badge">LKR ${bike.pricePerHour}/hr</span>
                        </div>
                        <p class="text-muted mb-1" style="font-size:0.9rem;">
                            <strong>${bike.brand}</strong> &bull; ${bike.bikeType}</p>
                        <p class="text-muted mb-3" style="font-size:0.85rem;">${bike.bikeDescription}</p>
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <c:choose>
                                <c:when test="${bike.available}">
                                    <span class="badge badge-available px-3 py-2">Available</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge badge-unavailable px-3 py-2">Booked</span>
                                </c:otherwise>
                            </c:choose>
                            <span class="text-muted" style="font-size:0.85rem;">ID: ${bike.bikeId}</span>
                        </div>
                        <c:choose>
                            <c:when test="${bike.available and user.userType != 'ADMIN'}">
                                <a href="/reserve/${bike.bikeId}" class="btn btn-book">Book Now</a>
                            </c:when>
                            <c:when test="${user.userType == 'ADMIN'}">
                                <form action="/admin/bikes/delete" method="post">
                                    <input type="hidden" name="bikeId" value="${bike.bikeId}">
                                    <button class="btn btn-book" style="background:#1a1a1a;color:#fff;"
                                            onclick="return confirm('Delete this bike?')">Delete Bike</button>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <button class="btn btn-book" disabled
                                        style="background:#ddd;color:#999;">Not Available</button>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<footer style="background:#1a1a1a;color:#aaa;padding:20px 0;text-align:center;">
    <p style="margin:0;">&copy; 2025 BikeRide Platform</p>
</footer>
</body></html>
