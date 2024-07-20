CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    -- chat_id INTEGER NOT NULL,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    patronymic VARCHAR(100),
    gender TEXT NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    expected_salary INTEGER NOT NULL,
    email TEXT NOT NULL,
    is_seeker BOOLEAN NOT NULL,
    phone_number VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS job_seekers (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    company_id INTEGER NOT NULL REFERENCES companies(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    patronymic VARCHAR(100),
    gender TEXT NOT NULL,
    email TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP   
);


CREATE TABLE IF NOT EXISTS companies (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    bin TEXT NOT NULL
);


CREATE TABLE IF NOT EXISTS job_posts (
    id SERIAL PRIMARY KEY,
    seeker_id INTEGER NOT NULL REFERENCES seeker(id) ON DELETE CASCADE,
    position VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL,
    probably_salary BIGINT NOT NULL,
    required_experiene INTEGER NOT NULL,
    is_active BOOLEAN NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);


CREATE INDEX idx_user_id ON users(id);
CREATE INDEX idx_seeker_id ON job_seekers(id);
CREATE INDEX idx_company_id ON companies(id);
CREATE INDEX idx_posts_id ON job_posts(id);