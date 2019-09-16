import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TeacherService } from 'src/app/services/teacher.service';
import { Teacher } from 'src/app/models/teacher.model';
import { AbsenceForTeacher } from 'src/app/models/absence-for-teacher.model';
import { AbsenceForTeacherService } from 'src/app/services/absence-for-teacher.service';

@Component({
  selector: 'app-absences',
  templateUrl: './absences.component.html',
  styleUrls: ['./absences.component.css']
})
export class AbsencesComponent implements OnInit {

  constructor(private router: Router, private absForTeaService: AbsenceForTeacherService, private teaService: TeacherService) { }
  loaded = false;
  absForTeachers: AbsenceForTeacher[] = [];
  teachers: Teacher[] = [];

  ngOnInit() {

    this.absForTeaService.getAll()
      .subscribe(aft => {
        this.absForTeachers = aft;
        this.teaService.getTeachers()
          .subscribe(teachers => {
            this.teachers = teachers;
            //this.teachers.map(t=>t.OccasionTypeName=this.occTypes.filter(ot=>ot.Id===o.OccasionType)[0].Name);
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
