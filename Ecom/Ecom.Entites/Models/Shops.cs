using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Ecom.Entites.Models
{
    [Table("Shops")]
    public class Shops
    {
        [Key]
        public Guid ShopId { get; set; }

        [Required(ErrorMessage = "Date created is required")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Date created is required")]
        public string Addres { get; set; }

        [Required(ErrorMessage = "Date created is required")]
        public string Phone { get; set; }

        [Required(ErrorMessage = "Date created is required")]
        public string Email { get; set; }

        public decimal Score { get; set; }

    }
}
