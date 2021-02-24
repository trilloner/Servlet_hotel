package model.dto;

import model.room.Room;
import model.user.User;

import java.time.LocalDate;

public class ReservationDto {
    private Long id;

    private Integer numberOfSeats;

    private String apartments;

    private LocalDate checkIn;

    private LocalDate checkOut;

    private User userByUserId;

    private String status;

    private Room roomId;

    private String roomName;

    private String userEmail;
}
