using System.ComponentModel.DataAnnotations;

namespace ProductSuggestionAPP.Models
{
    public class SALES_DATA
    {
        [Key]
        public int SD_ID { get; set; }
        public string SD_CUST_NO { get; set; }
        public string SD_PROD_ID { get; set; }
        public string SD_PRODUCT_NAME { get; set; }
        public string SD_PRODUCT_PRICE { get; set; }
        public string SD_STORE_ID { get; set; }

    }
}
