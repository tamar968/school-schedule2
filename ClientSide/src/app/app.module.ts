import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule,ReactiveFormsModule,} from '@angular/forms';
import { RouterModule, Routes } from '@angular/router'
import { HttpClientModule } from '@angular/common/http';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { AppComponent } from './app.component';
import { StudyTimeComponent } from './study-time/study-time.component';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { AddAbsenceComponent } from './Absences/add-absence/add-absence.component';
import { AddOccasionComponent } from './occation/add-occasion/add-occasion.component';
import { NgMultiSelectDropDownModule } from 'ng-multiselect-dropdown';
import { from } from 'rxjs';

const ROUTES: Routes = [
  //{path:"i",redirectTo:""},//only for sample
  { path: "studyTime/:number", component: StudyTimeComponent },//any should be  אוביקט שעת לימוד or id of אוביקט שעת לימוד
  { path: "login", component: LoginComponent },
  { path: "absence-for-tacher/add", component: AddAbsenceComponent },
  { path: "occasion/add", component: AddOccasionComponent },
  { path: "", component: HomeComponent },
  { path: "**", redirectTo: "" }
]

@NgModule({
  declarations: [
    AppComponent,
    StudyTimeComponent,
    HomeComponent,
    LoginComponent,
    AddAbsenceComponent,
    AddOccasionComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    RouterModule.forRoot(ROUTES),
    NgbModule,
    NgMultiSelectDropDownModule.forRoot()
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
