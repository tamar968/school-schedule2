import { TestBed } from '@angular/core/testing';

import { LoadDirService } from './load-dir.service';

describe('LoadDirService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: LoadDirService = TestBed.get(LoadDirService);
    expect(service).toBeTruthy();
  });
});
