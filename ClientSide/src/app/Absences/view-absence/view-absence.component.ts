import { Component, OnInit } from '@angular/core';
import { AbsenceForTeacher } from 'src/app/models/absence-for-teacher.model';
import { ActivatedRoute, Router } from '@angular/router';
import { AbsenceForTeacherService } from 'src/app/services/absence-for-teacher.service';

@Component({
  selector: 'app-view-absence',
  templateUrl: './view-absence.component.html',
  styleUrls: ['./view-absence.component.css']
})
export class ViewAbsenceComponent implements OnInit {

  constructor(private aftService: AbsenceForTeacherService, private activatedRoute: ActivatedRoute,private router:Router) { }
  loaded = false;
  abs: AbsenceForTeacher;

  ngOnInit() {
    this.aftService.get(Number(this.activatedRoute.snapshot.params['number']))
      .subscribe(abs => this.abs = abs,e=>console.error(e))
    //console.log(this.activeRoute.params["id"]);
    //console.log(this.activeRoute.snapshot.params['username']);
    //this.activeRoute.params.subscribe(params => {console.log(params['username'])})
    this.loaded = true;
  }
navigateToList(){
  this.router.navigate([`absence-for-teacher/absences`]);
}
}
