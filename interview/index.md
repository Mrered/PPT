---
marp: true
paginate: true
size: 4:3
# theme: uncover
math: mathjax
backgroundImage: url("../public_assets/bg.webp")
style: |
  h1{
    color: #1188FF;
    position: fixed;
    top: 240px;
  }
  h2{
    color: #0077EE;
    position: fixed;
    top: 37px;
    left: 120px;
    margin-bottom: 30px;
  }
  h3{
    text-align: left;
    position: fixed;
    top: 70px;
    left: 120px;
    margin-bottom: 30px;
  }
---

<!-- markdownlint-disable MD001 MD004 MD024 MD033 -->
<!-- headingDivider: 2 -->
<!-- <style scoped> section {text-align: center} </style> -->

# 三相异步电动机 $\mathrm{Y}-\pmb{\triangle}$ 降压启动电路

<!-- _paginate: false -->

![bg](../public_assets/begin.webp)

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

> 周大添

## 上节回顾

### 三相异步电动机 $\mathbf{T}$ 型等效电路图

![bg](../public_assets/bg_title.webp)

<br>
<br>
<br>

<p style="text-align: center"><img src="./assets/三相交流电机.drawio.svg" width="auto" height="auto" style="display: inline-block" alt="三相异步电动机的 T 型等效电路图"></p>

## 上节回顾

### 转子旋转时异步电动机的平衡方程

![bg](../public_assets/bg_title.webp)

<br>

$$
\left.
\begin{aligned}
  \dot{U}_{1} & = - \dot{E}_{1} + \dot{I}_{1}\dot{Z}_{1} \\
  \dot{E}'_{2} & = \dot{I}'_{2} \left( \frac{R'_{2}}{s} + jX'_{2}\right) \\
  \dot{I}_{1} & = \dot{I}_{0} - \dot{I}'_{2} \\
  \dot{E}_{1} & = \dot{E}'_{2} \\
  \dot{E}_{1} & = - \dot{I}_{0}Z_{m}
\end{aligned}
\right\} \qquad (1)
$$

---

![bg](../public_assets/contents.webp)

1. 异步电动机启动的条件
2. 启动电流和启动转矩
3. 直接启动及其问题
4. $\mathrm{Y}-\pmb{\triangle}$ 启动原理
5. $\mathrm{Y}-\pmb{\triangle}$ 启动控制电路

# 异步电动机启动的条件

<style scoped>
  h1 {
    margin-left: 250px;
    padding: 60px;
  }
</style>

![bg](../public_assets/01.webp)

---

![bg right:70%](./assets/实物图.webp)

三相异步
电动机
$\mathrm{Y}-\pmb{\triangle}$
降压启动
控制器
实物图

---

![bg](../public_assets/bg_title.webp)

### 异步电动机启动的条件

#### 启动电流要小

> 启动电流太大会对电机造成损伤，对电网产生冲击。

#### 启动转矩要大

> 启动转矩太小将无法拖动负载。

# 启动电流和启动转矩

<style scoped>
  h1 {
    margin-left: 250px;
    padding: 60px;
  }
</style>

![bg](../public_assets/02.webp)

---

异步电动机接电启动的瞬间

* $n = 0$
* $s = 1$

![bg left:55% w:550px](./assets/三相交流电机.drawio.svg)

---

启动时 $s = 1$

*负载阻抗* $R'_2 = 0$

*励磁阻抗* $Z_{m}$ 远远大于 *漏阻抗* $Z'_{2}$

简化等效电路
忽略励磁支路

![bg left:55% w:550px](./assets/三相交流电机启动.drawio.svg)

---

### 启动电流（相电流）

![bg](../public_assets/bg_title.webp)

<br>
<br>
<br>

<p style="text-align: center"><img src="./assets/三相交流电机启动.drawio.svg" width="70%" height="auto" style="display: inline-block" alt="三相交流电机启动"></p>

$$
I_{\mathrm{s}} = \frac{U_1}{Z_{\mathrm{k}}} = \frac{U_1}{\sqrt{\left(R_1 + R'_2 \right)^{2} + \left(X_1 + X'_2 \right)^{2}}} \qquad (2)
$$

---

### 启动电流

![bg](../public_assets/bg_title.webp)

<br>
<br>
<br>

一般笼型异步电动机阻抗标幺值 $Z_{\mathrm{k}}^{*} = 0.14 \sim 0.25$ 。

在额定电压标幺值 $U_1^{*} = 1$ 下直接启动，启动电流标幺值

$$
I_{\mathrm{s}}^{*} = \frac{U_1}{Z_{\mathrm{k}}^{*}} = 4 \sim 7
$$

即

$$
I_{\mathrm{s}}^{*} = k_{\mathrm{I}} = \frac{I_{\mathrm{s}}}{I_{\mathrm{N}}} = 4 \sim 7
$$

---

### 启动转矩

![bg](../public_assets/bg_title.webp)

<br>
<br>
<br>

启动转矩倍数

$$
k_{\mathrm{st}} = 0.9 \sim 1.3
$$

> 想一想为什么？

<br>
<br>

#### <mark>结论</mark>

异步电动机启动时

- **启动电流很大**（$k_{\mathrm{I}} = 4 \sim 7$），
- **启动转矩并不大**（$k_{\mathrm{st}} = 0.9 \sim 1.3$）。

# 直接启动及其问题

<style scoped>
  h1 {
    margin-left: 260px;
    padding: 60px;
  }
</style>

![bg](../public_assets/03.webp)

---

### 异步电动机直接启动

![bg](../public_assets/bg_title.webp)

<br>
<br>
<br>

**直接启动** 指不采用其他启动设备，电机在额定电压和额定功率下直接启动。

在 **变压器容量较大** ，**电机容量相对较小** 的情况下，笼型异步电动机可以采用直接启动。

额定功率在 $7.5 \mathrm{kW}$ 以下的小容量笼型异步电动机可以直接启动。

---

### 降低启动电流的方法

![bg](../public_assets/bg_title.webp)

异步电动机直接启动时启动电流 $I_{\mathrm{s}}^{*}$ 是额定电流的 $4 \sim 7$ 倍。

过大的电流会导致

* 电机发热引起的 **能量损耗** 甚至 **电机损坏**，
* 变压器容量不足时导致的变压器 **二次侧电压下降**，
* 电路中的其他用电设备会因电压波动 **运行不稳定**，
* 甚至会导致 **对电压波动敏感设备** （如电脑、路由器、交换机、工控机、服务器等）的损坏。

---

### 降低启动电流的方法

![bg](../public_assets/bg_title.webp)

为了避免启动电流 $I_{\mathrm{s}}^{*}$ 过大，根据

$$
I_{\mathrm{s}} = \frac{U_1}{Z_{\mathrm{k}}} = \frac{\pmb{U_1}}{\sqrt{\left(R_1 + \pmb{R'_2} \right)^{2} + \left(X_1 + X'_2 \right)^{2}}} \qquad (2)
$$

可以人工调节的变量有 $U_1$ 和 $R'_2$ 。

---

### 降低启动电流的方法

![bg](../public_assets/bg_title.webp)

<br>
<br>
<br>

启动方法

* 降压启动
  * 定子串电抗（电阻）启动
  * $\mathrm{Y}-\pmb{\triangle}$ 启动
  * 自耦变压器启动
  * 软启动
* 绕线形电机转子串电阻
  * 转子串电阻启动
  * 转子串频敏变阻器启动
* ……

# $\mathrm{Y}-\pmb{\triangle}$ 启动原理

<style scoped>
  h1 {
    margin-left: 250px;
    padding: 60px;
  }
</style>

![bg](../public_assets/04.webp)

---

### $\mathrm{Y}-\pmb{\triangle}$ 启动的条件

![bg](../public_assets/bg_title.webp)

运行时定子绕组接成 $\pmb{\triangle}$ 形，且三相绕组首尾六个端点全部引出来的三相异步电动机才能采用 $\mathrm{Y}-\pmb{\triangle}$ 起动。

---

### $\mathrm{Y}-\pmb{\triangle}$ 启动接线图

![bg](../public_assets/bg_title.webp)

<br>
<br>

<p style="text-align: center"><img src="./assets/异步电动机星三角启动接线图.drawio.svg" width="auto" height="auto" style="display: inline-block" alt="三相交流电机启动"></p>

---

<style scoped> section {text-align: center} </style>

### $\mathrm{Y}-\pmb{\triangle}$ 启动等效电路

![bg](../public_assets/bg_title.webp)

<br>
<br>
<br>

<p style="text-align: center"><img src="./assets/等效电路.drawio.svg" width="auto" height="auto" style="display: inline-block" alt="三相交流电机启动"></p>

（a）$\mathrm{Y}$ 接法等效电路 $\quad$ （b）$\pmb{\triangle}$ 接法等效电路

---

### $\mathrm{Y}-\pmb{\triangle}$ 启动等效电路

![bg](../public_assets/bg_title.webp)

<br>
<br>
<br>

<p style="text-align: center"><img src="./assets/等效电路.drawio.svg" width="55%" height="auto" style="display: inline-block" alt="三相交流电机启动"></p>

由上图可以得到

$$
\begin{aligned}
  \frac{U_{X}}{U_{\phi \mathrm{N}}} = \frac{1}{\sqrt{3}} & \qquad \qquad (3) \\
  \frac{I_{\mathrm{st}}}{I_{\phi \mathrm{st}}} = \frac{1}{\sqrt{3}} & \qquad \qquad (4)
\end{aligned}
$$

---

### $\mathrm{Y}-\pmb{\triangle}$ 启动线电流的关系

![bg](../public_assets/bg_title.webp)

<br>
<br>
<br>

$$
\frac{I_{\mathrm{st}}}{I_{\phi \mathrm{st}}} = \frac{1}{\sqrt{3}} \qquad \qquad (4)
$$

$\pmb{\triangle}$ 接法下 **相电流** 与 **线电流** 的关系有

$$
\frac{I_{\mathrm{\phi st}}}{I_{\mathrm{st N}}} = \frac{1}{\sqrt{3}} \qquad \qquad (5)
$$

根据（4）式（5）式可得， $\mathrm{Y}$ 接法的启动 **线电流** 与 $\pmb{\triangle}$ 接法的启动 **线电流** 之比

$$
\frac{I_{\mathrm{st}}}{I_{\mathrm{st N}}} = \frac{1}{3} \quad \qquad \qquad (6)
$$

---

### $\mathrm{Y}-\pmb{\triangle}$ 启动转矩的关系

![bg](../public_assets/bg_title.webp)

<br>
<br>
<br>

$$
\begin{aligned}
  \frac{U_{X}}{U_{\phi \mathrm{N}}} = \frac{1}{\sqrt{3}} & \qquad \qquad (3) \\
  T \propto U^{2} & \qquad \qquad (7)
\end{aligned}
$$

根据（3）式（7）式可得， $\mathrm{Y}$ 接法的启动转矩与 $\pmb{\triangle}$ 接法的启动转矩之比

$$
\frac{T_{\mathrm{Y}}}{T_{\pmb{\triangle}}} = \frac{1}{3} \ \quad \qquad \qquad (8)
$$

#### <mark>结论</mark>

$\mathrm{Y}$ 接法时的 **线电流** $I_{\mathrm{st}}$ 与 **转矩** $T_{\mathrm{Y}}$ 均为 $\pmb{\triangle}$ 接法时的 $\displaystyle \frac{1}{3}$ 。

# $\mathrm{Y}-\pmb{\triangle}$ 启动控制电路

<style scoped>
  h1 {
    margin-left: 250px;
    padding: 60px;
  }
</style>

![bg](../public_assets/05.webp)

---

<style scoped> section {text-align: center} </style>

### 主电路

![bg](../public_assets/bg_title.webp)

<br>
<br>
<br>

<p style="text-align: center; margin-left: 160px;"><img src="./assets/电机.drawio.svg" width="auto" height="auto" style="display: inline-block" alt="三相交流电机启动"></p>

（a）$\mathrm{Y}$ 接法等效电路 $\quad$ （b）$\pmb{\triangle}$ 接法等效电路

---

<style scoped> section {text-align: center} </style>

### 电机控制

![bg](../public_assets/bg_title.webp)

<br>
<br>
<br>

<p style="text-align: center; margin-left: 100px;"><img src="./assets/电机控制.drawio.svg" width="90%" height="auto" style="display: inline-block" alt="三相交流电机启动"></p>

（a）主电路 $\quad$ （b）控制电路

---

<style scoped> section {text-align: center} </style>

### 启动状态1

![bg](../public_assets/bg_title.webp)

<br>
<br>
<br>

<p style="text-align: center; margin-left: 100px;"><img src="./assets/电机控制1.drawio.svg" width="auto" height="auto" style="display: inline-block" alt="三相交流电机启动"></p>

---

<style scoped> section {text-align: center} </style>

### 启动状态2

![bg](../public_assets/bg_title.webp)

<br>
<br>
<br>

<p style="text-align: center; margin-left: 100px;"><img src="./assets/电机控制2.drawio.svg" width="auto" height="auto" style="display: inline-block" alt="三相交流电机启动"></p>

---

<style scoped> section {text-align: center} </style>

### 启动状态3

![bg](../public_assets/bg_title.webp)

<br>
<br>
<br>

<p style="text-align: center; margin-left: 100px;"><img src="./assets/电机控制3.drawio.svg" width="auto" height="auto" style="display: inline-block" alt="三相交流电机启动"></p>

# 感谢聆听

<!-- _paginate: false -->
<style scoped>
  h1 {
    margin-left: 300px;
  }
</style>

![bg](../public_assets/end.webp)
