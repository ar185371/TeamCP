import React, { Component } from 'react';

export default class SalesDataByUserId extends Component {
    static displayName = "SalesData By UserId";

    constructor(props) {
        super(props);
        this.state = { allSalesData: [], loading: true, username: '', isreload: '', text: true };
        this.updateInput = this.updateInput.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
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


    updateInput(event) {
        this.setState({ username: event.target.value })
    }


    handleSubmit() {
        alert(this.state.username);

        this.populateSalesData();
        this.isreload = "yes";

        alert("Hi suri 2");
    }

    render() {
        
        return (
            <div>

                <h1 id="tabelLabel" >Sales Data History</h1>

                <form>
                    <label> Please enter your userId: 
                        <input type="text"
                            onChange={this.updateInput}
                        />
                    </label>
                    <br />
                    <button type="button" onClick={this.handleSubmit}>Get the data</button>
                </form>


                {
                    this.state.text ? (
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
                                {this.allSalesData.map(saleItem =>
                                    <tr key={saleItem.sD_CUST_NO}>
                                        <td>{saleItem.sD_CUST_NO}</td>
                                        <td>{saleItem.sD_PRODUCT_NAME}</td>
                                        <td>{saleItem.sD_PRODUCT_PRICE}</td>
                                        <td>{saleItem.sD_STORE_ID}</td>
                                    </tr>
                                )}
                            </tbody>
                        </table>
                    ) : ''
                }

            </div>
        );
    }



    populateSalesData() {

        alert("Hi Suri");
        const response =  fetch(`/sales/salesdata/${this.state.username}`);
        const data = response.json();
        this.setState({ allSalesData : data, loading: false });
    }
}
