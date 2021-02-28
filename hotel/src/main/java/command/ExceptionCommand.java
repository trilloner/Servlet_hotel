package command;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.HttpServletRequest;

/**
 * Exception command class
 */
public class ExceptionCommand extends Command {
    private final Logger logger = LogManager.getLogger(ExceptionCommand.class);

    @Override
    public String execute(HttpServletRequest request) {
        logger.info("Executing exception command");
        return "error.jsp";
    }
}
