<details class="yellow"><summary>
Sets
</summary>

- $F$ is $\R$ or $\mathbb{C}$
- $\R^D$ is set of functions $f:D\to\R$
- $\mathcal L(V,W)$ is set of linear maps $T:V\to W$
  - $\mathcal L(V)=\mathcal L(V,V)$
- $V$ is infinite dimentional vector space
  - $V^n$ is $n$ dimentional vector space
</details>

# Finite Vector Space

## Othogonality
<details class="definition"><summary>
for $u,v,w\in V^n$
</summary>
- $u\cdot v=u_1 v_1+\cdots+u_nv_n$ (def of dot prod)
  - distributivity commutativity associativity
- $||u||^2=u\cdot u$
  - $||u||=0\iff u=0$
  - $\forall\lambda\in F\quad||\lambda u||=|\lambda|||u||$
</details>

<details class="theorem"><summary>
Cauchy Inequality
</summary>
$for $u,v\in V^n\quad\because ||u+v||^2=||u||^2+2(u\cdot v)+||v||^2$
$$|u\cdot v|\leqslant||u||||v||$$
$$|u\cdot v|=||u||||v||\iff\exist\lambda\in F\textsf{ st }u=\lambda v$$
</details>
<details class="definition"><summary>
Orthogonal Sets
</summary>
$\{v_i\}$ is **othogonal** iff all:

$$\forall i\enspace v_i\ne 0\quad\land\quad\forall i\ne j\enspace v_i\cdot v_j=0$$

is **onthogonal** iff all:

$$\textsf{is orthogonal}\quad\land\quad\forall i\enspace ||v_i||=1$$
</details>
<details class="theorem"><summary>
Pythagorean Theorem
</summary>
$$||v_1+\cdots+v_n||^2=||v_1||^2+\cdots+||v_n||^2$$
</details>
<details class="example"><summary>
prove PyTheorem
</summary>
given $\forall i\ne j\enspace v_i\cdot v_j=0$
\begin{align*}
    ||v_i+\cdots+v_n||^2&=(v_1+\cdots+v_n)\cdot(v_1+\cdots+v_n)\\
	&=(v_1\cdot v_1+\cdots+v_n\cdot v_n)+\sum_{i\ne j}v_i\cdot v_j\\
	&=||v_1||^2+\cdots+||v_n||^2+0\quad\blacksquare\\
\end{align*}
</details>
<details class="example"><summary>
Prove orthogonal sets are always indep
</summary>
let $\{v_i\}$ be orthogonal and suppose $a_1v_1+\cdots+a_nv_n=0$
\begin{align*}
    \textsf{ suppose }&a_1v_1+\cdots+a_nv_n=0\\
	\because&\,||x||=0\iff x=0\\
    \therefore&\,||a_1v_1+\cdots+a_nv_n||=0\\
	\because&\,\left|\left|\sum a_iv_i\right|\right|^2=\sum ||a_iv_i||^2\tag{\sf Pythagorean}\\
	\therefore&\,||a_1v_1||^2+\cdots+||a_nv_n||^2=0\\
	\because&\,||av||^2=(|a|||v||)^2\tag{\sf norm prop}\\
	&=|a|^2||v||^2\tag{\sf exp law}\\
	\therefore&\,|a_1|^2||v_1||^2+\cdots+|a_n|^2||v_n||^2=0\\
	\because&\,||v_i||\ne 0\tag{\sf orthogonal}\\
	\therefore&\, |a_1|^2=\cdots=|a_n|^2=0\\
	\therefore&\,\forall i\enspace a_i=0\\
	\therefore&\,\textsf{ linearly indep}
\end{align*}
</details>

## Similarity
<details class="definition"><summary>
for $A,B\in\mathcal L(V^n)$
</summary>
$$A\sim B\iff\exist P,P^{-1}\in\mathcal L(V^n)\enspace A=PBP^{-1}$$

- $A\sim A$
- commutativity transitivity
- $A\sim B\implies$
  - $|A|=|B|$
  - $\mathrm{tr}\,A=\mathrm{tr}\,B$
  - $\mathrm{rank}\,A=\mathrm{rank}\,B$
  - $c_A=c_B$
  - have same eigenvals
</details>

## Diagonisation
<details class="definition"><summary>
Characteristic Polynomial of $A\in\mathcal L(V^n)$
</summary>
$$c_A(\lambda)=|\lambda I-A|$$

by **Fundamental Theorem of Algebra**, $|\lambda I-A|$ always has $n$ non-distinct roots
</details>
<details class="algorithm"><summary>
Diagonisation for $A\in\mathcal L(V^n)$
</summary>
1. find each root of $c_A(\lambda)=|\lambda I-A|$ as **eigenval $\lambda_i$**
2. for each $\lambda_i$, find solution of $(\lambda_i I-A)x=0$ as **eigenvec $x$**
3. if $\{x_i\}$ is a basis of $V^n$, then
   - $P=\begin{bmatrix} x_1&x_2&\cdots&x_n\\ \end{bmatrix}$ is invertible
   - $PAP^{-1}=D=\mathrm{diag}(\lambda_i)$
</details>
<details class="theorem"><summary>
Distict Eigenvals $\implies$ Indep Eigenvecs
</summary>
for $T\in\mathcal L(V^n)$
\begin{align*}
 &\{\lambda_i\}_{i=1}^m\textsf{ are \textbf{distinct} eigenvals of }A\\
 \implies&\{v_i\}_{i=1}^m\textsf{ as corresponding eigenvecs are \textbf{indep}}
\end{align*}
</details>
<details class="example" open><summary>
prove above (by contradiction)
</summary>
given $T\in\mathcal L(V^n)$ with $\lambda_1,\cdots,\lambda_m$ **distinct** eigenvals
\begin{align*}
  &\textsf{suppose }v_1,\cdots,v_m\textsf{ is dep}\\
  \therefore&\,\exist k\textsf{ st }v_k\in\mathrm{sp}\{v_i,\cdots,v_{k-1}\}\quad\{v_i\}_{i=1}^{k-1}\textsf{ is indep}\\
  \therefore&\,\exist a_i\in F\textsf{ st }v_k=a_1v_1+\cdots+a_{k-1}v_{k-1}\tag{\sf def of span (1)}\\
  \therefore&\,\lambda_kv_k=a_1\lambda_1v_1+\cdots+a_{k-1}\lambda_{k-1}v_{k-1}\tag{\sf apply $T$ (2)}\\
  &\,\lambda_kv_k=a_1\lambda_kv_k+\cdots+a_{k-1}\lambda_kv_{k-1}\tag{\sf apply $\lambda_k$ (3)}\\
  \therefore&\,\textsf{(3)}-\textsf{(2) gives }0=a_1(\lambda_k-\lambda_1)v_1+\cdots+a_{k-1}(\lambda_k-\lambda_{k-1})v_{k-1}\\
  \because&\,v_1,\cdots,v_{k-1}\textsf{ is indep}\quad\lambda_i\ne\lambda_j\enspace\forall i\ne j\tag{\sf given distinct}\\
  \therefore&\,a_1=\cdots=a_{k-1}=0\\
  \therefore&\,v_k=0\tag{\sf from (1)}\\
  \therefore&\,\textsf{contradicts that }v_k\ne0\tag{\sf $v_k$ is eigenvec}\\
  \therefore&\,v_1,\cdots,v_m\textsf{ is indep}\quad\blacksquare
\end{align*}
</details>

# Vector Space
## Subspaces
<details class="definition"><summary>
$U$ is a **subspace** of $V$ iff all:
</summary>
- $U\subseteq V$
- $U$ is vecspc
</details>
<details class="algorithm"><summary>
Check if $U\subseteq V$ is **subspc**
</summary>
1. $0\in U$ (has additive identity)
2. $u,w\in U\implies u+w\in U$ (closure add)
3. $\lambda\in F,u\in U\implies \lambda u\in U$ (closure scalar mul)
</details>
<details class="theorem"><summary>
</summary>
- $\{0\}$ is the smallest subspc of $V$
- $V$ is the largest subspc of $V$
</details>


### Sum
<details class="definition"><summary>
for $U_i\subseteq V$
</summary>
$$\sum U_i=\left\{\sum u_i:u_i\in U_i\right\}$$
</details>
<details class="theorem"><summary>
</summary>
- $U,W\subseteq V\implies U\cap W\subseteq V$
- $U\cup W$ is rarely a subspc
</details>

<details class="example"><summary>
given $U,W\subseteq V$ show $U\cup W\subseteq V\iff U\subseteq W\lor W\subseteq U$
</summary>
- wts $U\cup W\subseteq V\implies U\subseteq W$ or $W\subseteq U$
  - assume $U\cup W\subseteq V$ and $U\not\subseteq W\land W\not\subseteq U$
  \begin{align*}
      &\therefore\exists u\in U,w\in W\textsf{ st }u\not\in W,w\not\in U\\
	  &\because u,w\in U\cup W\subseteq V\\
	  &\therefore u+w\in U\cup W\\
	  &\therefore\textsf{WLOG assume }u+w\in U\subseteq V\\
	  &\therefore (u+w)-u=w\in U\\
	  &\therefore\textsf{ contradiction }\\
	  &\therefore U\subseteq W\lor W\subseteq U\quad\blacksquare
  \end{align*}
- wts $U\subseteq W\lor W\subseteq U\implies U\cup W\subseteq V$
  - assume $U\subseteq W\lor W\subseteq U$
  \begin{align*}
      &\therefore\textsf{WLOG assume }U\subseteq W\\
	  &\therefore U\cup W=W\subseteq V\quad\blacksquare
  \end{align*}
</details>

### Direct Sum
<details class="definition"><summary>
$\displaystyle\sum U_i=\bigoplus U_i$ iff any:
</summary>

- for $\displaystyle u_i\in U_i\enspace\sum u_i=0\implies u_i=0$
- $\displaystyle\bigcap U_i=\{0\}$
- $\displaystyle\sum\dim U_i=\dim \sum U_i$ (proof [here](#with-direct-sum))
</details>

<details class="example"><summary>
show $U+W=U\oplus W\iff U\cap W=\{0\}$
</summary>
- wts $U+W=U\oplus W\implies U\cap W=\{0\}$
 \begin{align*}
     \textsf{let any}&\,v\in U\cap W\\
	 \therefore&\,v+(-v)=0\quad v\in U,-v\in W\\
	 \because&\,\textsf{repesentation of the sum must be unique}\\
	 \therefore&\,v=0\\
	 \therefore&\,U\cap W=\{0\}\\
 \end{align*}

 - wts $U\cap W=\{0\}\implies U+W=U\oplus W$
 \begin{align*}
     \textsf{given }&U\cap W=\{0\}\\
	 \textsf{suppose }&u+w=0\quad u\in U,w\in W\\
	 \therefore&\,u=-w\in W\\
	 \therefore&\,u\in U\cap W\\
	 \therefore&\,u=0\quad w=-u=0\\
	 \because&\,U+W=U\oplus W\iff u+w=0\implies u=w=0\\
	 \therefore&\,U+W=U\oplus W\quad\blacksquare\\
 \end{align*}
</details>

<details class="example"><summary>
disprove $U_1\oplus W=U_2\oplus W\implies U_1=U_2$
</summary>
\begin{align*}
    \textsf{let }&W=\{(x,x)\in\R^2\}\\
	 &U_1=\{(0,x)\in\R^2\}\quad U_2=\{(x,0)\in\R^2\}\\
	 &\therefore U_1+W=W=U_2+W\\
	 &\textsf{but }U_1\ne U_2
\end{align*}
</details>
<details class="example"><summary>
show $\R^\R=U_e\oplus U_o$
</summary>

- wts $\R^\R=U_e+U_o$
  - let any $f\in\R^\R$, choose
    $$f_e(x)=\frac{f(x)+f(-x)}2\quad f_o(x)=\frac{f(x)-f(-x)}2$$
	\begin{align*}
		&\because f_e(-x)=\frac{f(-x)+f(x)}2=\frac{f(x)+f(-x)}2=f_e(x)\\
		&\because f_o(-x)=\frac{f(-x)-f(x)}2=-\frac{f(x)-f(-x)}2=-f_o(x)\\
		&\therefore f_e\in U_e\enspace f_o\in U_o\\
		&\because f_e(x)+f_o(x)=\frac{f(x)+f(-x)}2+\frac{f(x)-f(-x)}2=f(x)\\
		&\therefore\forall f\in\R^\R\enspace\exists f_e\in U_e\enspace f_o\in U_o\textsf{ st }f=f_e+f_o\\
		&\therefore \R^\R=U_e+U_o\\
	\end{align*}
- wts $\R^\R=U_e\oplus U_o$
  - let any $f\in U_e\cap U_o$
  \begin{align*}
      &\because f\in U_e\\
      &\therefore f(x)=f(-x)\\
	  &\because f\in U_o\\
	  &\therefore f(x)=-f(-x)\\
	  &\therefore 2f(x)=f(-x)-f(-x)=0\implies f(x)=0\enspace\forall x\in\R\\
	  &\therefore f=0\forall f\in U_e\cap U_o\\
	  &\therefore U_e\cap U_o=\{0\}\\
	  &\therefore \R^\R=U_e+U_o=U_e\oplus U_o\quad\blacksquare\\
  \end{align*}
</details>

# Linear Maps
## Vector Space of Linear Maps
<details class="definition"><summary>
Map $T:V\to W$ is **linear** iff all:
</summary>
- $\forall u,v\in V\quad T(u+v)=Tu+Tv\implies T(0)=0$
- $\forall\lambda\in F,v\in V\quad T(\lambda v)=\lambda(Tv)$
</details>
<details class="definition"><summary>
Add and Scalar-Mul on $\mathcal L(V,W)$
</summary>
for $S,T\in\mathcal L(V,W)$
$$(S+T)v=Sv+Tv\quad(\lambda T)v=\lambda(Tv)$$

- $\forall v\in V$
- commutativity, associativity, distributivity
</details>
<details class="definition"><summary>
Product of Linear Maps
</summary>
for $T\in\mathcal L(U,V)$ and $S\in\mathcal L(V,W)$
$$ST\in\mathcal L(U,W)\quad(ST)u=S(Tu)$$

- $\forall u\in U$
- associativity, distributivity
</details>
<details class="theorem"><summary>
Map basis
</summary>
if $\{v_i\}$ is a basis of $V^n$ and $\{w_i\}$ is a basis of $W^n$, then
$$\exist!T\in\mathcal L(V,W)\textsf{ st }Tv_i=w_i$$
</details>

## Null and Image Spaces
### Null Space & Injectivity
<details class="definition"><summary>
null space for $T\in\mathcal L(V,W)$
</summary>
$$\mathrm{null}\,T=\{v\in V:Tv=0\}\subseteq V$$
</details>
<details class="definition"><summary>
$T\in\mathcal L(V,W)$ is **injective** iff any:
</summary>
- $Tu=Tv\implies u=v$
- $\mathrm{null}\,T=\{0\}$
</details>

### Image Space & Surjectivity
<details class="definition"><summary>
image space for $T\in\mathcal L(V,W)$
</summary>
$$\mathrm{im}\,T=\{Tv:v\in V\}\subseteq W$$
</details>
<details class="definition"><summary>
$T\in\mathcal L(V,W)$ is **surjective** iff any:
</summary>
- $\mathrm{im}\,T=W$
- $\forall w\in W\enspace\exist v\in V\textsf{ st }Tv=w$
</details>

### Finite Dimensional
<details class="theorem"><summary>
Fundamental Theorem of Linear Maps
</summary>
for $T\in\mathcal L(V^n,W^m)$
\begin{align*}
\dim V&=\dim \mathrm{null}\,T+\dim \mathrm{im}\,T\\
n&=\dim \mathrm{null}\,T+\mathrm{rank}\,T\\
\end{align*}

$\therefore T:V^n\to W^m$ is

- **injective** iff any
  - $\dim \mathrm{null}\,T=0$
  - $\mathrm{rank}\,T=n$ (aka full rank)
- **surjective** iff any
  - $\mathrm{rank}\,T=m$
  - $\mathrm{im}\,T=W^n$
</details>

<details class="example"><summary>
Prove Fundamental Theorem of Linear Maps for $T\in\mathcal L(V,W)$
</summary>

- wts $\dim V=\dim\mathrm{null}\,T+n$
\begin{align*}
    \textsf{let }&\{u_i\}^m_{i=1}\textsf{ be a basis of }\mathrm{null}\,T\\
    \therefore&\,\dim\mathrm{null}\,T=m\\
	\because&\,\forall i\enspace u_i\in\mathrm{null}\,T\textsf{ is a basis}\\
	\therefore&\,\forall i\enspace u_i\in V\textsf{ is indep}\\
	\therefore&\,\{u_1,\cdots,u_m\}\textsf{ can be extended to }\\
	&\,\{u_i,\cdots,u_m,v_1,\cdots,v_n\}\textsf{ as a basis of }V\\
	\therefore&\,\dim V=m+n=\dim\mathrm{null}\,T+n\\
\end{align*}
- wts $n=\dim\mathrm{im}\,T$
  - wts $\{Tv_i\}^n_{i=1}$ is a basis of $\mathrm{im}\,T$
    - wts $\mathrm{im}\,T=\mathrm{sp}\{Tv_i\}$

	\begin{align*}
	    \textsf{let any }&v\in V\\
		\because&\,v=\mathrm{span}\{u_1,\cdots,u_m,v_i,\cdots,v_n\}\\
		\therefore&\,v=\sum_{i=1}^m a_iu_i+\sum_{i=1}^nb_iv_i\quad a_i,b_i\in F\\
		\therefore&\,Tv=\sum_{i=1}^m a_iTu_i+\sum_{i=1}^nb_iTv_i\tag{\sf $T$ is linear}\\
		\because&\,u_i\in\mathrm{null}\,T\\
		\therefore&\,Tv=0+\sum_{i=1}^nb_iTv_i=\sum_{i=1}^nb_iTv_i\\
		\therefore&\,\forall Tv\in\mathrm{im}\,T\enspace\exist b_i\in F\textsf{ st }Tv=\sum_{i=1}^nb_iTv_i\\
		\therefore&\,\mathrm{im}\,T=\mathrm{sp}\{Tv_i\}
	\end{align*}
	  - wts $\{Tv_i\}$ is indep

	\begin{align*}
	    \textsf{suppose }&\,c_1Tv_1+\cdots+c_nTv_n=0\quad c_i\in F\\
		\therefore&\,T(c_1v_1+\cdots+c_nv_n)=0\tag{\sf $T$ is linear}\\
		\therefore&\,\sum_{i=1}^nc_iv_i\in\mathrm{null}\,T\\
		\because&\,\mathrm{null}\,T=\mathrm{sp}\{u_i\}_{i=1}^m\\
		\therefore&\,\sum_{i=1}^nc_iv_i=\sum_{i=1}^md_iu_i\quad d_i\in F\\
		\therefore&\,\sum_{i=1}^nc_iv_i-\sum_{i=1}^md_iu_i=0\\
		\because&\,\{u_1,\cdots,u_m,v_1,\cdots,v_n\}\textsf{ is indep}\\
		\therefore&\,c_1=\cdots=c_n=0\\
		\therefore&\,\{Tv_i\}^n_{i=1}\textsf{ is indep}
	\end{align*}
	- $\therefore\{Tv_i\}^n_{i=1}$ is a basis of $\mathrm{im}\,T$
  - $\therefore\dim\mathrm{im}\,T=n$
- $\therefore\dim V=m+n=\dim\mathrm{null}\,T+\dim\mathrm{im}\,T\quad\blacksquare$

</details>

## Matrices
<details class="definition"><summary>
$\mathcal M(T)$ for $T\in\mathcal L(V^n,W^m)$
</summary>
if $T:V^n\to W^m$ then
$$\mathcal M(T)=\begin{bmatrix}
    T\vec b_1&T\vec b_2&\cdots&T\vec b_n
\end{bmatrix}\in M^{m\times n}$$
where $\{\vec b_i\}$ is a basis of $V^n$
</details>

## Product Space
<details class="definition"><summary>
Cross Product
</summary>
$$\prod V_i=\{(v_1,\cdots,v_n):v_i\in V_i\}$$
</details>
<details class="theorem"><summary>
Dimension of Product
</summary>
$$\dim \prod V_i=\sum\dim V_i$$
</details>

### With Direct Sum
<details class="definition"><summary>
$\displaystyle\Gamma:\prod U_i\to\sum U_i\quad$ (a finite dimension map)
</summary>
$$\Gamma(u_1,\cdots,u_n)=u_1+\cdots+u_n$$

- $\Gamma$ is **surjective** by obviousness
</details>
<details class="theorem"><summary>
$\displaystyle\sum U_i=\bigoplus U_i\iff\Gamma$ is **injective**
</summary>
**Proof.** assume $\sum U_i=\bigoplus U_i$

\begin{align*}
    &\therefore\sum u_i=0\iff u_i=0\\
	&\therefore\Gamma(u)=0\iff u=0\\
	&\therefore\mathrm{null}\,\Gamma=\{0\}\\
\end{align*}
</details>
<details class="theorem"><summary>
$\displaystyle\sum U_i=\bigoplus U_i\iff\dim \sum U_i=\sum\dim U_i$
</summary>
**Proof.**
\begin{align*}
    &\because\Gamma\textsf{ is \textbf{surjective}}\\
	&\therefore\dim \mathrm{im}\,\Gamma=\dim \sum U_i\\
	&\therefore\dim \prod U_i=\dim \mathrm{null}\,\Gamma+\dim \sum U_i\\
	&\because\dim \prod U_i=\sum\dim U_i\\
	&\therefore\Gamma\textsf{ is \textbf{injective}}\iff\sum\dim U_i=\dim \sum U_i\\
    &\therefore\sum U_i=\bigoplus U_i\iff\sum\dim U_i=\dim \sum U_i
\end{align*}
</details>

## Quotient Space
<details class="definition"><summary>
$\displaystyle v+U\textsf{ for }v\in V,U\subseteq V$
</summary>
$$v+U=\{v+u:u\in U\}$$

- is a **affine subset** of $V$
- is **parallel** to $U$
</details>
<details class="definition"><summary>
$\displaystyle V/U\textsf{ for }U\subseteq V$
</summary>
$$V/U=\{v+U:v\in V\}$$

- is set of all affine subsets parallel to $U$
</details>
<details class="theorem"><summary>
Two affine subsets parallel to $U$ are equal ⊻ disjoint
</summary>
for $U\subseteq V\enspace v,w\in V$, equiv:

- $v-w\in U$
- $v+U=w+U$
- $(v+U)\cap(w+U)\ne\varnothing$
</details>
<details class="definition"><summary>
Add and Scalar-Mul on $V/U$
</summary>
for $v,w\in V\enspace U\subseteq V\enspace\lambda\in F$
\begin{align*}
    (v+U)+(w+U)&=v+w+U\\
    \lambda(v+U)&=\lambda v+U\\
\end{align*}

</details>
<details class="definition"><summary>
Quotient Map $\pi:V\to V/U$
</summary>
$$\pi(v)=v+U$$

- $\mathrm{null}\,\pi=U$
- $\mathrm{im}\,\pi=V/U$ (aka **surjective**)
</details>
<details class="theorem"><summary>
Dimension of Quotient Space
</summary>
for **finite-dimensional** $V$ and $U\subseteq V$
$$\dim V/U=\dim V-\dim U$$
</details>
<details class="definition"><summary>
$\tilde T:V/\mathrm{null}\,T\to W$
</summary>
for $T\in\mathcal L(V,W)$
$$\tilde T(v+\mathrm{null}\,T)=Tv$$
</details>
<details class="theorem"><summary>
First Isomorphism Theorem
</summary>
for $T\in\mathcal L(V,W)$
$$V/(\mathrm{null}\, T)\cong\mathrm{im}\,T$$
</details>
<details class="example"><summary>
prove First Isomorphism Theorem
</summary>
- given $T\in\mathcal L(V,W)$
- let $K=\mathrm{null}\,T$
- define $\tilde T:V/K\to\mathrm{im}\,T\textsf{ st }\tilde T(v+K)=Tv\enspace\forall v\in V$

1. wts $\tilde T$ is **well defined**
\begin{align*}
&&\textsf{let any }&v,w\in V\textsf{ st }v+K=w+K\\
\implies&&v-w&\in\mathrm{null}\,T\\
\implies&&T(v-w)&=0\tag{\sf def of null}\\
\implies&&T(v)-T(w)&=0\tag{\sf $T$ is linear}\\
\implies&&T(v)&=T(w)\\
\implies&&\tilde T(v+K)&=\tilde T(w+K)\tag{\sf def of $\tilde T$}
\end{align*}

2. wts $\tilde T$ is **linear**
\begin{align*}
    \textsf{let any }&u,v\in V\quad\lambda\in F\\
	\therefore&\,\tilde T((u+K)+\lambda(v+K))=\tilde T((u+\lambda v)+K)\\
	&=T(u+\lambda v)=Tu+\lambda Tv\tag{\sf $T$ is linear}\\
	&=\tilde T(u+K)+\lambda\tilde T(v+K)\tag{\sf by def}\\
	\therefore&\,\tilde T\textsf{ is linear}
\end{align*}

3. wts $\tilde T$ is **isomorphism** i.e. $V/K\cong\mathrm{im}\,T$
	- wts $\tilde T$ is **injective**
\begin{align*}
    \textsf{let any }&v\in V\textsf{ st }\tilde T(v+K)=0\qquad\\
	\therefore&\,\tilde T(v+K)=Tv=0\tag{\sf def of $\tilde T$}\\
	\therefore&\,v\in\mathrm{null}\,T=K\tag{\sf def of $\mathrm{null}\,T$}\\
    \because&\,v-0=v\in K\\
	\therefore&\,v+K=0+K=K\tag{\sf affine subset prop}\\
	\therefore&\,\mathrm{null}\,\tilde T=\{K\}\tag{\sf null is trivial}\\
	\therefore&\,\tilde T\textsf{ is \textbf{injective}}
\end{align*}
	- wts $\tilde T$ is **surjective**
\begin{align*}
	\textsf{let any }&Tv\in\mathrm{im}\,T\\
	\because&\,T\in\mathcal L(V,W)\\
	\therefore&\,v\in V\\
	\therefore&\,v+K\in V/K\\
	\therefore&\,\tilde T(v+K)=Tv\in\mathrm{im}\,T\\
	\therefore&\,\forall Tv\in\mathrm{im}\,T\enspace\exists v+K\in V/K\textsf{ st }\tilde T(v+K)=Tv\\
	\therefore&\,\tilde T\textsf{ is \textbf{surjective}}
\end{align*}
    - $\therefore V/K\cong\mathrm{im}\,T\quad\blacksquare$
</details>

# Eigenvalues/vectors

## Invariant Subspace
<!--
<details class="definition"><summary>
for $T\in\mathcal L(V)\enspace U\sube V\quad U$ is **invariant** under $T$ iff
</summary>
$$u\in U\implies Tu\in U$$
</details>
-->
<details class="definition"><summary>
for $T\in\mathcal L(V)\quad\lambda\in F$ is an **eigenvalue** iff
</summary>
$$\exist v\ne0\in V\textsf{ st }Tv=\lambda v$$
</details>
<details class="theorem"><summary>
for $T\in\mathcal L(V^n)\enspace\lambda\in F$, equiv:
</summary>
- $\lambda$ is an **eigenval** of $T$
- $T-\lambda I$ is not **injective**
- $T-\lambda I$ is not **surjective**
- $T-\lambda I$ is not **invertible**
- $|T-\lambda I|=0$
</details>
<details class="definition"><summary>
for $T\in\mathcal L(V)\enspace\lambda\in F$ is an eigenval of $T$<br>then $v\ne0\in V$ is an **$\lambda$-eigenvector** of $T$ iff
</summary>
$$Tv=\lambda v\iff(T-\lambda I)v=0\iff v\in\mathrm{null}(T-\lambda I)$$
</details>

