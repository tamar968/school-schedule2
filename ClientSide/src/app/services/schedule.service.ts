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
  public get(): Observable<Schedule[][]> {
    return this.http.post<Schedule[][]>(`${this.baseUrl}/get`,null);
  }
}
