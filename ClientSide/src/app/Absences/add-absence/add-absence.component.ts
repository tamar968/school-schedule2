import { Component, OnInit, Input, ViewChild } from '@angular/core';
import { TeacherService } from '../../services/teacher.service';
import { AbsenceService } from '../../services/absence.service';
import { Router } from '@angular/router';
import { Absence } from './../../models/absence.model';
import { Teacher } from './../../models/teacher.model';
import { AbsenceForTeacher} from './../../models/absence-for-teacher.model';
import { AbsenceForTeacherService } from '../../services/absence-for-teacher.service';
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
  absenceTypes:Absence[];

  constructor(private absenceService:AbsenceService, private teacherService:TeacherService,private absenceForTeacherService:AbsenceForTeacherService,private router: Router) { }

  ngOnInit() {
    this.teacherService.getTeachers()
    .subscribe(teachers=>
      this.teachers = teachers,
      err=>console.error(err)
    );
    this.absenceService.getAbsences().
    subscribe(absenceTypes=>
      this.absenceTypes=absenceTypes,
      err=>console.error(err)
      );
       }
  onAddAbsence(){
  
  this.absenceForTeacherService.add(this.get()).subscribe(
        res=>{this.router.navigateByUrl('');
        alert("onAddAbsence")}
         ,
         err=>console.error(err)
        );
  
  }
  
  get(){//TODO
    var absence = {
      TeacherId: this.teacherId,
      FromDate: this.fromDate,
      ToDate: this.toDate,
    } as AbsenceForTeacher;
   
    console.log(absence);
    return absence;  
  }
}
