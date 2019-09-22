import { Component, OnInit } from '@angular/core';
import { Teacher } from '../../models/teacher.model';
import { Absence } from '../../models/absence.model';
import { AbsenceForTeacher } from '../../models/absence-for-teacher.model';
import { AbsenceService } from '../../services/absence.service';
import { TeacherService } from '../../services/teacher.service';
import { AbsenceForTeacherService } from '../../services/absence-for-teacher.service';
import { Router, ActivatedRoute } from '@angular/router';
import { LessonHoursService } from 'src/app/services/lesson-hours.service';

@Component({
  selector: 'app-edit-absence',
  templateUrl: './edit-absence.component.html',
  styleUrls: ['./edit-absence.component.css']
})
export class EditAbsenceComponent implements OnInit {

  absence: AbsenceForTeacher;
  fromDate: Date;
  toDate: Date;
  teacherId: number;
  teacherStandIn: number;
  wholeDay: boolean;
  teachers: Teacher[];
  absenceTypeId: number;
  lessons: Number[];
  isCheckedLessons: boolean[];
  fromLesson: number;
  toLesson: number;
  id: number;
  absenceTypes: Absence[];

  constructor(
    private absenceService: AbsenceService,
    private teacherService: TeacherService,
    private absenceForTeacherService: AbsenceForTeacherService,
    private router: Router,
    private activeRoute: ActivatedRoute,
    private lessonSevrice: LessonHoursService) { }

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
    this.absenceForTeacherService.get(Number(this.activeRoute.snapshot.params['number'])).subscribe(absence => {
      this.absence = absence;
      this.fromDate = this.absence.FromDate;
      //console.log("this.fromDate:"+this.fromDate.getDate() +" "+this.absence.FromDate.getDate())
      this.toDate = this.absence.ToDate;
      this.teacherId = this.absence.TeacherId;
      this.teacherStandIn = this.absence.TeacherStandIn;
      this.absenceTypeId = this.absence.Type;
      this.fromLesson = this.absence.FromLesson;
      this.toLesson = this.absence.ToLesson;
      this.id = this.absence.Id;
      this.wholeDay = this.teacherStandIn != null;
      this.lessons = this.lessonSevrice.get();
      console.log(this.absence);
    },
      err => console.error(err)
    );

  }
  get() {
    var absence = {
      TeacherId: this.teacherId,
      FromDate: this.fromDate,
      ToDate: this.toDate,
      TeacherStandIn: this.wholeDay ? this.teacherStandIn : null,
      Type: this.absenceTypeId,
      FromLesson: this.fromLesson,
      ToLesson: this.toLesson
    } as AbsenceForTeacher;

    console.log(absence);
    return absence;
  }
  onUpdateAbsence() {
    this.absenceForTeacherService.update(this.get()).subscribe(
      res => {
        this.router.navigateByUrl('absence-for-teacher/absences');
        console.log("החסור למורה עודכן בהצלחה")
      }
      ,
      err => console.error(err)
    );
  }
  delete(id: number) {
    var res = confirm(`האם חיסור זה בטוח למחיקה?`)
    if (res === true) {
      this.absenceForTeacherService.delete(id)
        .subscribe(data => {
          this.router.navigate([`absence-for-teacher/absences`]);
          console.log(data);
        }, err => console.error(err));
    } else {
      alert(`מחיקת הארוע בוטלה`);
    }
  }
  navigateToList() {
    this.router.navigate([`absence-for-teacher/absences`]);
  }
}
