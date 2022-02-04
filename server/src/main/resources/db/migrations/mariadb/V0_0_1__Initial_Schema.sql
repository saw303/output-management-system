CREATE TABLE template (
    id         VARCHAR(36) NOT NULL,
    version    INTEGER     NOT NULL,
    name       VARCHAR(80) NOT NULL,
    media_type VARCHAR(40) NOT NULL,
    content    LONGTEXT    NOT NULL,
    PRIMARY KEY (id)
)
    ENGINE = InnoDB;
