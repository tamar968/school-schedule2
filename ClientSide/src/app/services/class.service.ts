import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { AppComponent } from '../app.component';
import { HttpClient } from '@angular/common/http';
import { Class } from '../models/class.model';

@Injectable({
  providedIn: 'root'
})
export class ClassService {

  constructor(private http: HttpClient) { }
  private baseUrl = AppComponent.getBaseUrl() + "/class";

  public addClass(_class: Class): Observable<Class> {
    return this.http.post<Class>(this.baseUrl + '/update', _class);
  }

  public updateClass(_class: Class): Observable<Class> {
    return this.http.post<Class>(this.baseUrl + '/update', _class);
  }

  public deleteClass(_class: Class): Observable<Class> {
    return this.http.post<Class>(this.baseUrl + '/delete', _class);
  }

  getClass(_class: number): Observable<Class> {
    return this.http.get<Class>(this.baseUrl + '/get/{_class}');
  }
  public getClasss(): Observable<Class[]> {
    return this.http.get<Class[]>(this.baseUrl + '/get/all');
  }
}
