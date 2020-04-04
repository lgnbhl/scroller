## Making a hex sticker for BFS
library(hexSticker)
library(magick)
library(magrittr)

hexSticker::sticker("man/figures/scroller_logo.svg",
                    package = "scroller",
                    p_color = "black", 
                    p_size = 7.5,
                    p_y = 0.6, 
                    s_x = 1, 
                    s_y = 1.2, 
                    s_width = 0.36, 
                    h_size = 1, 
                    h_color = "black",
                    h_fill = "white",
                    filename="man/figures/logo_large.png")

# MOD with Gimp: removing red borders.

scroller <- magick::image_read("man/figures/logo_large.png")
magick::image_scale(scroller, "130") %>%
  magick::image_write(path = "man/figures/logo.png", format = "png")

