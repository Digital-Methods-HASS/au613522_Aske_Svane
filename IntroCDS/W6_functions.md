Load packages and data
======================

    library(pacman)

    ## Warning: package 'pacman' was built under R version 3.6.3

    p_load(tidyverse, gapminder)

    # gapminder as df
    d <- gapminder

1. Define a defensive function that calculates the Gross Domestic Product of a nation from the data available in the gapminder dataset. Using that function, calculate the GDP of Denmark in the following years: 1967, 1977, 1987, 1997, 2007, and 2017.
=========================================================================================================================================================================================================================================================

    # Create function
    calcGDP <- function(data, country = NULL, year = NULL){
      
      
      if (!is.na(country)){
        data <- data[data$country %in% country, ]
        # if 'country' is not NA, subset all rows with that or those countries
      }
      
      if (!is.na(year)){
        data <- data[data$year %in% year, ]
      }
      
      gdp <- data$gdpPercap * data$pop
      
      new = cbind(data, gdp)
      
      return(new)
      
    }

    # Create empty df and make a list of years
    DK <- d[0,]
    years <- c(1967, 1977, 1987, 1997, 2007)

    # loop thorugh all years and gather in a single df
    for (i in 1:length(years)){

      new <- calcGDP(d, "Denmark", years[i])
      
      if (length(DK) == 0){
        DK <- new
      } else{
        DK <- rbind(DK, new)
      }

    }

    # The results
    DK

    ##   country continent year lifeExp     pop gdpPercap          gdp
    ## 1 Denmark    Europe 1967  72.960 4838800  15937.21  77116977700
    ## 2 Denmark    Europe 1977  74.690 5088419  20422.90 103920280028
    ## 3 Denmark    Europe 1987  74.800 5127024  25116.18 128771236166
    ## 4 Denmark    Europe 1997  76.110 5283663  29804.35 157476118456
    ## 5 Denmark    Europe 2007  78.332 5468120  35278.42 192906627081

2. Write a script that loops over each country in the gapminder dataset, tests whether the country starts with a ‘B’ , and print out whether the life expectancy is smaller than 50, between 50 and 70, or greater than 70.
===========================================================================================================================================================================================================================

    # one column df with countries on the list in 2007 (newest)
    countries <- d %>% filter(year == 2007)

    list <- as.list(countries[,1])
    list <- list[["country"]]
    length(list)

    ## [1] 142

    # Loop through all countries (existing in 2007) and print information
    for (i in 1:length(list)){
      
      x <- list[i]
      first <- substr(x, start = 1, stop = 1)
      
      if (isTRUE(first == "B") == TRUE){
        sentence1 <- paste("The first letter of the country", x, "is B.")
      } else {
        sentence1 <- paste("The first letter of the country", x, "is not B.")
      }

      if (countries$lifeExp[i] <= 50){
        sentence2 <- paste("In", x, "the life expectancy was under 50 years in 2007.")
      
      } else if (countries$lifeExp[i] >= 70){
        sentence2 <- paste("In", x, "the life expectancy was greater than 70 years in 2007.")
      
      } else {
        sentence2 <- paste("In", x, "the life expectancy was between 50 and 70 years in 2007.")
      
      }

      print(paste(sentence1,sentence2))
      
    }

    ## [1] "The first letter of the country Afghanistan is not B. In Afghanistan the life expectancy was under 50 years in 2007."
    ## [1] "The first letter of the country Albania is not B. In Albania the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Algeria is not B. In Algeria the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Angola is not B. In Angola the life expectancy was under 50 years in 2007."
    ## [1] "The first letter of the country Argentina is not B. In Argentina the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Australia is not B. In Australia the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Austria is not B. In Austria the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Bahrain is B. In Bahrain the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Bangladesh is B. In Bangladesh the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Belgium is B. In Belgium the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Benin is B. In Benin the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Bolivia is B. In Bolivia the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Bosnia and Herzegovina is B. In Bosnia and Herzegovina the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Botswana is B. In Botswana the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Brazil is B. In Brazil the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Bulgaria is B. In Bulgaria the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Burkina Faso is B. In Burkina Faso the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Burundi is B. In Burundi the life expectancy was under 50 years in 2007."
    ## [1] "The first letter of the country Cambodia is not B. In Cambodia the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Cameroon is not B. In Cameroon the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Canada is not B. In Canada the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Central African Republic is not B. In Central African Republic the life expectancy was under 50 years in 2007."
    ## [1] "The first letter of the country Chad is not B. In Chad the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Chile is not B. In Chile the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country China is not B. In China the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Colombia is not B. In Colombia the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Comoros is not B. In Comoros the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Congo, Dem. Rep. is not B. In Congo, Dem. Rep. the life expectancy was under 50 years in 2007."
    ## [1] "The first letter of the country Congo, Rep. is not B. In Congo, Rep. the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Costa Rica is not B. In Costa Rica the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Cote d'Ivoire is not B. In Cote d'Ivoire the life expectancy was under 50 years in 2007."
    ## [1] "The first letter of the country Croatia is not B. In Croatia the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Cuba is not B. In Cuba the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Czech Republic is not B. In Czech Republic the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Denmark is not B. In Denmark the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Djibouti is not B. In Djibouti the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Dominican Republic is not B. In Dominican Republic the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Ecuador is not B. In Ecuador the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Egypt is not B. In Egypt the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country El Salvador is not B. In El Salvador the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Equatorial Guinea is not B. In Equatorial Guinea the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Eritrea is not B. In Eritrea the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Ethiopia is not B. In Ethiopia the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Finland is not B. In Finland the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country France is not B. In France the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Gabon is not B. In Gabon the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Gambia is not B. In Gambia the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Germany is not B. In Germany the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Ghana is not B. In Ghana the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Greece is not B. In Greece the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Guatemala is not B. In Guatemala the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Guinea is not B. In Guinea the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Guinea-Bissau is not B. In Guinea-Bissau the life expectancy was under 50 years in 2007."
    ## [1] "The first letter of the country Haiti is not B. In Haiti the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Honduras is not B. In Honduras the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Hong Kong, China is not B. In Hong Kong, China the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Hungary is not B. In Hungary the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Iceland is not B. In Iceland the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country India is not B. In India the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Indonesia is not B. In Indonesia the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Iran is not B. In Iran the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Iraq is not B. In Iraq the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Ireland is not B. In Ireland the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Israel is not B. In Israel the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Italy is not B. In Italy the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Jamaica is not B. In Jamaica the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Japan is not B. In Japan the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Jordan is not B. In Jordan the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Kenya is not B. In Kenya the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Korea, Dem. Rep. is not B. In Korea, Dem. Rep. the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Korea, Rep. is not B. In Korea, Rep. the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Kuwait is not B. In Kuwait the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Lebanon is not B. In Lebanon the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Lesotho is not B. In Lesotho the life expectancy was under 50 years in 2007."
    ## [1] "The first letter of the country Liberia is not B. In Liberia the life expectancy was under 50 years in 2007."
    ## [1] "The first letter of the country Libya is not B. In Libya the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Madagascar is not B. In Madagascar the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Malawi is not B. In Malawi the life expectancy was under 50 years in 2007."
    ## [1] "The first letter of the country Malaysia is not B. In Malaysia the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Mali is not B. In Mali the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Mauritania is not B. In Mauritania the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Mauritius is not B. In Mauritius the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Mexico is not B. In Mexico the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Mongolia is not B. In Mongolia the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Montenegro is not B. In Montenegro the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Morocco is not B. In Morocco the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Mozambique is not B. In Mozambique the life expectancy was under 50 years in 2007."
    ## [1] "The first letter of the country Myanmar is not B. In Myanmar the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Namibia is not B. In Namibia the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Nepal is not B. In Nepal the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Netherlands is not B. In Netherlands the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country New Zealand is not B. In New Zealand the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Nicaragua is not B. In Nicaragua the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Niger is not B. In Niger the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Nigeria is not B. In Nigeria the life expectancy was under 50 years in 2007."
    ## [1] "The first letter of the country Norway is not B. In Norway the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Oman is not B. In Oman the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Pakistan is not B. In Pakistan the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Panama is not B. In Panama the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Paraguay is not B. In Paraguay the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Peru is not B. In Peru the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Philippines is not B. In Philippines the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Poland is not B. In Poland the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Portugal is not B. In Portugal the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Puerto Rico is not B. In Puerto Rico the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Reunion is not B. In Reunion the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Romania is not B. In Romania the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Rwanda is not B. In Rwanda the life expectancy was under 50 years in 2007."
    ## [1] "The first letter of the country Sao Tome and Principe is not B. In Sao Tome and Principe the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Saudi Arabia is not B. In Saudi Arabia the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Senegal is not B. In Senegal the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Serbia is not B. In Serbia the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Sierra Leone is not B. In Sierra Leone the life expectancy was under 50 years in 2007."
    ## [1] "The first letter of the country Singapore is not B. In Singapore the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Slovak Republic is not B. In Slovak Republic the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Slovenia is not B. In Slovenia the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Somalia is not B. In Somalia the life expectancy was under 50 years in 2007."
    ## [1] "The first letter of the country South Africa is not B. In South Africa the life expectancy was under 50 years in 2007."
    ## [1] "The first letter of the country Spain is not B. In Spain the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Sri Lanka is not B. In Sri Lanka the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Sudan is not B. In Sudan the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Swaziland is not B. In Swaziland the life expectancy was under 50 years in 2007."
    ## [1] "The first letter of the country Sweden is not B. In Sweden the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Switzerland is not B. In Switzerland the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Syria is not B. In Syria the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Taiwan is not B. In Taiwan the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Tanzania is not B. In Tanzania the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Thailand is not B. In Thailand the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Togo is not B. In Togo the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Trinidad and Tobago is not B. In Trinidad and Tobago the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Tunisia is not B. In Tunisia the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Turkey is not B. In Turkey the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Uganda is not B. In Uganda the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country United Kingdom is not B. In United Kingdom the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country United States is not B. In United States the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Uruguay is not B. In Uruguay the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Venezuela is not B. In Venezuela the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Vietnam is not B. In Vietnam the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country West Bank and Gaza is not B. In West Bank and Gaza the life expectancy was greater than 70 years in 2007."
    ## [1] "The first letter of the country Yemen, Rep. is not B. In Yemen, Rep. the life expectancy was between 50 and 70 years in 2007."
    ## [1] "The first letter of the country Zambia is not B. In Zambia the life expectancy was under 50 years in 2007."
    ## [1] "The first letter of the country Zimbabwe is not B. In Zimbabwe the life expectancy was under 50 years in 2007."
