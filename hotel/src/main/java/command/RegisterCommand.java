package command;

import model.user.User;
import model.user.UserBuilder;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import service.UserService;
import util.Utils;

import javax.servlet.http.HttpServletRequest;

/**
 * Registration command class for registration new user
 */
public class RegisterCommand extends Command {
    private final Logger logger = LogManager.getLogger(RegisterCommand.class);
    private final UserService userService = new UserService();

    @Override
    public String execute(HttpServletRequest request) {
        logger.info("Executing register command");
        try {
            if (request.getParameter("username") == null) {
                return "/registration.jsp";
            }
            User user = CommandUtility.buildUser(request);
            Utils.registrationValidation(user);
            request.getSession().setAttribute("user", userService.registerNewUser(user));
        } catch (Exception e) {
            request.getSession().setAttribute("errorRegister", e.getMessage());
            logger.warn("Registration failed: {}", e.getMessage());
            return "/registration.jsp";

        }

        return "redirect:/login";
    }
}
