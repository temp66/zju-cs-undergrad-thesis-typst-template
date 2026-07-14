#import "毕业论文-base.typ": template as template_

#let template(
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
) = template_(
  type: "电子版",
  info: info,
  致谢: 致谢,
  摘要: 摘要,
  Abstract: Abstract,
  主体部分: 主体部分,
  bib: bib,
  附录: 附录,
  作者简历: 作者简历,
)
