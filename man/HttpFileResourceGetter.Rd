% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/HttpFileResourceGetter.R
\docType{class}
\name{HttpFileResourceGetter}
\alias{HttpFileResourceGetter}
\title{HTTP file resource getter}
\format{A R6 object of class HttpFileResourceGetter}
\description{
Access a file that is stored at a HTTP(S) address. Use Basic authentication header if both
resource's identity and secret are defined.
}
\section{Methods}{


\code{$new(resource)} Create new HttpFileResourceGetter instance from provided resource object.
\code{$isFor(resource)} Get a logical that indicates that the file getter is applicable to the provided resource object.
\code{$downloadFile(resource)} Get the file described by the provided resource. Release the connection when done.
}

\section{Super class}{
\code{\link[resourcer:FileResourceGetter]{resourcer::FileResourceGetter}} -> \code{HttpFileResourceGetter}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{HttpFileResourceGetter$new()}}
\item \href{#method-isFor}{\code{HttpFileResourceGetter$isFor()}}
\item \href{#method-downloadFile}{\code{HttpFileResourceGetter$downloadFile()}}
\item \href{#method-clone}{\code{HttpFileResourceGetter$clone()}}
}
}
\if{html}{
\out{<details open ><summary>Inherited methods</summary>}
\itemize{
\item \out{<span class="pkg-link" data-pkg="resourcer" data-topic="FileResourceGetter" data-id="extractFileName">}\href{../../resourcer/html/FileResourceGetter.html#method-extractFileName}{\code{resourcer::FileResourceGetter$extractFileName()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="resourcer" data-topic="FileResourceGetter" data-id="getFileObject">}\href{../../resourcer/html/FileResourceGetter.html#method-getFileObject}{\code{resourcer::FileResourceGetter$getFileObject()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="resourcer" data-topic="FileResourceGetter" data-id="makeDownloadDir">}\href{../../resourcer/html/FileResourceGetter.html#method-makeDownloadDir}{\code{resourcer::FileResourceGetter$makeDownloadDir()}}\out{</span>}
}
\out{</details>}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\subsection{Method \code{new()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{HttpFileResourceGetter$new()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-isFor"></a>}}
\subsection{Method \code{isFor()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{HttpFileResourceGetter$isFor(resource)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-downloadFile"></a>}}
\subsection{Method \code{downloadFile()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{HttpFileResourceGetter$downloadFile(resource, ...)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{HttpFileResourceGetter$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
