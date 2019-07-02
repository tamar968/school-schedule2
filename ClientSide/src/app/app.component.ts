import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'clientSide';
  static baseUrl='http://localhost:54198/api'; 
  
  public static getBaseUrl() {
    return AppComponent.baseUrl;
  }
}
