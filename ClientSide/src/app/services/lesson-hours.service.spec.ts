import { TestBed } from '@angular/core/testing';

import { LessonHoursService } from './lesson-hours.service';

describe('LessonHoursService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: LessonHoursService = TestBed.get(LessonHoursService);
    expect(service).toBeTruthy();
  });
});
