using ProductSuggestionAPP.DataContexts;
using ProductSuggestionAPP.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductSuggestionAPP.Repository
{
    public class SalesRepository : ISalesRepository
    {
        private readonly SalesContext _dbContext;

        public SalesRepository(SalesContext dbContext)
        {
            _dbContext = dbContext;
        }
     
        
        public IEnumerable<SALES_DATA> GetAllSalesInfo()
        {
            try
            {
                return _dbContext.SalesData.ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IEnumerable<SALES_DATA> GetSaleInfoByProductID(string ProductId)
        {
            return _dbContext.SalesData.Where(r => r.SD_PRODUCT_NAME == ProductId);
        }

        public IEnumerable<SALES_DATA> GetSaleInfoByStoreName(string storeName)
        {
            return _dbContext.SalesData.Where(r => r.SD_STORE_ID == storeName);
        }



        public void CreateSalesRecord(SALES_DATA salesRecordData)
        {
            _dbContext.Add(salesRecordData);
            _dbContext.SaveChanges();
        }

        public void DeleteSalesRecord(int saleRecordId)
        {
            var salesRecord = _dbContext.SalesData.Find(saleRecordId);
            _dbContext.SalesData.Remove(salesRecord);
            _dbContext.SaveChanges();
        }

        
        public void EditSalesRecord(SALES_DATA salesRecordData)
        {
            _dbContext.Entry(salesRecordData).State = EntityState.Modified;
            _dbContext.SaveChanges();
        }

        public IEnumerable<SALES_DATA> GetProductSuggestionByUserId(string userId)
        {
            return _dbContext.SalesData.Where(r => r.SD_CUST_NO == userId);
        }
    }
}
