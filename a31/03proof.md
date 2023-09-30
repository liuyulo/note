---
title: Proof Techniques
---

<div id="left">

<!-- omit in toc -->
# Table of Contents
- [Language](#language)
    - [From Defs to Theorems](#from-defs-to-theorems)
    - [Quantifiers](#quantifiers)
    - [Implications](#implications)
    - [Counterexamples](#counterexamples)
- [Proof](#proof)
    - [Calculational](#calculational)
    - [Direct](#direct)
    - [Contradiction](#contradiction)

</div>

# Language
*(textbook)*
## From Defs to Theorems
> how to build on our basic definitions and develop the theory of calculus

example definitions
- an **integer** $\Z$ is a whole number that is positive, negative, or zero
- an int $n$ is **divisible** by an int $m$ if $n=km$ for some int $k$
- an int $n$ is **even** if $n=2k$ for some int $k$
- an int $n$ is **odd** if $n=2k+1$ for some int $k$
- $n$ is a **rational number** $\Bbb{Q}=\left\{\frac pq,p,q\in\Z,q\neq0\right\}$


## Quantifiers
> for all upside-down A, there exists a backwards E

- **$\forall x, P$** property $P$ holds for all possible values of $x$
- **$\exist x\text{ st }P$** property $P$ is true for at least one value of $x$

| $\forall\quad$ for all                    |         |
| ----------------------------------------- | ------- |
| $\forall x\in\R,\enspace 3x+3=3(x+1)$     | `true`  |
| $\forall x\in\R,\enspace \vert x\vert=-x$ | `false` |

| $\exist\quad$ there exists                         |                |
| -------------------------------------------------- | -------------- |
| $\exist x\in\R\enspace\text{st}\enspace\sqrt x=-x$ | `true` $(x=0)$ |

## Implications
> the **contrapositive** of an implication is *always* logically equivalent to the original implication

|     $A\implies B$      |               if $A$, then $B$ |
| :--------------------: | -----------------------------: |
| $\neg A\implies\neg B$ |        *inverse* of $A\Rarr B$ |
|     $B\implies A$      |       *converse* of $A\Rarr B$ |
|       $A\iff B$        |  *two-way implication* (`iff`) |
| $\neg B\implies\neg A$ | *contrapositive* of $A\Rarr B$ |

## Counterexamples
> fast way to prove a "for all" statement is **false**

# Proof
> me when i write "QED" at end of a proof: i'm something of a mathematician myself

## Calculational
prove that for all real numbers $a$ and $b$, $a^3-b^3=(a-b)(a^2+ab+b^2)$
$$\begin{aligned}
    (a-b)(a^2+ab+b^2)&=a^3+a^2b+ab^2-a^2b-ab^2-b^3\\
    &=a^3-b^3\quad\forall a,b\in\R\\
\end{aligned}\\
\therefore\; a^3-b^3=(a-b)(a^2+ab+b^2)\qquad\text{QED}$$

## Direct
prove that $f(x)=\frac{x-3}{x+2}$ is **one-to-one** function
$$\begin{aligned}
    \text{Given: }&f(x)=\frac{x-3}{x-2}\\
    \text{Show: }&f(x)\text{ is one-to-one}\\
\end{aligned}\\
\,\\
\text{Definition: }f\text{ is one-to-one if }\exist a,b\text{ st }f(a)=f(b)\Rarr a=b\quad a,b\in\text{Dom}(f)\\
\begin{aligned}
    f(a)&=f(b)\\
    \frac{a-3}{a+2}&=\frac{b-3}{b+2}\\
    (b+2)(a-3)&=(b-3)(a+2)\\
    ab-3b+2a-6&=ab-3a+2b-6\\
    2a-3b&=2b-3a\\
    5a&=5b\\
    a&=b
\end{aligned}\\
\begin{aligned}
    \therefore\;&f(a)=f(b)\Rarr a=b\\
    \therefore\;&f(x)\text{ is one-to-one}\qquad\text{QED}
\end{aligned}$$

## Contradiction
prove that the sum of a rational number and an irrational number is irrational
$$\begin{aligned}
    \text{Given: }&r\in\Bbb{Q}, x\not\in\Bbb{Q}\\
    \text{Show: }&r+x\not\in\Bbb{Q}\\
\end{aligned}\\\,\\
\begin{aligned}
    \text{Assume }&r+x\in\Bbb{Q}\\
    \therefore\;&\exist s\in\Bbb{Q}\text{ st }r+x=s\\
    \because\;&s,r\in\Bbb{Q}\\
    \therefore\;&x=s-r\in\Bbb{Q}\\
    &\text{which contradicts the initial assumption that }x\not\in\Bbb{Q}\\
    \therefore\;&r+x\not\in\Bbb{Q}\qquad\text{QED}
\end{aligned}$$
