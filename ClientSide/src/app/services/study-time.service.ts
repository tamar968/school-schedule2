import { Injectable } from '@angular/core';
import {AppComponent} from '../app.component'
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class StudyTimeService {

  constructor(private http:HttpClient) { }
   private baseUrl=AppComponent.getBaseUrl()+"/studytime"; 

   public add(studyTime:any):Observable<any>{
     return this.http.post(this.baseUrl+'/add',studyTime);
   };
 
  public update(studyTime:any):Observable<any> {
    return this.http.post<any>(this.baseUrl+'/update', studyTime);
  }

  public delete(studyTime:any):Observable<any> {
    return this.http.post<any>(this.baseUrl+'/delete', studyTime);
  }

  public get(studyTime:any):Observable<any> {
    return this.http.post<any>(this.baseUrl+'/get', studyTime);
  }
}
