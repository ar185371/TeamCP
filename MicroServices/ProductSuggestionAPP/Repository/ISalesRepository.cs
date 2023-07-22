using ProductSuggestionAPP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductSuggestionAPP.Repository
{

    public interface ISalesRepository
    {
        IEnumerable<SALES_DATA> GetAllSalesInfo();
        IEnumerable<SALES_DATA> GetSaleInfoByStoreName(string storeName);
        IEnumerable<SALES_DATA> GetSaleInfoByProductID(string saleRecordId);
        IEnumerable<SALES_DATA> GetProductSuggestionByUserId(string userId);
        void CreateSalesRecord(SALES_DATA salesRecordData);
        void DeleteSalesRecord(int saleRecordId);
        void EditSalesRecord(SALES_DATA salesRecordData);
    }
}
