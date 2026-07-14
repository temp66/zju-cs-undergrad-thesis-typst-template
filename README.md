# zju-cs-undergrad-thesis-typst-template
浙江大学计算机科学与技术、软件工程、信息安全、人工智能专业本科生毕业设计 Typst 模板

## 使用方法

在工作目录下，克隆此仓库到 `template` 目录：

```sh
git clone https://github.com/temp66/zju-cs-undergrad-thesis-typst-template.git template --depth 1
```

最终目录结构参考：

```
├─template
│
├─开题报告
│      开题报告.typ
│      指导教师对开题报告的具体要求.typ
│      正文.typ
│      ref.bib
│      外文原文.typ
│      外文翻译.typ
│
├─中期报告
│      中期报告.typ
│      正文.typ
│
├─毕业论文
│      毕业论文-电子版.typ
│      毕业论文-答辩.typ
│      致谢.typ
│      摘要.typ
│      Abstract.typ
│      主体部分.typ
│      ref.bib
│      附录.typ
│      作者简历.typ
│      指导教师对毕业论文的进度安排及任务要求.typ
│      指导教师对毕业论文的评语.typ
│
└─三合一
       三合一.typ
       开题报告和中期报告.typ
       开题报告和中期报告.pdf
       导师对开题报告的评语及成绩评定.typ
       学院盲审专家对开题报告的评语及成绩评定.typ
       导师对中期报告的评语及成绩评定.typ
```

- 若撰写**开题报告**，`开题报告/开题报告.typ` 为主文件：

    ```typ
    #import "../template/开题报告.typ": template

    #template(
      // info: (
      //   题目: [],
      //   学生姓名: [],
      //   学生学号: [],
      //   指导教师: [],
      //   年级与专业: [],
      //   所在学院: [],
      // ),
      // 指导教师对开题报告的具体要求: include("指导教师对开题报告的具体要求.typ"),
      // 开题报告正文: include("正文.typ"),
      // bib: read("ref.bib"),
      // 外文翻译: include("外文翻译.typ"),
      // 外文原文: include("外文原文.typ"),
    )
    ```

- 若撰写**中期报告**，`中期报告/中期报告.typ` 为主文件：

    ```typ
    #import "../template/中期报告.typ": template

    #template(
      // 正文: include("正文.typ"),
    )
    ```

- 若撰写**毕业论文（电子版）**，`毕业论文/毕业论文-电子版.typ` 为主文件：

    ```typ
    #import "../template/毕业论文-电子版.typ": template

    #template(
      // info: (
      //   题目: [],
      //   学生姓名: [],
      //   学生学号: [],
      //   指导教师: [],
      //   年级与专业: [],
      //   所在学院: [],
      //   提交日期: [],
      // ),
      // 致谢: include("致谢.typ"),
      // 摘要: include("摘要.typ"),
      // Abstract: include("Abstract.typ"),
      // 主体部分: include("主体部分.typ"),
      // bib: read("ref.bib"),
      // 附录: include("附录.typ"),
      // 作者简历: include("作者简历.typ"),
    )
    ```

  `毕业论文/摘要.typ` 格式可参考 `template/摘要.typ`。

  `毕业论文/Abstract.typ` 格式可参考 `template/Abstract.typ`。

- 若撰写**毕业论文（答辩用）**，`毕业论文/毕业论文-答辩.typ` 为主文件：

    ```typ
    #import "../template/毕业论文-答辩.typ": template

    #template(
      // info: (
      //   题目: [],
      //   学生姓名: [],
      //   学生学号: [],
      //   指导教师: [],
      //   年级与专业: [],
      //   所在学院: [],
      //   提交日期: [],
      // ),
      // 致谢: include("致谢.typ"),
      // 摘要: include("摘要.typ"),
      // Abstract: include("Abstract.typ"),
      // 主体部分: include("主体部分.typ"),
      // bib: read("ref.bib"),
      // 附录: include("附录.typ"),
      // 作者简历: include("作者简历.typ"),
      // 指导教师对毕业论文的进度安排及任务要求: include("指导教师对毕业论文的进度安排及任务要求.typ"),
      // 起讫日期: ([], []),
      // 指导教师对毕业论文的评语: include("指导教师对毕业论文的评语.typ"),
    )
    ```

- 若撰写**三合一**，`三合一/三合一.typ` 为主文件：

    ```typ
    #import "../template/三合一.typ": template

    #template(
      // info: (
      //   题目: [],
      //   学生姓名: [],
      //   学生学号: [],
      //   指导教师: [],
      //   年级与专业: [],
      //   所在学院: [],
      //   提交日期: [],
      // ),
      // 致谢: include("../毕业论文/致谢.typ"),
      // 摘要: include("../毕业论文/摘要.typ"),
      // Abstract: include("../毕业论文/Abstract.typ"),
      // 主体部分: include("../毕业论文/主体部分.typ"),
      // bib: read("../毕业论文/ref.bib"),
      // 附录: include("../毕业论文/附录.typ"),
      // 作者简历: include("../毕业论文/作者简历.typ"),
      // 指导教师对毕业论文的进度安排及任务要求: include("../毕业论文/指导教师对毕业论文的进度安排及任务要求.typ"),
      // 起讫日期: ([], []),
      // 指导教师对毕业论文的评语: include("../毕业论文/指导教师对毕业论文的评语.typ"),
      // 开题报告和中期报告: "/三合一/开题报告和中期报告.pdf",
      // 开题报告和中期报告页数: ,
      // 外文翻译起始页码: ,
      // 外文原文起始页码: ,
      // 中期报告起始页码: ,
      // 导师对开题报告的评语及成绩评定: include("导师对开题报告的评语及成绩评定.typ"),
      // 导师评分: (
      //   开题报告: [],
      //   外文翻译: [],
      //   中期报告: [],
      // ),
      // 学院盲审专家对开题报告的评语及成绩评定: include("学院盲审专家对开题报告的评语及成绩评定.typ"),
      // 专家评分: (
      //   开题报告: [],
      //   外文翻译: [],
      // ),
      // 导师对中期报告的评语及成绩评定: include("导师对中期报告的评语及成绩评定.typ"),
    )
    ```

    由于 Typst 目前在同一文档中仅允许存在一个 bibliography，本模板采取将开题报告和中期报告先生成为 PDF 再插入的 workaround。

    `三合一/开题报告和中期报告.typ`：

    ```typ
    #import "../template/开题报告和中期报告.typ": template

    #template(
      // info: (
      //   题目: [],
      //   学生姓名: [],
      //   学生学号: [],
      //   指导教师: [],
      //   年级与专业: [],
      //   所在学院: [],
      // ),
      // 指导教师对开题报告的具体要求: include("../开题报告/指导教师对开题报告的具体要求.typ"),
      // 开题报告正文: include("../开题报告/正文.typ"),
      // bib: read("../开题报告/ref.bib"),
      // 外文翻译: include("../开题报告/外文翻译.typ"),
      // 外文原文: include("../开题报告/外文原文.typ"),
      // 中期报告: include("../中期报告/正文.typ"),
    )
    ```

### 参考文献样式

由于 Typst 目前对 GB/T 7714 参考文献样式的支持不足，本模板使用了 [pku-typst/gb7714-bilingual][gb7714] 作为 workaround。

仍然可以通过 `@` 语法进行引用，但连续引用不会自动合并，需注意改用 `multicite`。

[pku-typst/gb7714-bilingual][gb7714] 也存在一些问题，本仓库中的版本对部分问题进行了修复。

[gb7714]: https://github.com/pku-typst/gb7714-bilingual

### 图表样式

本模板使用 [i-figured](https://typst.app/universe/package/i-figured/)。

引用时注意添加 `fig:`、`tbl:` 或 `lst:` 前缀。

### `common.typ` 提供了一些实用工具

- **`appendix-heading`**：附录标题需使用此函数而非官方的 heading。

- **`breakable-raw`**：若行内代码块无法断开导致所在行的文字间距过大，可使用此函数代替官方的代码块。

- **`hline`**：绘制三线表用，`hline.thick` 和 `hline.thin` 分别对应粗线和细线。

- **`figure-continuation-header`**：图表跨页时使用。注意参数 `continuation-header` 是手动指定的，不会自动更新。

- **`counter-figure-linebreak`**：若图表后自动添加的空行被放置在新一页，可使用此函数抵消空行。
