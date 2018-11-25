#include <iostream>
#include <cstring>
#include <queue>
using namespace std;
int n, ans,s;
const int maxn=1001;
const int inf=10000000;
int cap[maxn][maxn],pre[maxn];
int cost[maxn][maxn];
bool spfa()
{
    queue<int> q;
	int saaa[maxn],dis[maxn];
	bool vis[maxn];
	int u,i;
	for(i=0;i<n;i++)
	{
        dis[i]=inf;
        vis[i]=false;
        saaa[i]=0;
    }
    q.push(s);
	dis[s]=0;
	pre[s] = -1;
    vis[s]=true;
    saaa[s]++;
    while(!q.empty())
	{
        u=q.front();
        q.pop();
        vis[u]=false;
        for(i=0;i<n;i++)
            if(cap[u][i]>0 && dis[i]>dis[u]+cost[u][i])
			{
                dis[i]=dis[u]+cost[u][i];
                pre[i]=u;
                if(!vis[i])
				{
                    q.push(i);
                    vis[i]=true;
                    saaa[i]++;
                    if(saaa[i]==n) return false;
                }
            }
    }
    if(dis[n-1]==inf) return false;
    return true;
}
 
void end()
{
    int i,sum=inf;
    for(i=n-1;i!=s;i=pre[i])
        sum=min(sum,cap[pre[i]][i]);
    for(i=n-1;i!=s;i=pre[i])
	{
        cap[pre[i]][i]-=sum;
        cap[i][pre[i]]+=sum;
        //cost[i][pre[i]] = - cost[pre[i]][i];
        ans+=cost[pre[i]][i]*sum;
    }
}
void init()
{
	for(int i=0;i<n;i++)
		for(int j=0;j<n;j++)
			cin>>cap[i][j];
	for(int i=0;i<n;i++)
		for(int j=0;j<n;j++)
			cin>>cost[i][j];
	for(int i=0;i<n;i++)
		for(int j=0;j<n;j++)
			if(cost[i][j]>0 && cost[j][i]==0) cost[j][i]=-cost[i][j];
	s=0;	
}
int main()
{
	cin>>n;
	init();
	ans=0;
    while(spfa()) end();
    cout<<ans;
    return 0;
}
