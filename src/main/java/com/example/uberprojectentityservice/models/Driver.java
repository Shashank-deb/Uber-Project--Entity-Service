package com.example.uberprojectentityservice.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import lombok.*;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "driver")
@Getter
@Setter
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties({"hibernateLazyInitializer","handler","bookings"})
public class Driver extends BaseModel {

    @Column(nullable = false, length = 100)
    private String name;

    @Column(name = "licence_number", nullable = false, unique = true, length = 50)
    private String licenceNumber;

    @Column(name = "phone_number", length = 20)
    private String phoneNumber;

    @Column(name = "aadhaar_number", unique = true, length = 20)
    private String aadhaarNumber;

    @Column(length = 50)
    private String country;

    @OneToOne(mappedBy = "driver", cascade = CascadeType.ALL)
    private Car car;

    @Enumerated(value = EnumType.STRING)
    private DriverApprovalStatus driverApprovalStatus;

    @OneToOne
    private ExactLocation lastKnowLocation;

    @OneToOne
    private ExactLocation home;


    private String activeCity;

    @Column(name = "pan_number",unique = true)
    private String panNumber;

    @DecimalMin(value = "0.00", message = "Rating must be grater than or equal to 0.00")
    @DecimalMax(value = "5.00", message = "Rating must be less than or equal to 5.00")
    private double rating;



    @OneToMany(mappedBy = "driver", cascade = CascadeType.ALL, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    @Builder.Default
    private List<Booking> bookings = new ArrayList<>();

    // Helper methods for bidirectional relationship
    public void addBooking(Booking booking) {
        bookings.add(booking);
        booking.setDriver(this);
    }

    public void removeBooking(Booking booking) {
        bookings.remove(booking);
        booking.setDriver(null);
    }
}
