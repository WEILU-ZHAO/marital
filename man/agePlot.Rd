% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/agePlot.R
\name{agePlot}
\alias{agePlot}
\title{agePlot Plot the age by estimate plot}
\usage{
agePlot(county_name, sex, ms)
}
\arguments{
\item{county_name}{the county name in Florida, choice are "Alachua",
"Baker",        "Bay",          "Bradford",
"Brevard",      "Broward",      "Calhoun",
"Charlotte",   "Citrus",       "Clay",
"Collier",      "Columbia",    "DeSoto",
"Dixie",        "Duval",        "Escambia",
"Flagler",      "Franklin",     "Gadsden",
"Gilchrist",   "Glades",       "Gulf",
"Hamilton",     "Hardee",      "Hendry",
"Hernando",     "Highlands",    "Hillsborough",
"Holmes",       "Indian River", "Jackson",
"Jefferson",   "Lafayette",    "Lake",
"Lee",          "Leon",        "Levy",
"Liberty",      "Madison",      "Manatee",
"Marion",       "Martin",       "Miami-Dade",
"Monroe",      "Nassau",       "Okaloosa",
"Okeechobee",   "Orange",      "Osceola",
"Palm Beach",   "Pasco",        "Pinellas",
"Polk",         "Putnam",       "Santa Rosa",
"Sarasota",    "Seminole",     "St. Johns",
"St. Lucie",    "Sumter",      "Suwannee",
"Taylor",       "Union",       "Volusia",
"Wakulla",      "Walton",       "Washington"}

\item{sex}{Gender choice are "Female" and "Male"}

\item{ms}{Marital status choice are  "Never married","Married",
"Married, spouse absent", "Married, other", "Widowed", "Divorced"}
}
\description{
agePlot Plot the age by estimate plot
}
\examples{
agePlot("Miami-Dade","Male", "Never married")
agePlot("Alachua",  "Female", "Divorced")

}
