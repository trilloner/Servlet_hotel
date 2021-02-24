package command;

import javax.servlet.http.HttpServletRequest;

public class ExceptionCommand extends Command {
    @Override
    public String execute(HttpServletRequest request) {
        throw new RuntimeException("Generation exception");
    }
}
