alter table "u_dw".FCT_OPERATIONS_DD
   drop constraint FK_FCT_OPER_REFERENCE_DIM_GEO_;

alter table "u_dw".FCT_OPERATIONS_DD
   drop constraint FK_FCT_OPER_REFERENCE_DIM_DISH;

alter table "u_dw".FCT_OPERATIONS_DD
   drop constraint FK_FCT_OPER_REFERENCE_DIM_REST;

alter table "u_dw".FCT_OPERATIONS_DD
   drop constraint FK_FCT_OPER_REFERENCE_DIM_GEN_;

alter table "u_dw".FCT_OPERATIONS_DD
   drop constraint FK_FCT_OPER_REFERENCE_DIM_TIME;

drop table "u_dw".DIM_DISHES_SCD cascade constraints;

drop table "u_dw".DIM_GEN_PERIODS cascade constraints;

drop table "u_dw".DIM_GEO_LOCATIONS cascade constraints;

drop table "u_dw".DIM_RESTAURANTS cascade constraints;

drop table "u_dw".DIM_TIME_DD cascade constraints;

drop table "u_dw".FCT_OPERATIONS_DD cascade constraints;

drop user "u_dw";

create tablespace "ts_dw"
datafile 'db_qpt_dw_01.dat'
size 200M
 autoextend on next 100M
 segment space management auto;

/*==============================================================*/
/* User: "u_dw"                                                 */
/*==============================================================*/
create user "u_dw" 
  identified by "%PWD%"
    default tablespace ts_dw
    QUOTA UNLIMITED ON ts_dw;

grant CONNECT,RESOURCE to "u_dw";

/*==============================================================*/
/* Table: DIM_DISHES_SCD                                        */
/*==============================================================*/
create table "u_dw".DIM_DISHES_SCD 
(
   DISH_SUR_ID          NUMBER(15)           not null,
   DISH_ID              NUMBER(15)           not null,
   DISH_CODE            NUMBER(15)           not null,
   DISH_DESC            VARCHAR2(2000)       not null,
   DISH_NAME            VARCHAR2(400)        not null,
   DISH_WEIGHT          NUMBER(10,5)         not null,
   DISH_TYPE_ID         NUMBER(3)            not null,
   DISH_TYPE_DESC       VARCHAR2(500)        not null,
   DISH_TYPE_NAME       VARCHAR2(50)         not null,
   VALID_FROM           DATE                 not null,
   VALID_TO             DATE                 not null,
   IS_VALID             VARCHAR2(4)          not null,
   INSERT_DT            DATE                 not null,
   constraint PK_DIM_DISHES_SCD primary key (DISH_SUR_ID)
);

/*==============================================================*/
/* Table: DIM_GEN_PERIODS                                       */
/*==============================================================*/
create table "u_dw".DIM_GEN_PERIODS 
(
   PERIOD_SUR_ID        NUMBER(10)           not null,
   PERIOD_ID            VARCHAR2(150)        not null,
   PERIOD_DESC          VARCHAR2(500)        not null,
   PERIOD_CODE          VARCHAR2(50)         not null,
   PERIOD_TYPE_ID       NUMBER(10)           not null,
   PERIOD_TYPE_DESC     VARCHAR2(50)         not null,
   PERIOD_TYPE_NAME     VARCHAR2(150)        not null,
   START_DT             DATE                 not null,
   END_DT               DATE                 not null,
   PERIOD_LEVEL_CODE    VARCHAR2(50)         not null,
   constraint PK_DIM_GEN_PERIODS primary key (PERIOD_SUR_ID)
);

/*==============================================================*/
/* Table: DIM_GEO_LOCATIONS                                     */
/*==============================================================*/
create table "u_dw".DIM_GEO_LOCATIONS 
(
   GEO_SUR_ID           NUMBER(20)           not null,
   GEO_ID               NUMBER(20)           not null,
   GEO_COUNTRY_ID       NUMBER(20)           not null,
   GEO_COUNTRY_DESC     VARCHAR2(20)         not null,
   GEO_COUNTRY_CODE     VARCHAR2(20)         not null,
   GEO_COUNTRY_NAME     VARCHAR2(100)        not null,
   GEO_REGION_ID        NUMBER(20)           not null,
   GEO_REGION_DESC      VARCHAR2(20)         not null,
   GEO_REGION_CODE      VARCHAR2(20)         not null,
   GEO_REGION_NAME      VARCHAR2(100)        not null,
   GEO_CONTINENT_ID     NUMBER(20)           not null,
   GEO_CONTINENT_DESC   VARCHAR2(20)         not null,
   GEO_CONTINENT_CODE   VARCHAR2(20)         not null,
   GEO_CONTINENT_NAME   VARCHAR2(100)        not null,
   VALID_FROM           DATE                 not null,
   VALID_TO             DATE                 not null,
   IS_VALID             VARCHAR2(4)          not null,
   GEO_LEVEL_CODE       VARCHAR2(20)         not null,
   INSERT_DT            DATE                 not null,
   constraint PK_DIM_GEO_LOCATIONS primary key (GEO_SUR_ID)
);

/*==============================================================*/
/* Table: DIM_RESTAURANTS                                       */
/*==============================================================*/
create table "u_dw".DIM_RESTAURANTS 
(
   RESTAURANT_ID        NUMBER(10)           not null,
   RESTAURANT_CODE      NUMBER(10)           not null,
   RESTAURANT_NAME      VARCHAR2(150)        not null,
   RESTAURANT_DESC      VARCHAR2(2000)       not null,
   RESTAURANT_EMAIL     VARCHAR2(200),
   RESTAURANT_PHONE_NUMBER VARCHAR2(30),
   RESTAURANT_ADDRESS   VARCHAR2(400)        not null,
   RESTAURANT_NUMBER_OF_SEATS NUMBER(4)            not null,
   RESTAURANT_NUMBER_OF_DINING_RO NUMBER(4)            not null,
   RESTAURANT_TYPE_ID   NUMBER(3)            not null,
   RESTAURANT_TYPE_DESC VARCHAR2(200)        not null,
   RESTAURANT_TYPE_NAME VARCHAR2(50)         not null,
   INSERT_DT            DATE                 not null,
   UPDATE_DT            DATE,
   constraint PK_DIM_RESTAURANTS primary key (RESTAURANT_ID)
);

/*==============================================================*/
/* Table: DIM_TIME_DD                                           */
/*==============================================================*/
create table "u_dw".DIM_TIME_DD 
(
   EVENT_DT             DATE                 not null,
   DAY_NAME             VARCHAR2(15)         not null,
   DAY_NUMBER_IN_WEEK   VARCHAR2(4)          not null,
   DAY_NUMBER_IN_MONTH  VARCHAR2(4)          not null,
   DAY_NUMBER_IN_YEAR   VARCHAR2(4)          not null,
   CALENDAR_WEEK_NUMBER VARCHAR2(4)          not null,
   WEEK_ENDING_DATE     DATE                 not null,
   CALENDAR_MONTH_NUMBER VARCHAR2(4)          not null,
   DAYS_IN_CAL_MONTH    VARCHAR2(4)          not null,
   END_OF_CAL_MONTH     DATE                 not null,
   CALENDAR_MONTH_NAME  VARCHAR2(15)         not null,
   DAYS_IN_CAL_QUARTER  VARCHAR2(4)          not null,
   BEG_OF_CAL_QUARTER   DATE                 not null,
   END_OF_CAL_QUARTER   DATE                 not null,
   CALENDAR_QUARTER_NUMBER VARCHAR2(4)          not null,
   CALENDAR_YEAR        VARCHAR2(6)          not null,
   DAYS_IN_CAL_YEAR     VARCHAR2(4)          not null,
   BEG_OF_CAL_YEAR      DATE                 not null,
   END_OF_CAL_YEAR      DATE                 not null,
   INSERT_DT            DATE                 not null,
   UPDATE_DT            DATE                 not null,
   constraint PK_DIM_TIME_DD primary key (EVENT_DT)
);

/*==============================================================*/
/* Table: FCT_OPERATIONS_DD                                     */
/*==============================================================*/
create table "u_dw".FCT_OPERATIONS_DD 
(
   EVENT_DT             DATE,
   PERIOD_SUR_ID        NUMBER(10),
   RESTAURANT_ID        NUMBER(10),
   GEO_SUR_ID           NUMBER(20),
   DISH_SUR_ID          NUMBER(15),
   FCT_UNIT_PRICE_DOL   NUMBER(20,5)         not null,
   FCT_UNIT_AMOUNT      NUMBER(20,5)         not null,
   FCT_TOTAL_PRICE_DOL  NUMBER(20,5)         not null,
   TA_DISH_ID           NUMBER(15),
   TA_COUNTRY_ID        NUMBER(15),
   TA_REGION_ID         NUMBER(15),
   TA_PERIOD_ID         NUMBER(15),
   INSERT_DT            DATE                 not null,
   UPDATE_DT            DATE
)
PARTITION BY RANGE
 (EVENT_DT)
    (
        PARTITION
             PART_MONTH_1
            VALUES LESS THAN (TO_DATE('01-FEB-2012','DD-MON-RR'))
             TABLESPACE TS_DATA_MONTH_1
             NOCOMPRESS,
        PARTITION
             PART_MONTH_2
            VALUES LESS THAN (TO_DATE('01-MAR-2012','DD-MON-RR'))
             TABLESPACE TS_DATA_MONTH_2
             NOCOMPRESS,
        PARTITION
             PART_MONTH_3
            VALUES LESS THAN (TO_DATE('01-APR-2012','DD-MON-RR'))
             TABLESPACE TS_DATA_MONTH_3
             NOCOMPRESS,
        PARTITION
             PART_MONTH_4
            VALUES LESS THAN (TO_DATE('01-MAY-2012','DD-MON-RR'))
             TABLESPACE TS_DATA_MONTH_4
             NOCOMPRESS,
        PARTITION
             PART_MONTH_5
            VALUES LESS THAN (TO_DATE('01-JUN-2012','DD-MON-RR'))
             TABLESPACE TS_DATA_MONTH_5
             NOCOMPRESS,
        PARTITION
             PART_MONTH_6
            VALUES LESS THAN (TO_DATE('01-JUL-2012','DD-MON-RR'))
             TABLESPACE TS_DATA_MONTH_6
             NOCOMPRESS,
        PARTITION
             PART_MONTH_7
            VALUES LESS THAN (TO_DATE('01-AUG-2012','DD-MON-RR'))
             TABLESPACE TS_DATA_MONTH_7
             NOCOMPRESS,
        PARTITION
             PART_MONTH_8
            VALUES LESS THAN (TO_DATE('01-SEP-2012','DD-MON-RR'))
             TABLESPACE TS_DATA_MONTH_8
             NOCOMPRESS,
        PARTITION
             PART_MONTH_9
            VALUES LESS THAN (TO_DATE('01-OCT-2012','DD-MON-RR'))
             TABLESPACE TS_DATA_MONTH_9
             NOCOMPRESS,
        PARTITION
             PART_MONTH_10
            VALUES LESS THAN (TO_DATE('01-NOV-2012','DD-MON-RR'))
             TABLESPACE TS_DATA_MONTH_10
             NOCOMPRESS,
        PARTITION
             PART_MONTH_11
            VALUES LESS THAN (TO_DATE('01-DEC-2012','DD-MON-RR'))
             TABLESPACE TS_DATA_MONTH_11
             NOCOMPRESS,
        PARTITION
             PART_MONTH_12
            VALUES LESS THAN (TO_DATE('01-JAN-2013','DD-MON-RR'))
             TABLESPACE TS_DATA_MONTH_12
             NOCOMPRESS
    );

alter table "u_dw".FCT_OPERATIONS_DD
   add constraint FK_FCT_OPER_REFERENCE_DIM_GEO_ foreign key (GEO_SUR_ID)
      references "u_dw".DIM_GEO_LOCATIONS (GEO_SUR_ID);

alter table "u_dw".FCT_OPERATIONS_DD
   add constraint FK_FCT_OPER_REFERENCE_DIM_DISH foreign key (DISH_SUR_ID)
      references "u_dw".DIM_DISHES_SCD (DISH_SUR_ID);

alter table "u_dw".FCT_OPERATIONS_DD
   add constraint FK_FCT_OPER_REFERENCE_DIM_REST foreign key (RESTAURANT_ID)
      references "u_dw".DIM_RESTAURANTS (RESTAURANT_ID);

alter table "u_dw".FCT_OPERATIONS_DD
   add constraint FK_FCT_OPER_REFERENCE_DIM_GEN_ foreign key (PERIOD_SUR_ID)
      references "u_dw".DIM_GEN_PERIODS (PERIOD_SUR_ID);

alter table "u_dw".FCT_OPERATIONS_DD
   add constraint FK_FCT_OPER_REFERENCE_DIM_TIME foreign key (EVENT_DT)
      references "u_dw".DIM_TIME_DD (EVENT_DT);
