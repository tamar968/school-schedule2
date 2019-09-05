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
        'ראשון',
        'שני',
        'שלישי',
        'רביעי',
        'חמישי',
        'ששי'
      ],
      RowTitles: [
        'שעור 1',
        'שעור 2',
        'שעור 3',
        'שעור 4',
        'שעור 5',
        'שעור 6'
      ],
      Cells: [
        [
          {
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 2,
            EditUrl: 'login'
          }, {
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          },{
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          },{
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          },{
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          },
        ],
        [
          {
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          }, {
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          }, {
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          },{
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 2,
            EditUrl: 'login'
          }, {
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          },
        ],
        [
          {
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          }, {
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          }, {
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          },
          {SubTitle: 'שרה',
          EventTitle: 'מתמטיקה',
          Color: 'ccffcc',
          RowSpan: 1,
          EditUrl: 'login'
        }, {
          SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
          Color: 'ccffcc',
          RowSpan: 1,
          EditUrl: 'login'
        }, {
          SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
          Color: 'ccffcc',
          RowSpan: 1,
          EditUrl: 'login'
        },
        ],
        [
          {
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          }, {
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          },{
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 3,
            EditUrl: 'login'
          },{
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          },
        ],[
          {
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          }, {
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          },{
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          },{
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          },{
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          },{
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          }
        ],[
          {
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          }, {
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          },{
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          },{
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          },{
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          },{
            SubTitle: 'שרה',
            EventTitle: 'מתמטיקה',
            Color: 'ccffcc',
            RowSpan: 1,
            EditUrl: 'login'
          }
        ],
      ]
    };
  }

}
