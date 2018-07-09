using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Ecom.Entites.Models
{
    [Table("Users")]
    public class Users
    {
        [Key]
        public Guid UserId { get; set; }

        [Required(ErrorMessage = "Date created is required")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Date created is required")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Date created is required")]
        public string Surname { get; set; }

        [Required(ErrorMessage = "Date created is required")]
        public string Phone { get; set; }

        [Required(ErrorMessage = "Date created is required")]
        public string Address { get; set; }
    }
}
