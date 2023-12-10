CREATE TABLE customer (
    id CHARACTER VARYING(255) PRIMARY KEY,
    unique_id CHARACTER VARYING(255) NOT NULL,
    zip_code_prefix CHARACTER VARYING(10) NOT NULL,
    city CHARACTER VARYING(255),
    state CHARACTER VARYING(255)
);

CREATE TABLE geolocation (
    zip_code_prefix CHARACTER VARYING(10) NOT NULL,
    lat DECIMAL(16,13) NOT NULL,
    lng DECIMAL(16,13) NOT NULL,
    city CHARACTER VARYING(255),
    state CHARACTER VARYING(255)
);

CREATE TABLE translation (
    product_category_name CHARACTER VARYING(255) NOT NULL,
    product_category_name_english CHARACTER VARYING(255) NOT NULL
);

CREATE TABLE order_items (
    id CHARACTER VARYING(255) PRIMARY KEY,
    item_id DECIMAL(10,0) NOT NULL,
    product_id CHARACTER VARYING(255) NOT NULL,
    seller_id CHARACTER VARYING(255) NOT NULL,
    shipping_limit_date TIMESTAMP,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2)
);

CREATE TABLE orders (
    id CHARACTER VARYING(255) PRIMARY KEY,
    customer_id CHARACTER VARYING(255) NOT NULL,
    status CHARACTER VARYING(255) NOT NULL,
    purchase_timestamp TIMESTAMP,
    approved_at TIMESTAMP,
    delivered_customer_date TIMESTAMP,
    estimated_delivery_date TIMESTAMP
);

CREATE TABLE review (
    id CHARACTER VARYING(255) PRIMARY KEY,
    order_id CHARACTER VARYING(255),
    score DECIMAL(2,0),
    comment_title CHARACTER VARYING(255),
    comment_message CHARACTER VARYING(255),
    creation_date TIMESTAMP,
    answer_timestamp TIMESTAMP
);

CREATE TABLE payment (
    order_id CHARACTER VARYING(255),
    sequential DECIMAL(3,0),
    type CHARACTER VARYING(255),
    installments DECIMAL(3,0),
    value DECIMAL(15,2)
);

CREATE TABLE seller (
    id CHARACTER VARYING(255) PRIMARY KEY,
    zip_code_prefix CHARACTER VARYING(10),
    city CHARACTER VARYING(255),
    state CHARACTER VARYING(255)
);

CREATE TABLE product (
    id CHARACTER VARYING(255) PRIMARY KEY,
    category_name CHARACTER VARYING(255),
    name_length DECIMAL(10,0),
    description_length DECIMAL(15,0),
    photos_qty DECIMAL(10,0),
    weight_g DECIMAL(10,0),
    length_cm DECIMAL(10,0),
    height_cm DECIMAL(10,0),
    width_cm DECIMAL(10,0)
);