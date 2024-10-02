# Wogi Assignment

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Database Setup](#database-setup)
- [API Endpoints](#api-endpoints)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)

## Overview

This is a Rails API for managing brands, products, clients, and card functionalities, including user authentication. The application allows users to create, read, update, and delete resources while providing state management for brands and products.

## Features

- User authentication (registration and login).
- Manage brands with customizable fields.
- Manage products with price and currency support.
- State management for products and brands (active/inactive).
- Client management with authentication credentials and payout rates.
- Card issuance and cancellation.
- Reporting on products and associated cards.

## Technologies Used

- Ruby on Rails
- PostgreSQL
- FactoryBot for test data generation
- JWT for authentication

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/wogi-assignment.git
   cd wogi-assignment

2. Install the required gems:
   ```bash
   bundle install
3. Set up the database:
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
4. Start the Rails server:
    ```bash
   rails server
   
## Database Setup
The application uses PostgreSQL as the database. Make sure you have PostgreSQL installed and running. Update the config/database.yml file with your database credentials if necessary.

## API Endpoints
Authentication
```bash
Register: POST /auth/register
Login: POST /auth/login
Authorize: GET /auth/authorize_request
```
Brands Management
```bash
Get All Brands: GET /brands
Create Brand: POST /brands
```
Products Management
```bash
Get All Products: GET /products
Create Product: POST /products
Update Product: PUT /products/:id
Delete Product: DELETE /products/:id
```
Clients Management
```bash
Get All Clients: GET /clients
Create Client: POST /clients
```
Cards Management
```bash
Create Card: POST /cards
Cancel Card: PUT /cards/:id/cancel
```
Reporting
```bash
Generate Reports: GET /reports  
```


POSTMAN API LINK
``https://documenter.getpostman.com/view/9463833/2sAXxJjb7G``