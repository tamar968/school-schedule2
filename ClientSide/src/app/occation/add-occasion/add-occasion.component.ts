import { Component, OnInit } from '@angular/core';
import { OccasionService } from 'src/app/services/occasion.service';
import { OccasionTypeService } from 'src/app/services/occasion-type.service';
import { Router } from '@angular/router';
import { Occasion } from 'src/app/models/occasion.model';
import { OccasionType } from 'src/app/models/occasion-type.model';
import { Class } from 'src/app/models/class.model';
import { ClassService } from 'src/app/services/class.service';
import { Teacher } from 'src/app/models/teacher.model';
import { TeacherService } from 'src/app/services/teacher.service';

@Component({
  selector: 'app-add-occasion',
  templateUrl: './add-occasion.component.html',
  styleUrls: ['./add-occasion.component.css']
})
export class AddOccasionComponent implements OnInit {
  dropdownList: Teacher[];
  selectedItems: Teacher[];
  dropdownSettings = {};

  fromDate: Date;
  toDate: Date;
  typeId: number;

  occasionTypes: OccasionType[];
  grades: Class[];
  teachers: Teacher[];

  constructor(
    private occationService: OccasionService,
    private occationTypeService: OccasionTypeService,
    private classService: ClassService,
    private teacherService: TeacherService,
    private router: Router
  ) { }

  ngOnInit() {
    this.occationTypeService.getOccasionTypes()
      .subscribe(occasionType => {
        this.occasionTypes = occasionType;
        //console.log(this.occasionTypes);
      },
        err => console.error(err)
      );
    this.classService.getClasss()
      .subscribe(grades => {
        this.grades = grades;
        //console.log(this.grades);
      },
        err => console.error(err)
      );
    this.teacherService.getTeachers()
      .subscribe(teachers => {
        this.teachers = teachers;
        console.log(this.teachers);
        this.dropdownList = this.teachers;
        this.dropdownSettings = {
          singleSelection: false,
          idField: 'Id',
          textField: 'Name',
          selectAllText: 'כל המורות',
          unSelectAllText: 'אף מורה',
          itemsShowLimit: this.teachers.length,
          allowSearchFilter: true,
          searchPlaceholderText	:'חפוש'
        };
      },
        err => console.error(err)
      );

  }
  onItemSelect(item: Teacher) {
    console.log(item);
  }
  onSelectAll(items: Teacher) {
    console.log(items);
  }


  onAddOccasion() {
    this.occationService.add(this.get()).subscribe(
      res => {
        this.router.navigateByUrl('');
        console.log("הארוע נוסף בהצלחה")
      }
      ,
      err => console.error(err)
    );
  }
  get() {
    var occasion = {
      FromDate: this.fromDate,
      ToDate: this.toDate,
      OccasionType: this.typeId
    } as Occasion;
    console.log(occasion);
    return occasion;
  }

}


