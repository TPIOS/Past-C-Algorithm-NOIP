/*
	��Ȼ���ҵĲ���һ��,SPFA��һ���̶��Ͼ���Bellman-Ford�㷨�ĸı�
	ʵ���Ͼ���Bellman-Ford�㷨�Ķ����Ż�
	ֻ����,��֪Ϊ�ι����Ϻ���̫�Ͽ�SPFA,����һ���̶��Ͽ϶������㷨���й��˷������й�
	����һ��ԭ���������㷨ȱ���ȶ��� 
*/
#include <iostream>
#include <cstring>
#include <queue>
#include <algorithm> 
using namespace std;
const int maxn=1001;
const int inf=1000000;
int map[maxn][maxn];
int d[maxn];
int sum[maxn];
bool flag[maxn];
int main()
{
	memset(map,0,sizeof(map));
	memset(flag,false,sizeof(flag));
	memset(sum,0,sizeof(sum));
	queue<int> q;
	int n;
	cin>>n;
	for(int i=1;i<=n;i++)
		for(int j=1;j<=n;j++)
			cin>>map[i][j];
	int start;
	cin>>start;
	for(int i=1;i<=n;i++) d[i]=inf;
	d[start]=0;
	int h=0,t=0,v;
	q.push(start); flag[start]=true;
	sum[start]++;
	while(!q.empty())
	{
		v=q.front(); q.pop();
		flag[v]=false;
		for(int i=1;i<=n;i++)
			if(map[v][i]!=0 && d[v]+map[v][i]<d[i])
			{
				d[i]=d[v]+map[v][i];
				if(!flag[i])
				{
					q.push(i);
					sum[i]++;
					flag[i]=false;
					if(sum[i]==n) {cout<<"Error";return 0;}
				}
			}
	}
	for(int i=1;i<=n;i++)
		cout<<start<<"-->"<<i<<": "<<d[i]<<endl;
	return 0;
}
