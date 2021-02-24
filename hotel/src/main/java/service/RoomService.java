package service;

import dao.FactoryDao;
import dao.RoomDao;
import model.dto.RoomDto;
import model.room.Room;

import java.util.List;

public class RoomService {

    private FactoryDao factoryDao = FactoryDao.getInstance();


    public List<Room> findAllRooms() {
        try (RoomDao roomDao = factoryDao.createRoomDao()) {
            return roomDao.findAll();
        }
    }

    public RoomDto findPaginated(int page, int pageSize, String field) {
        try (RoomDao roomDao = factoryDao.createRoomDao()) {
            return roomDao.findPaginatedRooms(page, pageSize, field);
        }
    }
}
