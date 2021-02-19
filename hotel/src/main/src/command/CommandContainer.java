package command;

import java.util.Map;
import java.util.TreeMap;

public class CommandContainer {

    private static Map<String, Command> commands = new TreeMap<>();


    static {
        commands.put("/login", new Login());

        commands.put("/exception", new ExceptionCommand());
    }


    public static Command get(String commandName) {
        if (commandName == null || !commands.containsKey(commandName)) {

            return commands.get("/exception");
        }
        return commands.get(commandName);
    }


}
