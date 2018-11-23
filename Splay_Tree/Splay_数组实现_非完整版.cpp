//我们来用数组实现一下splay
//用指针的话,代码比较冗杂,不好看,不好做,还有各种NULL的复杂判断 
//用数组的话,有一点需要注意,不需要自定义struct,全部都在外面 
//通过链表我们学到了很多,也掌握了其中的部分原理
//今天我们学习数组实现,注释照样有,不用担心,我们重讲
#include <iostream>
#include <cstdio>
#include <cstring>
#include <algorithm>
#include <climits>
using namespace std;
const int maxn=100000+11;
int father[maxn],child[maxn][2],root; //亲切的变量名称,早已经不是node类型了
int value[maxn],ind; //value不用说,ind自然就是节点个数统计,同时也是存储点的必备变量 
inline void rotate(int p)
{
	int q=father[p],y=father[q],x=child[q][1]==p; //各个变量名请注意 q是p的父亲,y是p的祖父
	//请熟悉一下x这种先判断在赋值的这种写法,x是判断p究竟是左孩子还是右孩子,若是左孩子则为0;反之则为1 
	//我们这里假设x=0,即p为q的左孩子 
	child[q][x]=child[p][x^1]; father[child[q][x]]=q; 
	//q's left son = p's right son; q's left son此时已经变成了p's right son; 
	//此时让q's left son的father在为q,实际上就是让p's right son的father为q 
	child[p][x^1]=q; father[q]=p;
	//p's right son = q (因为q本身比p大); q's father=p;
	father[p]=y; //p's father = y;
	if(y) //y是否存在,y如果不存在相当于NULL 
	{
		//确定q在原来那棵树中是左孩子还是右孩子,因为p经过旋转取代了q的位置,所以更新q为p 
		if(child[y][0]==q) child[y][0]=p;
		else if(child[y][1]==q) child[y][1]=p;
	}
}
inline void splay(int x)
{
	for(int y;y=father[x];rotate(x)) //和数组相比,此处用了for循环来缩短代码,注意这里默认将x旋转到root 
	  if(father[y]) //如果祖父不是root 每次都执行一次单旋,当然如果算上for数组中的rotate,那么应该没每次都进行一次双旋 
	    if((x==child[x][0]) && (y==child[father[y]][0])) //旋转方式判断 
	      rotate(y);
	    else//如果祖父是root了的话,那么只剩下最后两次旋转,因为再rotate rotate 然后判断,for循环结束 
	      rotate(x);
	root=x; //正如上面所说,我们直接将这个数旋转到根 
}
inline void insert(int x,int v) //注意insert多了个变量,到底是做什么用的呢,我们来看一下
{
	int y;
	while(true)
	{
		y=child[x][value[x]<v];
		if(y==0)
		{
			y=++ind;
			value[y]=v;
			child[y][0]=child[y][1]=0;
			father[y]=x;
			child[x][k[x]<v]=y;
			break;
		}
		x=y;
	}
	splay(y);
}
int main()
{
	
	return 0;
} 
