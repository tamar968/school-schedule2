import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { OccasionService } from 'src/app/services/occasion.service';
import { Occasion } from 'src/app/models/occasion.model';

@Component({
  selector: 'app-occasion',
  templateUrl: './occasion.component.html',
  styleUrls: ['./occasion.component.css']
})
export class OccasionComponent implements OnInit {

  constructor(public router: Router,private occService:OccasionService) { }
  occasions:Occasion[];

  ngOnInit() {
    this.occService.getall()
      .subscribe(occasions => {
        this.occasions = occasions;
      },err=>console.error(err))
  }
  navigateToAdd() {
    this.router.navigate(['/occasion/add']);
  }
}
