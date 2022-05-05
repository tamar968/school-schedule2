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
  public add(teacher: Teacher): Observable<Teacher> {
    return this.http.post<Teacher>(`${this.baseUrl}/add`, teacher);
  }
  public update(teacher: Teacher): Observable<Teacher> {
    return this.http.post<Teacher>(`${this.baseUrl}/update`,teacher);
  }

  public delete(Id: number): Observable<Teacher> {
    return this.http.post<Teacher>(`${this.baseUrl}/delete`, Id);
  }

  public get(Id: number): Observable<Teacher> {
    return this.http.get<Teacher>(`${this.baseUrl}/get/${Id}`);
  }
  public getTeachers():Observable<Teacher[]>{
    return this.http.get<Teacher[]>(`${this.baseUrl}/get/all`);
  }
}
