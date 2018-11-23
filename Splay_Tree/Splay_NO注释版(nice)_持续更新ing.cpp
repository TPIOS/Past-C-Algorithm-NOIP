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
	void recount_size()
	{
		if(child[0]==NULL && child[1]==NULL) {size=value_same_cnt;return;}
		if(child[0]==NULL) {size=child[1]->size+value_same_cnt;return;}
		if(child[1]==NULL) {size=child[0]->size+value_same_cnt;return;}
		size=child[0]->size+child[1]->size+value_same_cnt;
	}
};
struct Splay_Tree
{
	node* root;
	void rotate(node* x,bool flag) //flag==1表示要右旋zig,flag==0表示要左旋zag 
	{
		node* y=x->father;
		y->child[!flag]=x->child[flag];
		if(x->child[flag]!=NULL) x->child[flag]->father=y;
		x->father=y->father;
		if(y->father!=NULL)
		{
			if(y==y->father->child[flag]) //判断自己到底是左孩子还是右孩子 
			  y->father->child[flag]=x;
			else
			  y->father->child[!flag]=x;
		}
		x->child[flag]=y; 
		y->father=x;
		y->recount_size();
		x->recount_size();
	}
	void splay(node* x,node* target) //将x旋转到target之下,一般都是target==root 
	{
		while(x->father!=target)
		{
			if(x->father->father==target)
			  if(x->father->child[0]==x)
			    rotate(x,1);
			  else
			    rotate(x,0);
			else
			{
				node* y=x->father; node* z=y->father;
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
		if(root==NULL)
		{
			root=new node;
			root->child[0]=NULL; root->child[1]=NULL; root->father=NULL;
			root->value=num;
			root->size=1; root->value_same_cnt=1;
			return;
		}
		node *x=root,*y;
		while(1) //无限循环,直到找到这个数字应放的位置,最后splay一下调整 
		{
			x->size++;
			if(num==x->value)
			{
				x->value_same_cnt++;
				x->recount_size();
				y=x;
				break;
			}
			else
			  if(num<x->value)
			  {
			  	if(x->child[0]!=NULL)
			  	  x=x->child[0];
			  	else
			  	{
			  		x->child[0]=new node;
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
			  		x->child[1]=new node;
			  		y=x->child[1];
			  		y->value=num;
			  		y->size=1; y->value_same_cnt=1;
			  		y->child[0]=NULL; y->child[1]=NULL;
			  		y->father=x;
			  		break;
			  	}
			  }
		}
		splay(y,NULL);
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
					  x=x->child[1];
					else
					  break;
				}
			}
		}
		splay(x,NULL);
		return y;
	}
	node* search_min(node *x)
	{
		node *y=x->father;
		while(x->child[0]!=NULL) x=x->child[0];
		splay(x,y);
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
				root=NULL;
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
					if(x->child[1]==NULL)
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
		y->child[0]=x->child[0];      //y's left son = x's left son
		x->child[0]->father=y;      //x's left son's father = y (认贼作父)
		y->recount_size();     //recalculate the size
		delete x;
		root=y; 
	}
	
	int find_kth_min(int key)
	{
		if(root==NULL || key>root->size) return inf;
		node *x=root;
		if(x->child[0]==NULL && x->child[1]==NULL && key<=x->value_same_cnt) return x->value;
		while(1)
		{
			if(x->child[0]!=NULL)
			{
				if(x->child[1]==NULL && key>x->child[0]->size+x->value_same_cnt) return inf;
				if(key>=x->child[0]->size+1 && key<=x->value_same_cnt+x->child[0]->size) return x->value;
				if(key<=x->child[0]->size) {x=x->child[0]; continue;}
				if(key>x->child[0]->size) {key=key-x->child[0]->size-x->value_same_cnt; x=x->child[1]; continue;}
			}
			else
			{
				if(x->child[1]==NULL && key>x->size) return inf;
				if(key<=x->value_same_cnt) return x->value;
				key=key-x->value_same_cnt; x=x->child[1];
			}
		}
	}
	int search_num(int num) //找到一个数在树中的排名
	{
		node* x=search(num);
		if(x==NULL) return inf;
		if(x->child[0]==NULL) return 1;
		return x->child[0]->size+1;
	}
	int find_pre(int num) //找一个数的前驱
	{
		node *x=search(num); 
		bool flag=false; int ret;
		if(x==NULL) {insert(num); flag=true;}
		node *y=root;
		if(y->child[0]==NULL) return inf;
		y=y->child[0];
		while(y->child[1]!=NULL) y=y->child[1];
		ret=y->value;
		if(flag) remove(num);
		return ret;
	}
	int find_lat(int num) //找一个数的后驱
	{
		node *x=search(num);
		bool flag=false; int ret;
		if(x==NULL) {insert(num); flag=true;}
		node *y=root;
		if(y->child[1]==NULL) return inf;
		y=y->child[1];
		while(y->child[0]!=NULL) y=y->child[0];
		ret=y->value;
		if(flag) remove(num);
		return ret;
	}
};
int main()
{
	Splay_Tree a;
	a.root=NULL;
	return 0;
}
