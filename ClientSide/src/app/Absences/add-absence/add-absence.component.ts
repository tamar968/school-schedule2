import { Component, OnInit, Input, ViewChild } from '@angular/core';
import { TeacherService } from 'src/app/services/teacher.service';
import { Router } from '@angular/router';
import { Absence } from './../../models/absence.model';
import { Teacher } from './../../models/teacher.model';
@Component({
  selector: 'app-add-absence',
  templateUrl: './add-absence.component.html',
  styleUrls: ['./add-absence.component.css']
})
export class AddAbsenceComponent implements OnInit {

  teacherId: number;
  fromDate: Date;
  toDate: Date;
  wholeDay: boolean;

  teachers:Teacher[];
  constructor(private teacherService:TeacherService, private router: Router) { }
 @Input() isChecked:boolean;
  ngOnInit() {
    this.teacherService.getTeachers()
    .subscribe(teachers=>
      this.teachers = teachers,
          err=>alert(err)
    );
  }
  get(){//TODO
    var absence = {
      TeacherId: this.teacherId,
      FromDate: this.fromDate,
      ToDate: this.toDate,
    } as Absence;
  }
}
