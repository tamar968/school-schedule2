import { Component, OnInit } from '@angular/core';
import { OccasionService } from 'src/app/services/occasion.service';
import { OccasionTypeService } from 'src/app/services/occasion-type.service';
import { Router } from '@angular/router';
import { Occasion } from 'src/app/models/occasion.model';
import { OccasionType } from 'src/app/models/occasion-type.model';

@Component({
  selector: 'app-add-occasion',
  templateUrl: './add-occasion.component.html',
  styleUrls: ['./add-occasion.component.css']
})
export class AddOccasionComponent implements OnInit {
    Id: number;
  FromDate: Date;
  ToDate: Date;
  TypeId:number;
  occasionTypes:OccasionType[];
  constructor(private occationService:OccasionService,private occationTypeService:OccasionTypeService,private router:Router) { }

  ngOnInit() {
    this.occationTypeService.getTypesOccasions()
    .subscribe(res=>
      this.occasionTypes = res,
      err=>console.error(err)
    );
  }

  onAddOccasion(){
  this.occationService.add(this.get()).subscribe(
    res=>{this.router.navigateByUrl('');
    console.log("הארוע נוסף בהצלחה")}
     ,
     err=>console.error(err)
    );
  }
  get(){
    var occasion = {
      Id: this.Id,
      FromDate: this.FromDate,
      ToDate: this.ToDate,
      OccasionType: this.TypeId
    }  as Occasion;
    console.log(occasion);
    return occasion;  
  }

}


