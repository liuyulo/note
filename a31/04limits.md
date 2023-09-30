---
title: Limit
---

<div id="left">

<!-- omit in toc -->
# Table of Contents
- [Formal Definition](#formal-definition)
- [Uniqueness](#uniqueness)
- [One-Sided](#one-sided)
- [Infinity](#infinity)
  - [Infinite Limit](#infinite-limit)
  - [Limit at infitiy](#limit-at-infitiy)
  - [Inf Limit at Inf](#inf-limit-at-inf)
- [Calculations](#calculations)
- [δ-ε Proofs](#δ-ε-proofs)
  - [Normal](#normal)
  - [Find Upper Bound](#find-upper-bound)
    - [Assume ∆](#assume-)
    - [Root](#root)
    - [Trig](#trig)
  - [One-Sided](#one-sided-1)
  - [To Inf](#to-inf)
  - [At Inf](#at-inf)

</div>

# Formal Definition
> $\lim\limits_{x\to c}f(x)=L$ means
> $$\forall\varepsilon\gt0\quad\exist\delta\gt0\text{ st }\\ 0\lt|x-c|\lt\delta\implies|f(x)-L|\lt\varepsilon$$
> or
> $$x\in(c-\delta,c)\cup(c,c+\delta)\Rarr f(x)\in(L-\varepsilon,L+\varepsilon)$$

<center>

```
    c-δ   c   c+δ            L-ε   L   L+ε
x ∈  ○----○----○   =>  f(x) ∈ ○----●----○
```
</center>

# Uniqueness
> $$\lim\limits_{x\to c}f(x)=L\text{ and }\lim\limits_{x\to c}f(x)=M\implies L=M$$

<details>
    <summary>proof</summary>

$$\begin{aligned}
    &\begin{aligned}
        \text{assume }&L\neq M\text{ and }L>M\\
        \therefore\;&\exist k>0\text{ st }L=M+k\\
        \text{let }&\varepsilon=k/2\\
        \therefore\;&(L-\varepsilon,L+\varepsilon)\cap(M-\varepsilon,M+\varepsilon)=\empty\\
        \,\\
        \because\;&\lim\limits_{x\to c}f(x)=L\\
        \therefore\;&\forall\varepsilon>0\enspace\exist\delta_1>0\text{ st }0\lt|x-c|\lt\delta_1\Rarr |f(x)-L|\lt\varepsilon \\
        \,\\
        \because\;&\lim\limits_{x\to c}f(x)=M\\
        \therefore\;&\forall\varepsilon>0\enspace\exist\delta_2>0\text{ st }0\lt|x-c|\lt\delta_2\Rarr |f(x)-M|\lt\varepsilon\\
        \,\\
        \text{let }&\delta=\text{min}\{\delta_1,\delta_2\}\\
        \therefore\;&\forall x\in(c-\delta,c)\cup(c,c+\delta),\enspace f(x)\in(L-\varepsilon,L+\varepsilon)\text{ and }f(x)\in(M-\varepsilon,M+\varepsilon)\\
        &\text{ which is impossible because }(L-\varepsilon,L+\varepsilon)\cap(M-\varepsilon,M+\varepsilon)=\empty\\
        \end{aligned}\\
        &\therefore\;L=M\\
        &\therefore\;\lim\limits_{x\to c}f(x)=L\text{ and }\lim\limits_{x\to c}f(x)=M\implies L=M\qquad\text{QED}
\end{aligned}$$
</details>

# One-Sided
<blockquote>

$\lim\limits_{x\to c^+}f(x)=L$ means $\quad \forall\varepsilon\gt0\quad\exist\delta\gt0\text{ st }$

$$x\in(c-\delta,c)\implies f(x)\in(L-\varepsilon,L+\varepsilon)$$
$\lim\limits_{x\to c^-}f(x)=L$ means $\quad \forall\varepsilon\gt0\quad\exist\delta\gt0\text{ st }$

$$x\in(c,c+\delta)\implies f(x)\in(L-\varepsilon,L+\varepsilon)$$

and
$$\lim\limits_{x\to c}f(x)=L\iff\lim\limits_{x\to c^-}f(x)=\lim\limits_{x\to c^+}f(x)=L$$
</blockquote>

<details>
    <summary>proof</summary>

$$\begin{aligned}
    &\begin{aligned}
        \text{assume }&\lim\limits_{x\to L}f(x)=L\\
        \therefore\;&\forall\varepsilon>0\enspace\exist\delta>0\text{ st }x\in(c-\delta,c)\cup(c,c+\delta)\Rarr f(x)\in(L-\varepsilon,L+\varepsilon)\\
        \therefore\;&\begin{cases}
            x\in(c-\delta,c)\implies f(x)\in(L-\varepsilon,L+\varepsilon)\\
            x\in(c,c+\delta)\implies f(x)\in(L-\varepsilon,L+\varepsilon)\\
        \end{cases}\\
        \therefore\;&\lim\limits_{x\to c^-}f(x)=L\text{ and }\lim\limits_{x\to c^+}f(x)=L\\
    \end{aligned}\\
    &\begin{aligned}
        \text{assume }&\lim\limits_{x\to c^-}f(x)=\lim\limits_{x\to c^+}f(x)=L\\
        \therefore\;&\forall\varepsilon>0\enspace\exist\delta_1>0,\delta_2>0\text{ st }x\in(c-\delta_1,c)\cup(c,c+\delta_2)\Rarr f(x)\in(L-\varepsilon,L+\varepsilon)\\
        \text{let }&\delta=\text{min}\{\delta_1,\delta_2\}\\
        \therefore\;&x\in(c-\delta,c)\cup(c,c+\delta)\Rarr f(x)\in(L-\varepsilon,L+\varepsilon)\\
        \therefore\;&\lim\limits_{x\to c}f(x)=L\\
    \end{aligned}\\
    &\therefore\;\lim\limits_{x\to c}f(x)=L\iff\lim\limits_{x\to c^-}f(x)=\lim\limits_{x\to c^+}f(x)=L\qquad\text{QED}\\
\end{aligned}$$
</details>


# Infinity
## Infinite Limit
> $\lim\limits_{x\to c}f(x)=\infty$ means
> $$\forall M>0\enspace\exist\delta>0\text{ st }\\ x\in(c-\delta,c)\cup(c,c+\delta)\implies f(x)\in(M,\infty)$$

## Limit at infitiy
> $\lim\limits_{x\to\infty}f(x)=L$ means
> $$\forall\varepsilon>0\enspace\exist N>0\text{ st }\\ x\in(N,\infty)\implies f(x)\in(L-\varepsilon,L+\varepsilon)$$

## Inf Limit at Inf
> $\lim\limits_{x\to-\infty}f(x)=-\infty$ means
> $$\forall M>0\enspace\exist N>0\text{ st }\\ x\in(-\infty,-N)\implies f(x)\in(-\infty,-M)$$

# Calculations
> $f(c\pm\delta)$ must be inside $L\pm\varepsilon$, therefore choose *min δ* and *max ε*

<style>.g{color:lime;}.ng{color:red}</style>

<details>
    <summary>find <code>δ</code> or <code>ε</code>

$\lim\limits_{x\to\textcolor{aqua}3}2x=\textcolor{lime}6$
    </summary>

$$\forall\varepsilon>0\enspace\exist\delta>0\text{ st }\\
|x-\textcolor{aqua}3|<\delta\implies|2x-\textcolor{lime}6|<\varepsilon\\
\begin{aligned}
    |2x-6|&<\varepsilon\\
    2|x-3|&<\varepsilon\\
    |x-3|&<\varepsilon/2\\
    \therefore\;\delta&=\varepsilon/2\\
\end{aligned}$$
</details>

<details>
    <summary>find max <code>δ</code> by choosing min <code>δ</code>

$\lim\limits_{x\to\textcolor{aqua}{2}}x^3=\textcolor{lime}8,\quad\varepsilon=0.45$
</summary>

$$\forall\varepsilon>0\enspace\exist\delta>0\text{ st }\\
0<|x-\textcolor{aqua}2|<\delta\implies|x^3-\textcolor{lime}8|<0.45\\
\,\\
\begin{aligned}
    8.45&<x^3<8+0.45\\
    \sqrt[3]{7.55}&<x<\sqrt[3]{8.45}\\
    \because\;2-\delta_1&<x<2+\delta_2\\
\end{aligned}\\
\begin{aligned}
    \therefore\;&\delta_1=2-\sqrt[3]{7.55}\quad\delta_2=\sqrt[3]{8.45}-2\\
    \therefore\;&\delta=\text{min}\{\delta_1,\delta_2\}=\delta_2\approx0.0368\\
\end{aligned}$$

- <details>
    <summary>why choose min δ</summary>

    >`(2 ± δ) ^ 3` must be in `L ± ε`

    |               | δ<sub>1</sub> (max)         | δ<sub>2</sub> (min)        | L ± ε |
    | ------------- | --------------------------- | -------------------------- | ----- |
    | `(2 - δ) ^ 3` | <span class=g>7.55</span>   | <span class=g>7.566</span> | 7.55  |
    | `(2 + δ) ^ 3` | <span class=ng>8.467</span> | <span class=g>8.45</span>  | 8.45  |
</details>
</details>

<details>
    <summary>find min <code>ε</code> by choosing max <code>ε</code>

$x\in(1,3)\implies|x^2-\textcolor{lime}6|<\varepsilon$
</summary>

$$\begin{aligned}
    1&<x<3\\
    1&<x^2<9\\
    \because\;6-\varepsilon_1&<x^2<6+\varepsilon_2\\
\end{aligned}\\
\begin{aligned}
    \therefore\;&\varepsilon_1=5\quad\varepsilon_2=3\\
    \therefore\;&\varepsilon=\text{max}\{\varepsilon_1,\varepsilon_2\}=5\\
\end{aligned}$$

- <details>
    <summary>why choose max ε</summary>

    >`c ± δ` must be in `sqrt(6 ± ε)`

    |               | c ± δ | ε<sub>1</sub> (max)        | ε<sub>2</sub> (min)         |
    | ------------- | ----- | -------------------------- | --------------------------- |
    | `sqrt(6 - ε)` | 1     | <span class=g>1</span>     | <span class=ng>1.732</span> |
    | `sqrt(6 + ε)` | 3     | <span class=g>3.317</span> | <span class=g>3</span>      |
</details>
</details>

# δ-ε Proofs

## Normal
$\lim\limits_{x\to2}(x^2-4x+5)=1$

$$\forall\varepsilon>0\enspace\exist\delta>0\text{ st }0<\textcolor{aqua}{|x-2|}<\delta\implies\textcolor{lime}{|x^2-4x+5-1|}<\varepsilon$$

- aside:
  $$\begin{aligned}
        \textcolor{lime}{|(x^2-4x+5)-1|}&=|x^2-4x+4|\\
        &=|(x-2)^2|\\
        &=|x-2|^2<\varepsilon\\
    \textcolor{aqua}{|x-2|}&<\textcolor{coral}{\sqrt\varepsilon=\delta}\\
  \end{aligned}$$
- proof:
  $$\text{given }\varepsilon>0,\text{ let }\textcolor{coral}{\delta=\sqrt\varepsilon}\\
  \begin{aligned}
  \therefore\;0<\textcolor{aqua}{|x-2|}<\delta\implies&\textcolor{lime}{|(x^2-4x+5)-1|}\\
  =&\textcolor{aqua}{|x-2|}^2<\delta^2=(\sqrt\varepsilon)^2=\varepsilon\quad\blacksquare\\
  \end{aligned}$$

## Find Upper Bound

### Assume ∆
$\lim\limits_{x\to2}(x^2+x-2)=4$

$$\forall\varepsilon>0\enspace\exist\delta>0\text{ st }0<|x-2|<\delta\implies|(x^2+x-2)-4|<\varepsilon$$

- aside:
  $$\begin{aligned}
      |(x^2+x-2)-4|=&&|x^2-x-6|\\
      =&&|(x+3)(x-2)|\\
      =&&|x+3||x-2|&<\varepsilon\\
      &&|x-2|&<\frac \varepsilon{|x+3|}\\
  \end{aligned}\\
  \begin{aligned}
      \text{assume }|x-2|&<1\\
      |x+3|&\le|x|+3\quad(\Delta)\\
      &=|x-2+2|+3\\
      &\le|x-2|+5\quad(\Delta)\\
      &<1+5=6
  \end{aligned}\\
  \begin{aligned}
      &\therefore\;|x-2|<\frac\varepsilon{|x+3|}<\frac\varepsilon6=\delta
  \end{aligned}$$

- proof:
  $$\text{given }\varepsilon>0,\text{ let }\delta=\text{min}\{1,\varepsilon/6\}\\
  \begin{aligned}
      \therefore\;0<|x-2|<\delta\implies|(x^2+x-2)-4|&=|x-2||x+3|\\
      &<|x+3|\delta\\
      &<6\delta=6\cdot\frac\varepsilon6=\varepsilon\quad\blacksquare
  \end{aligned}$$

### Root
$\lim\limits_{x\to-2}\sqrt{x^2+5}=3$

$$\forall\varepsilon>0\enspace\exist\delta>0\text{ st }0<|x+2|<\delta\Rarr|\sqrt{x^2+5}-3|<\varepsilon$$
- aside:
  $$\begin{aligned}
    \because\;&\sqrt{x^2+5}>0\\
    \therefore\;&|\sqrt{x^2+5}-3|=\frac{|x^2+5-9|}{\sqrt{x^2+5}+3}\\
    &=\frac{|x-2||x+2|}{\sqrt{x^2+5}+3}<\frac{|x-2||x+2|}3<\varepsilon\Rarr|x+2|<\frac{3\varepsilon}{|x-2|}
  \end{aligned}\\
  \begin{aligned}
    \text{assume }|x+2|&<1\\
    -1<x+2&<1\\
    -5<x-2&<-3\\
  \end{aligned}\\
  \begin{aligned}
    &\therefore\;|x-2|<\text{max}\{|-5|,|-3|\}=5\\
    &\therefore\;|x+2|<\frac{3\varepsilon}{|x-2|}<\frac{3\varepsilon}5=\delta\\
  \end{aligned}$$
- proof:
  $$\text{given }\varepsilon>0,\text{ let }\delta=\text{min}\left\{1,\frac{3\varepsilon}5\right\}\\
  \begin{aligned}
  \therefore\;0<|x+2|<\delta\Rarr|\sqrt{x^2+5}-3|=\frac{|x-2||x+2|}{\sqrt{x^2+5}+3}<&\frac{5|x+2|}3\\
  =&\frac{5(3\varepsilon/5)}3=\varepsilon\quad\blacksquare
  \end{aligned}$$

### Trig
$\lim\limits_{x\to\infty}\frac{\sin x}x=0$

$$\forall\varepsilon>0\enspace\exist N>0\text{ st }x>N\Rarr\left|\frac{\sin x}x\right|<\varepsilon$$
- aside:
  $$\begin{aligned}
    &\because\;|\sin x|\le1;\;x>0\\
    &\therefore\;\left|\frac{\sin x}x\right|=\frac{|\sin x|}x\le\frac 1x<\varepsilon\Rarr x>\frac 1\varepsilon=N\\
  \end{aligned}$$
- proof:
  $$\text{given }\varepsilon>0\text{ let }N=\text{max}\left\{1,1/\varepsilon\right\}\\
  \therefore\;x>1\Rarr\left|\frac{\sin x}x\right|\le\left|\frac1x\right|=\frac1x<\frac1{1/\varepsilon}=\varepsilon\quad\blacksquare$$

## One-Sided
$\lim\limits_{x\to1^+}\sqrt{x-1}=0$

$$\forall\varepsilon>0\enspace\exist\delta\text{ st }\textcolor{aqua}{0<x-1<\delta}\implies|\sqrt{x-1}|<\varepsilon$$

- aside:
  $$\begin{aligned}
      |\sqrt{x-1}|=\sqrt{x-1}&<\varepsilon\\
      x-1&<\varepsilon^2=\delta\\
  \end{aligned}$$
- proof:
  $$\text{given }\varepsilon>0,\text{ let }\delta=\varepsilon^2\\
  \begin{aligned}
      \therefore\;0<x-1<\delta\implies&|\sqrt{x-1}-1|\\
      =&\sqrt{x-1}<\sqrt\delta=\sqrt{\varepsilon^2}=\varepsilon\quad\blacksquare
  \end{aligned}$$

## To Inf
$\lim\limits_{x\to\infty}\frac{8x-7}{4x}=2$

$$\forall\varepsilon>0\enspace\exist N>0\text{ st }x>N\implies\left|\frac{8x-7}{4x}-2\right|<\varepsilon$$
- aside:
  $$\begin{aligned}
      \left|\frac{8x-7}{4x}-2\right|=\left|2-\frac7{4x}-2\right|=\left|\frac7{4x}\right|=\frac7{4x}&<\varepsilon\\
      x&<\frac7{4\varepsilon}=N
  \end{aligned}$$
- proof:
  $$\text{given }\varepsilon>0,\text{ let }N=\frac7{4\varepsilon}\\
  \therefore\;x>N\implies\left|\frac{8x-7}{4x}-2\right|=\frac7{4x}<\frac7{4N}=\varepsilon\quad\blacksquare$$
</details>

## At Inf
$\lim\limits_{x\to3^-}\frac 1{3-x}=\infty$

$$\forall M>0\enspace\exist\delta>0\text{ st }-\delta<x-3<0\implies \left|\frac 1{3-x}\right|>M$$

- aside:
  $$\begin{aligned}
      &\because\;-\delta<x-3<0\implies0<3-x<\delta\\
      &\begin{aligned}
          \therefore\;\frac 1{3-x}&>M\\
          3-x&<\frac 1M=\delta\\
      \end{aligned}
  \end{aligned}$$
- proof:
  $$\text{given }M>0,\text{ let }\delta=M^{-1}\\
  \therefore\;-\delta<x-3<0\implies\frac 1{3-x}>\frac 1\delta=\frac 1{M^{-1}}=M\quad\blacksquare
  $$
</details>
