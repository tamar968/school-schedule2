import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule, } from '@angular/forms';
import { RouterModule, Routes } from '@angular/router'
import { HttpClientModule } from '@angular/common/http';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { AppComponent } from './app.component';
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
import { LoadFilesComponent } from './load-files/load-files.component';
import { AbsencesComponent } from './Absences/absences/absences.component';
import { EditScheduleComponent } from './schedule/edit-schedule/edit-schedule.component';
import { EditAbsenceComponent } from './Absences/edit-absence/edit-absence.component';
import { AboutComponent } from './about/about.component'
const ROUTES: Routes = [
  { path: "login", component: LoginComponent },
  { path: "load", component: LoadFilesComponent , canActivate: [AdminGuard]},
  { path: "schedule", component: ScheduleComponent },
  { path: "absence-for-teacher/absences", component: AbsencesComponent },
  { path: "absence-for-teacher/add", component: AddAbsenceComponent, canActivate: [AdminGuard] },
  { path: "absence-for-teacher/view/:number", component: ViewAbsenceComponent },  
  { path: "absence-for-teacher/edit/:number", component: EditAbsenceComponent, canActivate: [AdminGuard] },
  { path: "occasion/occasion", component: OccasionComponent },
  { path: "occasion/add", component: AddOccasionComponent, canActivate: [AdminGuard] },
  { path: "occasion/view/:number", component: ViewOccasionComponent },
  { path: "occasion/edit/:number", component: EditOccasionComponent, canActivate: [AdminGuard] },
  { path: "about", component: AboutComponent },
  { path: "", component: HomeComponent },
  { path: "**", redirectTo: "" }
]

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    LoginComponent,
    AddAbsenceComponent,
    AddOccasionComponent,
    ViewAbsenceComponent,
    ScheduleComponent,
    ViewOccasionComponent,
    EditOccasionComponent,
    OccasionComponent,
    LoadFilesComponent,
    AbsencesComponent,
    EditScheduleComponent,
    EditAbsenceComponent,
    AboutComponent
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
