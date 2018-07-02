using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using Ecom.Entites;

namespace Ecom.Repository.Contracts
{
    public abstract class RepositoryBase<T> : IRepositoryBase<T> where T : class
    {
        protected RepositoryContext repositoryContext { get; set; }

        public RepositoryBase(RepositoryContext repositoryContext)
        {
            this.repositoryContext = repositoryContext;
        }

        public IEnumerable<T> FindAll()
        {
            return this.repositoryContext.Set<T>();
        }

        public IEnumerable<T> FindByCondition(Expression<Func<T, bool>> expression)
        {
            return this.repositoryContext.Set<T>().Where(expression);
        }

        public void Create(T entity)
        {
            this.repositoryContext.Set<T>().Add(entity);
        }

        public void Delete(T entity)
        {
            this.repositoryContext.Set<T>().Remove(entity);
        }

        public void Update(T entity)
        {
            this.repositoryContext.Set<T>().Update(entity);
        }

        public void Save()
        {
            this.repositoryContext.SaveChanges();
        }

    }
}
