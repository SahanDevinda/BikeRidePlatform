<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html><html><head>
<title>BikeRide — Ride the City</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { font-family: 'Segoe UI', sans-serif; margin:0; }
    .hero { background:#1a1a1a; color:#fff; padding:100px 0; }
    .hero h1 { font-size:3rem; font-weight:900; }
    .hero h1 span { color:#FFC200; }
    .btn-yellow { background:#FFC200; color:#1a1a1a; font-weight:700;
        border:none; padding:12px 32px; border-radius:8px; font-size:1rem; }
    .btn-yellow:hover { background:#e6ae00; color:#1a1a1a; }
    .feature-card { border:none; border-radius:12px; padding:30px;
        box-shadow:0 2px 16px rgba(0,0,0,0.08); text-align:center; }
    .feature-icon { font-size:2.5rem; margin-bottom:15px; }
    .section-title { font-weight:800; font-size:2rem; }
    .section-title span { color:#FFC200; }
</style>
</head><body>
<%@ include file="navbar.jsp" %>

<!-- HERO SECTION -->
<section class="hero">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6">
                <h1>Ride the City<br>with <span>BikeRide</span></h1>
                <p class="lead mt-3" style="color:#ccc;">
                    Sri Lanka's easiest bike reservation platform.
                    Find, book and ride in minutes.
                </p>
                <div class="d-flex gap-3 mt-4">
                    <a href="/register" class="btn btn-yellow">Get Started</a>
                    <a href="/login" class="btn btn-outline-light" style="padding:12px 32px;">Login</a>
                </div>
            </div>
            <div class="col-lg-6 text-center mt-5 mt-lg-0">
                <div style="font-size:10rem;">🚲</div>
            </div>
        </div>
    </div>
</section>

<!-- FEATURES SECTION -->
<section style="padding:80px 0; background:#fff;">
    <div class="container">
        <h2 class="section-title text-center mb-5">Why <span>BikeRide?</span></h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="feature-card">
                    <div class="feature-icon">🗺️</div>
                    <h5 style="font-weight:700;">Easy Booking</h5>
                    <p class="text-muted">Pick a bike, choose your dates, and confirm in seconds.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-card">
                    <div class="feature-icon">🏔️</div>
                    <h5 style="font-weight:700;">City & Mountain Bikes</h5>
                    <p class="text-muted">Choose from city bikes for roads or mountain bikes for trails.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-card">
                    <div class="feature-icon">💛</div>
                    <h5 style="font-weight:700;">Affordable Rates</h5>
                    <p class="text-muted">Transparent hourly pricing, no hidden fees.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- FOOTER -->
<footer style="background:#1a1a1a; color:#aaa; padding:30px 0; text-align:center;">
    <p style="margin:0;">&copy; 2025 BikeRide Platform — SE1020 OOP Project</p>
</footer>
</body></html>
