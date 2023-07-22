import React, { Component } from 'react';

export default class SalesDataByProductId extends Component {
    static displayName = "SalesData By ProductId";

    constructor(props) {
        super(props);
        this.state = { allSalesData: [], loading: true };
    }

    componentDidMount() {
        this.populateSalesData();
    }

    static renderallSalesDataTable(allSalesData) {
        return (
            <table className='table table-striped' aria-labelledby="tabelLabel">
                <thead>
                    <tr>
                        <th>UserId</th>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Store Name</th>
                    </tr>
                </thead>
                <tbody>
                    {allSalesData.map(saleItem =>
                        <tr key={saleItem.sD_CUST_NO}>
                            <td>{saleItem.sD_CUST_NO}</td>
                            <td>{saleItem.sD_PRODUCT_NAME}</td>
                            <td>{saleItem.sD_PRODUCT_PRICE}</td>
                            <td>{saleItem.sD_STORE_ID}</td>
                        </tr>
                    )}
                </tbody>
            </table>
        );
    }

    render() {
        let contents = this.state.loading
            ? <p><em>Loading...</em></p>
            : SalesDataByProductId.renderallSalesDataTable(this.state.allSalesData);

        return (
            <div>
                <h1 id="tabelLabel" >Sales Data History</h1>
                {contents}
            </div>
        );
    }

    async populateSalesData() {
        const response = await fetch('sales');
        const data = await response.json();
        console.log(data);
        this.setState({ allSalesData : data, loading: false });
    }
}
