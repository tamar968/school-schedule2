import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { OccasionService } from 'src/app/services/occasion.service';
import { Occasion } from 'src/app/models/occasion.model';
import { OccasionTypeService } from 'src/app/services/occasion-type.service';
import { SubjectService } from 'src/app/services/subject.service';
import { Subject } from 'src/app/models/subject.model';
import { Class } from 'src/app/models/class.model';
import { Teacher } from 'src/app/models/teacher.model';
import { TeacherService } from 'src/app/services/teacher.service';
import { ClassService } from 'src/app/services/class.service';


@Component({
  selector: 'app-view-occasion',
  templateUrl: './view-occasion.component.html',
  styleUrls: ['./view-occasion.component.css']
})
export class ViewOccasionComponent implements OnInit {

  constructor(
    private activatedRoute: ActivatedRoute,
    private router: Router,
    private occTypesService: OccasionTypeService,
    private occService: OccasionService,
    private subService: SubjectService,
    private clsService: ClassService,
    private teaService: TeacherService

  ) { }
  loaded = false;
  private occ: Occasion;
  //dairies: 
  private classes: Class[] = [];
  //rooms: 
  private teachers: Teacher[] = [];

  ngOnInit() {

    this.occService.get(Number(this.activatedRoute.snapshot.params['number']))
      .subscribe(occ => {
        this.occ = occ;
        this.occTypesService.get(occ.OccasionType)
          .subscribe(occType => {
            this.occ.OccasionTypeName = occType.Name;
          }, err => console.error(err))
        if (occ.Subject != null) {
          this.subService.getSubjects().subscribe(s => {
            this.occ.SubjectName = s.filter(s1 => s1.Id === this.occ.Subject)[0].Name;
            console.log(occ.SubjectName);
          }, e => console.error(e))
        }
        this.clsService.getClasses().subscribe(clss => {
          this.occ.Classes.forEach(c => this.classes.push(clss.filter(cl => cl.Id === c)[0]));
        }, e => console.error(e));
        this.teaService.getTeachers().subscribe(teachers => {
          this.occ.Teachers.forEach(t => this.teachers.push(teachers.filter(t1 => t1.Id === t)[0]));
        }, e => console.error(e));
        console.log(occ);
        this.loaded = true;
      }, err => console.error(err))

  }
  navigateToList() {
    this.router.navigate([`occasion/occasion`]);
  }
}
