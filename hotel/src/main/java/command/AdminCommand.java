package command;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import service.ReservationService;
import service.RoomService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Admin command class
 */
public class AdminCommand extends Command {
    static final Logger logger = LogManager.getLogger(AdminCommand.class);

    private final RoomService roomService = new RoomService();
    private final ReservationService reservationService = new ReservationService();

    @Override
    public String execute(HttpServletRequest request) {
        logger.info("Executing admin command");
        request.setAttribute("allRooms", roomService.findAllRooms());
        request.setAttribute("allReservations", reservationService.findAllReservations());

        return "admin.jsp";
    }
}
