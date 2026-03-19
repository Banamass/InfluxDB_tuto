CREATE TABLE IF NOT EXISTS sensor_data (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    time_ts DATETIME NOT NULL,
    room VARCHAR(50) NOT NULL,
    floor_name VARCHAR(20) NOT NULL,
    temp DOUBLE,
    hum DOUBLE,
    co2 INT,
    power DOUBLE,
    occupied BOOLEAN,
    INDEX idx_time_ts (time_ts),
    INDEX idx_room (room),
    INDEX idx_floor_name (floor_name),
    INDEX idx_room_time (room, time_ts)
);