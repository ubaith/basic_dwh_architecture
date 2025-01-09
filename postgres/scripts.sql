CREATE TABLE customers (
                           customer_id SERIAL PRIMARY KEY,
                           first_name VARCHAR(50) NOT NULL,
                           last_name VARCHAR(50) NOT NULL,
                           email VARCHAR(100) NOT NULL UNIQUE,
                           phone VARCHAR(15),
                           address VARCHAR(255),
                           city VARCHAR(50),
                           state VARCHAR(50),
                           zip_code VARCHAR(10),
                           country VARCHAR(50),
                           created_at TIMESTAMP,
                           loaded_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);