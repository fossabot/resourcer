#' R data file resource client
#'
#' Connects to a R data file and loads it in a controlled environment.
#'
#' @docType class
#' @format A R6 object of class TidyFileResourceClient
#' @import R6
#' @export
RDataFileResourceClient <- R6::R6Class(
  "RDataFileResourceClient",
  inherit = FileResourceClient,
  public = list(
    initialize = function(resource) {
      super$initialize(resource)
    },
    asDataFrame = function(...) {
      private$ensureSymbol()
      # TODO as.data.frame parameters
      private$eval(paste0("as.data.frame(", private$.symbol, ")"))
    },
    getValue = function() {
      private$ensureSymbol()
      if (is.null(private$.symbol)) {
        NULL
      } else {
        get(private$.symbol, envir = private$.env)
      }
    }
  ),
  private = list(
    .env = NULL,
    .symbol = NULL,
    eval = function(text) {
      eval(expr = parse(text = text), envir = private$.env)
    },
    ensureSymbol = function() {
      if (is.null(private$.env)) {
        path <- super$downloadFile()
        resource <- super$getResource()
        format <- resource$format
        private$.env <- new.env()
        load(path, envir = private$.env)
        symbols <- ls(envir = private$.env)

        # preferred symbol is the one with same name as resource (and the expected format/class)
        if (resource$name %in% symbols) {
          if (format %in% private$eval(paste0("class(", resource$name, ")"))) {
            private$.symbol <- resource$name
          }
        }

        # if symbol not assigned yet, look for first symbol with expected format/class
        if (is.null(private$.symbol)) {
          for (i in 1:length(symbols)) {
            if (is.null(private$.symbol)) {
              symbol <- symbols[[i]]
              if (format %in% private$eval(paste0("class(", symbol, ")"))) {
                private$.symbol <- symbol
              }
            }
          }
        }

        if (is.null(private$.symbol)) {
          stop("Cannot find a symbol with expected format/class: ", format)
        }
      }
    }
  )
)
