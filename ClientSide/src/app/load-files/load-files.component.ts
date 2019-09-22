import { Component, OnInit } from '@angular/core';
import { LoadDirService } from '../services/load-dir.service';

@Component({
  selector: 'app-load-files',
  templateUrl: './load-files.component.html',
  styleUrls: ['./load-files.component.css']
})
export class LoadFilesComponent implements OnInit {

  constructor(private loadDirService: LoadDirService) { }
  success = false;
  clicked = false;
  currentDirFiles = '';

  ngOnInit() {
  }
  dirEvent(dirInput) {
    console.log(dirInput);
    this.currentDirFiles = dirInput.currentTarget.value;
  }
  onLoad() {
    //TODO remove the file name from the path
    console.log(this.currentDirFiles);
    this.loadDirService.onLoading(this.currentDirFiles)
      .subscribe(res => {
        this.clicked = true;
        this.success = true;
      }, err => {
        this.clicked = true;
        console.log(err)
      });
  }
}
