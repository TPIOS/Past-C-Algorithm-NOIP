#include <cstdio>
#include <cstring>
#include <algorithm>
#include <queue>
using namespace std;
const int maxn=10000+11;
const int maxm=10000+11;
const int inf=100000000;
int n,m;
int start,end;
struct node
{
	int from,to,weight;
	int next;
}edge[maxn];
int first[maxn];
int d[maxn],pa[maxn];
int sum[maxn];
bool vis[maxn];
void spfa(int s)
{
	queue<int> q;
	memset(sum,0,sizeof(sum));
	memset(vis,false,sizeof(vis));
	for(int i=1;i<=n;i++) {d[i]=inf;pa[i]=-1;}
	d[s]=0; q.push(s); vis[s]=true;
	sum[s]++;
	while(!q.empty())
	{
		int v=q.front(); q.pop();
		vis[v]=false;
		int p=first[v];
		while(p!=-1)
		{
			if(d[edge[p].to]>d[v]+edge[p].weight)
			{
				d[edge[p].to]=d[v]+edge[p].weight;
				pa[edge[p].to]=v;
				if(!vis[edge[p].to])
				{
					q.push(edge[p].to);
					sum[edge[p].to]++;
					vis[edge[p].to]=true;
					if(sum[edge[p].to]==n) {printf("Error"); exit(0);}
				}
			}
			p=edge[p].next;
		}		
	}
}
void output(int x)
{
	if(x==-1) {printf("%d -> ",start);return;}
	if(x==start) {printf("%d -> ",x); return;}
	output(pa[x]);
	printf("%d -> ",x);
}
int main()
{
	//freopen("data.txt","r",stdin);
	scanf("%d %d",&n,&m);
	memset(first,-1,sizeof(first));
	for(int i=1;i<=m;i++)
	{
		scanf("%d %d %d",&edge[i].from,&edge[i].to,&edge[i].weight);
		edge[i].next=first[edge[i].from];
		first[edge[i].from]=i;
	}
    scanf("%d %d",&start,&end);
	spfa(start);
	for(int i=1;i<=n;i++)
	  if(i!=start) {output(pa[i]); printf("%d : %d\n",i,d[i]);}
	return 0;
}
