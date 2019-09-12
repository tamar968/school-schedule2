import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-occasion',
  templateUrl: './occasion.component.html',
  styleUrls: ['./occasion.component.css']
})
export class OccasionComponent implements OnInit {

  constructor(public router: Router) { }

  ngOnInit() {
  }
  navigateToAdd() {
    this.router.navigate(['/occasion/add']);
  }
}
