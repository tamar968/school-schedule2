import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import {AppComponent} from 'src/app/app.component'
@Injectable({
  providedIn: 'root'
})
export class TeacherService {

  constructor(private http:HttpClient) { } 
  
  private baseUrl = AppComponent.prototype.getBaseUrl()+'/AbsenceForTeacher'; 

  public getTeachers():Observable<any>{
    return this.http.get<any>(this.baseUrl+'/getall');
  }
}
