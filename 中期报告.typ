#import "common.typ": *

#let 正文_(正文) = {
  set heading(offset: 1)

  show figure: show-figure.with(
    level: 2,
    numbering: (..nums) => {
      nums = nums.pos()
      nums = nums.slice(1)
      numbering("1.1", ..nums)
    },
  )

  正文
}

#let template(
  正文: include("中期报告正文.typ"),
) = [

#show: styled.with(i-figured-reset-counter-level: 2)
#show heading.where(level: 1): it => {
  pagebreak(weak: true)

  it
}

#show: with-heading-numbering-spaced.with((..nums) => {
  nums = nums.pos()
  nums = nums.slice(1)
  numbering("1.1", ..nums)
})
#show: with-heading-fonts
#show heading.where(depth: 1): set heading(supplement: "章")
#set heading(supplement: "节")

#正文_(正文)

]
