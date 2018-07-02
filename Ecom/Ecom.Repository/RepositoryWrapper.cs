using Ecom.Entites;
using Ecom.Repository.Contracts;
using System;
using System.Collections.Generic;
using System.Text;

namespace Ecom.Repository
{
    public class RepositoryWrapper : IRepositoryWrapper
    {

        private RepositoryContext _repoContext;

        private IItemsRepository _item;
        private IUsersRepository _user;
        private IShopsRepositiry _shop;

        public RepositoryWrapper(RepositoryContext repositoryContext)
        {
            _repoContext = repositoryContext;
        }
        
        public IItemsRepository Item
        {
            get
            {
                if (_item == null)
                {
                    _item = new ItemsRepository(_repoContext);
                }
                return _item;
            }
        }

            

        public IUsersRepository User
        {
            get
            {
                if (_user == null)
                {
                    _user = new UsersRepository(_repoContext);
                }
                return _user;
            }
        }


        public IShopsRepositiry Shop
        {
            get
            {
                if (_shop == null)
                {
                    _shop = new ShopsRepository(_repoContext);
                }
                return _shop;
            }
        }
    }
}
