ALTER TABLE Driver
    ADD COLUMN pan_number VARCHAR(255);


ALTER TABLE Driver
    ADD CONSTRAINT uc_driver_pan_number UNIQUE (pan_number);