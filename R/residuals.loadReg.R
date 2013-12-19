#'Extract Model Residuals
#'
#'Extract the residuals of a load regression.
#'
#'The value for \code{type} can be any one of the following:
#'\tabular{ll}{ Value \tab Description\cr
#'"working" \tab Residuals with censored residuals replaced by their expected
#'values\cr
#'"response" \tab Residuals from the linear predictor\cr
#'"influence" \tab An estimate of Cook's D values based on "working"
#'residuals\cr
#'"leverage" \tab The hat diagonals\cr
#'"S-L" \tab The square-root of the absolute value of the residuals with
#'censored residuals replaced by their expected value\cr }
#'Also, any other value of \code{type} for \code{\link{residuals.survreg}}
#'can be used to obtain those residuals. Note that "working" and "response"
#'are defined in the table above, in keeping with older versions of
#'\code{loadReg}.
#'
#'@param object an object of class "loadReg"---output from \code{loadReg}
#'@param type The type of residuals, see \bold{Details}.
#'@param suppress.na.action logical, suppress the effects of the
#'\code{na.action} in the call to \code{loadReg} and return only the fitted
#'values corresponding to the fitted data.
#'@param \dots further arguments passed to or from other methods.
#'@return The residuals from the regression as specified by \code{type}.
#'@note The residuals from the load regression are the same as those from 
#'the concentration regression, so there is no option to distinguish
#'among those models.
#'@seealso \code{\link{loadReg}}
#'@keywords regression
#'@S3method residuals loadReg
#'@method residuals loadReg
residuals.loadReg <- function(object , type="working",
                              suppress.na.action=FALSE, ...) {
  ## Coding history:
  ##    2013Jun19 DLLorenz Initial Coding
  ##
  ## Extract the load model and 
  object <- object$lfit
  return(residuals(object, type=type, 
                   subsetppress.na.action=suppress.na.action))
}