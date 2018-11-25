/*
	啊啊,终于到了大招的时刻,由于Dijkstra无法处理存在负权边的最短路径问题
	于是我们出现了Bellman-Ford算法
	首先说明一下,若存在负环,则不存在最短路径,理由:到某一点的距离可能会被无数次更新至-∞
	Dijkstra算法是一种贪心,确定一个最短点之后,固定不动,这就导致了无法处理负权的问题
	Bellman-Ford则不一样(判断出负环需要跳出....)
	如果说Dijkstra是Prim算法的转变,那么Bellman-Ford有很大可能就是Kruskal算法的转变 
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
