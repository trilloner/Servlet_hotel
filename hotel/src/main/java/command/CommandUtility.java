package command;

import model.reservation.Reservation;
import model.reservation.ReservationBuilder;
import model.room.RoomBuilder;
import model.user.User;
import model.user.UserBuilder;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.util.HashSet;

/**
 * Utility class for commands
 */
public class CommandUtility {
    static boolean checkUserIsLogged(HttpServletRequest request, String userName) {
        HashSet<String> loggedUsers = (HashSet<String>) request.getSession().getServletContext()
                .getAttribute("loggedUsers");

        if (loggedUsers.stream().anyMatch(userName::equals)) {
            return true;
        }
        loggedUsers.add(userName);
        request.getSession().getServletContext()
                .setAttribute("loggedUsers", loggedUsers);
        return false;
    }

    static void logoutUser(HttpServletRequest request, String name) {
        ((HashSet<String>) request.getSession().getServletContext().getAttribute("loggedUsers")).remove(name);
        request.getSession().removeAttribute("user");
    }

    static User buildUser(HttpServletRequest request) {
        return new UserBuilder()
                .setName(request.getParameter("username"))
                .setEmail(request.getParameter("email"))
                .setPassword(request.getParameter("password"))
                .build();
    }

    static Reservation buildReservation(HttpServletRequest request) {
        return new ReservationBuilder()
                .setNumberOfSeats(Integer.parseInt(request.getParameter("numberOfSeats")))
                .setApartments(request.getParameter("apartments"))
                .setCheckIn(LocalDate.parse(request.getParameter("checkIn")))
                .setCheckOut(LocalDate.parse(request.getParameter("checkOut")))
                .setUserByUserId((User) request.getSession().getAttribute("user"))
                .setStatus("PENDING")
                .build();
    }

    static Reservation buildAdminReservation(HttpServletRequest request) {

        return new ReservationBuilder()
                .setRoomId(new RoomBuilder().setId(Long.parseLong(request.getParameter("room_id")) + 1L).build())
                .setId(Long.parseLong(request.getParameter("id")))
                .build();
    }


    static boolean orderIsValid(HttpServletRequest request) {
        return request.getParameter("checkIn") != null
                && request.getParameter("checkOut") != null
                && request.getParameter("numberOfSeats") != null
                && request.getParameter("apartments") != null;
    }


}
