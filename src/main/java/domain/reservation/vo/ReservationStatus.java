package domain.reservation.vo;

public enum ReservationStatus {
    WAITING_FOR_ACCEPT("waiting for accept"),
    ACCEPT("accept"),
    REJECT("reject");

    private final String fieldDescription;

    ReservationStatus(String value) {
        fieldDescription = value;
    }

    public String getFieldDescription() {
        return fieldDescription;
    }
}
