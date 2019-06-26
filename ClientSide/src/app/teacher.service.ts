import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
@Injectable({
  providedIn: 'root'
})
export class TeacherService {

  constructor(private http:HttpClient) { } 
  
  private baseUrl = 'http://localhost:54198/api'; 

}
