using Ecom.Entites.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Ecom.Entites.Extensions
{
    public static class UserExtensions
    {
        public static void Map(this Users dbUser, Users users)
        {
            dbUser.Name = users.Name;
            dbUser.Surname = users.Name;
            dbUser.Username = users.Username;
            dbUser.Address = users.Address;
            dbUser.Phone = users.Phone;
        }
    }
}
