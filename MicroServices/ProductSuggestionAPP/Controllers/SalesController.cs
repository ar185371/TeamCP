using Microsoft.AspNetCore.Mvc;
using ProductSuggestionAPP.Models;
using ProductSuggestionAPP.Repository;
using System.Collections.Generic;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ProductSuggestionAPP.Controllers
{

    [Route("[controller]")]
    [ApiController]
    public class SalesController : ControllerBase
    {
        private readonly ISalesRepository _salesRepository;


        public SalesController(ISalesRepository salesRepository)
        {
            _salesRepository = salesRepository;
        }

        [HttpGet("getAllSalesInfo")]
        public IActionResult GetAllSalesInfo()
        {
            var products = _salesRepository.GetAllSalesInfo();
            return new OkObjectResult(products);
        }

        [HttpPost]
        public SALES_DATA Add([FromBody] SALES_DATA saleData)
        {
            _salesRepository.CreateSalesRecord(saleData);
            return saleData;
        }



        [HttpGet("salessuggestiondata/{userId}")]
        public IActionResult GetProductSuggestionByUserId(string userId)
        {
            var product = _salesRepository.GetProductSuggestionByUserId(userId);
            return new OkObjectResult(product);
        }


        [HttpGet("salesdataofuser/{userId}")]
        public IActionResult GetSalesByUserId(string userId)
        {
            var product = _salesRepository.GetProductSuggestionByUserId(userId);
            return new OkObjectResult(product);
        }

        [HttpGet("saleInfobyprodcutid/{productId}")]

        public IActionResult GetSaleInfoByProdcutId(string productId)
        {
            var product = _salesRepository.GetSaleInfoByProductID(productId);
            return new OkObjectResult(product);
        }


        [HttpGet("salesstoredata/{storeName}")]
        public IActionResult GetSaleInfoByStoreName(string storeName)
        {
            var product = _salesRepository.GetSaleInfoByStoreName(storeName);
            return new OkObjectResult(product);
        }

        [HttpPut]
        public IActionResult Edit([FromBody] SALES_DATA saleData)
        {
            if (saleData != null)
            {
                _salesRepository.EditSalesRecord(saleData);
                return new OkResult();
            }
            return new NoContentResult();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _salesRepository.DeleteSalesRecord(id);
            return new OkResult();
        }
    }

}
