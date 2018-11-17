#include <iostream>
#include <cstring>
#include <algorithm>
#include <string>
#include <queue>
#include <sstream>
using namespace std;
const int maxn=101;
int n;
queue<int> all;
queue<int> a[10];
int ff,cc;
void radix(int d)
{
	for(int i=1;i<=d;i++)
	{
		ff=1;
		for(int j=1;j<=i-1;j++) ff=ff*10;		
		while(!all.empty())
		{
			int tt=all.front(); 			
			a[(tt/ff)%10].push(tt); all.pop();
		}
		for(int j=0;j<=9;j++) while(!a[j].empty()) {all.push(a[j].front()); a[j].pop();}
	}
}
int main()
{
	int maxlen=-1;
	cin>>n; 
	for(int i=1;i<=n;i++) 
	{
		stringstream ss; string s;
		int x; cin>>x; all.push(x);
		ss<<x; ss>>s; int len=s.length(); maxlen=max(maxlen,len);
	}
	radix(maxlen);
	while(!all.empty()) {cout<<all.front()<<endl; all.pop();}
	return 0;
}
