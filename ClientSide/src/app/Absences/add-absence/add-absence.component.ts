import { Component, OnInit, Input } from '@angular/core';
import {Bootstrap} from 'bootstrap';
@Component({
  selector: 'app-add-absence',
  templateUrl: './add-absence.component.html',
  styleUrls: ['./add-absence.component.css']
})
export class AddAbsenceComponent implements OnInit {

  constructor() { }
 @Input() isChecked:boolean;
  ngOnInit() {
  }

}
