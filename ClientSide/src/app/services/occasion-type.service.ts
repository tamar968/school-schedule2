import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { AppComponent } from '../app.component';
import { OccasionType } from '../models/occasion-type.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class OccasionTypeService {

  constructor(private http:HttpClient) { }
  private baseUrl=AppComponent.getBaseUrl()+"/occasion-type";  

  public getOccasionTypes():Observable<OccasionType[]> {
    return this.http.get<OccasionType[]>(`${this.baseUrl}/get/all`);
  }
}
