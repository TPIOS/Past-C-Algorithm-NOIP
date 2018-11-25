/*
	虽然说n遍Dijkstra算法的时间效率同样也是n^3;(程序见同此文件根目录的另外一个名字比较长的.cpp)
	但是同为n^3算法的Floyd算法,在理解和默写方面都会比Dijkstra算法要好办的多
	(虽说Dijkstra也挺好理解的,而且还能有效的转化为Prim)
	只可惜不能处理负权,还得靠大招Bellman-Ford算法,见后文。。。 
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
