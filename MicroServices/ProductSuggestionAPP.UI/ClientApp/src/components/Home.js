import React, { Component } from 'react';

export class Home extends Component {
  static displayName = Home.name;

  render() {
    return (
      <div>
        <h4>Hello, Welcome to Product Suggestion Application</h4>
            <p>We are providing the below services:</p>
            <ul>
                <li>Get all sales information</li>
                <li>Get the sales info by using UserId</li>
                <li>Get the sales info by using ProductId</li>
                <li>Get the sales info by using Store Name</li>
        </ul>
      </div>
    );
  }
}
