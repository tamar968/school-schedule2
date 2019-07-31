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
import { Layer } from 'src/app/models/layer.model';
import { FormControl, Validators, FormGroup } from '@angular/forms';

@Component({
  selector: 'app-add-occasion',
  templateUrl: './add-occasion.component.html',
  styleUrls: ['./add-occasion.component.css']
})
export class AddOccasionComponent implements OnInit {
 
  /*addOcassion:FormGroup;*/
//the settings for multiselect teachers
  dropdownList: Teacher[];
  selectedItems: Teacher[];
  dropdownSettings = {};
//the values for the server
  fromDate: Date;
  toDate: Date;
  typeId: number;
  dairyIDs: number[];
  classIDs: number[];
  teacherIDs: number[];
  roomIDs: number[];
//the values for the client
  occasionTypes: OccasionType[];
  layers: Layer[];
  classes: Class[];
  teachers: Teacher[];
  isCheckedLayers: boolean[];
  isCheckedClasses: boolean[];
  constructor(
    private occationService: OccasionService,
    private occationTypeService: OccasionTypeService,
    private classService: ClassService,
    private teacherService: TeacherService,
    private router: Router,
  ) { }

  ngOnInit() {
    
    /*this.addOcassion = new FormGroup({
      type: new FormControl(this.typeId,Validators.required),
      from: new FormControl(this.fromDate, Validators.required),
      to: new FormControl(this.toDate, [Validators.required,Validators.pattern('20[0-9]{2}-[0-1][0-9]-[0-3][0-9]')])
    });*/

    this.occationTypeService.getOccasionTypes()//get all the types occasion; for example:test,speach and etc.
      .subscribe(occasionType => {
        this.occasionTypes = occasionType;
        //console.log(this.occasionTypes);
      },
        err => console.error(err)
      );
    this.layers = [{ Id: 0, Name: 'כל המחזורים' }, { Id: 9, Name: 'ט' }, { Id: 10, Name: 'י' }, { Id: 11, Name: 'י"א' }, { Id: 12, Name: 'י"ב' }, { Id: 13, Name: 'י"ג' }, { Id: 14, Name: 'י"ד' }];

    this.teacherService.getTeachers()
      .subscribe(teachers => {
        this.teachers = teachers;
        //console.log(this.teachers);
        this.dropdownList = this.teachers;
        this.dropdownSettings = {
          singleSelection: false,
          idField: 'Id',
          textField: 'Name',
          selectAllText: 'כל המורות',
          unSelectAllText: 'אף מורה',
          itemsShowLimit: this.teachers.length,
          allowSearchFilter: true,
          searchPlaceholderText: 'חפוש'
        };
      },
        err => console.error(err)
      );
    this.isCheckedLayers = [];
    this.isCheckedClasses = [];

    this.dairyIDs = [];
    this.teacherIDs = [];
    this.roomIDs = [];
  }
  /*get type() { return this.addOcassion.get('type'); }
  get from() { return this.addOcassion.get('from'); }
  get to() { return this.addOcassion.get('to'); }*/

  onItemSelect(item: Teacher) {
    this.teacherIDs.push(item.Id);
    console.log(item);
  }
  onSelectAll(items: Teacher[]) {
    console.log(items);
  }

  onChooseLayer() {
    var layerIDs = [];
    for (const key in this.isCheckedLayers) {
      if (this.isCheckedLayers.hasOwnProperty(key)) {
        if (this.isCheckedLayers[key]) {
          layerIDs.push(key);
        }
      }
    }
    this.classService.getClassesByLayers(layerIDs)//get all the classes by the layers that had been chosen.
      .subscribe(classes => {
        this.classes = classes;
        //console.log(this.classes);
      },
        err => console.error(err)
      );
  }

  /*onClass(cls:number){
    this.classIDs.push(cls);
  }*/
  
  onAddOccasion() {
    this.classIDs = [];
    for (const key in this.isCheckedClasses) {//add the classes TOFIX! add the classes again
      if (this.isCheckedClasses.hasOwnProperty(key)) {
        if (this.isCheckedClasses[key]) {
          this.classIDs.push(Number(key));
        }
      }
    }
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
      OccasionType: this.typeId,
      Dairies: this.dairyIDs,
      Classes: this.classIDs,
      Rooms: this.roomIDs,
      Teachers: this.teacherIDs
    } as Occasion;
    console.log(occasion);
    return occasion;
  }
  arrayRemove(arr, value) {

    return arr.filter(function (elem) {
      return elem != value;
    });

  }
}


