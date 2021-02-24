package command;

import model.user.User;

import javax.servlet.http.HttpServletRequest;

public class LogoutCommand extends Command {
    @Override
    public String execute(HttpServletRequest request) {
        User tempUser = (User) request.getSession().getAttribute("user");
        if (tempUser != null) {
            CommandUtility.logoutUser(request, tempUser.getName());

        }
        return "redirect:/login";
    }
}
