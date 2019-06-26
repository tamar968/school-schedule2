import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { StudyTimeComponent } from './study-time.component';

describe('StudyTimeComponent', () => {
  let component: StudyTimeComponent;
  let fixture: ComponentFixture<StudyTimeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ StudyTimeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(StudyTimeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
