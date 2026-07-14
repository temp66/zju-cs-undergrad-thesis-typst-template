#import "开题报告和中期报告.typ": template as template_

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
) = template_(
  info: info,
  指导教师对开题报告的具体要求: 指导教师对开题报告的具体要求,
  开题报告正文: 开题报告正文,
  bib: bib,
  外文翻译: 外文翻译,
  外文原文: 外文原文,
)
