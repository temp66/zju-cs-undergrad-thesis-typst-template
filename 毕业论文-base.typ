#import "common.typ": *

#let make-part(up, down) = {
  set page(header: none, footer: none)

  v(-162pt)

  set align(horizon + center)

  block[
    #show: with-cn-font-ht
    #set text(48pt)
    #up
  ]

  v(60pt)

  block[
    #show: with-cn-font-fs
    #show: zihao("-0")
    #show: strong
    #down
  ]
}

#let 封面(info) = {
  v(-15.5pt)

  align(right, block[
    #set text(font: "SimSun")
    #show: zihao(5)

    *涉密论文*#space(1)#sym.ballot#space(2.3)*公开论文*#space(1)#sym.ballot.check.heavy#space(3)
  ])

  align(center)[
    #v(25.5pt)

    #ZJU-calligraphy

    #v(32.5pt)

    #block[
      #show: with-cn-font-ht
      #show: zihao(1)
      *本#space(1)科#space(1)生#space(1)毕#space(1)业#space(1)论#space(1)文（设计）*
    ]

    #v(16pt)

    #ZJU-logo
  ]

  v(14.5pt)

  block(inset: (left: 3.5em))[
    #show: zihao(3)
    #show: strong

    #grid(
      columns: 2,
      column-gutter: 1em,
      [题目], context underline-width(90%, info.题目),
    )

    #v(57pt)

    #{
      let h = 15em
      grid(
        columns: 2,
        row-gutter: 1.25em,
        column-gutter: 1em,
        [学生姓名], underline-width(h, info.学生姓名),
        [学生学号], underline-width(h, info.学生学号),
        [指导教师], underline-width(h, info.指导教师),
        [年级与专业], underline-width(h, info.年级与专业),
        [所在学院], underline-width(h, info.所在学院),
        [~], [], // To preserve height
        [提交日期], underline-width(h, info.提交日期),
      )
    }
  ]
}

#let 毕业论文原创性声明 = {
  let date = [签字日期：#space(5)年#space(3)月#space(3)日]

  let spacing = spacing-for-size(4)
  set par(leading: spacing, spacing: spacing)

  let v0 = 0.4em

  v(-5pt)

  align(center)[
    #show: zihao(3)

    #block[*毕业论文（设计）原创性声明*]
  ]

  v(v0)

  [
    #show: zihao(4)

    本人郑重声明：所呈交的毕业论文（设计）是本人在导师的指导下，严格按照学校和学院有关规定完成的，不存在学术不端行为。除#[
      #show: with-cn-font.with("FangSong")
      文中特别加以标注和致谢的地方外
    ]，本论文（设计）不包含其他个人或集体已经发表或撰写过的研究成果，也不包含为获得#underline[* 浙江大学 *]或其他教育机构的学位或证书而使用过的材料。对本研究做出贡献的个人和集体，均已在文中明确说明并表示谢意。

    #align(right)[
      毕业论文（设计）作者签名：#hide[#space(5)年#space(3)月#space(3)日]

      #date
    ]
  ]

  v(44pt)

  align(center)[
    #show: zihao(3)

    #block[*毕业论文（设计）使用授权书*]
  ]

  v(v0)

  [
    #show: zihao(4)

    本人完全了解#underline[ *浙江大学* ]有权保留并向国家有关部门或机构送交本论文（设计）的复印件和电子版，允许本论文（设计）被查阅和借阅。本人授权#underline[ *浙江大学* ]可以将本论文（设计）的全部或部分内容编入有关数据库进行检索和传播，可以采用影印、缩印或扫描等复制手段保存、汇编本论文（设计）。

    （涉密毕业论文（设计）在解密后适用本授权书。）

    #[
      #linebreak()

      #set par(first-line-indent: 0em)

      毕业论文（设计）作者签名：#h(1fr) 导师签名：#h(1fr)

      #date #h(1fr) #date
    ]
  ]
}

#let 致谢_(v0, 致谢) = {
  align(center)[
    #show: zihao(3)

    #v(v0)

    #block[*致#space(2)谢*]
  ]

  致谢
}

#let 摘要_(v0, 摘要) = {
  align(center)[
    #show: zihao(3)

    #v(v0)

    #block[*摘#space(2)要（中文）*]
  ]

  摘要
}

#let Abstract_(v0, Abstract) = {
  align(center)[
    #show: zihao(3)

    #v(v0)

    #block[*Abstract （英文）*]
  ]

  Abstract
}

#let 目录(v0, type, 外文翻译起始页码, 外文原文起始页码, 中期报告起始页码) = {
  align(center)[
    #show: zihao(3)

    #v(v0)

    #block[*目#space(2)录*]
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
  outline(
    title: block[
      #show: zihao(4)
      *第一部分#space(2)毕业论文（设计）*
    ],
    target: selector(heading).before(<end-of-first-part-numbered>),
  )

  if type != "电子版" {
    show outline.entry: it => link(
      it.element.location(),
      it.indented(it.prefix(), gap: outline-gap)[#it.body() #box(width: 1fr, it.fill)],
    )
    show outline.entry.where(level: 1): with-cn-font-ht
    show outline.entry.where(level: 1): zihao(-4)
    outline(
      title: none,
      target: selector(heading).after(<end-of-first-part-numbered>, inclusive: false).before(<end-of-first-part>),
    )

    if type != "答辩" {
      block(spacing: 1.8em)[
        #show: zihao(4)
        *第二部分#space(2)开题报告和中期报告*
      ]

      show: zihao(-4)
      
      let fill = box(width: 1fr, repeat(gap: 0.15em)[.])

      block[
        #show: with-cn-font-ht
        开题报告和中期报告封面 #fill
      ]

      block[
        #show: with-cn-font-ht
        指导教师对开题报告具体内容要求 #fill
      ]

      block[
        #show: with-cn-font-ht
        目录 #fill I
      ]

      block[
        一、开题报告 #fill 1
      ]

      block[
        二、外文翻译 #fill #外文翻译起始页码
      ]

      block[
        三、外文原文 #fill #外文原文起始页码
      ]

      block[
        四、中期报告 #fill #中期报告起始页码
      ]

      block[
        #show: with-cn-font-ht
        《浙江大学本科生开题报告考核表》 #fill
      ]

      block[
        #show: with-cn-font-ht
        《浙江大学本科生中期报告考核表》 #fill
      ]
    }
  }
}

#let 主体部分_(主体部分) = {
  show: with-heading-numbering-spaced.with("1.1")
  show heading.where(depth: 1): set heading(supplement: "章")
  set heading(supplement: "节")

  show figure: show-figure

  主体部分
}

#let 参考文献() = {
  show: with-cn-font-st
  show: zihao(5)
  let spacing = 1em
  set par(leading: spacing, spacing: spacing)

  gb7714-bibliography()

  // (编写指南：
  // 1. 数量：开题报告、文献综述，应保证合理的参考文献数量；毕业论文（毕业设计报告），应该在开题报告所引用文献的基础上有合理的数量增加；
  // 2. 相关性：应涵盖本论文（报告）直接相关的重要文献；
  // 3. 时效性：应以近期文献为主，可引用历史上标志性的重要文献，近五年内的文献应占合理比例；
  // 4. 覆盖面：应包含国际、国内和论文（报告）相关的重要的、前沿的工作。
  // 顺序编码制格式示例如下。
  // 红色字部分，请在正式报告中删除）
}

#let 附录_(附录) = {
  counter(heading).update(0)
  show figure: show-figure.with(numbering: "A.1")

  附录
}

#let 作者简历_(作者简历) = [
  = 作者简历
  <end-of-first-part-numbered>

  #set par(first-line-indent: 0em)

  #作者简历
]

#let 本科生毕业论文任务书(题目, 指导教师对毕业论文的进度安排及任务要求, 起讫日期, h0) = [
  #heading(outlined: false)[本科生毕业论文（设计）任务书]

  #show heading: none

  = 《浙江大学本科生毕业论文（设计）任务书》

  #set par(first-line-indent: 0em)

  *一、题目：*#题目

  *二、指导教师对毕业论文（设计）的进度安排及任务要求：*#指导教师对毕业论文的进度安排及任务要求

  #align(bottom)[
    #show: strong

    起讫日期#space(1)#起讫日期.at(0) 至#space(1)#起讫日期.at(1)

    #align(right)[
      指导教师（签名）#h(6em)职称#h(6em)
    ]

    三、系或研究所审核意见：

    #v(8em)

    #align(right)[
      负责人（签名）#h(h0)

      年#space(4)月#space(4)日
    ]
  ]
]

#let 毕业论文考核表(指导教师对毕业论文的评语, h0) = [
  #heading(outlined: false)[毕#space(1)业#space(1)论#space(1)文（设计）考#space(1)核]

  #show heading: none

  = 《浙江大学本科生毕业论文（设计）考核表》
  <end-of-first-part>

  #set par(first-line-indent: 0em)

  #[
    #show: zihao(4)

    *一、指导教师对毕业论文（设计）的评语：*
  ]

  #block(height: 10em, [
    #set par(first-line-indent: (amount: 2em, all: true))

    #指导教师对毕业论文的评语
  ])

  #align(right)[
    #show: strong

    指导教师（签名）#h(h0)

    年#space(4)月#space(4)日
  ]

  #[
    #show: zihao(4)

    *二、答辩小组对毕业论文（设计）的答辩评语及总评成绩：*
  ]

  #v(10em)

  #align(right)[
    #show: strong

    #{
      show: zihao(5)
      show: strong

      table(
        columns: 6,
        stroke: 0.5pt,
        align: horizon + left,
        inset: (x: 0.8em, y: 1.2em),
        table.header[
          成绩\ 比例
        ][
          文献综述/\ 中期报告\ 占（10%）
        ][
          开题报告\ 占（15%）
        ][
          外文翻译\ 占（5%）
        ][
          毕业论文（设计）\ 质量及答辩\ 占（70%）
        ][
          总评成绩
        ],
        [分值], [], [], [], [], [],
      )
    }

    #v(2em)

    答辩小组负责人（签名） #h(h0)

    年#space(4)月#space(4)日
  ]
]

#let 开题报告和中期报告_(开题报告和中期报告, 开题报告和中期报告页数) = {
  set page(margin: 0pt)
  
  for page in range(1, 开题报告和中期报告页数 + 1) {
    image(开题报告和中期报告, page: page)
  }
}

#let 开题报告考核(导师对开题报告的评语及成绩评定, 导师评分, 学院盲审专家对开题报告的评语及成绩评定, 专家评分) = [
  #show heading.where(depth: 1): zihao(-2)

  #heading(outlined: false)[毕业设计开题报告、外文翻译的考核]

  #show heading: none

  = 《浙江大学本科生开题报告考核表》

  #[
    #show: zihao(4)

    *导师对开题报告、外文翻译的评语及成绩评定：*
  ]

  #let h0 = 9em

  #block(height: h0)[
    #set par(first-line-indent: (amount: 2em, all: true))

    #导师对开题报告的评语及成绩评定
  ]

  #let scores(评分) = table(
    stroke: 0.5pt,
    columns: 3,
    align: horizon + left,
    inset: (x: 0.8em),
    table.header[
      #show: zihao(4)
      成绩比例
    ][
      #show: zihao(5)
      开题报告\
      （15%）
    ][
      #show: zihao(5)
      外文翻译\
      （5%）
    ],
    block(inset: (y: 0.5em))[
      #show: zihao(4)
      分#space(1)值
    ],
    评分.开题报告,
    评分.外文翻译,
  )

  #align(right)[
    #show: strong

    #scores(导师评分)

    #v(20pt)

    导师签名#box(underline-width(5em)[])

    年#space(4)月#space(4)日
  ]

  #v(20pt)

  #[
    #show: zihao(4)

    *学院盲审专家对开题报告、外文翻译的评语及成绩评定：*
  ]

  #block(height: h0)[
    #set par(first-line-indent: (amount: 2em, all: true))

    #学院盲审专家对开题报告的评语及成绩评定
  ]

  #align(right)[
    #show: strong

    #scores(专家评分)

    #v(20pt)

    开题报告审核负责人（签名/签章）#box(underline-width(5em)[])

    年#space(4)月#space(4)日
  ]
]

#let 中期报告考核(导师对中期报告的评语及成绩评定, 导师评分) = [
  #show heading.where(depth: 1): zihao(3)

  #heading(outlined: false)[毕业设计中期报告考核]

  #show heading: none

  = 《浙江大学本科生中期报告考核表》

  #[
    #show: zihao(4)

    *导师对中期报告的评语及成绩评定：*
  ]

  #block(height: 15em)[
    #set par(first-line-indent: (amount: 2em, all: true))

    #导师对中期报告的评语及成绩评定
  ]

  #align(right)[
    #show: strong

    #table(
      stroke: 0.5pt,
      columns: 2,
      align: horizon + left,
      inset: (x: 0.8em),
      table.header[
        #show: zihao(4)
        成绩比例
      ][
        #show: zihao(5)
        中期报告\
        （10%）
      ],
      block(inset: (y: 0.5em))[
        #show: zihao(4)
        分#space(1)值
      ], 导师评分.中期报告,
    )

    #v(20pt)

    导师签名#box(underline-width(5em)[])

    年#space(4)月#space(4)日
  ]
]

#let template(
  type: "",
  info: (
    题目: [毕业论文（设计）题目],
    学生姓名: [],
    学生学号: [],
    指导教师: [],
    年级与专业: text(red)[（如：2022级计算机科学与技术）],
    所在学院: [],
    提交日期: [],
  ),
  致谢: include("致谢.typ"),
  摘要: include("摘要.typ"),
  Abstract: include("Abstract.typ"),
  主体部分: include("主体部分.typ"),
  bib: read("ref.bib"),
  附录: [],
  作者简历: include("作者简历.typ"),
  指导教师对毕业论文的进度安排及任务要求: [],
  起讫日期: ([20#hide[00]年#hide[00]月#hide[00]日], [20#hide[00]年#hide[00]月#hide[00]日]),
  指导教师对毕业论文的评语: [],
  开题报告和中期报告: "",
  开题报告和中期报告页数: 0,
  外文翻译起始页码: 0,
  外文原文起始页码: 0,
  中期报告起始页码: 0,
  导师对开题报告的评语及成绩评定: [],
  导师评分: (
    开题报告: [],
    外文翻译: [],
    中期报告: [],
  ),
  学院盲审专家对开题报告的评语及成绩评定: [],
  专家评分: (
    开题报告: [],
    外文翻译: [],
  ),
  导师对中期报告的评语及成绩评定: [],
) = [

#assert(type == "电子版" or type == "答辩" or type == "三合一")

#show: styled

#suppress-page-counter()

#封面(info)

#pagebreak-one-sided()

#show: with-page-header.with(info.题目)
#show: with-page-footer.with(numbering_: "I")

#毕业论文原创性声明

#pagebreak-one-sided()

#let v0 = 12pt

#致谢_(v0, 致谢)

#pagebreak-one-sided()

#摘要_(v0, 摘要)

#pagebreak-one-sided()

#Abstract_(v0, Abstract)

#pagebreak-one-sided()

#目录(v0, type, 外文翻译起始页码, 外文原文起始页码, 中期报告起始页码)

#pagebreak-one-sided()

#make-part[第一部分][毕业论文（设计）]

#pagebreak-one-sided()

#counter(page).update(1)
#show: with-page-footer

#{
  show: with-heading-fonts
  show heading.where(level: 1): it => {
    pagebreak(weak: true)

    it
  }

  show: init-gb7714.with(bib)

  主体部分_(主体部分)

  show heading.where(depth: 1): set align(center)

  参考文献()

  附录_(附录)

  作者简历_(作者简历)
}

#if type != "电子版" [

#set page(header: none, footer: none)

#{
  show heading.where(depth: 1): zihao(-2)
  show heading: set align(center)

  let h0 = 8em

  pagebreak-one-sided()

  本科生毕业论文任务书(info.题目, 指导教师对毕业论文的进度安排及任务要求, 起讫日期, h0)

  pagebreak-one-sided()

  毕业论文考核表(指导教师对毕业论文的评语, h0)
}

#if type != "答辩" [

#pagebreak-one-sided()

#make-part[第二部分][开题报告]

#pagebreak-one-sided()

#开题报告和中期报告_(开题报告和中期报告, 开题报告和中期报告页数)

#pagebreak-one-sided()

#show heading: set align(center)

#开题报告考核(导师对开题报告的评语及成绩评定, 导师评分, 学院盲审专家对开题报告的评语及成绩评定, 专家评分)

#pagebreak-one-sided()

#中期报告考核(导师对中期报告的评语及成绩评定, 导师评分)

]
]
]
