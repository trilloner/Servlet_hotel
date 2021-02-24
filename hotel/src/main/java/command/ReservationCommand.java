package command;

import javax.servlet.http.HttpServletRequest;

public class ReservationCommand extends Command{
    @Override
    public String execute(HttpServletRequest request) {
        return "redirect:/order.jsp";
    }
}
