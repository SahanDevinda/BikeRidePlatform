<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html><html><head>
<title>Book Bike — BikeRide</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background:#f5f5f5; font-family:'Segoe UI',sans-serif; }
    .book-card { max-width:560px; margin:60px auto; background:#fff;
        border-radius:16px; box-shadow:0 4px 24px rgba(0,0,0,0.1); overflow:hidden; }
    .book-header { background:#1a1a1a; padding:30px; text-align:center; }
    .book-header h3 { color:#FFC200; font-weight:800; margin:0; }
    .book-header p { color:#ccc; margin:6px 0 0; }
    .book-body { padding:36px; }
    .info-row { display:flex; justify-content:space-between;
        padding:10px 0; border-bottom:1px solid #f0f0f0; }
    .info-label { color:#777; font-size:0.9rem; }
    .info-value { font-weight:700; }
    .price-big { font-size:1.5rem; font-weight:900; color:#FFC200; }
    .form-control:focus { border-color:#FFC200; box-shadow:0 0 0 3px rgba(255,194,0,0.2); }
    .btn-book { background:#FFC200; color:#1a1a1a; font-weight:700;
        border:none; width:100%; padding:14px; border-radius:8px; font-size:1rem; }
    .btn-book:hover { background:#e6ae00; color:#1a1a1a; }
</style>
</head><body>
<%@ include file="navbar.jsp" %>
<div class="book-card">
    <div class="book-header">
        <div style="font-size:3rem;">
            <c:choose><c:when test="${bike.bikeType=='MOUNTAIN'}">🏔️</c:when>
                <c:otherwise>🚲</c:otherwise></c:choose>
        </div>
        <h3>${bike.bikeName}</h3>
        <p>${bike.bikeDescription}</p>
    </div>
    <div class="book-body">
        <div class="info-row">
            <span class="info-label">Brand</span>
            <span class="info-value">${bike.brand}</span>
        </div>
        <div class="info-row">
            <span class="info-label">Type</span>
            <span class="info-value">${bike.bikeType}</span>
        </div>
        <div class="info-row mb-4">
            <span class="info-label">Rate</span>
            <span class="price-big">LKR ${bike.pricePerHour}/hr</span>
        </div>
        <form action="/reserve" method="post">
            <input type="hidden" name="bikeId" value="${bike.bikeId}">
            <div class="mb-3">
                <label class="form-label fw-bold">Start Date</label>
                <input type="date" name="startDate" class="form-control" required>
            </div>
            <div class="mb-4">
                <label class="form-label fw-bold">End Date</label>
                <input type="date" name="endDate" class="form-control" required>
            </div>
            <button type="submit" class="btn-book">Confirm Booking 🚲</button>
        </form>
        <div class="text-center mt-3">
            <a href="/bikes" style="color:#1a1a1a;font-weight:600;">← Back to Bikes</a>
        </div>
    </div>
</div>
</body></html>
