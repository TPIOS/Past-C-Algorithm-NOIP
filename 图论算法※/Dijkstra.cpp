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
	memset(vis,false,sizeof(vis));
	for(int i=1;i<=n;i++)
		for(int j=1;j<=n;j++)
		{
			cin>>map[i][j];
			if(map[i][j]==0 && i!=j) map[i][j]=inf;
		}
	int start;
	cin>>start;
	for(int i=1;i<=n;i++) d[i]=inf;
	d[start]=0;	 //d数组表示，index到start的最短距离		
	for(int i=1;i<=n;i++)
	{
		cout<<i<<": ";
		int x,m=inf;
		for(int j=1;j<=n;j++) if(!vis[j] && d[j]<=m) {x=j;m=d[x];}
		vis[x]=true;
		cout<<"x: "<<x<<" ";
		for(int j=1;j<=n;j++) {d[j]=min(d[j],d[x]+map[x][j]); cout<<d[j]<<" ";}
		cout<<endl;
	}
	
	for(int i=1;i<=n;i++) cout<<start<<"-->"<<i<<": "<<d[i]<<endl;
	return 0;
}
