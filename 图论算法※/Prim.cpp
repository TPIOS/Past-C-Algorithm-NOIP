#include <iostream>
#include <algorithm>
#include <cstring>
using namespace std;
const int maxn=1001;
const int inf=10000000;
int map[maxn][maxn];
int d[maxn];
bool vis[maxn]; 
int main()
{
	int n;
	cin>>n;
	memset(vis,false,sizeof(vis));
	for(int i=1;i<=n;i++)
		for(int j=1;j<=n;j++)
		{
			cin>>map[i][j];
			if(map[i][j]==0 && i!=j) map[i][j]=inf;
		}
	for(int i=1;i<=n;i++) d[i]=inf;
	d[1]=0;		
	int ans=0;	
	for(int i=1;i<=n;i++)
	{
		int x,m=inf;
		for(int j=1;j<=n;j++) if(!vis[j] && d[j]<=m) {x=j;m=d[x];
		vis[x]=true;
		ans+=d[x];
		for(int j=1;j<=n;j++) d[j]=min(d[j],map[x][j]);
	}
	cout<<ans;
	return 0;
}
