CREATE TABLE user (
    id int(11) NOT NULL AUTO_INCREMENT,
    username varchar(255) NOT NULL,
    fullname varchar(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    male int(1) NOT NULL DEFAULT '1',
    weight FLOAT NOT NULL,
    heigth FLOAT NOT NULL,
    PRIMARY KEY (id),
    UNIQUE(username)
);

CREATE TABLE teambench (
    id int(11) NOT NULL AUTO_INCREMENT,
    user_id_creator int(11) NOT NULL,
    name varchar(255) NOT NULL,
    creation_date DATETIME NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_teambench_user_id FOREIGN KEY (user_id_creator) REFERENCES user(id)
);

CREATE TABLE r_teambench_user (
    teambench_id int(11) NOT NULL,
    user_id int(11) NOT NULL,
    PRIMARY KEY (teambench_id, user_id),
    CONSTRAINT FK_r_teambench_user_teambench_id FOREIGN KEY (teambench_id) REFERENCES teambench(id),
    CONSTRAINT FK_r_teambench_user_user_id FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE team (
    id int(11) NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    user_id_creator int(11) NOT NULL,
    teambench_id int(11) NOT NULL,
    creation_date DATETIME NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_team_teambench_id FOREIGN KEY (teambench_id) REFERENCES teambench(id),
    CONSTRAINT FK_team_user_id_creator FOREIGN KEY (user_id_creator) REFERENCES user(id)
);

CREATE TABLE r_team_user (
    team_id int(11) NOT NULL,
    user_id int(11) NOT NULL,
    PRIMARY KEY (team_id, user_id),
    CONSTRAINT FK_r_team_user_team_id FOREIGN KEY (team_id) REFERENCES team(id),
    CONSTRAINT FK_r_team_user_user_id FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE `match` (
    id int(11) NOT NULL AUTO_INCREMENT,
    date DATETIME NOT NULL,
    place varchar(1024) NOT NULL,
    teambench_id int NOT NULL,
    team_id_a int(11) NOT NULL,
    team_id_b int(11) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_match_teambench_id FOREIGN KEY (teambench_id) REFERENCES teambench(id),
    CONSTRAINT FK_match_team_id_a FOREIGN KEY (team_id_a) REFERENCES team(id),
    CONSTRAINT FK_match_team_id_b FOREIGN KEY (team_id_b) REFERENCES team(id)
);

CREATE TABLE matchresult (
    match_id int(11) NOT NULL,
    team_id_winner int(11) NOT NULL,
    score_winner int NOT NULL,
    score_looser int NOT NULL,
    PRIMARY KEY (match_id),
    CONSTRAINT FK_matchresult_match_id FOREIGN KEY (match_id) REFERENCES `match`(id),
    CONSTRAINT FK_matchresult_team_id_winner FOREIGN KEY (team_id_winner) REFERENCES team(id)
);

CREATE TABLE userscore (
    match_id int(11) NOT NULL,
    user_id int(11) NOT NULL,
    scores int NOT NULL DEFAULT 0,
    PRIMARY KEY (match_id, user_id),
    CONSTRAINT FK_userscore_match_id FOREIGN KEY (match_id) REFERENCES `match`(id),
    CONSTRAINT FK_userscore_user_id FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE statcategory (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE user_match_stat (
    user_id int NOT NULL,
    user_id_subject int NOT NULL,
    statcategory_id int NOT NULL,
    match_id int NOT NULL,
    score int NOT NULL,
    PRIMARY KEY (user_id, user_id_subject, statcategory_id, match_id),
    CONSTRAINT FK_user_match_stat_user_id FOREIGN KEY (user_id) REFERENCES user(id),
    CONSTRAINT FK_user_match_stat_user_id_subject FOREIGN KEY (user_id_subject) REFERENCES user(id),
    CONSTRAINT FK_user_match_stat_statcategory_id FOREIGN KEY (statcategory_id) REFERENCES statcategory(id),
    CONSTRAINT FK_user_match_stat_match_id FOREIGN KEY (match_id) REFERENCES `match`(id)
);
