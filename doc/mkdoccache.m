#!/usr/bin/env octave
# run make_doc_cache

dirs = argv();
if isempty(dirs)
  error ("Expected at least one path")
endif

printf("Creating doc cache ...\n");
for idx = 1:length(dirs)
  printf(" processing %s\n", dirs{idx});
   addpath(dirs{idx})
  doc_cache_create (fullfile (dirs{idx}, "doc-cache"), dirs{idx});
endfor
printf("Done!\n");

%!test
% # no tests
