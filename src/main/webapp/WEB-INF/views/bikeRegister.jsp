<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html><html><head>
<title>Add Bike — BikeRide Admin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background:#f5f5f5; font-family:'Segoe UI',sans-serif; }
    .form-card { max-width:560px; margin:60px auto; background:#fff;
        border-radius:16px; box-shadow:0 4px 24px rgba(0,0,0,0.10); overflow:hidden; }
    .form-header { background:#1a1a1a; padding:24px 30px; }
    .form-header h4 { color:#FFC200; font-weight:800; margin:0; }
    .form-header p { color:#aaa; margin:4px 0 0; font-size:0.9rem; }
    .form-body { padding:36px; }
    .form-label { font-weight:600; }
    .form-control:focus, .form-select:focus { border-color:#FFC200;
        box-shadow:0 0 0 3px rgba(255,194,0,0.2); }
    .btn-main { background:#FFC200; color:#1a1a1a; font-weight:700;
        border:none; width:100%; padding:12px; border-radius:8px; }
    .btn-main:hover { background:#e6ae00; color:#1a1a1a; }
</style>
</head><body>
<%@ include file="navbar.jsp" %>
<div class="form-card">
    <div class="form-header">
        <h4>🚲 Register New Bike</h4>
        <p>Add a new bike to the fleet</p>
    </div>
    <div class="form-body">
        <c:if test="${not empty message}">
            <div class="alert alert-success py-2">${message}</div>
        </c:if>
        <form action="/admin/bikes/add" method="post">
            <div class="mb-3">
                <label class="form-label">Bike Name</label>
                <input type="text" name="name" class="form-control" required placeholder="e.g. Trek FX3">
            </div>
            <div class="mb-3">
                <label class="form-label">Brand</label>
                <input type="text" name="brand" class="form-control" required placeholder="e.g. Trek, Giant, Hero">
            </div>
            <div class="mb-3">
                <label class="form-label">Price per Hour (LKR)</label>
                <input type="number" name="price" class="form-control" required min="1" placeholder="e.g. 500">
            </div>
            <div class="mb-4">
                <label class="form-label">Bike Type</label>
                <select name="type" class="form-select">
                    <option value="CITY">🚲 City Bike</option>
                    <option value="MOUNTAIN">🏔️ Mountain Bike</option>
                </select>
            </div>
            <button type="submit" class="btn-main">Add Bike to Fleet</button>
        </form>
        <div class="text-center mt-3">
            <a href="/bikes" style="color:#1a1a1a;font-weight:600;">← Back to Bikes</a>
        </div>
    </div>
</div>
</body></html>
