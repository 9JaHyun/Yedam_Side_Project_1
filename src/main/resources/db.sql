CREATE TABLE restaurant(
    restaurant_id number primary key,
    name varchar2(1000),
    tel varchar2(1000),
    reserve_count number,
    location varchar2(1000),
    content varchar2(2000),
    operation_time_start date,
    operation_time_end date,
    break_time_start date,
    break_time_end date
);

CREATE TABLE Member(
    member_id number primary key,
    login_id varchar2(1000),
    password varchar2(1000),
    email varchar2(1000),
    tel varchar2(1000),
    createdAt date,
    updatedAt date
);

CREATE TABLE RESERVATION(
    order_id number primary key,
    member_id number,
    restaurant_id number,
    order_time date,
    order_count number,
    CONSTRAINT fk_reservation_member_id
    FOREIGN KEY(member_id)
    REFERENCES member(member_id),
    CONSTRAINT fk_reservation_restaurant_id
    FOREIGN KEY(restaurant_id)
    REFERENCES restaurant(restaurant_id)
);

CREATE TABLE menu(
    menu_id number primary key,
    restaurant_id number,
    menu varchar2(200),
    cost number,
    picture varchar2(2000),
    CONSTRAINT fk_menu_restaurant_id
    FOREIGN KEY(restaurant_id)
    REFERENCES restaurant(restaurant_id)
);

CREATE TABLE manager(
    manger_id number primary key,
    restaurant_id number,
    login_id varchar2(100),
    password varchar2(100),
    email varchar2(100),
    tel varchar2(100),
    CONSTRAINT fk_manager_restaurant_id
    FOREIGN KEY(restaurant_id)
    REFERENCES restaurant(restaurant_id)
);

CREATE table address_code(
    region_id number primary key,
    restaurant_id number,
    constraint fk_address_restaurant_id
    foreign key(restaurant_id)
    REFERENCES restaurant(restaurant_id)
);

CREATE table review(
    review_id number primary key,
    member_id number,
    restaurant_id number,
    content varchar2(2000),
    rating number,
    constraint fk_address_member_id
    foreign key(member_id)
    REFERENCES member(member_id),
    constraint fk_review_restaurant_id
    foreign key(restaurant_id)
    REFERENCES restaurant(restaurant_id)
);

commit;

drop table member cascade constraints;
drop table restaurant cascade constraints;
drop table reservation cascade constraints;
drop table menu cascade constraints;
drop table manager cascade constraints;
drop table address_code cascade constraints;

commit;