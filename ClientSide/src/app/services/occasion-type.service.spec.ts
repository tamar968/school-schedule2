import { TestBed } from '@angular/core/testing';

import { OccasionTypeService } from './occasion-type.service';

describe('OccasionTypeService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: OccasionTypeService = TestBed.get(OccasionTypeService);
    expect(service).toBeTruthy();
  });
});
