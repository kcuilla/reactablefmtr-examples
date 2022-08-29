library(reactablefmtr)
library(dplyr)
library(scales)

data <- data.frame(
  Indicator = c('Poorest',NA,NA,NA,NA,NA,NA,NA,NA,'Richest'),
  Starmer = c(1029,995,1040,1150,1018,1140,1110,1234,1320,1379),
  Sunak = c(429,505,430,327,241,195,154,112,93,83),
  Truss = c(92,124,146,183,214,265,298,360,425,936)
)

reactable(
  data,
  theme = no_lines(font_size = 20, header_font_size = 20, cell_padding = 2.5, centered = TRUE),
  defaultColDef = colDef(align = 'left', width = 300),
  columns = list(
    Indicator = colDef(name = '', width = 80),
    Starmer = colDef(cell = data_bars(data, fill_color = '#DC4134', background = '#F4F4F4', text_position = 'inside-base', bar_height = 32, number_fmt = scales::label_dollar(prefix = "+\u00A3", big.mark = ","))),
    Sunak = colDef(cell = data_bars(data, fill_color = '#756AA6', background = '#F4F4F4', text_position = 'inside-base', bar_height = 32, max_value = 1379, force_outside = c(0,241), number_fmt = scales::label_dollar(prefix = "+\u00A3", big.mark = ","))),
    Truss = colDef(cell = data_bars(data, fill_color = '#A7BFE1', background = '#F4F4F4', text_position = 'inside-base', bar_height = 32, max_value = 1379, force_outside = c(0,298), number_fmt = scales::label_dollar(prefix = "+\u00A3", big.mark = ",")))
  )) %>%
  add_title('Current plans are poorly targeted, meagre, or both', font_size = 41, font_color = '#262626', margin = reactablefmtr::margin(b = -4)) %>%
  add_subtitle("Effect of different proposals on households' disposable income this winter", font_size = 26, font_style = 'normal', font_color = '#535353', font_weight = 'normal', margin = reactablefmtr::margin(b = 22)) %>%
  add_source(html("Source: Resolution Foundation <img src='https://www.newstatesman.com/wp-content/uploads/sites/2/2021/09/TNS_master_logo.svg' alt='New Statesman Logo' width='130' height='40' style='vertical-align:middle;margin-left:520px'>"), font_size = 20, margin = reactablefmtr::margin(t=20), font_color = '#858585') %>%
  google_font("Jost")
