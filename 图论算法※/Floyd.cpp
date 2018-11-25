/*
	��Ȼ˵n��Dijkstra�㷨��ʱ��Ч��ͬ��Ҳ��n^3;(�����ͬ���ļ���Ŀ¼������һ�����ֱȽϳ���.cpp)
	����ͬΪn^3�㷨��Floyd�㷨,������Ĭд���涼���Dijkstra�㷨Ҫ�ð�Ķ�
	(��˵DijkstraҲͦ������,���һ�����Ч��ת��ΪPrim)
	ֻ��ϧ���ܴ���Ȩ,���ÿ�����Bellman-Ford�㷨,�����ġ����� 
*/
#include <iostream>
#include <algorithm>
#include <cstring>
using namespace std;
const int maxn=1001;
const int inf=1000000;
int map[maxn][maxn];
int main()
{
	int n;
	cin>>n;
	for(int i=1;i<=n;i++)
		for(int j=1;j<=n;j++)
		{
			cin>>map[i][j];
			if(map[i][j]==0 && i!=j) map[i][j]=inf;
		}
	for(int k=1;k<=n;k++)
		for(int i=1;i<=n;i++)
			for(int j=1;j<=n;j++)
				map[i][j]=min(map[i][j],map[i][k]+map[k][j]);
	for(int i=1;i<=n;i++)
	{
		for(int j=1;j<=n;j++)
			cout<<i<<"-->"<<j<<": "<<map[i][j]<<"  ";
		cout<<endl;
	}
	return 0;
}
