import { TestBed } from '@angular/core/testing';

import { StudyTimeService } from './study-time.service';

describe('StudyTimeService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: StudyTimeService = TestBed.get(StudyTimeService);
    expect(service).toBeTruthy();
  });
});
