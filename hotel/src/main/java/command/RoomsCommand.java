package command;

import model.dto.RoomDto;
import service.RoomService;

import javax.servlet.http.HttpServletRequest;
import java.util.Optional;

public class RoomsCommand extends Command {
    private final RoomService roomService = new RoomService();
    private final int PAGE_SIZE = 3;

    @Override
    public String execute(HttpServletRequest request) {
        String pageParam = Optional.ofNullable(request.getParameter("page")).orElse("1");
        String fieldParam = Optional.ofNullable(request.getParameter("field")).orElse("id");

        int page = Integer.parseInt(pageParam);

        RoomDto roomDto = roomService.findPaginated(page, PAGE_SIZE, fieldParam);

        int maxPage = (int) Math.ceil((double) roomDto.getNumberOfRooms() / PAGE_SIZE);

        request.getSession().setAttribute("rooms", roomDto.getListOfPagination());
        request.setAttribute("page", page);
        request.setAttribute("pageSize", PAGE_SIZE);
        request.setAttribute("field", fieldParam);

        request.setAttribute("maxPage", maxPage);

        return "/rooms.jsp";
    }
}
