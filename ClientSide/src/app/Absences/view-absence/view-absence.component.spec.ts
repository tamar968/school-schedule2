import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewAbsenceComponent } from './view-absence.component';

describe('ViewAbsenceComponent', () => {
  let component: ViewAbsenceComponent;
  let fixture: ComponentFixture<ViewAbsenceComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ViewAbsenceComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ViewAbsenceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
