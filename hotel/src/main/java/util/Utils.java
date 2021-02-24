package util;

import model.user.User;

public class Utils {

    public static boolean registrationValidation(User user) throws Exception {
        if (user.getName().length() < 5) {
            throw new Exception("Username roo short");
        }
        if (user.getPassword().length() < 8) {
            throw new Exception("Password too short");
        }
        if (!user.getEmail().matches("[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-zA-Z0-9]+")) {
            throw new Exception("Email is not correct");
        }
        return true;
    }
}
