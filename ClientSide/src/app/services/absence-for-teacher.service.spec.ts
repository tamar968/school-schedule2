import { TestBed } from '@angular/core/testing';

import { AbsenceForTeacherService } from './absence-for-teacher.service';

describe('AbsenceForTeacherService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: AbsenceForTeacherService = TestBed.get(AbsenceForTeacherService);
    expect(service).toBeTruthy();
  });
});
