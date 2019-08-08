import { Component, OnInit, Input, ViewChild } from '@angular/core';
import { TeacherService } from '../../services/teacher.service';
import { AbsenceService } from '../../services/absence.service';
import { Router } from '@angular/router';
import { Absence } from './../../models/absence.model';
import { Teacher } from './../../models/teacher.model';
import { AbsenceForTeacher } from './../../models/absence-for-teacher.model';
import { AbsenceForTeacherService } from '../../services/absence-for-teacher.service';
import { Lesson } from 'src/app/models/lesson.model';
import { ClassService } from 'src/app/services/class.service';
@Component({
  selector: 'app-add-absence',
  templateUrl: './add-absence.component.html',
  styleUrls: ['./add-absence.component.css']
})
export class AddAbsenceComponent implements OnInit {

  fromDate: Date;
  toDate: Date;
  teacherId: number;
  teacherStandIn: number;
  wholeDay: boolean;
  teachers: Teacher[];
  absenceTypes: Absence[];
  absenceTypeId: number;
  lessons: Lesson[];
  isCheckedLessons: boolean[];
  fromLesson: number;
  toLesson: number;
  constructor(
    private absenceService: AbsenceService,
    private teacherService: TeacherService,
    private absenceForTeacherService: AbsenceForTeacherService,
    private router: Router,
    private classService: ClassService,
    ) { }

  ngOnInit() {
    this.teacherService.getTeachers()
      .subscribe(teachers =>
        this.teachers = teachers,
        err => console.error(err)
      );
    this.absenceService.getAbsences().
      subscribe(absenceTypes => {
        this.absenceTypes = absenceTypes;
        // console.log(absenceTypes);
      },
        err => console.error(err)
      );
   this.isCheckedLessons = [];
      this.lessons = [ //TODO get this list from the server
      {Id: 1,  Name:"ראשון"},
      {Id: 2, Name: "שני"},
      {Id: 3, Name: "שלישי"},
      {Id: 4, Name: "רביעי"},
      {Id: 5, Name: "חמישי"},
      {Id: 6, Name: "שישי"},
      {Id: 7, Name: "שביעי"},
      {Id: 8, Name: "שמיני"},
    ];
  }


  onAddAbsence() {

    this.absenceForTeacherService.add(this.get()).subscribe(
      res => {
        this.router.navigateByUrl('');
        console.log("החסור למורה נוסף בהצלחה")
      }
      ,
      err => console.error(err)
    );

  }

  get() {
    console.log(this.fromLesson,this.toLesson);
    var absence = {
      TeacherId: this.teacherId,
      FromDate: this.fromDate,
      ToDate: this.toDate,
      TeacherStandIn: this.wholeDay ? this.teacherStandIn : null,
      Type: this.absenceTypeId,
      FromLesson:this.fromLesson,
      ToLesson:this.toLesson
    } as AbsenceForTeacher;

    console.log(absence);
    return absence;
  }
}
