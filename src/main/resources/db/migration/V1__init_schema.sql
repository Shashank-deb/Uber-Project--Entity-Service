CREATE TABLE booking
(
    id             BIGINT AUTO_INCREMENT NOT NULL,
    created_at     datetime     NOT NULL,
    updated_at     datetime     NOT NULL,
    booking_status VARCHAR(255) NOT NULL,
    start_time     datetime     NOT NULL,
    end_time       datetime     NULL,
    start_point    VARCHAR(255) NULL,
    end_point      VARCHAR(255) NULL,
    total_distance BIGINT       NULL,
    driver_id      BIGINT       NULL,
    passenger_id   BIGINT       NOT NULL,
    CONSTRAINT pk_booking PRIMARY KEY (id)
);

CREATE TABLE driver
(
    id             BIGINT AUTO_INCREMENT NOT NULL,
    created_at     datetime     NOT NULL,
    updated_at     datetime     NOT NULL,
    name           VARCHAR(100) NOT NULL,
    licence_number VARCHAR(50)  NOT NULL,
    phone_number   VARCHAR(20)  NULL,
    aadhaar_number VARCHAR(20)  NULL,
    country        VARCHAR(50)  NULL,
    CONSTRAINT pk_driver PRIMARY KEY (id)
);

CREATE TABLE passenger
(
    id           BIGINT AUTO_INCREMENT NOT NULL,
    created_at   datetime     NOT NULL,
    updated_at   datetime     NOT NULL,
    name         VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20)  NOT NULL,
    email        VARCHAR(100) NOT NULL,
    password     VARCHAR(100) NOT NULL,
    CONSTRAINT pk_passenger PRIMARY KEY (id)
);

ALTER TABLE driver
    ADD CONSTRAINT uc_driver_aadhaar_number UNIQUE (aadhaar_number);

ALTER TABLE driver
    ADD CONSTRAINT uc_driver_licence_number UNIQUE (licence_number);

ALTER TABLE passenger
    ADD CONSTRAINT uc_passenger_email UNIQUE (email);

ALTER TABLE booking
    ADD CONSTRAINT FK_BOOKING_ON_DRIVER FOREIGN KEY (driver_id) REFERENCES driver (id);

ALTER TABLE booking
    ADD CONSTRAINT FK_BOOKING_ON_PASSENGER FOREIGN KEY (passenger_id) REFERENCES passenger (id);