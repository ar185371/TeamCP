using Microsoft.AspNetCore.Mvc;
using ProductSuggestionAPP.UI.Models;
using System.Text.Json;

namespace ProductSuggestionAPP.UI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class SalesController :ControllerBase
    {



        [HttpGet("salesdata/{userid}")]
        public IEnumerable<SALES_DATA> GetSalesDataByUserId(string userid)
        {
            using var httpClient = new HttpClient();
            var request = new HttpRequestMessage(HttpMethod.Get, "https://localhost:44386/Sales/salesdataofuser/" + userid);
            var response = httpClient.Send(request);
            using var reader = new StreamReader(response.Content.ReadAsStream());
            var responseBody = reader.ReadToEnd();

            List<SALES_DATA> salesDataList = new List<SALES_DATA>();

            if (responseBody != null & responseBody != "")
            {
                salesDataList = JsonSerializer.Deserialize<List<SALES_DATA>>(responseBody);

            }

            return salesDataList;

        }


        [HttpGet("salesproductdata/{prodcutId}")]
        public IEnumerable<SALES_DATA> GetSalesDataByProdcutId(string prodcutId)
        {
            using var httpClient = new HttpClient();
            var request = new HttpRequestMessage(HttpMethod.Get, "https://localhost:44386/Sales/saleInfobyprodcutid/" + prodcutId);
            var response = httpClient.Send(request);
            using var reader = new StreamReader(response.Content.ReadAsStream());
            var responseBody = reader.ReadToEnd();

            List<SALES_DATA> salesDataList = new List<SALES_DATA>();

            if (responseBody != null & responseBody != "")
            {
                salesDataList = JsonSerializer.Deserialize<List<SALES_DATA>>(responseBody);

            }

            return salesDataList;

        }


        [HttpGet("salesstoredata/{storeName}")]
        public IEnumerable<SALES_DATA> GetSalesDataByStoreName(string storeName)
        {
            using var httpClient = new HttpClient();
            var request = new HttpRequestMessage(HttpMethod.Get, "https://localhost:44386/Sales/salesstoredata/" + storeName);
            var response = httpClient.Send(request);
            using var reader = new StreamReader(response.Content.ReadAsStream());
            var responseBody = reader.ReadToEnd();

            List<SALES_DATA> salesDataList = new List<SALES_DATA>();

            if (responseBody != null & responseBody != "")
            {
                salesDataList = JsonSerializer.Deserialize<List<SALES_DATA>>(responseBody);

            }

            return salesDataList;

        }



        [HttpGet]
        public IEnumerable<SALES_DATA> Get()
        {

            using var httpClient = new HttpClient();
            var request = new HttpRequestMessage(HttpMethod.Get, "https://localhost:44386/Sales/getAllSalesInfo");
            var response = httpClient.Send(request);
            using var reader = new StreamReader(response.Content.ReadAsStream());
            var responseBody = reader.ReadToEnd();

            List<SALES_DATA> salesDataList = new List<SALES_DATA>();

            if (responseBody!=null & responseBody != "")
            {
                salesDataList = JsonSerializer.Deserialize<List<SALES_DATA>>(responseBody);

            }

            return salesDataList;

        }

    }
}
