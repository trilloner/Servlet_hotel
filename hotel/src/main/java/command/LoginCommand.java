package command;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Login command class
 */
public class LoginCommand extends Command {
    static final Logger logger = LogManager.getLogger(LoginCommand.class);
    private final UserService userService = new UserService();

    @Override
    public String execute(HttpServletRequest request) {
        logger.info("Executing login command");
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            CommandUtility.logoutUser(request, username);
            if (username == null || password == null || CommandUtility.checkUserIsLogged(request, username)) {
                return "/login.jsp";
            }
            HttpSession session = request.getSession();
            session.setAttribute("user", userService.loginUser(username, password));
            logger.info("Current user: " + session.getAttribute("user"));

            return "redirect:/";
        } catch (Exception e) {
            request.getSession().setAttribute("errorMessage", e.getMessage());
            logger.error("Cannot create user {}", e.getMessage());

            return "/login.jsp";
        }
    }
}
