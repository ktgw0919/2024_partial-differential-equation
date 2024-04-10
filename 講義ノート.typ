//#import "./template.typ": *
//#show: report.with()

//#import "@preview/ctheorems:1.1.2": *
//#show: thmrules

#import "./typst-theorems-main/manual_template.typ": *
#import "./typst-theorems-main/theorems.typ": *
#show: thmrules

#show: thmrules.with(qed-symbol: $square$)

#set page(width: 16cm, height: auto, margin: 1.5cm)
#set text(font: "Linux Libertine", lang: "en")
#set heading(numbering: "1.1.")

#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)
#let definition = thmbox(
  "definition",
  "Definition",
  // inset: (x: 1.2em, top: 1em ),
  base_level: 1,
  stroke: rgb("#68ff68") + 1pt
  )

#let example = thmplain("example", "Example").with(numbering: none)
#let proof = thmproof("proof", "Proof")

#show: project.with(
  title: "常微分方程式",
)

= 導入
== 微分方程式とは？
- 例 $f''-3f'-4f=0$ を満たす関数$f$は？\
  #h(1em) 解の例 $-->f(t) = e^(4t), space e^(-t)$\
  #h(3em) (正確な解は， $f(t)=C_1 e^(4t) + C_2 e^(-t)$ ($C_1, C_2$:任意定数))
\
- これまでに習った微分方程式の例(不定積分)\
  $integral f(x)dif x$ $-->$
  微分して$f(x)$になる関数$F(x)$を求めている．
  つまり，$F'(x) = f(x)$という微分方程式を解いている．

== この授業の目標
扱いやすいいくつかの微分方程式(変数分離系，定数係数線微分方程式)に対して手計算での解き方を学ぶ．

== 注意
この授業では，$x,y$ はたいていの場合，独立変数を持つ(未知)関数を表す．\
#example[
  #h(1em) $x' = sin(x) space.quad (x(t) = cos(t) + C)$
  ] 
また，$x^((n))$ で $x$ の n階微分を表す．
#pagebreak()
= 第一回講義(2024-04-09)
#let ODE = $F(t, x, x', dots , x^((n))) = 0$
#definition[
  $x = x(t)$ を未知関数とする．
  $ ODE space.quad (F: n + 2 "変数関数") $
  という形の方程式を常微分方程式という．
]
#example[
  + $x'(t) = cos(t) <==> x(t) = integral cos(t) dif t$ \
    $F(a,b,c) = -cos(a) + C$
  + $x'' + 2t x' + x = e^t $ \
    $F(a,b,c,d) = -e^a + b + 2 a c + d space.quad (a=t,b=x,c=x',d=x'')$

  + $lr(\{ #block($ 
    && x_1 ' = 2x_1 - 3x_2 \
    && x_2 ' = x_1 - 2x_2
    $))$ #sym.space.quad (連立微分方程式)
]
#definition[
  常微分方程式がn階の導関数を含み，それ以上の高階の項を含まないとき，
  n階の微分方程式という．
]
#definition[
  n階の方程式 $ODE$ の解であって，$x(t_0)=a_0, x'(t_0)=a_1,dots,x^((n))(t_0)=a_n space.quad (t_0,a_i "は定数")$を満たすものを求めることを(初期条件に対する)初期値問題を解くという．
]
#example[
  $x'e^(-t)$ の解は $x(t)=-e^(-t)+C space.quad (C:"任意定数")$\
  #h(5em) #sym.arrow.b.double 初期値問題\
  #h(4em)$x'=e^(-t), x(0)=0 $ の解は，$x(t)=-e^(-1)+1$\
  #h(4em)この初期値問題においては $x(0)=0$ が初期条件．
]




