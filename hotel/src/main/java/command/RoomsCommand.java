package command;

import model.dto.RoomDto;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import service.RoomService;

import javax.servlet.http.HttpServletRequest;
import java.util.Optional;

/**
 * Rooms command class for room pagination
 */
public class RoomsCommand extends Command {
    static final Logger logger = LogManager.getLogger(RoomsCommand.class);

    private final RoomService roomService = new RoomService();
    private final int PAGE_SIZE = 3;

    @Override
    public String execute(HttpServletRequest request) {
        logger.info("Executing rooms command");

        String pageParam = Optional.ofNullable(request.getParameter("page")).orElse("1");
        String fieldParam = Optional.ofNullable(request.getParameter("field")).orElse("id");
        String direction = Optional.ofNullable(request.getParameter("direction")).orElse("asc");

        int page = Integer.parseInt(pageParam);

        RoomDto roomDto = roomService.findPaginated(page, PAGE_SIZE, fieldParam, direction);

        int maxPage = (int) Math.ceil((double) roomDto.getNumberOfRooms() / PAGE_SIZE);

        request.getSession().setAttribute("rooms", roomDto.getListOfPagination());
        request.setAttribute("page", page);
        request.setAttribute("pageSize", PAGE_SIZE);
        request.setAttribute("field", fieldParam);
        request.setAttribute("direction", direction);
        request.setAttribute("maxPage", maxPage);

        return "/rooms.jsp";
    }
}
