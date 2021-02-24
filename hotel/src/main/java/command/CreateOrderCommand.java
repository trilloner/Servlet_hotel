package command;

import model.reservation.Reservation;
import service.ReservationService;

import javax.servlet.http.HttpServletRequest;

public class CreateOrderCommand extends Command {

    private final ReservationService reservationService = new ReservationService();

    @Override
    public String execute(HttpServletRequest request) {
        try {

            if (CommandUtility.orderIsValid(request)) {
                Reservation reservation = CommandUtility.buildReservation(request);
                //TODO validation
                reservationService.createNewReserve(reservation);
                return "/order";
            }
            return "/order";


        } catch (Exception ex) {

        }


        return null;
    }
}
