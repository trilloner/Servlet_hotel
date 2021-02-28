package util;

import model.reservation.Reservation;
import model.user.User;

import java.time.LocalDate;

/**
 * Util class for data validation
 */
public class Utils {

    public static boolean registrationValidation(User user) throws Exception {
        if (user.getName().length() < 5) {
            throw new Exception("Username roo short");
        }
        if (user.getPassword().length() < 8) {
            throw new Exception("Password too short");
        }
        if (!user.getEmail().matches("[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-zA-Z0-9]+")) {
            throw new Exception("Email is not correct");
        }
        return true;
    }

    public static boolean reservationValidation(Reservation reservation) throws Exception {
        LocalDate today = LocalDate.now();
        if (reservation.getCheckIn().isBefore(today))
            throw new Exception("Must be future or present date");

        if (!reservation.getCheckOut().isAfter(today))
            throw new Exception("Must be future date");

        if (reservation.getNumberOfSeats() <= 0)
            throw new Exception("Number of seats must be more than 0");

        return true;
    }

}
