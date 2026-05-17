# Bike Management Module

This extracted project contains the Bike Management part of the Bike Ride Platform.

## Main Responsibility

The bike module allows admins to add, view, edit, and delete bikes. It also allows users to view available bikes.

## Main Files

- `src/main/java/com/bikeride/model/Bike.java`
- `src/main/java/com/bikeride/model/CityBike.java`
- `src/main/java/com/bikeride/model/MountainBike.java`
- `src/main/java/com/bikeride/service/BikeService.java`
- `src/main/java/com/bikeride/controller/BikeController.java`
- `src/main/webapp/WEB-INF/views/bikeList.jsp`
- `src/main/webapp/WEB-INF/views/bikeRegister.jsp`

## OOP Concepts

- Encapsulation: bike fields are private and accessed through getters and setters.
- Abstraction: `Bike` is an abstract class.
- Inheritance: `CityBike` and `MountainBike` extend `Bike`.
- Polymorphism: each bike type implements `getBikeDescription()` differently.

## Suggested Branch

```bash
git checkout -b feature/bike-management
git add .
git commit -m "Add bike management module"
git push origin feature/bike-management
```
