package com.example.uberprojectentityservice.models;


import jakarta.persistence.Entity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

import java.util.Random;

@Entity
@Getter
@Setter
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
public class OTP extends BaseModel {

    private String code;

    private String sendToNumber;

    public static OTP make(String phoneNumber) {
        Random random = new Random();
        Integer code = random.nextInt(9000) + 1000;
        return OTP.builder().code(code.toString()).sendToNumber(phoneNumber).build();
    }
}
