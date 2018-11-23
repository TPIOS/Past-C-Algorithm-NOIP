#include <iostream>
using namespace std;
const int maxn=100000+11;
struct node
{
	int weight,sz,cnt; //cnt是统计该节点下,有多少个不同的值(有过少个节点) 
	node *ch[2], *pre;
	node() {}
	node(int x,int y,int z) {key=x,sz=y,cnt=z;}
	void rs()
	{
		sz=ch[0]->sz+ch[1]->sz+cnt;
	}
}
struct Splay
{
	node* root;
	int ncnt;
	node nod[maxn];
	void init()
	{
		root=NIL;
		ncnt=0;
	}
	void rotate(node* x,bool d)
	{
		node *y=x->pre;
		y->ch[!d] = x->ch[d];
		if(x->ch[d]!=NIL) x->ch[d]->pre=y;
		x->pre=y->pre;
		if(y->pre!=NIL)
		{
			if(y==y->pre->ch[d])
			  y->pre->ch[d]=x;
			else
			  y->pre->ch[!d]=x;
		}
		x->ch[d]=y;
		y->pre=x;
		y->rs();
		x->rs();
	}
	void splay(node* x,node* target)
	{
		for(;x->pre!=target;)
		  if(x->pre->pre==target)
		    if(x->pre->ch[0]==x) 
			  rotate(x,1);
			else
			  rotate(x,0);
		  else
		  {
		  	node *y=x->pre, *z=y->pre;
		  	if(z->ch[0]==y)
		  	  if(y->ch[0]==x)
		  	    rotate(y,1),rotate(x,1);
		  	  else
		  	    rotate(x,0),rotate(x,1);
		  	else
		  	  if(y->ch[1]==x)
		  	    rotate(y,0),rotate(x,0);
		  	  else
		  	    rotate(x,1),rotate(x,0);
		  }  
	}
	void insert(int ww)
	{
		if(root==NIL)
		{
			ncnt=0;
			root=&nod[++ncnt];
			root->ch[0]=root->ch[1]=root->pre=NIL;
			root->weight=ww;
			root->sz=root->cnt=1;
			return;
		}
		node* x=root, *y;
		while(1)
		{
			x->sz++;
			if(ww==x->weight)
			{
				x->cnt++;
				x->rs();
				y=x;
				break;
			}
			else
			  if(ww<x->weight)
			  {
			  	if(x->ch[0]!=NIL)
			  	  x=x->ch[0];
			  	else
				  {
				  	x->ch[0]=&nod[++ncnt];
				  	y=x->ch[0];
				  	y->weight=ww;
				  	y->sz=y->cnt=1;
				  	y->ch[0]=y->ch[1]=NIL;
				  	y->pre=x;
				  	break;
				  }  
			  }
			  else
			  {
			  	if(x->ch[1]!=NIL)
			  	  x=x->ch[1];
			  	else
				  {
				  	x->ch[1]=&nod[++ncnt];
				  	y=x->ch[1];
				  	y->weight=ww;
				  	y->sz=y->cnt=1;
				  	y->ch[0]=y->ch[1]=NIL;
				  	y->pre=x;
				  	break;
				  }  			  	
			  }
		}
		splay(y,NIL);
	}
    Node* search(int key)
	{
        if(root==NIL)  
            return NIL;  
        node *x=root, *y=NIL;  
        while(1)
		{  
            if(key==x->weight)
			{  
                y=x;  
                break;  
            }  
            else 
			  if(key>x->weight)
			  {  
                if(x->ch[1] != NIL)  
                  x=x->ch[1];  
                else  
                  break;  
              }  
              else
			  {  
                if(x->ch[0]!=NIL)  
                  x=x->ch[0];  
                else  
                  break;  
              }  
        }  
        splay(x, NIL);  
        return y;  
    }  
    Node* searchmin(Node *x)
	{
        Node *y = x->pre;  
        while(x->ch[0]!=NIL){x=x->ch[0];}  
        splay(x, y);  
        return x;  
    }  
    void del(int key)
	{
        if(root==NIL)  
            return;  
        node *x = search(key), *y;  
        if(x==NIL)  
            return;  
        if(x->cnt>1)
		{  
            x->cnt--;  
            x->rs();  
            return;  
        }  
        else 
		  if(x->ch[0] == NIL && x->ch[1] == NIL)
		  {  
            init();  
            return;  
          }  
          else 
		    if(x->ch[0] == NIL)
			{  
              root = x->ch[1];  
              x->ch[1]->pre = NIL;  
              return;  
            }  
        	else 
			  if(x->ch[1] == NIL)
			  {  
                root = x->ch[0];  
                x->ch[0]->pre = NIL;  
                return;  
        	  }  
        y=searchmin(x->ch[1]);  
        y->pre=NIL;  
        y->ch[0]=x->ch[0];  
        x->ch[0]->pre=y;  
        y->rs();  
        root=y;  
    }  
    int rank(int key)
	{//求结点高度  
        node *x = search(key);  
        if (x == NIL)  
            return 0;  
        return x->ch[0]->sz + 1  /* or x->cnt*/;  
    }  
    Node* findk(int kth)
	{//查找第k小的值  
        if (root == NIL || kth > root->sz)  
            return NIL;  
        node *x = root;  
        while(1)
		{  
            if (x->ch[0]->sz +1 <= kth && kth <= x->ch[0]->sz + x->cnt)  
                break;  
            else 
			  if (kth <= x->ch[0]->sz)  
                x = x->ch[0];  
              else
			  {  
                kth -= x->ch[0]->sz + x->cnt;  
                x = x->ch[1];  
              }  
        }  
        splay(x, NIL);  
        return x;  
    }  
}sp;
