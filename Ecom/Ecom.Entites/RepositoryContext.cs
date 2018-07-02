using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using Ecom.Entites.Models; 

namespace Ecom.Entites
{
    public class RepositoryContext : DbContext
    {
        public RepositoryContext(DbContextOptions options) : base(options)
        {
        }

        public DbSet<Items> Items { get; set; }
        public DbSet<Users> Users { get; set; }
        public DbSet<Shops> Shops { get; set; }
    }
}
