#' Fix a copied windows filepath
#'
#' @return Character vector that has a cleaned, modified windows file path replacing
#' all forward slashes with a single backslash so it can be recopied and pasted in
#' windows file explorer
#'
#' @export
#'
#' @examples \dontrun{
#' clipr::write_clip("C:\\Users\\Test")
#' fix_filepath()
#'}
fix_filepath <- function() {

  #Stop the run if this is being called in a non-interactive session.
  if(!interactive()) stop('Cannot use from non-interactive session')

  #Copy in what's on the clipboard.
  copied_filepath <- clipr::read_clip()

  #So long as theres dual slashes (\\) detected the code will run. Clipr auto
  #changes a single \ to dual \\ otherwise a warning is thrown. This is pretty
  #low level. But given the flexibility in the types of file paths that can be
  #copied, i didn't want to build in too much checks other than making sure there
  #are slashes (indicating a file path).
  if(grepl("\\\\", copied_filepath)) {
    #take the copied filepath and swith the double forward slashes (\\) to a single
    #backslash (/)
    fix_the_clip <- gsub("\\\\", "/", copied_filepath)
    fix_the_clip <- gsub("^\"|\"$", "", copied_filepath)

    #returns the value
    return(fix_the_clip)
  } else {

    #Throw an error if the copied filepath fails the rather low level check
    #that's above. But, just incase you didn't copy a file path and copied
    #something else, an error will be thrown.
    errorCondition(message = "Did you copy a windows file path? No
                   double-forward slashes detected")

  }
}

fix_filepath_addin <- function() {
  #This is more or less the same as above, but is meant to be used for the add-in
  #were rather than returning the object, this uses the rstudioapi package to
  #read in the copied data and paste it as a character vector in the R text editor.

  if(!interactive()) stop('Cannot use from non-interactive session')

  copied_filepath <- clipr::read_clip()

  if(grepl("\\\\", copied_filepath)) {
    fix_the_clip <- gsub("\\\\", "/", copied_filepath)

    rstudioapi::insertText(paste0('"',fix_the_clip,'"'))
  } else {

    errorCondition(message = "Did you copy a windows file path? No
                   double-forward slashes detected")

  }
}
