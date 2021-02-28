import model.user.User;
import model.user.UserBuilder;
import org.junit.Test;
import org.mockito.Mockito;
import service.UserService;

import static org.mockito.Mockito.*;

public class UserServiceTest {
    
    private final UserService userService = Mockito.mock(UserService.class);

    @Test
    public void givenUsedEmail() {
        User user = new UserBuilder().setId(1L).setName("Alex").setPassword("1").setEmail("12@gmail.com").build();
        when(userService.loginUser(anyString(), anyString())).thenReturn(user);
        userService.loginUser("name", "pass");
        verify(userService, times(1)).loginUser(anyString(), anyString());
    }


    @Test
    public void registerNewUser() throws Exception {
        User user = new UserBuilder().setId(1L).setName("Alex").setPassword("1").setEmail("12@gmail.com").build();
        when(userService.registerNewUser(user)).thenReturn(user);
        userService.registerNewUser(user);
        verify(userService, times(1)).registerNewUser(user);
    }
}
