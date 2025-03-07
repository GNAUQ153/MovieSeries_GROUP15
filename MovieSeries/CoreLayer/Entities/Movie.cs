﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MovieSeries.CoreLayer.Entities
{
    public class Movie
    {
        [Key]
        [Column("movie_series_id")]
        public int Id { get; set; }
        public string Title { get; set; }
        public string Genre { get; set; }

        [Column("release_date")]
        public DateTime ReleaseDate { get; set; }
        public string Description { get; set; }
        public ICollection<MovieSeriesTag> MovieSeriesTags { get; set; }
    }
}
