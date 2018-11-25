#include <iostream>
#include <cstring>
#include <algorithm>
#include <string>
#include <cstdio>
using namespace std;
const int maxn=15000*2+11;
string s1;
int s[maxn],sa[maxn],n;
int wa[maxn],wb[maxn],wv[maxn],ff[maxn];
int rank[maxn],height[maxn];
int cmp(int *r,int a,int b,int l) {return r[a]==r[b]&&r[a+l]==r[b+l];}
void da(int *r,int *sa,int n,int m)
{
	int i,j,p,*x=wa,*y=wb,*t;
	for(i=0;i<m;i++) ff[i]=0;
	for(i=0;i<n;i++) ff[x[i]=r[i]]++;
	for(i=1;i<m;i++) ff[i]+=ff[i-1];
	for(i=n-1;i>=0;i--) sa[--ff[x[i]]]=i;
	for(j=1,p=1;p<n;j*=2,m=p)
	{
		for(p=0,i=n-j;i<n;i++) y[p++]=i;
		for(i=0;i<n;i++) if(sa[i]>=j) y[p++]=sa[i]-j;
		for(i=0;i<n;i++) wv[i]=x[y[i]];
		for(i=0;i<m;i++) ff[i]=0;
		for(i=0;i<n;i++) ff[wv[i]]++;
		for(i=1;i<m;i++) ff[i]+=ff[i-1];
		for(i=n-1;i>=0;i--) sa[--ff[wv[i]]]=y[i];
		for(t=x,x=y,y=t,p=1,x[sa[0]]=0,i=1;i<n;i++)
		x[sa[i]]=cmp(y,sa[i-1],sa[i],j)?p-1:p++;
	}
}
void calheight(int *r,int *sa,int n)
{
	int i,j,k=0;
	for(i=1;i<=n;i++) rank[sa[i]]=i;
	for(i=0;i<n;height[rank[i++]]=k)
	  for(k?k--:0,j=sa[rank[i]-1];r[i+k]==r[j+k];k++);
	return;
}
int main()
{
	cin>>s1;
	n=s1.length();
	for(int i=1;i<=n;i++) s[i]=s1[i-1]-'a'+1;
	s[0]=0;
	da(s,sa,n+1,27); 
	for(int i=1;i<=n;i++) cout<<sa[i]<<" ";
	printf("\n");
	calheight(s,sa,n+1);
	for(int i=2;i<=n;i++) cout<<height[i]<<" ";
	return 0;
}
