#import "common.typ": *

#let 封面(info) = {
  align(center)[
    #ZJU-calligraphy

    #v(10pt)

    #block[
      #show: with-cn-font-ht
      #show: zihao(-1)

      *本#space(1)科#space(1)生#space(1)毕#space(1)业#space(1)设#space(1)计*

      #v(15pt)

      *开题报告*

      #v(25pt)

      #ZJU-logo
    ]
  ]

  v(45pt)

  block(inset: (left: 2.85em), {
    show: zihao(3)
    show: strong

    let h = 12em
    grid(
      columns: 2,
      row-gutter: 2.27em,
      column-gutter: 1em,
      [学生姓名], context underline-width(h, info.学生姓名),
      [学生学号], context underline-width(h, info.学生学号),
      [指导教师], context underline-width(h, info.指导教师),
      [年级与专业], context underline-width(h, info.年级与专业),
      [所在学院], context underline-width(h, info.所在学院),
    )
  })
}

#let 指导教师的具体要求(题目, 指导教师对开题报告的具体要求) = [
  #[
    #show: zihao(4)
    #let spacing = spacing-for-size(4)
    #set par(leading: spacing, spacing: spacing, first-line-indent: 0em)

    *一、题目：*#题目

    *二、指导教师对开题报告的具体要求：*

    #block(height: 36em, 指导教师对开题报告的具体要求)
  ]

  #align(right)[
    #show: strong

    指导教师（签名）#h(6em)

    年#space(4)月#space(4)日#h(3.2em)
  ]
]

#let 目录 = {
  align(center)[
    #show: zihao(3)

    #block[*目#space(3)录*]
  ]

  show outline.entry: it => link(
    it.element.location(),
    it.indented(it.prefix(), gap: outline-gap, it.inner()),
  )
  show outline.entry.where(level: 1): with-cn-font-ht
  show outline.entry.where(level: 1): zihao(-4)
  show outline.entry.where(level: 2): with-cn-font-fs
  show outline.entry.where(level: 2): zihao(-4)
  show outline.entry.where(level: 3): with-cn-font-fs
  show outline.entry.where(level: 3): zihao(-4)
  outline(title: none)
}

#let 开题报告(开题报告正文, bib) = [
  = 开题报告

  #set heading(offset: 1)

  #show figure: show-figure.with(
    level: 2,
    numbering: (..nums) => {
      nums = nums.pos()
      nums = nums.slice(1)
      numbering("1.1", ..nums)
    },
  )

  #show: init-gb7714.with(bib)

  #开题报告正文

  #show: with-cn-font-st
  #show: zihao(5)
  #let spacing = 1em
  #set par(leading: spacing, spacing: spacing)

  = 参考文献

  #gb7714-bibliography(title: none)

  // (编写指南：
  // 1. 数量：开题报告、文献综述，应保证合理的参考文献数量；毕业论文（毕业设计报告），应该在开题报告所引用文献的基础上有合理的数量增加；
  // 2. 相关性：应涵盖本论文（报告）直接相关的重要文献；
  // 3. 时效性：应以近期文献为主，可引用历史上标志性的重要文献，近五年内的文献应占合理比例；
  // 4. 覆盖面：应包含国际、国内和论文（报告）相关的重要的、前沿的工作。
  // 顺序编码制格式示例如下。
  // 红色字部分，请在正式报告中删除）
]

#let 外文翻译_(外文翻译) = [
  = 外文翻译

  #pagebreak()

  #set page(header: none, footer: none, margin: 0pt)

  #外文翻译
]

#let 外文原文_(外文原文) = [
  #set page(header: none, footer: none)

  = 外文原文

  #pagebreak()

  #set page(margin: 0pt)

  #外文原文
]

#let 中期报告_(中期报告) = [
  = 中期报告

  #set heading(offset: 1)

  #show figure: show-figure.with(
    level: 2,
    numbering: (..nums) => {
      nums = nums.pos()
      nums = nums.slice(1)
      numbering("1.1", ..nums)
    },
  )

  #中期报告
]

#let template(
  info: (
    题目: [],
    学生姓名: [],
    学生学号: [],
    指导教师: [],
    年级与专业: [],
    所在学院: [],
  ),
  指导教师对开题报告的具体要求: [],
  开题报告正文: include("开题报告正文.typ"),
  bib: read("ref.bib"),
  外文翻译: [],
  外文原文: [],
  中期报告: [],
) = [

#show: styled.with(i-figured-reset-counter-level: 2)
#show heading.where(level: 1): it => {
  pagebreak(weak: true)

  it
}

#封面(info)

#pagebreak-one-sided()

#指导教师的具体要求(info.题目, 指导教师对开题报告的具体要求)

#pagebreak-one-sided()

#show: with-page-header.with(info.题目)
#counter(page).update(1)
#show: with-page-footer.with(numbering_: "I")

#目录

#pagebreak-one-sided()

#counter(page).update(1)
#show: with-page-footer

#show: with-heading-numbering-spaced.with((..nums) => {
  nums = nums.pos()
  nums = nums.slice(1)
  numbering("1.1", ..nums)
})
#show heading.where(level: 1): set heading(numbering: (..nums) => [
  #numbering("一、", ..nums)#h(-0.3em)
])
#show: with-heading-fonts
#show heading.where(level: 1): set align(center)
#show heading.where(depth: 1): set heading(supplement: "章")
#set heading(supplement: "节")

#开题报告(开题报告正文, bib)

#外文翻译_(外文翻译)

#外文原文_(外文原文)

#if 中期报告 != [] {
  中期报告_(中期报告)
}

]
