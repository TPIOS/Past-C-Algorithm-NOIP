/*
	事先注明: Prim算法和Kruskal算法的输入数据是不一样的
	Prim、Dijkstra算法的处理数据方式为邻接矩阵
	而Kruskal算法的输入方式则是: 起始点--终止点--这条边的权值(相比起邻接矩阵的输入方式,麻烦了许多)
	但是,需要明确的是！！！
	我们一定要学会,无论是什么样的输入数据都要熟练地转化为我们熟悉的方式(邻接矩阵等) 
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
