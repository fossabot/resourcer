# Resource R

[![Build Status](https://travis-ci.com/obiba/resourcer.svg?branch=master)](https://travis-ci.com/obiba/resourcer)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/resourcer)](https://cran.r-project.org/package=resourcer)
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fobiba%2Fresourcer.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Fobiba%2Fresourcer?ref=badge_shield)

The `resourcer` package is meant for accessing resources identified by a URL in a uniform way whether it references a dataset (stored in a file, a SQL table, a MongoDB collection etc.) or a computation unit (system commands, web services etc.). Usually some credentials will be defined, and an additional data format information can be provided to help dataset coercing to a data.frame object.

The main concepts are:

* _Resource_, access to a resource (dataset or computation unit) is described by an object with URL, optional credentials and optional data format properties,
* _ResourceResolver_, a _ResourceClient_ factory based on the URL scheme and available in a resolvers registry,
* _ResourceClient_, realizes the connection with the dataset or the computation unit described by a _Resource_,
* _FileResourceGetter_, connect to a file described by a resource,
* _DBIResourceConnector_, establish a [DBI](https://www.r-dbi.org/) connection.

## File Resources

These are resources describing a file. If the file is in a remote location, it must be downloaded before being read. The data format specification of the resource helps to find the appropriate file reader.

### File Getter

The supported file locations are: 

* `file` (local file system), 
* `http`(s) (web address, basic authentication), 
* `gridfs` (MongoDB file store), 
* `s3` or `aws` (Amazon Web Services S3 file store), 
* `scp` (file copy through SSH),
* `opal` (Opal file store). 

This can be easily applied to other file locations by extending the _FileResourceGetter_ class. An instance of the new file resource getter is to be registered so that the _FileResourceResolver_ can operate as expected.

```
registerFileResourceGetter(MyFileLocationResourceGetter()$new())
```

### File Data Format

The data format specified within the _Resource_ object, helps at finding the appropriate file reader. Currently supported data formats are:

* the data formats that have a reader in [tidyverse](https://www.tidyverse.org/): [readr](https://readr.tidyverse.org/) (`csv`, `csv2`, `tsv`, `ssv`, `delim`), [haven](https://haven.tidyverse.org/) (`spss`, `sav`, `por`, `dta`, `stata`, `sas`, `xpt`), [readxl](https://readxl.tidyverse.org/) (`excel`, `xls`, `xlsx`). This can be easily applied to other data file formats by extending the _FileResourceClient_ class.
* the R data format that can be loaded in a child R environment from which object of interest will be retrieved.

Usage example that reads a local SPSS file:

```r
# make a SPSS file resource
res <- resourcer::newResource(
  name = "CNSIM1",
  url = "file:///data/CNSIM1.sav",
  format = "spss"
)

# coerce the csv file in the opal server to a data.frame
df <- as.data.frame(res)
```

To support other file data format, extend the _FileResourceClient_ class with the new data format reader implementation. Associate factory class, an extension of the _ResourceResolver_ class is also to be implemented and registered.

```
registerResourceResolver(MyFileFormatResourceResolver$new())
```

## Database Resources

### DBI Connectors

[DBI](https://www.r-dbi.org/) is a set of virtual classes that are are used to abstract the SQL database connections and operations within R. Then any DBI implementation can be used to access to a SQL table. Which DBI connector to be used is an information that can be extracted from the scheme part of the resource's URL. For instance a resource URL starting with `postgres://` will require the [RPostgres](https://rpostgres.r-dbi.org/) driver. To separate the DBI connector instanciation from the DBI interface interactions in the _SQLResourceClient_, a _DBIResourceConnector_ registry is to be populated. The currently supported SQL database connectors are:

* `mariadb` MariaDB connector,
* `mysql` MySQL connector,
* `postgres` or `postgresql` Postgres connector,
* `presto`, `presto+http` or `presto+https` [Presto](https://prestodb.io/) connector,
* `spark`, `spark+http` or `spark+https` [Spark](https://spark.apache.org/) connector.

To support another SQL database having a DBI driver, extend the _DBIResourceConnector_ class and register it:

```
registerDBIResourceConnector(MyDBResourceConnector$new())
```

### Use dplyr

Having the data stored in the database allows to handle large (common SQL databases) to big (PrestoDB, Spark) datasets using [dplyr](https://dplyr.tidyverse.org/) which will delegate as much as possible operations to the database.

### Document Databases

NoSQL databases can be described by a resource. The [nodbi](https://docs.ropensci.org/nodbi/) can be used here. Currently only connection to MongoDB database is supported using URL scheme `mongodb` or `mongodb+srv`.

## Computation Resources

Computation resources are resources on which tasks/commands can be triggerred and from which resulting data can be retrieved.

Example of computation resource that connects to a server through SSH:

```r
# make an application resource on a ssh server
res <- resourcer::newResource(
  name = "supercomp1",
  url = "ssh://server1.example.org/work/dir?exec=plink,ls",
  identity = "sshaccountid",
  secret = "sshaccountpwd"
)

# get ssh client from resource object
client <- resourcer::newResourceClient(res) # does a ssh::ssh_connect()

# execute commands
files <- client$exec("ls") # exec 'cd /work/dir && ls'

# release connection
client$close() # does ssh::ssh_disconnect(session)
```

## Extending Resources

There are several ways to extend the Resources handling. These are based on different R6 classes having a `isFor(resource)` function:

* If the resource is a file located at a place not already handled, write a new _FileResourceGetter_ subclass and register an instance of it with the function `registerFileResourceGetter()`.
* If the resource is a SQL engine having a DBI connector defined, write a new _DBIResourceConnector_ subclass and register an instance of it with the function `registerDBIResourceConnector()`.
* If the resource is in a domain specific web application or database, write a new _ResourceResolver_ subclass and register an instance of it with the function `registerResourceResolver()`. This _ResourceResolver_ object will create the appropriate _ResourceClient_ object that matches your needs.

The design of the URL that will describe your new resource should not overlap an existing one, otherwise the different registries will return the first instance for which the `isFor(resource)` is `TRUE`. In order to distinguish resource locations, the URL's scheme can be extended, for instance the scheme for accessing a file in a Opal server is `opal+https` so that the credentials be applied as needed by Opal.



## License
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fobiba%2Fresourcer.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Fobiba%2Fresourcer?ref=badge_large)