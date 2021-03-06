% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DBIResourceConnector.R
\docType{class}
\name{DBIResourceConnector}
\alias{DBIResourceConnector}
\title{DBI resource connector}
\format{A R6 object of class DBIResourceConnector}
\description{
Makes a DBI connection from a resource description, used in SQLResourceClient that is based on DBI.
}
\section{Methods}{


\code{$new()} Create new DBIResourceConnector instance.
\code{$isFor(resource)} Get a logical that indicates that the DBI connector is applicable to the provided resource object.
\code{$createDBIConnection(resource, ...)} Get the DBI connection object described by the provided resource.
\code{$closeDBIConnection(conn)} Release the DBI connection when done.
}

\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{DBIResourceConnector$new()}}
\item \href{#method-isFor}{\code{DBIResourceConnector$isFor()}}
\item \href{#method-createDBIConnection}{\code{DBIResourceConnector$createDBIConnection()}}
\item \href{#method-closeDBIConnection}{\code{DBIResourceConnector$closeDBIConnection()}}
\item \href{#method-clone}{\code{DBIResourceConnector$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\subsection{Method \code{new()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{DBIResourceConnector$new()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-isFor"></a>}}
\subsection{Method \code{isFor()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{DBIResourceConnector$isFor(resource)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-createDBIConnection"></a>}}
\subsection{Method \code{createDBIConnection()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{DBIResourceConnector$createDBIConnection(resource)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-closeDBIConnection"></a>}}
\subsection{Method \code{closeDBIConnection()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{DBIResourceConnector$closeDBIConnection(conn)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{DBIResourceConnector$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
