using System;
using System.Collections.Generic;
using System.Text;

namespace Ecom.Repository.Contracts
{
    public interface IRepositoryWrapper
    {
        IItemsRepository Item { get; }
        IUsersRepository User { get; }
        IShopsRepositiry Shop { get; }
    }
}
