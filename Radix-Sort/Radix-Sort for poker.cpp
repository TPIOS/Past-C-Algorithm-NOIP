#include <iostream>
#include <cstring>
#include <algorithm>
#include <string>
#include <sstream>
#include <queue>
using namespace std;
queue<string> all;
queue<string> c[4];
queue<string> n[14]; 
int main()
{
	for(int i=1;i<=52;i++)
	{
		string x; cin>>x;
		/*
		if(x[0]=='C') c[0].push(x);
		if(x[0]=='D') c[1].push(x);
		if(x[0]=='H') c[2].push(x);
		if(x[0]=='S') c[3].push(x);*/
		int ff;
		string kk=x.substr(1,2);
		stringstream ss; ss<<kk; ss>>ff;
		n[ff].push(x);
	}
	for(int i=1;i<=13;i++) while(!n[i].empty()) {all.push(n[i].front()); n[i].pop();}
	while(!all.empty())
	{
		string tt=all.front();
		if(tt[0]=='C') c[0].push(tt);
		if(tt[0]=='D') c[1].push(tt);
		if(tt[0]=='H') c[2].push(tt);
		if(tt[0]=='S') c[3].push(tt);
		all.pop();
	}
	cout<<"以下是输出:"<<endl;
	for(int i=0;i<=3;i++) while(!c[i].empty()) {cout<<c[i].front()<<endl; c[i].pop();}
	/*
	for(int i=0;i<=3;i++) while(!c[i].empty()) {all.push(c[i].front()); c[i].pop();}
	while(!all.empty())
	{
		int ff;
		string tt=all.front(),kk=tt.substr(1,2);
		stringstream ss; ss<<kk; ss>>ff;
		n[ff].push(tt); all.pop();
	}
	cout<<"以下是输出:"<<endl;
	for(int i=1;i<=13;i++) while(!n[i].empty()) {cout<<n[i].front()<<endl; n[i].pop();}*/
	//事实证明先排花色是错误的,排数是对的(原因: 数相对于花色来讲是低一等级的[对于扑克排序来讲]) 
	return 0;
}
