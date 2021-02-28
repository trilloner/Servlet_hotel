package command;

import javax.servlet.http.HttpServletRequest;

/**
 * Command pattern for converting requests to the objects.
 */
public abstract class Command {

    public abstract String execute(HttpServletRequest request);
}
