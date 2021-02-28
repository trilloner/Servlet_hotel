package command;

import model.reservation.Reservation;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import service.ReservationService;

import javax.servlet.http.HttpServletRequest;

/**
 * Update command class for updating info about reservation
 */
public class UpdateCommand extends Command {
    static final Logger logger = LogManager.getLogger(LoginCommand.class);

    private final ReservationService reservationService = new ReservationService();

    @Override
    public String execute(HttpServletRequest request) {
        logger.info("Executing update command");
        try {
            Reservation reservation = CommandUtility.buildAdminReservation(request);
            reservationService.updateReservation(reservation);
        } catch (Exception ex) {
            logger.error("Reservation can`t be updated:{}", ex.getMessage());
        }

        return "redirect:/admin";
    }
}
