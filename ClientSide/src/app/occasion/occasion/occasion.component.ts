import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { OccasionService } from 'src/app/services/occasion.service';
import { Occasion } from 'src/app/models/occasion.model';
import { OccasionTypeService } from 'src/app/services/occasion-type.service';
import { OccasionType } from 'src/app/models/occasion-type.model';
import { ClassService } from 'src/app/services/class.service';
import { Class } from 'src/app/models/class.model';

@Component({
  selector: 'app-occasion',
  templateUrl: './occasion.component.html',
  styleUrls: ['./occasion.component.css']
})
export class OccasionComponent implements OnInit {

  constructor(public router: Router,private clsService:ClassService,private occService:OccasionService,private occTypesService:OccasionTypeService) { }
  loaded=false;
  occTypes:OccasionType[];
  occasions:Occasion[];
classes:Class[];
  ngOnInit() {
    this.occTypesService.getOccasionTypes()
    .subscribe(occTypes => {
      this.occTypes = occTypes;
      console.log(occTypes);
    },err=>console.error(err))
    
    this.clsService.getClasses()
        .subscribe(clss => {
          this.classes=clss;
          console.log(this.classes);
        },err=>console.error(err))

    this.occService.getall()
      .subscribe(occasions => {
        this.occasions = occasions;
        this.occasions.map(o=>o.OccasionTypeName=this.occTypes.filter(ot=>ot.Id===o.OccasionType)[0].Name);
        
        this.loaded=true;
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
