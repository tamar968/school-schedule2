import { Injectable } from '@angular/core';
import {AppComponent} from '../app.component'
import { from, Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class AbsenceForTeacherService {

  constructor(private http:HttpClient) { }
   private baseUrl=AppComponent.getBaseUrl()+"/AbsenceForTeacher"; 

   public add(absence:any):Observable<any>{
     return this.http.post(this.baseUrl+'/Add',absence);
   };
 
  public update(absence:any):Observable<any> {
    return this.http.post<any>(this.baseUrl+'/Update', absence);
  }

  public delete(absence:any):Observable<any> {
    return this.http.post<any>(this.baseUrl+'/Delete', absence);
  }

  public get(absence:any):Observable<any> {
    return this.http.post<any>(this.baseUrl+'/Get', absence);
  }
}
