
import  SalesData  from "./components/SalesData";
import { Home } from "./components/Home";
import SalesDataByProductId from "./components/SalesDataByProductId";
import SalesDataByStoreName from "./components/SalesDataByStoreName";
import SalesDataByUserId from "./components/SalesDataByUserId";
import GetProdcutSuggestionByUserId from "./components/GetProdcutSuggestionByUserId";


const AppRoutes = [
  {
    index: true,
    element: <Home />
  },
    {
        path: '/sales-data',
        element: <SalesData />
    }
    ,
    {
        path: '/getSalesDataByUserId',
        element: <SalesDataByUserId />
    }
    , 
    {
        path: '/getSalesDataByProdcutId',
        element: <SalesDataByProductId />
    }
    ,
    {
        path: '/getSalesDataByStoreName',
        element: <SalesDataByStoreName />
    }

    ,
    {
        path: '/getProdcutSuggestionByUserId',
        element: <GetProdcutSuggestionByUserId />
    }
];

export default AppRoutes;
