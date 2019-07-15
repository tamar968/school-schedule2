import { Injectable } from '@angular/core';
import {AppComponent} from '../app.component'
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { AbsenceForTeacher } from '../models/absence-for-teacher.model';

@Injectable({
  providedIn: 'root'
})
export class AbsenceForTeacherService {

  constructor(private http:HttpClient) { }
   private baseUrl=AppComponent.getBaseUrl()+"/absence-for-teacher"; 

   public add(absence:AbsenceForTeacher):Observable<any>{
     return this.http.post(this.baseUrl+'/add',absence);
   };
 
  public update(absence:AbsenceForTeacher):Observable<any> {
    return this.http.post<any>(this.baseUrl+'/update', absence);
  }

  public delete(absence:AbsenceForTeacher):Observable<any> {
    return this.http.post<any>(this.baseUrl+'/delete', absence);
  }

  public get(absenceId:number):Observable<any> {
    return this.http.get<any>(this.baseUrl+'/get/'+absenceId);
  }
}
