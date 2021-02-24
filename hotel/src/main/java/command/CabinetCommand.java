package command;

import model.reservation.Reservation;
import model.user.User;
import service.ReservationService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public class CabinetCommand extends Command {

    private final ReservationService reservationService = new ReservationService();

    @Override
    public String execute(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        List<Reservation> reservationList = reservationService.findAllReservationByUser(user.getId());
        System.out.println(reservationList);
        session.setAttribute("reservations", reservationList);
        return "/cabinet.jsp";
    }
}
