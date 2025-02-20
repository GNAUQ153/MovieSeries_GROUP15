# MovieSeries Application

This project is a comprehensive solution for managing movies and series, allowing CRUD operations, tagging, reviewing, and rating. It is built using a layered architecture with .NET Core technologies.

## Features

- **User Management**: Create, update, and manage users.
- **Movie Management**: Add, update, and retrieve movies.
- **Tagging System**: Assign and manage tags for movies.
- **Reviews**: Add, approve, and retrieve reviews for movies.
- **Ratings**: Add and retrieve ratings for movies.

## Project Architecture

The project uses a modular, layered structure:

1. **API Layer**: Handles HTTP requests and responses.
2. **Service Layer**: Contains business logic.
3. **Repository Layer**: Communicates with the database.
4. **Data Access Layer**: Handles database context and migrations.
5. **Core Layer**: Contains shared entities and interfaces.

## Technologies Used

- **.NET Core**: Backend framework.
- **Entity Framework Core**: ORM for database operations.
- **xUnit**: Unit testing framework.
- **MSTest**: For additional testing support.
- **Moq**: Mocking library for unit tests.
- **ReportGenerator**: For generating test coverage reports.

## Installation

### Prerequisites

- Install [.NET SDK](https://dotnet.microsoft.com/download).
- Install a SQL Server instance for the database.

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/movieseries-app.git
   cd movieseries-app
2. Build the project:
    ```bash
    dotnet build
3. Apply migrations:
   ```bash
   dotnet ef database update --project MovieSeries.DataAccessLayer
4. Run the application:
   ```bash
   dotnet run --project MovieSeries.API
