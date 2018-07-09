using Ecom.Entites.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Ecom.Entites
{
    public static class IEntityExtension
    {
        public static bool IsObjectNull(this Users entity)
        {
            return entity == null;
        }

        public static bool IsEmptyObject(this Users entity)
        {
            return entity.UserId.Equals(Guid.Empty);
        }
    }
}
