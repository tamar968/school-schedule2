import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class LessonHoursService {

  constructor() { }
  private lessonHours:number[]=[1,2,3,4,5,6,7,8,9];
  public get() {
    return this.lessonHours;
  }
}
