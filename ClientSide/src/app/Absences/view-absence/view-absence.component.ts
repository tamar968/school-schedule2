import { Component, OnInit } from '@angular/core';
import { AbsenceForTeacher } from 'src/app/models/absence-for-teacher.model';
import { ActivatedRoute, Router } from '@angular/router';
import { AbsenceForTeacherService } from 'src/app/services/absence-for-teacher.service';
import { TeacherService } from 'src/app/services/teacher.service';
import { AbsenceService } from 'src/app/services/absence.service';

@Component({
  selector: 'app-view-absence',
  templateUrl: './view-absence.component.html',
  styleUrls: ['./view-absence.component.css']
})
export class ViewAbsenceComponent implements OnInit {

  constructor(
    private aftService: AbsenceForTeacherService,
    private activatedRoute: ActivatedRoute,
    private router: Router,
    private teaService: TeacherService,
    private absTypeService: AbsenceService
  ) { }
  loaded = false;
  abs: AbsenceForTeacher = null;

  ngOnInit() {
    this.aftService.get(Number(this.activatedRoute.snapshot.params['number']))
      .subscribe(abs => {
        this.abs = abs;
        this.teaService.get(abs.TeacherId).subscribe(t => this.abs.TeacherName = t.Name, e => console.error(e));
        if (this.abs.TeacherStandIn)
          this.teaService.get(abs.TeacherStandIn).subscribe(t => this.abs.TeacherStandInName = t.Name, e => console.error(e));
        this.absTypeService.getAbsence(abs.Type).subscribe(t => this.abs.TypeName = t.Name, e => console.error(e));
      }, e => console.error(e))
    this.loaded = true;
  }
  navigateToList() {
    this.router.navigate([`absence-for-teacher/absences`]);
  }
}
