package dao;

import model.dto.RoomDto;
import model.room.Room;

public interface RoomDao extends GenericDao<Room> {
    RoomDto findPaginatedRooms(int page, int sizeOfPage, String field, String direction);
}
