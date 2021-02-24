package command;

import model.reservation.Reservation;
import service.ReservationService;

import javax.servlet.http.HttpServletRequest;

public class UpdateCommand extends Command {

    private final ReservationService reservationService = new ReservationService();

    @Override
    public String execute(HttpServletRequest request) {

        try {
            Reservation reservation = CommandUtility.buildAdminReservation(request);
            reservationService.updateReservation(reservation);
        } catch (Exception ex) {

        }

        return "redirect:/admin";
    }
}
