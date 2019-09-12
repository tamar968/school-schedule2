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
  onLoad() {
    console.log(this.currentInputFile);
    //TODO remove the file name from the path
    console.log(this.currentInputFile);
    debugger;
    this.loadDirService.onLoading(this.currentInputFile).subscribe(res => {
      this.clicked = true;
      this.success = true;
    }, err => {
      this.clicked = true;
      console.log(err)
    });
  }
}
