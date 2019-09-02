import { Component, OnInit } from '@angular/core';
import { ScheduleData } from '../models/schedule-data.model';

@Component({
  selector: 'app-schedule',
  templateUrl: './schedule.component.html',
  styleUrls: ['./schedule.component.css']
})
export class ScheduleComponent implements OnInit {

  data: ScheduleData;
  constructor() { }

  ngOnInit() {
    this.data = {
      ColumnTitles: [
        'Sunday',
        'Monday',
        'Tuesday'
      ],
      RowTitles: [
        'Lesson 1',
        'Lesson 2',
        'Lesson 3'
      ],
      Cells: [
        [
          {
            SubTitle: 'Sara',
            EventTitle: 'Math',
            Color: '002057',
            RowSpan: 2,
            EditUrl: 'login'
          }, {
            SubTitle: 'Sara',
            EventTitle: 'Math',
            Color: '002057',
            RowSpan: 1,
            EditUrl: 'login'
          }, {
            SubTitle: 'Sara',
            EventTitle: 'Math',
            Color: '002057',
            RowSpan: 1,
            EditUrl: 'login'
          },
        ],
        [
          {
            SubTitle: 'Sara',
            EventTitle: 'Math',
            Color: '002057',
            RowSpan: 1,
            EditUrl: 'login'
          }, {
            SubTitle: 'Sara',
            EventTitle: 'Math',
            Color: '002057',
            RowSpan: 1,
            EditUrl: 'login'
          }, {
            SubTitle: 'Sara',
            EventTitle: 'Math',
            Color: '002057',
            RowSpan: 1,
            EditUrl: 'login'
          },
        ],
        [
          {
            SubTitle: 'Sara',
            EventTitle: 'Math',
            Color: '002057',
            RowSpan: 1,
            EditUrl: 'login'
          }, {
            SubTitle: 'Sara',
            EventTitle: 'Math',
            Color: '002057',
            RowSpan: 1,
            EditUrl: 'login'
          }, {
            SubTitle: 'Sara',
            EventTitle: 'Math',
            Color: '002057',
            RowSpan: 1,
            EditUrl: 'login'
          },
        ]
      ]
    };
  }

}
