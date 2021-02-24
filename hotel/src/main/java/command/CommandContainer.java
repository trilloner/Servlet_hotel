package command;

import java.util.Map;
import java.util.TreeMap;

public class CommandContainer {

    private static final Map<String, Command> commands = new TreeMap<>();


    static {
        commands.put("/login", new LoginCommand());

        commands.put("/exception", new ExceptionCommand());

        commands.put("/registration", new RegisterCommand());

        commands.put("/cabinet", new CabinetCommand());

        commands.put("/order", new ReservationCommand());

        commands.put("/order/create", new CreateOrderCommand());

        commands.put("/rooms", new RoomsCommand());

        commands.put("/logout", new LogoutCommand());

        commands.put("/admin", new AdminCommand());

        commands.put("/admin/update", new UpdateCommand());
    }


    public static Command get(String commandName) {
        if (commandName == null || !commands.containsKey(commandName)) {

            return commands.get("/exception");
        }
        return commands.get(commandName);
    }


}
