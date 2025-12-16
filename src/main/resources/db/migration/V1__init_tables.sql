-- V1__init_schema.sql

-- Create base tables with common fields
CREATE TABLE IF NOT EXISTS driver (
                                      id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                      created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                      updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                      name VARCHAR(255),
                                      licence_number VARCHAR(255) NOT NULL UNIQUE,
                                      phone_number VARCHAR(20),
                                      aadhaar_number VARCHAR(12),
                                      INDEX idx_licence_number (licence_number)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS passenger (
                                         id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                         created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                         updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                         name VARCHAR(255),
                                         phone_number VARCHAR(20),
                                         email VARCHAR(255),
                                         password VARCHAR(255),
                                         INDEX idx_email (email),
                                         INDEX idx_phone_number (phone_number)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS booking (
                                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                       created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                       updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                       booking_status VARCHAR(50) NOT NULL,
                                       start_time TIMESTAMP NULL,
                                       end_time TIMESTAMP NULL,
                                       total_distance BIGINT,
                                       driver_id BIGINT,
                                       passenger_id BIGINT,
                                       INDEX idx_booking_status (booking_status),
                                       INDEX idx_driver_id (driver_id),
                                       INDEX idx_passenger_id (passenger_id),
                                       INDEX idx_start_time (start_time),
                                       CONSTRAINT fk_booking_driver FOREIGN KEY (driver_id) REFERENCES driver(id) ON DELETE SET NULL,
                                       CONSTRAINT fk_booking_passenger FOREIGN KEY (passenger_id) REFERENCES passenger(id) ON DELETE SET NULL,
                                       CONSTRAINT chk_booking_status CHECK (booking_status IN ('SCHEDULED', 'CANCELLED', 'CAR_ARRIVED', 'ASSIGNING_DRIVER', 'IN_RIDE', 'COMPLETED'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;