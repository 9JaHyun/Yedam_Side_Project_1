CREATE TABLE MEMBER(
    member_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    login_id VARCHAR2(1000),
    password VARCHAR2(1000),
    email VARCHAR2(1000),
    tel VARCHAR2(1000),
    createdAt DATE,
    updatedAt DATE
);
CREATE TABLE MANAGER(
    manager_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    login_id VARCHAR2(100),
    password VARCHAR2(100),
    email VARCHAR2(100),
    tel VARCHAR2(100)
);
CREATE TABLE RESTAURANT(
    restaurant_id NUMBER PRIMARY KEY,
    manager_id NUMBER,
    name VARCHAR2(1000),
    tel VARCHAR2(1000),
    reserve_count NUMBER,
    location VARCHAR2(1000),
    content VARCHAR2(2000),
    operation_time_start VARCHAR2(20),
    operation_time_end VARCHAR2(20),
    break_time_start VARCHAR2(20),
    break_time_end VARCHAR2(20),
    CONSTRAINT fk_restaurant_manager_id
    FOREIGN KEY(manager_id)
    REFERENCES manager(manager_id)
);
CREATE TABLE Reservation(
    reservation_id NUMBER PRIMARY KEY,
    member_id NUMBER,
    restaurant_id NUMBER,
    reservation_time DATE,
    reservation_count NUMBER,
    reservation_content VARCHAR2(1000),
    CONSTRAINT fk_reservation_member_id
    FOREIGN KEY(member_id)
    REFERENCES member(member_id),
    CONSTRAINT fk_reservation_restaurant_id
    FOREIGN KEY(restaurant_id)
    REFERENCES restaurant(restaurant_id)
);
CREATE TABLE MENU(
    menu_id NUMBER PRIMARY KEY,
    restaurant_id NUMBER,
    name VARCHAR2(200),
    cost NUMBER,
    picture VARCHAR2(2000),
    CONSTRAINT fk_menu_restaurant_id
    FOREIGN KEY(restaurant_id)
    REFERENCES restaurant(restaurant_id),
    CONSTRAINT fk_menu_manager_id
    FOREIGN KEY(manager_id)
    REFERENCES manager(manager_id)
);
CREATE table REVIEW(
    review_id NUMBER PRIMARY KEY,
    member_id NUMBER,
    restaurant_id NUMBER,
    content VARCHAR2(2000),
    rating NUMBER,
    constraint fk_review_member_id
    foreign key(member_id)
    REFERENCES member(member_id),
    constraint fk_review_restaurant_id
    foreign key(restaurant_id)
    REFERENCES restaurant(restaurant_id),
    constraint fk_review_manager_id
    foreign key(manager_id)
    REFERENCES manager(manager_id)
);

CREATE SEQUENCE member_id_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 9999999;

CREATE SEQUENCE order_id_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 9999999;

CREATE SEQUENCE restaurant_id_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 9999999;

CREATE SEQUENCE menu_id_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 9999999;

CREATE SEQUENCE manager_id_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 9999999;

commit;