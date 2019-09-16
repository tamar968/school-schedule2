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
  currentInputFile;

  ngOnInit() {
  }
  fileEvent(fileInput) {
    console.log(fileInput);
     this.currentInputFile = fileInput.target.files[0].path;
    console.log(this.currentInputFile);
    debugger;

    let fileName = this.currentInputFile.name;
  }
  onLoad() {
    console.log(this.currentInputFile);
    //TODO remove the file name from the path
    console.log(this.currentInputFile);
    this.loadDirService.onLoading(this.currentInputFile).subscribe(res => {
      this.clicked = true;
      this.success = true;
    }, err => {
      this.clicked = true;
      console.log(err)
    });
  }
}
