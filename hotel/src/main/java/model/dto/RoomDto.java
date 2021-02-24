package model.dto;

import model.room.Room;

import java.util.List;

public class RoomDto {
    private List<Room> listOfPagination;
    private int numberOfRooms;

    public List<Room> getListOfPagination() {
        return listOfPagination;
    }

    public void setListOfPagination(List<Room> listOfPagination) {
        this.listOfPagination = listOfPagination;
    }

    public int getNumberOfRooms() {
        return numberOfRooms;
    }

    public void setNumberOfRooms(int numberOfRooms) {
        this.numberOfRooms = numberOfRooms;
    }
}
