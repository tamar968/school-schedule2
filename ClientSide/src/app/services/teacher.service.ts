import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import {AppComponent} from 'src/app/app.component'
import { Teacher } from '../models/teacher.model';
@Injectable({
  providedIn: 'root'
})
export class TeacherService {

  constructor(private http:HttpClient) { } 
  
  private baseUrl = AppComponent.getBaseUrl()+'/teacher'; 
 
  public getTeachers():Observable<Teacher[]>{
    return this.http.get<Teacher[]>(`${this.baseUrl}/get/all`);
  }
}
