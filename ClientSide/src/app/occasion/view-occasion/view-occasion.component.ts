import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { OccasionService } from 'src/app/services/occasion.service';
import { Occasion } from 'src/app/models/occasion.model';
import { OccasionTypeService } from 'src/app/services/occasion-type.service';


@Component({
  selector: 'app-view-occasion',
  templateUrl: './view-occasion.component.html',
  styleUrls: ['./view-occasion.component.css']
})
export class ViewOccasionComponent implements OnInit {

  constructor(private activatedRoute:ActivatedRoute,private router:Router,private occTypesService:OccasionTypeService, private occService:OccasionService ) { }

occ:Occasion;
  ngOnInit() {
    
    this.occService.get(Number(this.activatedRoute.snapshot.params['number']))
    .subscribe(occ => {
      this.occ = occ;
      this.occTypesService.get(occ.OccasionType)
    .subscribe(occType => {
      this.occ.OccasionTypeName = occType.Name;
    },err=>console.error(err))
      console.log(occ);
    },err=>console.error(err))
  }
  navigateToList() {
    this.router.navigate([`/occasion/occasion`]);
  }
}
