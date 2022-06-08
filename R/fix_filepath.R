#' Fix a copied windows filepath
#'
#' @return Character vector that has a cleaned, modified windows file path replacing
#' all forward slashes with a single backslash so it can be recopied and pasted in
#' windows file explorer
#'
#' @export
#'
#' @examples \dontrun{
#' clipr::write_clip("C:\\Users\\Test", allow_non_interactive = TRUE)
#' fix_filepath()
#'}
fix_filepath <- function() {

  if(!interactive()) stop('Cannot use from non-interactive session')

  copied_filepath <- clipr::read_clip()

  if(grepl("\\\\", copied_filepath)) {
    fix_the_clip <- gsub("\\\\", "/", copied_filepath)

    return(fix_the_clip)
  } else {

    warning("Did you copy a windows file path? No double-forward slashes detected")

  }
}

fix_filepath_addin <- function() {

  if(!interactive()) stop('Cannot use from non-interactive session')

  copied_filepath <- clipr::read_clip()

  if(grepl("\\\\", copied_filepath)) {
    fix_the_clip <- gsub("\\\\", "/", copied_filepath)

    rstudioapi::insertText(paste0('"',fix_the_clip,'"'))
  } else {

    warning("Did you copy a windows file path? No double-forward slashes detected")

  }
}
