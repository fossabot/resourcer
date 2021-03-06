% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PostgresResourceConnector.R
\docType{class}
\name{PostgresResourceConnector}
\alias{PostgresResourceConnector}
\title{Postgres DBI resource connector}
\format{A R6 object of class PostgresResourceConnector}
\description{
Makes a Postgres DBI connection from a resource description.
}
\section{Methods}{


\code{$new()} Create new PostgresResourceConnector instance.
\code{$isFor(resource)} Get a logical that indicates that the DBI connector is applicable to the provided resource object.
\code{$createDBIConnection(resource, ...)} Get the DBI connection object described by the provided resource.
\code{$closeDBIConnection(conn)} Release the DBI connection when done.
}

\section{Super class}{
\code{\link[resourcer:DBIResourceConnector]{resourcer::DBIResourceConnector}} -> \code{PostgresResourceConnector}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{PostgresResourceConnector$new()}}
\item \href{#method-isFor}{\code{PostgresResourceConnector$isFor()}}
\item \href{#method-createDBIConnection}{\code{PostgresResourceConnector$createDBIConnection()}}
\item \href{#method-clone}{\code{PostgresResourceConnector$clone()}}
}
}
\if{html}{
\out{<details open ><summary>Inherited methods</summary>}
\itemize{
\item \out{<span class="pkg-link" data-pkg="resourcer" data-topic="DBIResourceConnector" data-id="closeDBIConnection">}\href{../../resourcer/html/DBIResourceConnector.html#method-closeDBIConnection}{\code{resourcer::DBIResourceConnector$closeDBIConnection()}}\out{</span>}
}
\out{</details>}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\subsection{Method \code{new()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{PostgresResourceConnector$new()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-isFor"></a>}}
\subsection{Method \code{isFor()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{PostgresResourceConnector$isFor(resource)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-createDBIConnection"></a>}}
\subsection{Method \code{createDBIConnection()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{PostgresResourceConnector$createDBIConnection(resource)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{PostgresResourceConnector$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
