--create database liftingbuddy;
drop table lift;
drop table muscle_area;
drop table customer_stat;
drop table customer;
drop table area;
drop table muscle;

 create table customer (
        customer_id serial,
        email varchar (30) not null,
        password varchar (30) not null,
        
        constraint pk_customer_id primary key (customer_id)
 );
 
 create table customer_stat(
        customer_stat_id serial,
        customer_id int not null,
        date timestamp not null,
        body_weight decimal(5,2),
        
        constraint pk_customer_stat_id primary key (customer_stat_id),
        constraint fk_customer_id foreign key (customer_id) references customer (customer_id)
 );
 
 create table muscle (
        muscle_name varchar (30),
        
        constraint pk_muscle_name primary key (muscle_name)
 );
 
 create table area (
        area_name varchar (30),
        
        constraint pk_area_name primary key (area_name)
 );
 
 create table muscle_area (
        muscle_area_id serial,
        muscle_name varchar (30) not null,
        area_name varchar (30) not null,
        
        constraint pk_muscle_area_id primary key (muscle_area_id),
        constraint fk_muscle_name foreign key (muscle_name) references muscle (muscle_name),
        constraint fk_area_name foreign key (area_name) references area (area_name)
 );
 
 create table lift(
        lift_name varchar(30),
        primary_muscle varchar (30) not null,
        secondary_muscle varchar (30),
        
        constraint pk_lift_name primary key (lift_name),
        constraint fk_primary_muscle foreign key (primary_muscle) references muscle (muscle_name),
        constraint fk_secondary_muscle foreign key (secondary_muscle) references muscle (muscle_name)
 );
 
 create table routine(
        routine_id serial,
        customer_id int not null,
        date timestamp not null,
        
        constraint pk_routine_id primary key (routine_id),
        constraint fk_customer_id foreign key (customer_id) references customer (customer_id)
 );
 
 create table exercise (
        exercise_id serial,
        routine_id int not null,
        lift_name varchar (30) not null,
        set_1_target_reps int not null,
        set_1_actual_reps int not null,
        set_1_weight int not null,
        set_2_target_reps int,
        set_2_actual_reps int ,
        set_2_weight int,
        set_3_target_reps int,
        set_3_actual_reps int ,
        set_3_weight int,
        set_4_target_reps int,
        set_4_actual_reps int ,
        set_4_weight int,
        set_5_target_reps int,
        set_5_actual_reps int ,
        set_5_weight int,
        
        constraint pk_exercise_id primary key (exercise_id),
        constraint fk_routine_id foreign key (routine_id) references routine (routine_id),
        constraint fk_lift_name foreign key (lift_name) references lift (lift_name)
 );
 