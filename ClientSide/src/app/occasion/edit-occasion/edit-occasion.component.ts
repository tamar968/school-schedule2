import { Component, OnInit } from '@angular/core';
import { Occasion } from 'src/app/models/occasion.model';
import { OccasionService } from 'src/app/services/occasion.service';
import { ActivatedRoute, Router } from '@angular/router';
import { OccasionTypeService } from 'src/app/services/occasion-type.service';
import { OccasionType } from 'src/app/models/occasion-type.model';

@Component({
  selector: 'app-edit-occasion',
  templateUrl: './edit-occasion.component.html',
  styleUrls: ['./edit-occasion.component.css']
})
export class EditOccasionComponent implements OnInit {

  constructor(private activatedRoute: ActivatedRoute, private router: Router, private occService: OccasionService, private occTypeService: OccasionTypeService) { }

  occ: Occasion;
  occTypes: OccasionType[];

  ngOnInit() {
    this.occService.get(Number(this.activatedRoute.snapshot.params['number']))
      .subscribe(occ => {
        this.occ = occ;
        console.log(occ); this.occTypeService.getOccasionTypes()
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
