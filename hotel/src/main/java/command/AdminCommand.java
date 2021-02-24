package command;

import service.ReservationService;
import service.RoomService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class AdminCommand extends Command {

    private final RoomService roomService = new RoomService();
    private final ReservationService reservationService = new ReservationService();

    @Override
    public String execute(HttpServletRequest request) {
        HttpSession session = request.getSession();
        request.setAttribute("allRooms", roomService.findAllRooms());
        request.setAttribute("allReservations", reservationService.findAllReservations());

        return "admin.jsp";
    }
}
