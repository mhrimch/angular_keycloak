import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrl: './products.component.css'
})
export class ProductsComponent implements OnInit {

  public products: any;

  constructor(private http: HttpClient){}

  ngOnInit() {
   
   this.http.get('http://inventory-service:8001/api/v1/products').subscribe({
    next : data =>{
      this.products = data;
    },
    error : err =>{
      console.log(err)
    }

   })

  }

 

}
