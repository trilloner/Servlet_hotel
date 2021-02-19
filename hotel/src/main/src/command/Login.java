package command;

import javax.servlet.http.HttpServletRequest;

public class Login extends Command {

    @Override
    public String execute(HttpServletRequest request) {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || username.equals("") || password == null || password.equals("")) {
            return "/login.jsp";
        }
        System.out.println(username + "  " + password);

       if ( CommandUtility.checkUserIsLogged(request, username)){
           System.out.println("error");
       }


        return "/";
    }
}
