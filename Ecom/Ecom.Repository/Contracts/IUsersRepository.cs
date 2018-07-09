using Ecom.Entites.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Ecom.Repository.Contracts
{
    public interface IUsersRepository : IRepositoryBase<Users>
    {
        IEnumerable<Users> GetAllUsers();
        Users GetUserById(Guid userId);
        void CreateUser(Users user);
        void UpdateUser(Users dbUser, Users users);
        void DeleteUser(Users user);
    }
}
