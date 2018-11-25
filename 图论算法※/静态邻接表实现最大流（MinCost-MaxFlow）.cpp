#include <cstdio>
#include <cstring>
#include <algorithm>
#include <queue>
using namespace std;
const int maxn=10000+11;
const int maxm=10000+11;
const int inf=100000000;
int n,m;
int start,end,minc=0,maxf=0;
struct node
{
	int from,to,cap,cost;
	int next;
}edge[maxm];
int first[maxn];
int d[maxn],pa[maxn];
int sum[maxn];
bool vis[maxn];
void spfa()
{
	while(1)
	{
		queue<int> q;
		memset(sum,0,sizeof(sum));
		memset(vis,false,sizeof(vis));
		for(int i=start;i<=end;i++) {d[i]=inf;pa[i]=-1;}
		d[start]=0; q.push(start); vis[start]=true; sum[start]++;
		while(!q.empty())
		{
			int v=q.front(); q.pop();
			vis[v]=false;
			int p=first[v];
			while(p!=-1)
			{
				if(edge[p].cap>0 && d[edge[p].to]>d[v]+edge[p].cost)
				{
					d[edge[p].to]=d[v]+edge[p].cost;
					pa[edge[p].to]=p;
					if(!vis[edge[p].to])
					{
						q.push(edge[p].to);
						sum[edge[p].to]++;
						vis[edge[p].to]=true;
						if(sum[edge[p].to]==end-start+1) {printf("Error"); exit(0);}
					}
				}
				p=edge[p].next;
			}		
		}
		if(d[end]==inf) break;
		int neck=inf,k=pa[end];
		while(k!=-1)
		{
			neck=min(neck,edge[k].cap);
			k=pa[edge[k].from];
		}
		k=pa[end];
		while(k!=-1)
		{
			edge[k].cap-=neck;
			edge[k^1].cap+=neck;
			k=pa[edge[k].from];
		}
		minc+=d[end]*neck;
		maxf+=neck;
	}
}
int main()
{
	//freopen("data.txt","r",stdin);
	scanf("%d %d",&n,&m);
	memset(first,-1,sizeof(first));
	int i=0;
	for(int j=1;j<=m;j++)
	{
		scanf("%d %d %d %d",&edge[i].from,&edge[i].to,&edge[i].cap,&edge[i].cost);
		edge[i].next=first[edge[i].from];
		first[edge[i].from]=i;
		edge[i+1].from=edge[i].to; edge[i+1].to=edge[i].from; 
		edge[i+1].cap=0; edge[i+1].cost=-edge[i].cost; 
		edge[i+1].next=first[edge[i+1].from];
		first[edge[i+1].from]=i+1;
		i=i+2;
	}
    scanf("%d %d",&start,&end);
	spfa();
	printf("%d %d",minc,maxf);
	return 0;
}
