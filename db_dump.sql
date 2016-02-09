CREATE TABLE sex (
    id int(11) NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL
}

CREATE TABLE user (
    id int(11) NOT NULL AUTO_INCREMENT,
    username varchar(255) NOT NULL,
    fullname varchar(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    sex_id int(11) NOT NULL,
    weigth FLOAT NOT NULL,
    PRIMARY KEY (id),
    UNIQUE(username),
    CONSTRAINT FK_appUser_sex_id FOREIGN KEY (sex_id) REFERENCES sex(id)
);

CREATE TABLE teambench (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE r_teambench_user (
    teambench_id int NOT NULL AUTO_INCREMENT,
    user_id varchar(255) NOT NULL,
    PRIMARY KEY (team_id, user_id),
    CONSTRAINT FK_r_teambench_user_team_id FOREIGN KEY (team_id) REFERENCES team(id),
    CONSTRAINT FK_r_teambench_user_user_id FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE team (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    teambench_id NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_team_teambench_id FOREIGN KEY (teambench_id) REFERENCES teambench(id)
);

CREATE TABLE r_team_user (
    team_id int NOT NULL AUTO_INCREMENT,
    user_id varchar(255) NOT NULL,
    PRIMARY KEY (team_id, user_id),
    CONSTRAINT FK_r_team_user_team_id FOREIGN KEY (team_id) REFERENCES team(id),
    CONSTRAINT FK_r_team_user_user_id FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE match (
    id int NOT NULL AUTO_INCREMENT,
    date DATE NOT NULL,
    place varchar(1024) NOT NULL,
    team_id_a int NOT NULL,
    team_id_b int NOT NULL,
    team_id_winner int NOT NULL,
    score varchar(255) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_history_team_id_a FOREIGN KEY (team_id_a) REFERENCES team(id),
    CONSTRAINT FK_history_team_id_b FOREIGN KEY (team_id_b) REFERENCES team(id)
);

CREATE TABLE statcategory (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE statscore (
    user_id int NOT NULL,
    user_id_subject int NOT NULL,
    statcategory_id int NOT NULL,
    match_id int NOT NULL,
    score int NOT NULL,
    PRIMARY KEY (user_id, user_id_subject, statcategory_id, match_id),
    CONSTRAINT FK_statscore_user_id FOREIGN KEY (user_id) REFERENCES user(id),
    CONSTRAINT FK_statscore_user_id_subject FOREIGN KEY (user_id_subject) REFERENCES user(id),
    CONSTRAINT FK_statscore_statcategory_id FOREIGN KEY (statcategory_id) REFERENCES statcategory(id),
    CONSTRAINT FK_statscore_match_id FOREIGN KEY (match_id) REFERENCES match(id)
);
