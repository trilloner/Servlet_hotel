package command;

import model.reservation.Reservation;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import service.ReservationService;
import util.Utils;

import javax.servlet.http.HttpServletRequest;

/**
 * Command class for creating new order
 */
public class CreateOrderCommand extends Command {
    private final Logger logger = LogManager.getLogger(CreateOrderCommand.class);
    private final ReservationService reservationService = new ReservationService();

    @Override
    public String execute(HttpServletRequest request) {
        logger.info("Executing create order command");
        try {
            if (CommandUtility.orderIsValid(request)) {
                Reservation reservation = CommandUtility.buildReservation(request);

                if (Utils.reservationValidation(reservation))
                    reservationService.createNewReserve(reservation);
            }
            return "redirect:/cabinet";

        } catch (Exception ex) {
            logger.error("Order cannot be created: {}", ex.getMessage());
            request.setAttribute("reservationError", ex.getMessage());
            return "/order";
        }
    }
}
