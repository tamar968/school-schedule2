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
import { LessonHoursService } from 'src/app/services/lesson-hours.service';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
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
  lessons: number[];
  isCheckedLessons: boolean[];
  fromLesson: number;
  toLesson: number;

  addAbsence:FormGroup

  loaded = false;

  constructor(
    private absenceService: AbsenceService,
    private teacherService: TeacherService,
    private absenceForTeacherService: AbsenceForTeacherService,
    private router: Router,
    private lessonService: LessonHoursService,
    private fb: FormBuilder
  ) {
    this.addAbsence = this.fb.group({
    'fromCtrl': [null, Validators.required/*Validators.compose([Validators.required, Validators.pattern('20[0-9]{2}-[0-1][0-9]-[0-3][0-9]*')])*/],
    'toCtrl': [false/*null, Validators.compose([Validators.required, Validators.pattern('[0-9]{4}-[0-9]{2}-[0-9]{2}')])*/],
    'typeCtrl': [null, Validators.required],
    'fromLsnCtrl': [null, Validators.required /*Validators.compose([Validators.required,Validators.pattern('[0-9]*'),Validators.maxLength(1),Validators.minLength(1)])*/],
    'toLsnCtrl': [false/*null,Validators.compose([Validators.required,Validators.pattern('[0-9]*'),Validators.maxLength(1),Validators.minLength(1)])*/],
    'teaCtrl': [null, Validators.required],
    'teaStndInCrtl': [false]/**/
  }) }

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
        this.loaded = true;
      },
        err => console.error(err)
      );
    this.isCheckedLessons = [];
    this.lessons = this.lessonService.get();
  }


  onAddAbsence() {

    this.absenceForTeacherService.add(this.get()).subscribe(
      res => {
        this.router.navigateByUrl('absence-for-teacher/absences');
        console.log("החסור למורה נוסף בהצלחה")
      }
      ,
      err => console.error(err)
    );

  }

  get() {
    console.log(this.fromDate);
    var absence = {
      TeacherId: this.teacherId,
      FromDate: this.fromDate,
      ToDate: this.toDate?this.toDate : this.fromDate,
      TeacherStandIn: this.wholeDay ? this.teacherStandIn : null,
      Type: this.absenceTypeId,
      FromLesson: this.fromLesson,
      ToLesson: this.toLesson?this.toLesson : this.fromLesson 
    } as AbsenceForTeacher;

    console.log(absence);
    return absence;
  }
}
