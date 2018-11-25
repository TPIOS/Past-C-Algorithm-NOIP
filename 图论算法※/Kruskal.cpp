/*
	����ע��: Prim�㷨��Kruskal�㷨�����������ǲ�һ����
	Prim��Dijkstra�㷨�Ĵ������ݷ�ʽΪ�ڽӾ���
	��Kruskal�㷨�����뷽ʽ����: ��ʼ��--��ֹ��--�����ߵ�Ȩֵ(������ڽӾ�������뷽ʽ,�鷳�����)
	����,��Ҫ��ȷ���ǣ�����
	����һ��Ҫѧ��,������ʲô�����������ݶ�Ҫ������ת��Ϊ������Ϥ�ķ�ʽ(�ڽӾ����) 
*/
#include <iostream>
#include <algorithm>
using namespace std;
const int maxn=1001;
const int inf=1000000;
typedef struct
{
	int from,end,weight;
}kruskal;
kruskal a[maxn];
int father[maxn];
int k=0;
int map[maxn][maxn];
int getfather(int x)
{
	if(x==father[x])
		return x;
	else
		return getfather(father[x]); 
}

int cmp(kruskal x,kruskal y)
{
	return x.weight<y.weight;
}
int main()
{
	int n;
	cin>>n;
	for(int i=1;i<=n;i++)
		for(int j=1;j<=n;j++)
		{
			cin>>map[i][j];
			if(map[i][j]==0) continue;
			k++;
			 a[k].from=i; a[k].end=j; a[k].weight=map[i][j]
		};
	sort(a+1,a+k+1,cmp);
	for(int i=1;i<=n;i++) father[i]=i;
	int sum=0;
	int num=0;
	for(int i=1;i<=k;i++)
	{
		if(getfather(a[i].from)!=getfather(a[i].end))
		{
			father[getfather(a[i].from)]=a[i].end;
			sum+=a[i].weight;
			num++;
		}
		if(num==n-1) break;
	}
	cout<<sum;
	return 0;
} 
