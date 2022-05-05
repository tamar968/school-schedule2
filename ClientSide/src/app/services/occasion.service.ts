import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { AppComponent } from '../app.component';
import { Occasion } from '../models/occasion.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class OccasionService {

  constructor(private http: HttpClient) { }
  private baseUrl = AppComponent.getBaseUrl() + "/occasion";

  public add(occasion: Occasion): Observable<Occasion> {
    return this.http.post<Occasion>(`${this.baseUrl}/add`, occasion);
  }
  public update(occasion: Occasion): Observable<Occasion> {
    return this.http.post<Occasion>(`${this.baseUrl}/update`,occasion);
  }

  public delete(Id: number): Observable<Occasion> {
    return this.http.post<Occasion>(`${this.baseUrl}/delete`, Id);
  }

  public get(Id: number): Observable<Occasion> {
    return this.http.get<Occasion>(`${this.baseUrl}/get/${Id}`);
  }
  public getall(): Observable<Occasion[]> {
    return this.http.get<Occasion[]>(`${this.baseUrl}/get/all`);
  }
}
