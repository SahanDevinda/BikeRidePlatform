package com.bikeride.controller;

import com.bikeride.model.*;
import com.bikeride.service.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class ReservationController {

    @Autowired private ReservationService reservationService;
    @Autowired private BikeService bikeService;

    @GetMapping("/reserve/{bikeId}")
    public String showReserve(@PathVariable String bikeId,
                              Model model, HttpSession session) {
        User u = (User) session.getAttribute("loggedUser");
        if (u == null) return "redirect:/login";
        model.addAttribute("bike", bikeService.findById(bikeId));
        return "reserve";
    }

    @PostMapping("/reserve")
    public String doReserve(@RequestParam String bikeId,
                            @RequestParam String startDate,
                            @RequestParam String endDate,
                            HttpSession session, Model model) {
        User u = (User) session.getAttribute("loggedUser");
        if (u == null) return "redirect:/login";
        Bike bike = bikeService.findById(bikeId);
        double cost = bike.getPricePerHour() * 24;
        reservationService.create(u.getUserId(), bikeId,
                bike.getBikeName(), startDate, endDate, cost);
        bikeService.setAvailability(bikeId, false);
        return "redirect:/my-reservations";
    }

    @GetMapping("/my-reservations")
    public String myReservations(Model model, HttpSession session) {
        User u = (User) session.getAttribute("loggedUser");
        if (u == null) return "redirect:/login";
        model.addAttribute("reservations", reservationService.getByUser(u.getUserId()));
        model.addAttribute("user", u);
        return "myReservations";
    }

    @PostMapping("/reservations/cancel")
    public String cancel(@RequestParam String reservationId,
                         @RequestParam String bikeId) {
        reservationService.updateStatus(reservationId, "CANCELLED");
        bikeService.setAvailability(bikeId, true);
        return "redirect:/my-reservations";
    }

    @GetMapping("/admin/reservations")
    public String allReservations(Model model, HttpSession session) {
        User u = (User) session.getAttribute("loggedUser");
        if (u == null || !u.getUserType().equals("ADMIN")) return "redirect:/login";
        model.addAttribute("reservations", reservationService.getAll());
        return "myReservations";
    }
}

