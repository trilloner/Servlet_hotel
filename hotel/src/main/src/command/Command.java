package command;

import javax.servlet.http.HttpServletRequest;

public abstract class Command {

    abstract void execute(HttpServletRequest request);
}
