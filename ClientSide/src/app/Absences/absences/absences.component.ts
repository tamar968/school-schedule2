import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TeacherService } from 'src/app/services/teacher.service';
import { Teacher } from 'src/app/models/teacher.model';
import { AbsenceForTeacher } from 'src/app/models/absence-for-teacher.model';
import { AbsenceForTeacherService } from 'src/app/services/absence-for-teacher.service';
import { AbsenceService } from 'src/app/services/absence.service';
import { Absence } from 'src/app/models/absence.model';

@Component({
  selector: 'app-absences',
  templateUrl: './absences.component.html',
  styleUrls: ['./absences.component.css']
})
export class AbsencesComponent implements OnInit {

  constructor(
    private router: Router,
    private absForTeaService: AbsenceForTeacherService,
    private teaService: TeacherService,
    private absService: AbsenceService
  ) { }
  loaded = false;
  absForTeachers: AbsenceForTeacher[] = [];
  teachers: Teacher[] = [];
  absTypes: Absence[] = [];

  ngOnInit() {

    this.absForTeaService.getAll()
      .subscribe(aft => {
        this.absForTeachers = aft;
        this.teaService.getTeachers()
          .subscribe(teachers => {
            this.teachers = teachers;
            this.absForTeachers.forEach(e => {
              e.TeacherName = this.teachers.filter(t => t.Num === e.TeacherId)[0].Name;
              console.log(e.FromDate)
              if (e.TeacherStandIn!=null&&e.TeacherStandIn!==undefined)
                e.TeacherStandInName = this.teachers.filter(t => t.Num == e.TeacherStandIn)[0].Name;
            });
            this.absService.getAbsences()
              .subscribe(d => {
                this.absTypes = d;
                this.absForTeachers.forEach(e => {
                  e.TypeName = this.absTypes.filter(t => t.Id === e.Type)[0].Name;
                });
              }, e => console.error(e))

            this.loaded = true;
          }, err => console.error(err));
      }, e => console.error(e));

  }
  navigateToAdd() {
    this.router.navigate([`/absence-for-teacher/add`]);
  }
  navigateToEdit(id: number) {
    this.router.navigate([`/absence-for-teacher/edit/${id}`]);
  }
  navigateToView(id: number) {
    this.router.navigate([`/absence-for-teacher/view/${id}`]);
  }
}
