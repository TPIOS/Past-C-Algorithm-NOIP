//������������ʵ��һ��splay
//��ָ��Ļ�,����Ƚ�����,���ÿ�,������,���и���NULL�ĸ����ж� 
//������Ļ�,��һ����Ҫע��,����Ҫ�Զ���struct,ȫ���������� 
//ͨ����������ѧ���˺ܶ�,Ҳ���������еĲ���ԭ��
//��������ѧϰ����ʵ��,ע��������,���õ���,�����ؽ�
#include <iostream>
#include <cstdio>
#include <cstring>
#include <algorithm>
#include <climits>
using namespace std;
const int maxn=100000+11;
int father[maxn],child[maxn][2],root; //���еı�������,���Ѿ�����node������
int value[maxn],ind; //value����˵,ind��Ȼ���ǽڵ����ͳ��,ͬʱҲ�Ǵ洢��ıر����� 
inline void rotate(int p)
{
	int q=father[p],y=father[q],x=child[q][1]==p; //������������ע�� q��p�ĸ���,y��p���游
	//����Ϥһ��x�������ж��ڸ�ֵ������д��,x���ж�p���������ӻ����Һ���,����������Ϊ0;��֮��Ϊ1 
	//�����������x=0,��pΪq������ 
	child[q][x]=child[p][x^1]; father[child[q][x]]=q; 
	//q's left son = p's right son; q's left son��ʱ�Ѿ������p's right son; 
	//��ʱ��q's left son��father��Ϊq,ʵ���Ͼ�����p's right son��fatherΪq 
	child[p][x^1]=q; father[q]=p;
	//p's right son = q (��Ϊq�����p��); q's father=p;
	father[p]=y; //p's father = y;
	if(y) //y�Ƿ����,y����������൱��NULL 
	{
		//ȷ��q��ԭ���ǿ����������ӻ����Һ���,��Ϊp������תȡ����q��λ��,���Ը���qΪp 
		if(child[y][0]==q) child[y][0]=p;
		else if(child[y][1]==q) child[y][1]=p;
	}
}
inline void splay(int x)
{
	for(int y;y=father[x];rotate(x)) //���������,�˴�����forѭ�������̴���,ע������Ĭ�Ͻ�x��ת��root 
	  if(father[y]) //����游����root ÿ�ζ�ִ��һ�ε���,��Ȼ�������for�����е�rotate,��ôӦ��ûÿ�ζ�����һ��˫�� 
	    if((x==child[x][0]) && (y==child[father[y]][0])) //��ת��ʽ�ж� 
	      rotate(y);
	    else//����游��root�˵Ļ�,��ôֻʣ�����������ת,��Ϊ��rotate rotate Ȼ���ж�,forѭ������ 
	      rotate(x);
	root=x; //����������˵,����ֱ�ӽ��������ת���� 
}
inline void insert(int x,int v) //ע��insert���˸�����,��������ʲô�õ���,��������һ��
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
