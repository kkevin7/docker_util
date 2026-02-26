-- init-scripts/01-create-odoo-user.sql

-- Create superuser
CREATE USER odoo_user 
WITH PASSWORD 'develop123'
SUPERUSER
CREATEDB
CREATEROLE
LOGIN;

-- Create database
CREATE DATABASE odoo OWNER odoo_user;

-- Grant all privileges on the database to the user
GRANT ALL PRIVILEGES ON DATABASE odoo TO odoo_user;