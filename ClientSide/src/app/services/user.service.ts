import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import {AppComponent} from 'src/app/app.component'
//https://scotch.io/tutorials/angular-2-http-requests-with-observables#toc-angular-2-http-and-observables
@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http:HttpClient) { } 
  
  private baseUrl = AppComponent.prototype.getBaseUrl(); 

  public login(password:string):Observable<any>{
    return this.http.post<any>(this.baseUrl+'/login', {password});
  }
}
