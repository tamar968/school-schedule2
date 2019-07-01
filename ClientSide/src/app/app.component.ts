import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'clientSide';
  baseUrl='http://localhost:54198/api'; 
  
  public getBaseUrl() {
    return this.baseUrl;
  }
}
