package servlet;

import command.CommandContainer;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashSet;

public class Servlet extends HttpServlet {

    @Override
    public void init(ServletConfig config) {
        config.getServletContext().setAttribute("loggedUsers", new HashSet<>());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        process(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        process(req, resp);
    }

    private void process(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        String commandName = req.getRequestURI();

        String command = CommandContainer.get(commandName).execute(req);


        if (command.contains("redirect:")) {
            resp.sendRedirect(command.replace("redirect:/", "/hotel/"));
        } else {
            req.getRequestDispatcher(command).forward(req, resp);
        }


    }

}
