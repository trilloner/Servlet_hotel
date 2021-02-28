package dao.mapper;

import model.reservation.Reservation;
import model.reservation.ReservationBuilder;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Reservation Mapper to convert reservation from result set
 */
public class ReservationMapper {

    public Reservation getReservationFromResultSet(ResultSet set) throws SQLException {

        return new ReservationBuilder()
                .setId(set.getLong("id"))
                .setNumberOfSeats(set.getInt("number_of_seats"))
                .setStatus(set.getString("status"))
                .setApartments(set.getString("apartments"))
                .setCheckIn(set.getDate("check_in").toLocalDate())
                .setCheckOut(set.getDate("check_out").toLocalDate())
                .build();
    }


}
