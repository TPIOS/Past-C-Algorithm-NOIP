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
	void recount_size() //recount��Ŀ���Ǵ�������ֵͬ������±���ͳ��size�ظ� 
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
	node address[maxn]; //��������˳��ṹ����,��node�����ڼ�����ڴ��п���һ������Splay_Tree�Ŀռ�
	void clear_tree()
	{
		root=NULL;
		node_address_cnt=0;
	}
	void rotate(node* x,bool flag) //flag==1��ʾҪ����zig,flag==0��ʾҪ����zag 
	{
		//���Ǽ���flag==1,��Ҫ����zig
		node* y=x->father; //y is x's father || y��һ��������������ʱ�� 
		y->child[!flag]=x->child[flag]; //y's left son = x's right son (maybe x's right son is NULL)
		if(x->child[flag]!=NULL) x->child[flag]->father=y; //if x's right son exist, let x's right son have father Y
		x->father=y->father; //x's father = y's father ==> x'father = x'grandfather (Also we have MAYBE)
		if(y->father!=NULL) //Ѱ��y���������ӻ����Һ���,����x��ת��y 
		{
			if(y==y->father->child[flag]) //�ж��Լ����������ӻ����Һ��� 
			  y->father->child[flag]=x;
			else
			  y->father->child[!flag]=x;
		}
		x->child[flag]=y; //becase father>left son ; father<right son ; x's right son = y
		y->father=x;//let y's father = x  rotate finish!
		y->recount_size(); //re-calculate the size
		x->recount_size(); //re-calculate the size
	}
	void splay(node* x,node* target) //��x��ת��target֮��,һ�㶼��target==root 
	{
		while(x->father!=target) //ֻҪ���½ڵ�ĸ��ײ���target���� 
		{
			if(x->father->father==target) //�Լ����游��target�Ļ�,����ֻʣ��һ����ת,��ô������ת�ķ����Ҫ�����ǵ��������ӻ����Һ��� 
			  if(x->father->child[0]==x) //����rotate�е��ж�,����׸�� 
			    rotate(x,1);
			  else
			    rotate(x,0);
			else
			{
				node* y=x->father; node* z=y->father; //����ת��ʽ zagzag,zagzig,zigzag,zigzig ���� 
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
	void insert(int num) //����ĳһ��ֵ 
	{
		if(root=NULL) //���¿�ͷ��,��һ��ʼ�ǿյ�,��������Ҫ��Ū��һ���ڵ�--�� 
		{
			node_address_cnt=0; node_address_cnt++;
			root=&address[node_address_cnt]; //��������һ����ַ,������˳��ṹ�����ַ(˳��ṹ-->���ϵ���,������)
			root->child[0]=NULL; root->child[1]=NULL; root->father=NULL;
			root->value=num;
			root->size=1; root->value_same_cnt=1;  //����ʲô��ȫ����ʼ�� 
			return; //Ȼ��ͷ�����,��Ҫ������(û������û��else��) 
		}
		node *x=root,*y;
		while(1) //����ѭ��,ֱ���ҵ��������Ӧ�ŵ�λ��,���splayһ�µ��� 
		{
			x->size++;
			if(num==x->value) //�����ĳһ�ڵ��ֵ��ͬ,��ô������ͬ����� 
			{
				x->value_same_cnt++;
				x->recount_size(); //���õ��Ļ��ظ�����,��Ϊrecount_size�����¸�����size
				y=x;
				break;
			}
			else //��������һ�����������жϵ�ע��,��Ҫ����splay�����ص�: left son < father < right son. Ȼ��Ͳ��ö�˵�� 
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
		}//���ָ���ַ,���ֳ�ʼ��,ֻ�Ǳ��������滹�и�while(1),ע��ʲôʱ��break������(when? Ans:�ҵ�Ӧ�ø��ĵ�ʱ��)
		splay(y,NULL); //����Splay_Tree;
	}
	node* search(int key) //�ҵ�key���ڵ�λ��,����node*����ʽ����.Ѱ�ҷ�ʽ�ܼ�,����Splay_Tree���ص�
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
		splay(x,NULL); //�ҵ��˵��Ǹ�ֵ��ֱ�Ӿ���splay������ת���� 
		return y;
	}
	node* search_min(node *x) //�ҵ���Сֵ,ֻҪ������������ߵ����������뵽�׼���,��node*����ʽ���� 
	{
		node *y=x->father;
		while(x->child[0]!=NULL) x=x->child[0];
		splay(x,y); //�ҵ���Сֵ��ֱ�ӽ���Сֵͨ��splay������ת�������￪ʼ�ҵ��Ǹ�������� 
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
		y=search_min(x->child[1]); //ɾ�����ת����������������Сֵ���ת����;Ҳ�����������������ֵ���ת����.���ߵ���˼��ͬ 
		y->father=NULL; //yԭ�ȵ�father��������Ҫɾ���Ǹ��� 
		y->child[0]=x->child[0]; //y's left son = x's left son
		x->child[0]->father=y; //x's left son's father = y (��������)
		y->recount_size(); //recalculate the size
		root=y; 
	}
//-�����Ҫ����Ŀ����Ҫ��,����Ĵ����������ing,Ŀ���ǽ�����splay�ܸɵĶ���������-//
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
	int search_root_left_max() //�������������value��ӽ���ֵ 
	{
		node *x=root;
		if(x->child[0]==NULL) return -1;
		if(x->value_same_cnt>1) return x->value;
		x=x->child[0];
		while(x->child[1]!=NULL) x=x->child[1];
		return x->value;
	}
	int search_root_right_min() //�������������value��ӽ���ֵ 
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
