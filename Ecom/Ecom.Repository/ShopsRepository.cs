using Ecom.Entites;
using Ecom.Entites.Models;
using Ecom.Repository.Contracts;
using System;
using System.Collections.Generic;
using System.Text;

namespace Ecom.Repository
{
    public class ShopsRepository : RepositoryBase<Shops>, IShopsRepositiry
    {
        public ShopsRepository(RepositoryContext repositoryContext) : base(repositoryContext)
        {

        }
    }
}
