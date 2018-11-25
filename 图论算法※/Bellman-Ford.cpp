/*
	����,���ڵ��˴��е�ʱ��,����Dijkstra�޷�������ڸ�Ȩ�ߵ����·������
	�������ǳ�����Bellman-Ford�㷨
	����˵��һ��,�����ڸ���,�򲻴������·��,����:��ĳһ��ľ�����ܻᱻ�����θ�����-��
	Dijkstra�㷨��һ��̰��,ȷ��һ����̵�֮��,�̶�����,��͵������޷�����Ȩ������
	Bellman-Ford��һ��(�жϳ�������Ҫ����....)
	���˵Dijkstra��Prim�㷨��ת��,��ôBellman-Ford�кܴ���ܾ���Kruskal�㷨��ת�� 
*/
#include <iostream>
using namespace std;
const int maxn=1001;
const int inf=1000000;
int map[maxn][maxn];
int d[maxn];
typedef struct
{
	int from,end,weight;
}kruskal;
kruskal a[maxn];
int k=0;
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
			a[k].from=i; a[k].end=j; a[k].weight=map[i][j];
		}
	int start;
	cin>>start;
	for(int i=1;i<=n;i++) d[i]=inf;
	d[start]=0;
	bool flag=true;
	for(int i=1;i<=n-1;i++)
		for(int j=1;j<=k;j++)
			d[a[j].end]=min(d[a[j].end],d[a[j].from]+a[j].weight);
	for(int i=1;i<=k;i++)
		if(d[a[i].from]+a[i].weight<d[a[i].end])
			flag=false;
	if(flag)
		for(int i=1;i<=n;i++)
			cout<<start<<"-->"<<i<<": "<<d[i]<<endl;
	else
		cout<<"Data Error!";
	return 0;
}
