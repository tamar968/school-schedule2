import { TestBed } from '@angular/core/testing';

import { OccasionService } from './occasion.service';

describe('OccasionService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: OccasionService = TestBed.get(OccasionService);
    expect(service).toBeTruthy();
  });
});
