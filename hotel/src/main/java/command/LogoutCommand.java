package command;

import model.user.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.HttpServletRequest;

/**
 * Logout command class
 */
public class LogoutCommand extends Command {
    static final Logger logger = LogManager.getLogger(LoginCommand.class);

    @Override
    public String execute(HttpServletRequest request) {
        logger.info("Executing logout command");
        User tempUser = (User) request.getSession().getAttribute("user");
        if (tempUser != null) {
            CommandUtility.logoutUser(request, tempUser.getName());
            logger.info("User logout");
        }
        return "redirect:/login";
    }
}
