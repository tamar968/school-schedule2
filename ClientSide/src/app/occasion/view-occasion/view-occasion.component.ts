import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { OccasionService } from 'src/app/services/occasion.service';
import { Occasion } from 'src/app/models/occasion.model';


@Component({
  selector: 'app-view-occasion',
  templateUrl: './view-occasion.component.html',
  styleUrls: ['./view-occasion.component.css']
})
export class ViewOccasionComponent implements OnInit {

  constructor(private activatedRoute:ActivatedRoute,private occService:OccasionService ) { }

occ:Occasion;

  ngOnInit() {
    this.occService.get(Number(this.activatedRoute.snapshot.params['number']))
    .subscribe(occ => {
      this.occ = occ;
      console.log(occ);
    },err=>console.error(err))
  }

}
