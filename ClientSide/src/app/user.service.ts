import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

//https://scotch.io/tutorials/angular-2-http-requests-with-observables#toc-angular-2-http-and-observables
@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http:HttpClient) { } 
  
  private baseUrl = 'http://localhost:54198/api'; 

  public login(password:string):Observable<any>{
    return this.http.post<any>(this.baseUrl+'/login', {password});
  }
}
