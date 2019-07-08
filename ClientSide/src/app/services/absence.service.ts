import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import {AppComponent} from 'src/app/app.component'
import { Absence } from '../models/absence.model';

@Injectable({
  providedIn: 'root'
})
export class AbsenceService {

  constructor(private http:HttpClient) { }
  private baseUrl=AppComponent.getBaseUrl()+"/absence";  
  
  public addAbsence(absence:Absence):Observable<Absence> {
    return this.http.post<Absence>(this.baseUrl+'/add', absence);
  }
  
  public updateAbsence(absence:Absence):Observable<Absence> {
    return this.http.post<Absence>(this.baseUrl+'/update', absence);
  }

  public deleteAbsence(absence:Absence):Observable<Absence> {
    return this.http.post<Absence>(this.baseUrl+'/delete', absence);
  }

   getAbsence(absence:number):Observable<Absence> {
    return this.http.get<Absence>(this.baseUrl+'/get/{absence}');
  }/**///TOFIX
  public getAbsences():Observable<Absence[]> {
    return this.http.get<Absence[]>(this.baseUrl+'/get/all' );
  }
}
