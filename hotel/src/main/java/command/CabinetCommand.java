package command;

import model.reservation.Reservation;
import model.user.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import service.ReservationService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Cabinet command class
 */
public class CabinetCommand extends Command {
    static final Logger logger = LogManager.getLogger(CabinetCommand.class);

    private final ReservationService reservationService = new ReservationService();

    @Override
    public String execute(HttpServletRequest request) {
        logger.info("Executing cabinet command");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        List<Reservation> reservationList = reservationService.findAllReservationByUser(user.getId());
        session.setAttribute("reservations", reservationList);
        return "/cabinet.jsp";
    }
}
