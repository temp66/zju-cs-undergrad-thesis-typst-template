#import "common.typ": *

= 绪论

== 背景

#text(font: "FangSong")[
  #breakable-str("××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××")]#multicite[@liu1957 @jixie1997 @engel1986 @ladayi1997 @tao1984]，
  #text(font: "FangSong")[#breakable-str("××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××")]

=== 节标题

#text(font: "FangSong")[
  #breakable-str("××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××")
]

== 节标题

= 正文

== 节标题

=== 节标题

#text(font: "FangSong")[
  #breakable-str("×××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××")
]

#figure(
  image("图2.1.png"),
  caption: text(font: "SimSun")[××××××××××],
)

#text(font: "FangSong")[#breakable-str("××××××××××××××××××××××××××××××××××××××××××××××××××××××")]

#figure(
  image("图2.2.jpg"),
  caption: text(font: "SimSun")[××××××××××],
)

$ "EQI" = sum_(i = 1)^n W_j dot r_(i j) $

$ "EHI" = L_1 dot "ESI" + L_2 dot "EQI" $

$ "EE" / "EHI" = beta_0 + beta_1 "PCG" + beta_2 "RGP" + dots.c + beta_i X_i + \ dots.c + beta_9 "ICWUR" + beta_10 "ECPG" + beta_11 "WCPG" + epsilon_i $

#linebreak()

#let x = text(font: "SimSun")[×]

#figure(
  table(
    columns: (1fr, 4fr),
    align: (x, y) => horizon + if x != 0 and y != 0 { left } else { center },
    hline.thick,
    table.header(x * 3)[特点],
    hline.thin,
    x * 3, x * 54,
    x * 3, x * 54,
    x * 3, x * 54,
    x * 3, x * 54,
    hline.thin,
  ),
  caption: x * 16,
)

#(x * 168)

#figure-continuation-header(
  continuation-header: [
    表2.2（续）#h(1em)#(x * 16)
  ],
  counter("table2.2"),
)[
  #figure(
    table(
      columns: (1fr, 4fr),
      align: (x, y) => horizon + if x != 0 and y != 0 { left } else { center },
      hline.thick,
      table.header[项目内容][特点],
      hline.thin,
      x * 3, x * 54,
      x * 3, x * 54,
      x * 3, x * 54,
      x * 3, x * 54,
      x * 3, x * 54,
      x * 3, x * 54,
      x * 3, x * 54,
      x * 3, x * 54,
      x * 3, x * 54,
      x * 3, x * 54,
      x * 3, x * 54,
      x * 3, x * 54,
      x * 3, x * 54,
      x * 3, x * 54,
      x * 3, x * 54,
      hline.thin,
    ),
    caption: x * 16,
  ) <cont-table>
]

=== 节标题

=

=

= 结论

#text(font: "FangSong")[
  #breakable-str("××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××")
]
