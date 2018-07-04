using Ecom.Entites;
using Ecom.Entites.Models;
using Ecom.Repository.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Ecom.Repository
{
    public class UsersRepository : RepositoryBase<Users>, IUsersRepository
    {
        public UsersRepository(RepositoryContext repositoryContext) : base(repositoryContext)
        {
        }

        public IEnumerable<Users> GetAllUsers()
        {
            return FindAll();
        }

        public Users GetUserById(Guid userId)
        {
            return FindByCondition(user => user.UserId.Equals(userId)).FirstOrDefault();
        }
    }
}
