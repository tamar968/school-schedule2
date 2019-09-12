import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { AppComponent } from '../app.component';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class LoadDirService {

  constructor(private http:HttpClient) { }
  private baseUrl=AppComponent.getBaseUrl();  
  
  public onLoading(path:string):Observable<{string}> {
    return this.http.post<{string}>(`${this.baseUrl}/load`, { path });
  }
  
  }
