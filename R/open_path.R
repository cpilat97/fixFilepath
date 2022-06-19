#' open_path.
#'
#' @return Open path will read a url, file path, directory label, etc.. from
#' your clipboard and open that for you. Just note, there's not much safety net
#' regarding checking for a valid url, file path, etc... because of the
#' variability that may be associated with them. The function will throw an error
#' in two cases: not used in an interactive session (ie trying to call from
#' command line) or if the path cannot be opened.
#' @export
#'
#' @examples \dontrun{
#' clipr::write_clip("C:\\Users\\Test")
#' open_path()
#'
#' clipr::write_clip("https://github.com/cpilat97/fixFilepath")
#' open_path()
#'}
open_path <- function() {
  if (!interactive()) {
    stop("This can only be used in an interactive session")
  } else {
    utils::browseURL(clipr::read_clip())
  }
}
