<div id="left">

<!-- omit in toc -->
# Table of Contents
- [Optimisation](#optimisation)
	- [Geometric (Open Int)](#geometric-open-int)
	- [Distance (Closed)](#distance-closed)
	- [Business (Open)](#business-open)
- [Related Rates](#related-rates)
	- [Geometric](#geometric)

</div>


# Optimisation
1. find known quantities/conditions and unknown
2. draw figure and put labels
3. find single variable function
4. find max/min
5. answer question

## Geometric (Open Int)
> $\text{Dom}(f)$ is usually $\R^+$

1. condition: cylinder to hold 1L (1000ml)<br>
   goal: *minimise* surface area
2. figure and labels<br>
	![](assets/cyn.png)
	- radius $r$
	- height $h$
	- area $A$
	- volume $V=1000$
3. find function
	- $A=2\pi r^2+2\pi rh$
	- $\because V=\pi r^2h=1000\quad\therefore h=\frac{1000}{\pi r^2}$
	  $$\therefore A=2\pi r^2+\frac{2000}r$$
	  (to minimise)
4. minimise (in $\R^+$)
	- find deriv
	  $$A'(r)=4\pi r-2000r^{-2}=\frac{4\pi r^3-2000}{r^2}$$
	- find cp
		- $A'(r)=0$ when $r=\sqrt[3]{\frac{2000}{4\pi}}=\sqrt[3]{\frac{500}\pi}$
		- $A'(r)$ DNE: no such points $\in\R^+$
	- test cp (draw number line)
	  $$\begin{aligned}A'(1)&=\frac{4\pi-2000}1<0\\A'(10)&=\frac{4000\pi-2000}{100}>0\end{aligned}$$
5. $\therefore$ min area at $r=\sqrt[3]{\frac{500}\pi}$

## Distance (Closed)
> test left+right bounds and cps

1. condition: need to go from $A(0,0)$ to $B(3,-8)$
	- $6$km/h to go diag/hori
	- $8$km/h to go vertically
	- minimise time
2. figure and labels<br>
	![](assets/riv.png)
	- speed from $A$ to $D$ is $6$km/h
	- speed from $D$ to $B$ is $8$km/h
3. find func
	$$T(x)=\frac{\sqrt{x^2+9}}6+\frac{8-x}8\\\text{Dom}(T)=[0,8]$$
4. minimise
	$$T'(x)=\frac x{6\sqrt{x^2+9}}-\frac18=\frac{4x-3\sqrt{x^2+9}}{24\sqrt{9+x^2}}$$
	- cps
		- $T'(x)=0$ when $4x=3\sqrt{x^2+9}\Rarr x=9/\sqrt7$
		- $T'(x)$ dne: no such pts in $[0,8]$
	- test
		$$T(0)\approx1.5\quad T(9/\sqrt7)\approx1.3\quad T(8)\approx1.4$$
5. $\therefore$ min time if diag to $9/\sqrt7$km and vert to $B$

## Business (Open)
> maximise profit = revenue - cost<br>
> revenue = x * price(x)
> $$P(x)=R(x)-C(x)=xp(x)-C(x)$$
> (or maximise revenue if cost DNE)

- condition: now sells $200$/week at $350$\$ each<br>
	- $+20$ sells implies $-10$\$ price
- find revenue function and deriv (no cost mentioned)
  $$\begin{aligned}
  p(x)&=350-\frac{10(x-200)}{20}=350-\frac{x-200}2=450-\frac x2\\ 
  R(x)&=xp(x)=450x-\frac{x^2}2\quad x\in\R^+\\
  R'(x)&=450-x\\  
  \end{aligned}$$
- find cp<br>
  $R'(x)=0$ when $x=450$ <br>
  $R(450)=225$

# Related Rates
> $$\frac{dx}{dy}=\frac{dx}{du}\frac{du}{dy}$$

1. find known rates
2. draw figure with labels
3. find equation
4. diff both sides

## Geometric
- cone point down with height $h=10$ and radius $r=5$
- water fills at $9$u<sup>3</sup>/min
- find water level rising rate at height $y=6$
<center>

given $\frac{dV}{dt}$, find $\frac{dy}{dt}$ where $y=6$
</center>

$$\begin{aligned}
	\frac{dV}{dt}&=9\\ 
	V&=\frac{\pi r^2h}3=\frac{\pi x^2y}3\\ 
	\frac xy&=\frac rh=\frac12\Rarr x=\frac y2\\
	\therefore V&=\frac{\pi y}{3}\cdot\frac{y^2}4=\frac\pi{12}y^3\\ 
	\frac{dV}{dt}&=\frac{\pi}4y^2\frac{dy}{dt}=9\\ 
	\frac{dy}{dt}&=\frac{36}{\pi y^2}=\frac1\pi
\end{aligned}$$