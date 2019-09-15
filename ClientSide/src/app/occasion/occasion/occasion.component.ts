import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { OccasionService } from 'src/app/services/occasion.service';
import { Occasion } from 'src/app/models/occasion.model';
import { OccasionTypeService } from 'src/app/services/occasion-type.service';
import { OccasionType } from 'src/app/models/occasion-type.model';

@Component({
  selector: 'app-occasion',
  templateUrl: './occasion.component.html',
  styleUrls: ['./occasion.component.css']
})
export class OccasionComponent implements OnInit {

  constructor(public router: Router,private occService:OccasionService,private occTypesService:OccasionTypeService) { }
  
  occTypes:OccasionType[];
  occasions:Occasion[];

  ngOnInit() {
    this.occTypesService.getOccasionTypes()
    .subscribe(occTypes => {
      this.occTypes = occTypes;
    },err=>console.error(err))
    this.occService.getall()
      .subscribe(occasions => {
        this.occasions = occasions;
      },err=>console.error(err))
  }
  navigateToAdd() {
    this.router.navigate([`/occasion/add`]);
  }
  navigateToEdit(id:number){
    this.router.navigate([`/occasion/edit/${id}`]);
  }
  navigateToView(id:number){
    this.router.navigate([`/occasion/view/${id}`]);
  }
}
