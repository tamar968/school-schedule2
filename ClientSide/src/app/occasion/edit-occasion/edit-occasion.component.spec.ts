import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EditOccasionComponent } from './edit-occasion.component';

describe('EditOccasionComponent', () => {
  let component: EditOccasionComponent;
  let fixture: ComponentFixture<EditOccasionComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EditOccasionComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EditOccasionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
