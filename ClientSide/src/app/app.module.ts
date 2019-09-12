import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule, } from '@angular/forms';
import { RouterModule, Routes } from '@angular/router'
import { HttpClientModule } from '@angular/common/http';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { AppComponent } from './app.component';
import { StudyTimeComponent } from './study-time/study-time.component';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { AddAbsenceComponent } from './Absences/add-absence/add-absence.component';
import { AddOccasionComponent } from './occasion/add-occasion/add-occasion.component';
import { NgMultiSelectDropDownModule } from 'ng-multiselect-dropdown';
import { AdminGuard } from './guard/admin.guard';
import { ViewAbsenceComponent } from './Absences/view-absence/view-absence.component';
import { ScheduleComponent } from './schedule/schedule.component';
import { ViewOccasionComponent } from './occasion/view-occasion/view-occasion.component';
import { EditOccasionComponent } from './occasion/edit-occasion/edit-occasion.component';
import { OccasionComponent } from './occasion/occasion/occasion.component';
import { LoadFilesComponent } from './load-files/load-files.component'
const ROUTES: Routes = [
  { path: "login", component: LoginComponent },
  { path: "load", component: LoadFilesComponent },
  { path: "schedule", component: ScheduleComponent },
  { path: "studyTime/:number", component: StudyTimeComponent },// id of אוביקט שעת לימוד
  { path: "absence-for-teacher/add", component: AddAbsenceComponent, canActivate: [AdminGuard] },
  { path: "absence-for-teacher/view/:number", component: ViewAbsenceComponent, canActivate: [AdminGuard] },
  { path: "absence-for-teacher/view", component: ViewAbsenceComponent, canActivate: [AdminGuard] },
  { path: "occasion/occasion", component: OccasionComponent },
  { path: "occasion/add", component: AddOccasionComponent, canActivate: [AdminGuard] },
  { path: "occasion/view", component: ViewOccasionComponent },
  { path: "occasion/edit", component: EditOccasionComponent, canActivate: [AdminGuard] },
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
    AddOccasionComponent,
    ViewAbsenceComponent,
    ScheduleComponent,
    ViewOccasionComponent,
    EditOccasionComponent,
    OccasionComponent,
    LoadFilesComponent
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
