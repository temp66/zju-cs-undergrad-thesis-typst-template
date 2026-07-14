#import "@preview/cuti:0.4.0": show-cn-fakebold
#import "@preview/i-figured:0.2.4": reset-counters, show-equation, show-figure
#import "@preview/pointless-size:0.1.2": zihao
#import "gb7714-bilingual/lib.typ": init-gb7714, gb7714-bibliography, multicite

#let with-cn-font(cn-font, body) = {
  set text(font: ("Times New Roman", cn-font))

  body
}

#let with-cn-font-st(body) = {
  show: with-cn-font.with("SimSun")

  body
}

#let with-cn-font-ht(body) = {
  show: with-cn-font.with("SimHei")

  body
}

#let with-cn-font-fs(body) = {
  show: with-cn-font.with("FangSong")

  body
}

#let underline-width(width, body) = layout(container-size => {
  let abs-width = measure(width: container-size.width, box(width: width)).width
  let body-width = measure(body).width

  let body = if body == [] {
    [~]
  } else {
    body
  }
  box(width: width, align(center, underline(body, extent: (abs-width - body-width) / 2)))
})

#let spacing-for-size(size) = if size == -4 {
  1.29em
} else if size == 4 {
  1.55em
}

#let ZJU-calligraphy = scale(73.5%, image("ZJU-calligraphy.gif"))

#let ZJU-logo = image("ZJU-logo.png")

#let space(n) = h(0.5em * n)

#let breakable-str(s) = [#s.clusters().intersperse(sym.zws).join()]

#let breakable-raw(s) = raw(s.clusters().intersperse(sym.zws).join())

#let page-top-gap = 24pt
#let page-bottom-gap = 24pt

#let suppress-page-counter() = counter(page).update(n => n - 1)

#let with-page-header(title, body) = {
  set page(
    header: {
      show: with-cn-font-st
      show: zihao(-5)

      context if calc.rem(here().page(), 2) == 1 {
        align(right, block(title))
      } else {
        align(left, block[浙江大学本科生毕业论文（设计）])
      }
      v(4pt)
      place(bottom, line(length: 100%, stroke: 0.5pt))
    },
    header-ascent: page-top-gap,
  )

  body
}

#let with-page-footer(numbering_: "1", body) = {
  set page(
    footer: align(center, {
      show: zihao(-5)

      block(context numbering(numbering_, ..counter(page).get()))
    }),
    footer-descent: page-bottom-gap + 9pt,
  )

  body
}

#let pagebreak-one-sided() = {
  pagebreak()
  context if calc.rem(here().page(), 2) == 0 {
    suppress-page-counter()
  }
  set page(header: none, footer: none)
  pagebreak(to: "odd", weak: true)
}

#let with-heading-fonts(body) = {
  show heading.where(level: 1): with-cn-font-fs
  show heading.where(level: 1): zihao(3)
  show heading.where(level: 2): with-cn-font-fs
  show heading.where(level: 2): zihao(-3)
  show heading: with-cn-font-fs
  show heading: zihao(4)

  body
}

#let with-heading-numbering-spaced(numbering_, body) = {
  set heading(numbering: (..nums) => [
    #numbering(numbering_, ..nums)#h(0.2em)
  ])

  body
}

#let appendix-heading(body) = context {
  counter(heading).step()
  let num = [附录#numbering("A", ..counter(heading).get())]

  heading(outlined: false)[
    #num\
    #body
  ]

  show heading: none
  heading[#num#space(1)#body]
}

#let outline-gap = 0.4em

#let hline = (thick: table.hline(stroke: 1.5pt), thin: table.hline(stroke: 0.75pt))

// Use with caution!
// Ensure that the continuation header is consistent with the figure caption.
#let figure-continuation-header(continuation-header: none, gap: 0.65em, counter, fig) = {
  show figure: set block(breakable: true)

  show <continuation-header>: it => {
    counter.step()
    context if counter.get().first() != 1 {
      show: with-cn-font-st
      show: zihao(5)
      show: strong

      it
    }
  }

  grid(
    grid.header[
      #[#align(center, continuation-header) #v(gap)]
      <continuation-header>
    ],
    fig,
  )
}

#let counter-figure-linebreak() = v(-2.2em)

#let init-gb7714_ = init-gb7714
#let init-gb7714(version: "2015", ..args) = init-gb7714_(version: version, ..args)

#let gb7714-bibliography_ = gb7714-bibliography
#let gb7714-bibliography(full: true, ..args) = gb7714-bibliography_(full: full, ..args)

#let styled(page-settings: true, i-figured-reset-counter-level: 1, body) = {
  // show block: set text(green.darken(60%))
  // show par: set text(blue.darken(60%))

  set text(lang: "zh")

  show: with-cn-font-fs
  show: zihao(-4)
  show: show-cn-fakebold
  set underline(evade: false, offset: 0.109em, stroke: 1pt)

  let spacing = spacing-for-size(-4)
  set par(justify: true, first-line-indent: (amount: 2em, all: true), leading: spacing, spacing: spacing)

  set page(margin: (x: 1.25in, top: 1in + page-top-gap, bottom: 1in + page-bottom-gap)) if page-settings

  show heading: set block(spacing: spacing)

  set outline(depth: 3)
  show outline: with-cn-font-fs
  show outline: set block(spacing: 1.4em)

  set table(stroke: none, align: horizon)

  show figure: with-cn-font-st
  show figure: zihao(5)
  show figure.caption: strong
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: raw): set figure.caption(position: top)
  show figure: set block(spacing: 1em)
  show figure: set par(leading: 1em, spacing: 1em)
  // Must be before `show-figure`.
  show figure: it => {
    block(spacing: spacing, it)
    linebreak()
  }
  show math.equation: show-equation.with(numbering: "(1-1)")
  show heading: reset-counters.with(level: i-figured-reset-counter-level)

  // set bibliography(full: true, style: "gb-7714-2015-numeric")

  show ref: it => {
    if not (it.element != none and it.element.func() == heading) {
      return it
    }
    let it-heading = it.element
    link(it.target, if it-heading.numbering != none {
      [第#context (it-heading.numbering)(..counter(heading).at(it-heading.location()))#it-heading.supplement]
    } else {
      [附录#context numbering("A", ..counter(heading).at(it-heading.location()))]
    })
  }

  set enum(
    full: true,
    numbering: (..nums) => {
      nums = nums.pos()
      if nums.len() == 1 {
        numbering("（1）", ..nums)
      } else if nums.len() == 2 {
        numbering("①", nums.at(1))
      } else {
        panic()
      }
    },
  )

  body
}
