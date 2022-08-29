data <- data.frame(
  State = c('Kansas','Ohio','Pennsylvania','Idaho','Oklahoma','Alabama','Maine','Florida','North Carolina','New Mexico'),
  Before = c(0.49,0.47,0.49,0.49,0.48,0.49,0.51,0.50,0.51,0.46),
  After = c(0.65,0.54,0.56,0.55,0.51,0.52,0.53,0.52,0.52,0.47),
  Change = c(15.9,6.4,6.2,5.5,3.2,2.9,2.3,2.3,0.8,0.5)
)

library(reactablefmtr) #this script uses the dev version, please install with: remotes::install_github("kcuilla/reactablefmtr")
library(dplyr)
library(scales)

reactable(
  data,
  theme = nytimes(font_size = 15, header_font_size = 13, header_font_color = '#242424', font_color = '#2d2d2d', border_color = '#c0c0c0', border_width = '1.2px', cell_padding = 7, centered = TRUE),
  defaultColDef = colDef(headerVAlign = 'bottom', align = 'left', width = 65),
  columns = list(
    State = colDef(width = 125),
    Change = colDef(width = 260, cell = data_bars(data, fill_color = '#010101', background = 'transparent', text_position = 'outside-end', bar_height = 16, max_value = 23, number_fmt = function(value) { if(value == 15.9) {scales::label_number(accuracy = 0.1, prefix = '+', suffix = ' pts.')(value)} else scales::label_number(accuracy = 0.1, prefix = '+')(value)})),
    Before = colDef(name = 'Before <br> Leak', html = TRUE, cell = function(value) {scales::percent_format()(value)}),
    After = colDef(name = 'After <br> Dobbs', html = TRUE, align = 'center', cell = function(value) {scales::percent_format()(value)})
  )) %>%
  add_title(html("After Roe's End, Women Surged in <br> Signing Up to Vote in Some States"), font_size = 31, margin = reactablefmtr::margin(b = 16)) %>%
  add_subtitle("Women as a percentage of new registered voters", font_size = 16.5, word_spacing = 1, font_style = 'normal', font_weight = 'bold', font_color = '#7d7d7d', margin = reactablefmtr::margin(b = 20)) %>%
  add_source(html("Sources: L2, a nonpartisan voter data provider (Alabama, <br> Kansas, Maine, New Mexico and Oklahoma) and individual <br> Secretaries of State (Florida, Idaho, North Carolina, Ohio <br> and Pennsylvania) <img src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAAB7CAMAAABJqf7iAAAAYFBMVEX///8AAADDw8PGxsaqqqrn5+fr6+vT09Ofn5/8/Pyjo6M0NDTQ0NDX19fd3d14eHiTk5P19fViYmJQUFAvLy+FhYUODg5qampAQEBISEgqKiq1tbUiIiJYWFgWFhZvb2+HkLM3AAAC/UlEQVRoge2ZabOyIBSAQQ0XFJei3Hr7///yKsZiYstwauad4fmU1OWJ5Z5zIIQ8Ho/H4/F4PB6Px6Oo45ilv5KRJEo6PFbkV0KEBowxhxxgHVTN8Xgts9A2inLSncCGR/gZS860yh/HEcxvjDWMLPqH15x4vv6AaL2ByDi20FaF/kS3tB0AZJVNJoQ8J/Ocktu9IXOXhXsysVbH5tKM8unibuuf2dYcnWXB+zIA2+21ROG+KT+Q4einNvdocu8oYTVhQXZ9JiudZYut1986rk57NoDIJUbDzJa6iI42Gdvr4gPmENjoR5b01RQ/6uHy4DpByBAajQUZWtzJSU1D3irXmAClt0KNbZjCCtdvzEMMK1525TYFOeioWJJ8HomSpQMN7i8j2CohTRqSirQjgwXJKMbKBpFoTOpC7MJ+mbBDJaL+12zFkghEwi5k5PyWLV6qkmYuhnQ0+ZKN3csSVkdVgr9sq+nSe58lzMzk37HJqMHnOGixJcWzv/4QlbxFaNraBnyO4WyyxqGp1VaZw3Qmkp13yGYrl9fuWXtBlW/cZlOppwKRxXjd38pGqH66QQRmXShHW1uuHzCFiM06hQ1bG2Lq6HMFOeDgpzZEesB5RER3nthsqO70DnJGbxL7npySXyO/iDvGPrjabQg1+iCVuq2eYaN7NqNSGHJLH+9jzCQu9mw6B1C3dGDskuXk+dSWY8etadjoSxvFbrLVyTRY28JHW4JHR5t5n9CbNq5GJG25+3FxdRDm0jZmxla/2xgG+MczbVP0mm3dOnkuNhEynZN4udbl+PZ4mBG2ZQ5cZWKCDJpttJhsNZcz7Uqz1tFNDTIc5D0YQPF1wA+0qwKyzi8yyXXuMts917ktsyAMwyDix1E3h6/7egPrKXtL87qndzCLnX3OUAU6e+dmbQCSTbrXo4PK3zPk1drBVK+S1Hrdq4CqzBVxu+tqAQ85isG+emeA62Qreblx0eibv+LkiT7n9zfw2wsbhE0A/bTh8Xg8Ho/H4/F4PP8rfytOHPV99KhDAAAAAElFTkSuQmCC' width='55' height='65' style='opacity:0.3;position:absolute;margin-top:-30px;margin-left:350px'>"), margin = reactablefmtr::margin(t=20), font_size = 14.5, font_color = '#7d7d7d') %>%
  google_font("Noto Serif Telugu")


