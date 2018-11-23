#include <iostream>
#include <cstring>
#include <algorithm>
#include <cstdio>
using namespace std;
const int maxn=100000+11;
struct node
{
	int size;
	int value,value_same_cnt;
	node *child[2],*father;
	void recount_size() //recount的目的是处理有相同值的情况下避免统计size重复 
	{
		if(child[0]==NULL && child[1]==NULL) {size=value_same_cnt;return;}
		if(child[0]==NULL) {size=child[1]->size+value_same_cnt;return;}
		if(chile[1]==NULL) {size=child[0]->size+value_same_cnt;return;}
		size=child[0]->size+child[1]->size+value_same_cnt;
	}
};
struct Splay_Tree
{
	node* root;
	int node_address_cnt;
	node address[maxn]; //采用树的顺序结构储存,用node数组在计算机内存中开辟一个属于Splay_Tree的空间
	void clear_tree()
	{
		root=NULL;
		node_address_cnt=0;
	}
	void rotate(node* x,bool flag) //flag==1表示要右旋zig,flag==0表示要左旋zag 
	{
		//我们假设flag==1,即要右旋zig
		node* y=x->father; //y is x's father || y是一个独立出来的临时树 
		y->child[!flag]=x->child[flag]; //y's left son = x's right son (maybe x's right son is NULL)
		if(x->child[flag]!=NULL) x->child[flag]->father=y; //if x's right son exist, let x's right son have father Y
		x->father=y->father; //x's father = y's father ==> x'father = x'grandfather (Also we have MAYBE)
		if(y->father!=NULL) //寻找y究竟是左孩子还是右孩子,并将x旋转到y 
		{
			if(y==y->father->child[flag]) //判断自己到底是左孩子还是右孩子 
			  y->father->child[flag]=x;
			else
			  y->father->child[!flag]=x;
		}
		x->child[flag]=y; //becase father>left son ; father<right son ; x's right son = y
		y->father=x;//let y's father = x  rotate finish!
		y->recount_size(); //re-calculate the size
		x->recount_size(); //re-calculate the size
	}
	void splay(node* x,node* target) //将x旋转到target之下,一般都是target==root 
	{
		while(x->father!=target) //只要当下节点的父亲不是target就做 
		{
			if(x->father->father==target) //自己的祖父是target的话,我们只剩下一次旋转,那么本次旋转的方向就要看我们到底是左孩子还是右孩子 
			  if(x->father->child[0]==x) //类似rotate中的判断,不再赘述 
			    rotate(x,1);
			  else
			    rotate(x,0);
			else
			{
				node* y=x->father; node* z=y->father; //看旋转方式 zagzag,zagzig,zigzag,zigzig 四种 
				if(z->child[0]==y)
				  if(y->child[0]==x)
				    {rotate(y,1); rotate(x,1);}
				  else
				    {rotate(x,0); rotate(x,1);}
				else
				  if(y->child[0]==x)
				    {rotate(x,1); rotate(x,0);}
				  else
				    {rotate(y,0); rotate(x,0);}
			}
		}
		if(target==NULL) root=x;
	}
	void insert(int num) //插入某一个值 
	{
		if(root=NULL) //万事开头难,树一开始是空的,所以我们要先弄第一个节点--根 
		{
			node_address_cnt=0; node_address_cnt++;
			root=&address[node_address_cnt]; //给根开辟一个地址,我们用顺序结构储存地址(顺序结构-->从上到下,从左到右)
			root->child[0]=NULL; root->child[1]=NULL; root->father=NULL;
			root->value=num;
			root->size=1; root->value_same_cnt=1;  //其他什么的全部初始化 
			return; //然后就返回了,不要继续做(没看下面没加else吗) 
		}
		node *x=root,*y;
		while(1) //无限循环,直到找到这个数字应放的位置,最后splay一下调整 
		{
			x->size++;
			if(num==x->value) //如果跟某一节点的值相同,那么处理相同的情况 
			{
				x->value_same_cnt++;
				x->recount_size(); //不用担心会重复计算,因为recount_size中重新覆盖了size
				y=x;
				break;
			}
			else //在这里做一个对于下面判断的注释,不要忘了splay树的特点: left son < father < right son. 然后就不用多说了 
			  if(num<x->value)
			  {
			  	if(x->child[0]!=NULL)
			  	  x=x->child[0];
			  	else
			  	{
			  		node_address_cnt++;
			  		x->child[0]=&address[node_address_cnt];
			  		y=x->child[0];
			  		y->value=num;
			  		y->size=1; y->value_same_cnt=1;
			  		y->child[0]=NULL; y->child[1]=NULL;
			  		y->father=x;
			  		break;
			  	}
			  }
			  else
			  {
			  	if(x->child[1]!=NULL)
			  	  x=x->child[1];
			  	else
			  	{
			  		node_address_cnt++;
			  		x->child[1]=&address[node_address_cnt];
			  		y=x->child[1];
			  		y->value=num;
			  		y->size=1; y->value_same_cnt=1;
			  		y->child[0]=NULL; y->child[1]=NULL;
			  		y->father=x;
			  		break;
			  	}
			  }
		}//各种赋地址,各种初始化,只是别忘了外面还有个while(1),注意什么时候break就行了(when? Ans:找到应该搁哪的时候)
		splay(y,NULL); //调整Splay_Tree;
	}
	node* search(int key) //找到key所在的位置,并以node*的形式返回.寻找方式很简单,利用Splay_Tree的特点
	{ 
		if(root==NULL) return NULL;
		node *x=root,*y=NULL;
		while(1)
		{
			if(key==x->value)
			{
				y=x;
				break;
			}
			else
			{
				if(key<x->value)
				{
					if(x->child[0]!=NULL)
					  x=x->child[0];
					else
					  break;
				}
				else
				{
					if(x->child[1]!=NULL)
					  x->child[1];
					else
					  break;
				}
			}
		}
		splay(x,NULL); //找到了的那个值就直接经过splay操作旋转至根 
		return y;
	}
	node* search_min(node *x) //找到最小值,只要沿着树的最左边的那条边深入到底即可,以node*的形式返回 
	{
		node *y=x->father;
		while(x->child[0]!=NULL) x=x->child[0];
		splay(x,y); //找到最小值后直接将最小值通过splay操作旋转至从哪里开始找的那个点的下面 
		return x;
	}
	node* search_max(node *x)
	{
		node *y=x->father;
		while(x->child[1]!=NULL) x=x->child[1];
		splay(x,y);
		return x;
	}
	void remove(int num)
	{
		if(root==NULL) return;
		node *x=search(num),*y;
		if(x==NULL) return;
		if(x->value_same_cnt>1)
		{
			x->value_same_cnt--;
			x->recount_size();
			return;
		}
		else
		{
			if(x->child[0]==NULL && x->child[1]==NULL)
			{
				clear_tree();
				return;
			}
			else
			{
				if(x->child[0]==NULL)
				{
					root=x->child[1];
					x->child[1]->father=NULL;
					return;
				}
				else
				{
					if(x->child[1]=NULL)
					{
						root=x->child[0];
						x->child[0]->father=NULL;
						return;
					}
				}
			}
		}
		y=search_min(x->child[1]); //删点的旋转可以是右子树的最小值最后转到根;也可以是左子树的最大值最后转到根.两者的意思相同 
		y->father=NULL; //y原先的father就是我们要删的那个点 
		y->child[0]=x->child[0]; //y's left son = x's left son
		x->child[0]->father=y; //x's left son's father = y (认贼作父)
		y->recount_size(); //recalculate the size
		root=y; 
	}
//-后面就要看题目的需要了,下面的代码持续更新ing,目的是将所有splay能干的都包含进来-//
	node* find_kth_min(int ord_num)
	{
		if(root==NULL || ord_num>root->size) return NULL;
		node *x=root;
		while(1)
		{
			if(ord_num>=x->child[0]->size+1 && ord_num<=x->child[0]->size+x->value_same_cnt)
			  break;
			else
			{
				if(ord_num<=x->child[0]->size)
				  x=x->child[0];
				else
				{
				  ord_num-=x->child[0]->size+x->value_same_cnt;
				  x=x->child[1];
				}
			}
		}
		splay(x,NULL);
		return x;
	}
	node *find_kth_max(int ord_num)
	{
		if(root==NULL || ord_num>root->size) return NULL;
		node *x=root;
		while(1)
		{
			if(ord_num>=x->child[1]->size+1 && ord_num<=x->child[1]->size+x->value_same_cnt)
			  break;
			else
			{
				if(ord_num<=x->child[1]->size)
				  x=x->child[1];
				else
				{
					ord_num-=x->child[1]->size+x->value_same_cnt;
					x=x->child[0];
				}
			}
		}
		splay(x,NULL);
		return x;
	}
	int search_root_left_max() //找左子树中与根value最接近的值 
	{
		node *x=root;
		if(x->child[0]==NULL) return -1;
		if(x->value_same_cnt>1) return x->value;
		x=x->child[0];
		while(x->child[1]!=NULL) x=x->child[1];
		return x->value;
	}
	int search_root_right_min() //找右子树中与根value最接近的值 
	{
		node *x=root;
		if(x->child[1]==NULL) return -1;
		if(x->value_same_cnt>1) return x->value; 
		x=x->child[1];
		while(x->child[0]!=NULL) x=x->child[0];
		return x->value;
	}	
};
int main()
{
	return 0;
}
