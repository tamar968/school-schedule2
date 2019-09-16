import { Injectable } from '@angular/core';
import {AppComponent} from '../app.component'
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { AbsenceForTeacher } from '../models/absence-for-teacher.model';
import { Absence } from '../models/absence.model';

@Injectable({
  providedIn: 'root'
})
export class AbsenceForTeacherService {

  constructor(private http:HttpClient) { }
   private baseUrl=AppComponent.getBaseUrl()+"/absence-for-teacher"; 

   public add(absence:AbsenceForTeacher):Observable<AbsenceForTeacher>{
     return this.http.post<AbsenceForTeacher>(`${this.baseUrl}/add`,absence);
   };
 
  public update(absence:AbsenceForTeacher):Observable<AbsenceForTeacher> {
    return this.http.post<AbsenceForTeacher>(`${this.baseUrl}/update`, absence);
  }

  public delete(Id:number):Observable<AbsenceForTeacher> {
    return this.http.post<AbsenceForTeacher>(`${this.baseUrl}/delete`, Id);
  }

  public get(absenceId:number):Observable<AbsenceForTeacher> {
    return this.http.get<AbsenceForTeacher>(`${this.baseUrl}/get/${absenceId}`);
  }
  public getAll():Observable<AbsenceForTeacher[]> {
    return this.http.get<AbsenceForTeacher[]>(`${this.baseUrl}/get/all`);
  }
}
