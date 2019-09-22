import { Component, OnInit } from '@angular/core';
import { ScheduleData } from '../models/schedule-data.model';
import { ScheduleService } from '../services/schedule.service';
import { Schedule } from '../models/schedule.model';
import { TeacherService } from '../services/teacher.service';
import { Teacher } from '../models/teacher.model';
import { ClassService } from '../services/class.service';

@Component({
  selector: 'app-schedule',
  templateUrl: './schedule.component.html',
  styleUrls: ['./schedule.component.css']
})
export class ScheduleComponent implements OnInit {

  data: ScheduleData;
  teacherId: number;
  teachers:Teacher[];
  clsId:number;
  layer: number;
  clsnum: number;
  classes: import("c:/workspace/school-schedule2/ClientSide/src/app/models/class.model").Class[];
  constructor(private schService: ScheduleService,
     private teacherService: TeacherService,
     private classService: ClassService) { }
  cells: Schedule[][];
  ngOnInit() {
    this.teacherService.getTeachers()
    .subscribe(teachers =>
      this.teachers = teachers,
      err => console.error(err)
    );
    this.classService.getClasses()
    .subscribe(
      cls=>this.classes = cls,
      err => console.error(err)
    );
    //this.classes
    this.teacherId = 1093;
    this.getScheduleByTeacher();
  }
  onChangeTeacher(e)
  {
    this.teacherId = e;
    console.log(this.teacherId);
    this.getScheduleByTeacher();

  }
  onChangeClass(e)
  {
    this.clsId = e;
    console.log(this.clsId);
    this.getScheduleByClass();

  }
  getScheduleByTeacher(){
    const layer = 10;
    const clsnum = 2;
    //const teacherId = 1242
    this.schService.getTeacher( this.teacherId,new Date).subscribe(
      d => {
        d.forEach(i => this.resizeArrayToN(i, 8, { TeacherName: '', RowSpan: 1, Color: 'white' } as Schedule));
        this.cells = d;
        console.log(d);
        this.data = {
          ColumnTitles: [
            'ראשון',
            'שני',
            'שלישי',
            'רביעי',
            'חמישי',
            'ששי'
          ],
          RowTitles: [
            'שעור 1',
            'שעור 2',
            'שעור 3',
            'שעור 4',
            'שעור 5',
            'שעור 6',
            'שעור 7',
            'שעור 8'
          ],
          Cells: this.cells
        };
      }
      , e => console.error(e)
    )
  }
  getScheduleByClass(){
    this.schService.getClassById(this.clsId).subscribe(
      d => {
        d.forEach(i => this.resizeArrayToN(i, 8, { TeacherName: '', RowSpan: 1, Color: 'white' } as Schedule));
        this.cells = d;
        console.log(d);
        this.data = {
          ColumnTitles: [
            'ראשון',
            'שני',
            'שלישי',
            'רביעי',
            'חמישי',
            'ששי'
          ],
          RowTitles: [
            'שעור 1',
            'שעור 2',
            'שעור 3',
            'שעור 4',
            'שעור 5',
            'שעור 6',
            'שעור 7',
            'שעור 8'
          ],
          Cells: this.cells
        };
      }
      , e => console.error(e)
    )
  }

  resizeArrayToN(a: Schedule[], n: number, o: Schedule) {
    let l = a.length;
    if (l < n) {
      for (let index = 0; l + index < n; index++) {
        a.push(o);
      }
    }
    else if (l > n) {
      for (let index = 0; index < l - n; index++) {
        a.pop();
      }
    }
    return a;
  }
}

