#include <iostream>
#include <algorithm>
#include <cstring>
using namespace std;
const int maxn=1001;
const int inf=1000000;
int map[maxn][maxn];
int d[maxn];
bool vis[maxn]; 
int main()
{
	int n;
	cin>>n;
	for(int i=1;i<=n;i++)
		for(int j=1;j<=n;j++)
		{
			cin>>map[i][j];
			if(map[i][j]==0) map[i][j]=inf;
		}
	for(int g=1;g<=n;g++)
	{
		memset(vis,false,sizeof(vis));
		int start=g;
		for(int i=1;i<=n;i++) d[i]=inf;
		d[start]=0;			
		for(int i=1;i<=n;i++)
		{
			int x,m=inf;
			for(int j=1;j<=n;j++) if(!vis[j] && d[j]<=m) {x=j;m=d[x];}
			vis[x]=true;
			for(int j=1;j<=n;j++) d[j]=min(d[j],d[x]+map[x][j]);
		}
		for(int i=1;i<=n;i++) cout<<start<<"-->"<<i<<": "<<d[i]<<endl;
	}
	return 0;
}
