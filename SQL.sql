CREATE DATABASE MovieSeriesReviews;
GO

USE [master]
GO

CREATE DATABASE [MovieSeriesReviews]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieSeriesReviews', FILENAME = N'D:\SQL sever\MSSQL16.MSSQLSERVER\MSSQL\DATA\MovieSeriesReviews.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MovieSeriesReviews_log', FILENAME = N'D:\SQL sever\MSSQL16.MSSQLSERVER\MSSQL\DATA\MovieSeriesReviews_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MovieSeriesReviews] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieSeriesReviews].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieSeriesReviews] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieSeriesReviews] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieSeriesReviews] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieSeriesReviews] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieSeriesReviews] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieSeriesReviews] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MovieSeriesReviews] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieSeriesReviews] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieSeriesReviews] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieSeriesReviews] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieSeriesReviews] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieSeriesReviews] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieSeriesReviews] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieSeriesReviews] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieSeriesReviews] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MovieSeriesReviews] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieSeriesReviews] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieSeriesReviews] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieSeriesReviews] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieSeriesReviews] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieSeriesReviews] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MovieSeriesReviews] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieSeriesReviews] SET RECOVERY FULL 
GO
ALTER DATABASE [MovieSeriesReviews] SET  MULTI_USER 
GO
ALTER DATABASE [MovieSeriesReviews] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieSeriesReviews] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieSeriesReviews] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieSeriesReviews] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MovieSeriesReviews] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MovieSeriesReviews] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MovieSeriesReviews', N'ON'
GO
ALTER DATABASE [MovieSeriesReviews] SET QUERY_STORE = ON
GO
ALTER DATABASE [MovieSeriesReviews] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MovieSeriesReviews]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[movie_series_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](100) NOT NULL,
	[genre] [varchar](50) NULL,
	[release_date] [date] NULL,
	[description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[movie_series_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieSeriesTags](
	[movie_series_id] [int] NOT NULL,
	[tag_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[movie_series_id] ASC,
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[rating_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[movie_series_id] [int] NOT NULL,
	[rating] [decimal](3, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[rating_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[movie_series_id] [int] NOT NULL,
	[review_text] [nvarchar](max) NULL,
	[review_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[tag_id] [int] IDENTITY(1,1) NOT NULL,
	[tag_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[tag_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT (getdate()) FOR [review_date]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[MovieSeriesTags]  WITH CHECK ADD FOREIGN KEY([movie_series_id])
REFERENCES [dbo].[Movies] ([movie_series_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MovieSeriesTags]  WITH CHECK ADD FOREIGN KEY([tag_id])
REFERENCES [dbo].[Tags] ([tag_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD FOREIGN KEY([movie_series_id])
REFERENCES [dbo].[Movies] ([movie_series_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([movie_series_id])
REFERENCES [dbo].[Movies] ([movie_series_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD CHECK  (([rating]>=(0) AND [rating]<=(10)))
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddReview]
    @user_id INT,
    @movie_series_id INT,
    @review_text NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO Reviews (user_id, movie_series_id, review_text, review_date)
    VALUES (@user_id, @movie_series_id, @review_text, GETDATE());
END;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetMovieReviews]
    @movie_series_id INT
AS
BEGIN
    SELECT r.review_id, r.user_id, u.username, r.review_text, r.review_date
    FROM Reviews r
    JOIN Users u ON r.user_id = u.user_id
    WHERE r.movie_series_id = @movie_series_id
    ORDER BY r.review_date DESC;
END;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetMoviesByTag]
    @tag_name VARCHAR(50)
AS
BEGIN
    SELECT m.movie_series_id, m.title, m.genre, m.release_date, m.description
    FROM Movies m
    JOIN MovieSeriesTags mst ON m.movie_series_id = mst.movie_series_id
    JOIN Tags t ON mst.tag_id = t.tag_id
    WHERE t.tag_name = @tag_name;
END;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTopRatedMovies]
    @top_count INT
AS
BEGIN
    SELECT 
        m.movie_series_id, 
        m.title, 
        m.genre,  
        m.release_date,
        m.description, 
        COALESCE(AVG(r.rating), 0) AS avg_rating
    FROM Movies m
    LEFT JOIN Ratings r ON m.movie_series_id = r.movie_series_id
    GROUP BY m.movie_series_id, m.title, m.genre, m.release_date, m.description
    ORDER BY avg_rating DESC
    OFFSET 0 ROWS FETCH NEXT CASE WHEN @top_count > 0 THEN @top_count ELSE 1 END ROWS ONLY;
END;
GO
USE [master]
GO
ALTER DATABASE [MovieSeriesReviews] SET  READ_WRITE 
GO
