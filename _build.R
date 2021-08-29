#!/usr/bin/env Rscript

output_base_dir <- 'book-output'

bookdown::render_book("book")

for (f in dir('course_materials', recursive=T)) {
  if(grepl('.Rmd', f)) {
    read_file <- paste0('course_materials/', f)
    dirs <- unlist(strsplit(f, '/'))
    output_dir <- paste0(c(output_base_dir, dirs[-length(dirs)]), collapse='/')
    rmarkdown::render(read_file, 'bookdown::html_document2', output_dir=output_dir) 
    rmarkdown::render(read_file, 'bookdown::ioslides_presentation2', output_dir = paste0(output_dir, '/slides')) 
  }
}
