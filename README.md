# daily
用以记录日常所学所看所想

记初衷，
不明不白当了两年iOS开发，可笑的是之前还天真的认为能力要靠进公司才会进步。在公司裁员后，我陷入了2个月的空闲期，期间有想过转行，但觉得敲代码还是有意思的。明白很多东西不是进了公司才学，而是私底下自己去掌握去了解的。

大道至简，无非千锤百炼。

希望自己能坚持日常更新。
做不做得好是能力问题，做不做就是态度问题了。


2017.3.8
研究monkey的源码。
MVVM的架构让VC里少了不少代码，其中比较惊艳到我的是对tableView，datasource的使用，以及VM于model还有VC之间的关系。
发现了titleView这个属性。
一些搜索条之类的UI可以直接复于上面，但是最好自己初始化一个view复给titleView。

2017.3.9
今天敲了点C语言的代码，因为我认为c语言代码对培养逻辑以及了解计算机如何工作有很大帮助。
guessNumber里是C语言程序设计的课程练习。发现了c里的loop得靠死循环去实现.（所以runloop是个死循环没有错了。
poker里最先用的C语言程序设计的练习代码，模拟52张扑克输出5张判断是什么类型的牌.（可以理解为这是德州扑克的一种算法。
后来换了一种思路，即只管拿到手的5张牌是否重复是否合理，与练习的思路相反。（思路一下子有了，代码实现却用了1个小时，可见对c语言驾驭能力还不够

2017.3.10
练习了点swift，以及读了一些OC网络相关的文章。
swift给我感觉比OC要简单粗暴很多，简洁的语法很让人喜欢，不禁联想到了高级版本的RAC。
OC网络相关的文章一时消化不了，等能消化好了去写一篇长的技术文吧。

2017.3.11
敲了会swift，时间并不是很充裕。
不过走路的时候会在想，果然很多语法很多语言都是互通的，都是由数据类型，函数，实参，形参，之类的依靠思想组合起来的东西。

2017.3.12
通过抓包研究了tcp的三次握手机制明白了一些header里隐藏的内容。
通过对swift的class研究发现了swift的简洁，这周打算出一篇文章对比一下swift与oc的基本方法的区别来加深对swift的理解。

2017.3.13
通过MVVM的的设计模式获取了豆瓣API的数据并展示到tableview上。（目前打算通过线程以及一些加载动画去优化取到data-展现data这个过程。
明白了所谓的循环引用的代码实际意义是怎样的，（感觉已经能看懂oc高级编程的block的深入理解那章了。


2017.3.14
看了Object-C高级编程的GCD那一章。（感觉多线程什么的还是主要用在通信上，比如请求之类的。
研究了十道面试题。(感觉自己的oc基础已经很牢固了该往其他方向多多发展)

2017.3.15 
研究了c语言的指针，思考结论得出oc里的对象指针应该是只能指针里的一种。

2017.3.16
深入了深浅复制，明白了不可变对象copy后的复制就是浅复制，其他都是深复制，照这么说来，其实=也是浅复制。
开始着手做一个下拉刷新，大致明白是用kvo通过检测scrollview来判断。

2017.3.17
制作了一个简单的下拉刷新。下一步打算仿一个美团的动图下拉刷新。图片可变化。
