import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AppComponent } from '../app.component';
import { Schedule } from '../models/schedule.model';

@Injectable({
  providedIn: 'root'
})
export class ScheduleService {
  private baseUrl = AppComponent.getBaseUrl() + "/schedule";

  constructor(private http: HttpClient) { }
  public getClass(c: number, n: number, d: Date): Observable<Schedule[][]> {
    return this.http.post<Schedule[][]>(`${this.baseUrl}/get/class`, { c, n, d });
  }
  public getClassById(clsId:number): Observable<Schedule[][]> {
    return this.http.post<Schedule[][]>(`${this.baseUrl}/get/class`, { clsId });
  }
  public getTeacher(id: number, d: Date): Observable<Schedule[][]> {
    return this.http.post<Schedule[][]>(`${this.baseUrl}/get/teacher`, { id, d });
  }
  public getLayer(l: number, d: Date): Observable<Schedule[][]> {
    return this.http.post<Schedule[][]>(`${this.baseUrl}/get/layer`, { l, d });
  }
}
