using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Ecom.Entites.Models
{
    [Table("Items")]
    public class Items
    {
        [Key]
        public Guid ItemId { get; set; }

        [Required(ErrorMessage = "Date created is required")]
        public string Name { get; set; }

        public string Color { get; set; }

        public string Size { get; set; }

        public string Weightt { get; set; }

        public byte[] Imagee { get; set; }

        [Required(ErrorMessage = "Shop Id is required")]
        public Guid ShopId { get; set; }
    }

}
    