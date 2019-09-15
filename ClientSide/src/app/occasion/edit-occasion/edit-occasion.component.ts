import { Component, OnInit } from '@angular/core';
import { Occasion } from 'src/app/models/occasion.model';
import { OccasionService } from 'src/app/services/occasion.service';
import { ActivatedRoute, Router } from '@angular/router';
import { OccasionTypeService } from 'src/app/services/occasion-type.service';
import { OccasionType } from 'src/app/models/occasion-type.model';
import { LessonHoursService } from 'src/app/services/lesson-hours.service';
import { SubjectService } from 'src/app/services/subject.service';
import { Subject } from 'src/app/models/subject.model';

@Component({
  selector: 'app-edit-occasion',
  templateUrl: './edit-occasion.component.html',
  styleUrls: ['./edit-occasion.component.css']
})
export class EditOccasionComponent implements OnInit {

  constructor(private activatedRoute: ActivatedRoute,
    private router: Router,
    private occService: OccasionService,
    private occTypeService: OccasionTypeService,
    private lessonsService: LessonHoursService,
    private subjectService: SubjectService) { }
  loaded = false;
  public occ = {} as Occasion;
  occTypes: OccasionType[] = [];
  hours: number[] = [];
  subjects: Subject[] = [];
  fromLsn: number;
  toLsn: number;

  ngOnInit() {
    this.occService.get(Number(this.activatedRoute.snapshot.params['number']))
      .subscribe(occ => {
        this.occ = occ;
        this.fromLsn = occ.FromLesson == null ? 0 : occ.FromLesson;
        this.toLsn = occ.ToLesson == null ? 0 : occ.ToLesson;
        console.log(`${this.fromLsn} ${this.toLsn}`)
        console.log(occ);
        this.hours = this.lessonsService.get();
        this.loaded = true;
        this.subjectService.getSubjects()
          .subscribe(data => {
            this.subjects = data;
          },
            err => console.error(err)
          );

        this.occTypeService.getOccasionTypes()
          .subscribe(occasionTypes => {
            this.occTypes = occasionTypes;
            this.occ.OccasionTypeName = this.occTypes.filter(ot => ot.Id === this.occ.OccasionType)[0].Name;
          },
            err => console.error(err)
          );
      }, err => console.error(err))

  }
  delete(id: number) {
    this.occService.delete(id)
      .subscribe(res => {
        console.log(`נמחק בהצלחה ${res}`);
        this.router.navigateByUrl('');
      }, err => console.error(err))
  }
  navigateToList() {
    this.router.navigate([`/occasion/occasion`]);
  }
}
