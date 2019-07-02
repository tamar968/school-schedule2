import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import {AppComponent} from 'src/app/app.component'

@Injectable({
  providedIn: 'root'
})
export class AbsenceService {

  constructor(private http:HttpClient) { }
  private baseUrl=AppComponent.getBaseUrl()+"/Absence";  
  
  public addAbsence(absence:any):Observable<any> {
    return this.http.post<any>(this.baseUrl+'/Add', absence);
  }
  
  public updateAbsence(absence:any):Observable<any> {
    return this.http.post<any>(this.baseUrl+'/Update', absence);
  }

  public deleteAbsence(absence:any):Observable<any> {
    return this.http.post<any>(this.baseUrl+'/Delete', absence);
  }

  public getAbsence(absence:any):Observable<any> {
    return this.http.post<any>(this.baseUrl+'/Get', absence);
  }
}
