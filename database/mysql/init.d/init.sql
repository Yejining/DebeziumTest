CREATE TABLE post (
    id          INT                                 NOT NULL PRIMARY KEY,
    file_path   VARCHAR(300)                        NOT NULL,
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    constraint filePath_UNIQUE UNIQUE (file_path)
);

INSERT INTO pseudo.post (id, file_path, create_time, update_time) VALUES (1, '/foo/bar/file.txt', '2024-07-02 08:18:50', '2024-07-02 08:18:50');
INSERT INTO pseudo.post (id, file_path, create_time, update_time) VALUES (3, '/baz/qux/file.pdf', '2024-07-02 08:18:53', '2024-07-02 08:18:53');
INSERT INTO pseudo.post (id, file_path, create_time, update_time) VALUES (5, '/qux/bar.file.xlsx', '2024-07-02 08:18:50', '2024-07-02 08:18:50');
