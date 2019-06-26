import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {FormsModule} from '@angular/forms';
import {RouterModule,Routes} from '@angular/router'
import { HttpClientModule } from '@angular/common/http';
import { AppComponent } from './app.component';
import { StudyTimeComponent } from './study-time/study-time.component';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';

const ROUTES:Routes=[
  {path:"i",component:StudyTimeComponent},//only for sample
  {path:"studyTime/:any",component:StudyTimeComponent},//any should be  אוביקט שעת לימוד or id of אוביקט שעת לימוד
  {path:"login",component:LoginComponent},
  {path:"",component:HomeComponent},
  {path:"**",redirectTo:""}
]

@NgModule({
  declarations: [
    AppComponent,
    StudyTimeComponent,
    HomeComponent,
    LoginComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpClientModule,
    RouterModule.forRoot(ROUTES)
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
