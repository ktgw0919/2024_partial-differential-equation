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

#let theorem = thmbox(
  "theorem",
  "Th.",
  //"定理",
  base_level: 1,
  fill: rgb("#aaeeff")
)
#let corollary = thmplain(
  "corollary",
  "Cor.",
  //"系",
  base: "theorem",
  titlefmt: strong,
)
#let definition = thmbox(
  "definition",
  "Def.",
  //"定義",
  // inset: (x: 1.2em, top: 1em ),
  base_level: 1,
  stroke: rgb("#2255dd") + 1pt
)
#let proposition = thmbox(
  "proposition",
  "Prop.",
  //"命題",
  // inset: (x: 1.2em, top: 1em ),
  // base_level: 1,
  // stroke: rgb("#ffeeaa") + 1pt
  base_level: 1,
  fill: rgb("#ffccd9")
)


#let example = thmplain("example", "Example"/* "例"*/).with(numbering: none)
#let proof = thmproof("proof", "Proof"/* "証明"*/)

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
=== ノートにおける囲いの意味
#definition[
  定義\
  数学の概念の意味や内容を定めたもの．
]
#theorem[
  定理\
  正しいことが確かめられた数学の主張のうち重要なもの．
]
#proposition[
  命題\
  定理よりも軽い(重要度が低い)主張のこと．
]
#corollary[
  系\
  定理の結論から直ちに得られる主張．
]
#example[ 例]
#proof[ 証明]
#pagebreak()
//-------------------------------------------
= 第一回講義(2024-04-09)
#let ODE = $F(t, x, x', dots , x^((n))) = 0$
// "ODE" is "ordinary differential equation"(常微分方程式)
== 常微分方程式
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
#let IVP = [$ODE , space x(t_0)=a_0, x'(t_0)=a_1,dots,x^((n))(t_0)=a_n$]
// "IVP" is ""Initial value problem"(初期値問題) 
== 初期値問題
#definition[
  n階の方程式 $ODE$ の解であって，$x(t_0)=a_0, x'(t_0)=a_1,dots,x^((n))(t_0)=a_n space.quad (t_0,a_i "は定数")$を満たすものを求めることを(初期条件に対する)初期値問題を解くという．
]
#example[
  $x'e^(-t)$ の解は $x(t)=-e^(-t)+C space.quad (C:"任意定数")$\
  #h(5em) #sym.arrow.b.double 初期値問題\
  #h(4em)$x'=e^(-t), x(0)=0 $ の解は，$x(t)=-e^(-1)+1$\
  #h(4em)この初期値問題においては $x(0)=0$ が初期条件．
]
#theorem[
  (解の存在と一意性)\
  初期値問題
  $ IVP $
  の解は ($F$ がリプシッツ条件を満たすなら，$t_0$ の近傍で) ただ一つに定まる．
]
#pagebreak()
== 変数分離形
#definition[
  $ x' = f(t)g(x) space.quad (f, g:"関数") $
  の形の方程式を変数分離形という．
]
#example[
  $x' = 2t dot e^x$ #sym.space.quad $(f(a) = 2a, g(a) = e^a)$
]
#let VSF = $x' = f(t)g(x)$ // VariableSeparatedForm
  #let VSFS = $H(x(t)) = F(t) + C$ // VariableSeparatedFormSolution
#proposition[
  $g$ は $0$ を値に持たないとする．
  $ VSF $
  に対し， $h(x) = 1/(g(x))$ とし， $H(x)$ を $h(x)$ の原始関数， $F(x)$ を $f(x)$ の原始関数とする．
  $ VSF <==> VSFS space.quad "(C:任意定数)" $
]
#proof[
  \ まず，$VSF space ==> space VSFS$ を示す．
  \ $VSF$ かつ $g eq.not 0$ より， $1/(g(x(t)))x'(t)=f(t)$ 
  $ &integral 1/(g(x(t)))x'(t) dif t = integral f(t) dif t \
  &--> integral 1/g(x) dif x = F(t) + C_1 \
  &--> H(t) + C_2 = F(t) + C_1 \
  &--> H(t) = F(t) + C \
   $
   よって，$VSF space ==> space VSFS$ が示された．\
   次に，$VSF space <== space VSFS$ だが，$VSFS$ の両辺を $t$ で微分すれば示される．
]
#proposition[
  $y$ は常に正，もしくは常に負の値をとる連続関数とする．このとき， $h(x)=1/(g(x))$ の原始関数 $H(x)$ には逆関数が存在する．そして，方程式 $x'=f(t)g(x)$ の解は， $x(t)=H^(-1)(F(t)+C)$ と表される． 
]
