package command;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.HttpServletRequest;

/**
 * Reservation command class
 */
public class ReservationCommand extends Command {
    private final Logger logger = LogManager.getLogger(ReservationCommand.class);

    @Override
    public String execute(HttpServletRequest request) {
        logger.info("Executing reservation command");
        return "/order.jsp";
    }
}
