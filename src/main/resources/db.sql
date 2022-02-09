CREATE TABLE RESTAURANT(
    restaurant_id NUMBER PRIMARY KEY,
    name VARCHAR2(1000),
    tel VARCHAR2(1000),
    reserve_count NUMBER,
    location VARCHAR2(1000),
    content VARCHAR2(2000),
    operation_time_start DATE,
    operation_time_end DATE,
    break_time_start DATE,
    break_time_end DATE
);

CREATE TABLE MEMBER(
    member_id NUMBER PRIMARY KEY,
    member_name VARCHAR2(100) NOT NULL,
    login_id VARCHAR2(1000),
    password VARCHAR2(1000),
    email VARCHAR2(1000),
    tel VARCHAR2(1000),
    createdAt DATE,
    updatedAt DATE
);

CREATE TABLE RESERVATION(
    order_id NUMBER PRIMARY KEY,
    member_id NUMBER,
    restaurant_id NUMBER,
    order_time DATE,
    order_count NUMBER,
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
    REFERENCES restaurant(restaurant_id)
);

CREATE TABLE MANAGER(
    manager_id NUMBER PRIMARY KEY,
    restaurant_id NUMBER,
    login_id VARCHAR2(100),
    password VARCHAR2(100),
    email VARCHAR2(100),
    tel VARCHAR2(100),
    CONSTRAINT fk_manager_restaurant_id
    FOREIGN KEY(restaurant_id)
    REFERENCES restaurant(restaurant_id)
);

CREATE table ADDRESS_CODE(
    region_id NUMBER PRIMARY KEY,
    restaurant_id NUMBER,
    constraint fk_address_restaurant_id
    foreign key(restaurant_id)
    REFERENCES restaurant(restaurant_id)
);

CREATE table REVIEW(
    review_id NUMBER PRIMARY KEY,
    member_id NUMBER,
    restaurant_id NUMBER,
    content VARCHAR2(2000),
    rating NUMBER,
    constraint fk_address_member_id
    foreign key(member_id)
    REFERENCES member(member_id),
    constraint fk_review_restaurant_id
    foreign key(restaurant_id)
    REFERENCES restaurant(restaurant_id)
);

commit;
