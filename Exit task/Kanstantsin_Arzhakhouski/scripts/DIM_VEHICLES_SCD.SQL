CREATE TABLE DIM_VEHICLES_SCD
(
	VEHICLE_ID     NUMBER(22) NOT NULL,
	VEHICLE_TYPE   VARCHAR2(20),
	VEHICLE_DESC   VARCHAR2(200),
	VEHICLE_PRICE  NUMBER(7,2),
	VALID_FROM     DATE,
	VALID_TO       DATE,
	IS_VALID       VARCHAR2(4)
)
;


ALTER TABLE DIM_VEHICLES_SCD ADD CONSTRAINT PK_DIM_VEHICLES_SCD 
	PRIMARY KEY (VEHICLE_ID)
;

