
CREATE TABLE CADS_IDE
(
  id       int      NOT NULL,
  CADS_id  int      NOT NULL,
  name     varchar  NOT NULL,
  duration interval NOT NULL,
  PRIMARY KEY (id)
);

COMMENT ON TABLE CADS_IDE IS '每日代码活动统计信息：IDE模块';

CREATE TABLE CADS_language
(
  CADS_id            int      NOT NULL,
  id                 int      NOT NULL,
  name               varchar  NOT NULL,
  duration           interval NOT NULL,
  characters_added   int      NOT NULL,
  characters_deleted int      NOT NULL,
  PRIMARY KEY (id)
);

COMMENT ON TABLE CADS_language IS '每日代码活动统计信息：编程语言模块';

CREATE TABLE CADS_OS
(
  CADS_id  int      NOT NULL,
  id       int      NOT NULL,
  name     varchar  NOT NULL,
  duration interval NOT NULL,
  PRIMARY KEY (id)
);

COMMENT ON TABLE CADS_OS IS '每日代码活动统计信息：操作系统模块';

CREATE TABLE CADS_project
(
  id       int      NOT NULL,
  CADS_id  int      NOT NULL,
  name     varchar  NOT NULL,
  duration interval NOT NULL,
  PRIMARY KEY (id)
);

COMMENT ON TABLE CADS_project IS '每日代码活动统计信息：项目模块';

CREATE TABLE CodeActivity
(
  id                int       NOT NULL,
  start_time_stamp  timestamp NOT NULL,
  end_time_stamp    timestamp NOT NULL,
  user_id           int       NOT NULL,
  project_name      varchar   NOT NULL,
  project_branch    varchar   NOT NULL,
  debug_duration    int       NOT NULL,
  terminal_duration int       NOT NULL,
  os_name           varchar   NOT NULL,
  os_version        varchar   NOT NULL,
  ide_name          varchar   NOT NULL,
  ide_version       varchar   NOT NULL,
  version           varchar   NOT NULL,
  CADS_id           int      ,
  PRIMARY KEY (id)
);

COMMENT ON TABLE CodeActivity IS '代码活动详细记录';

COMMENT ON COLUMN CodeActivity.id IS 'uuid 或雪花算法';

COMMENT ON COLUMN CodeActivity.CADS_id IS '每日统计信息表id';

CREATE TABLE CodeActivityDayStatistics
(
  id                int      NOT NULL,
  code_duration     interval NOT NULL,
  debug_duration    interval NOT NULL,
  terminal_duration interval NOT NULL,
  PRIMARY KEY (id)
);

COMMENT ON TABLE CodeActivityDayStatistics IS '每日代码活动统计信息';

CREATE TABLE LanguageInfo
(
  id                 int     NOT NULL,
  code_activity_id   int     NOT NULL,
  name               varchar NOT NULL,
  characters_added   int     NOT NULL,
  characters_deleted int     NOT NULL,
  duration           int     NOT NULL,
  PRIMARY KEY (id)
);

COMMENT ON TABLE LanguageInfo IS '代码活动编程语言信息';

CREATE TABLE users
(
  id      int NOT NULL,
  UCAS_id int NOT NULL,
  PRIMARY KEY (id)
);

COMMENT ON TABLE users IS '只有id,其它省略';

COMMENT ON COLUMN users.UCAS_id IS '用户历史代码活动统计信息表 id';

ALTER TABLE LanguageInfo
  ADD CONSTRAINT FK_CodeActivity_TO_LanguageInfo
    FOREIGN KEY (code_activity_id)
    REFERENCES CodeActivity (id);

ALTER TABLE CodeActivity
  ADD CONSTRAINT FK_users_TO_CodeActivity
    FOREIGN KEY (user_id)
    REFERENCES users (id);

ALTER TABLE CodeActivity
  ADD CONSTRAINT FK_CodeActivityDayStatistics_TO_CodeActivity
    FOREIGN KEY (CADS_id)
    REFERENCES CodeActivityDayStatistics (id);

ALTER TABLE CADS_project
  ADD CONSTRAINT FK_CodeActivityDayStatistics_TO_CADS_project
    FOREIGN KEY (CADS_id)
    REFERENCES CodeActivityDayStatistics (id);

ALTER TABLE CADS_IDE
  ADD CONSTRAINT FK_CodeActivityDayStatistics_TO_CADS_IDE
    FOREIGN KEY (CADS_id)
    REFERENCES CodeActivityDayStatistics (id);

ALTER TABLE CADS_language
  ADD CONSTRAINT FK_CodeActivityDayStatistics_TO_CADS_language
    FOREIGN KEY (CADS_id)
    REFERENCES CodeActivityDayStatistics (id);

ALTER TABLE CADS_OS
  ADD CONSTRAINT FK_CodeActivityDayStatistics_TO_CADS_OS
    FOREIGN KEY (CADS_id)
    REFERENCES CodeActivityDayStatistics (id);
