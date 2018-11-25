#include <iostream>  
#include <queue>
#include <cstring>
using namespace std;  
const int maxn=1001;
const int inf=1000000; 
int map[maxn][maxn];  
bool flag[maxn];  
int father[maxn];  
int n,m; 
int ans;  
void Ford_Fulkerson()  
{  
    while(1)  
    {  
        queue <int> q;  
        memset(flag,false,sizeof(flag));  
        memset(father,-1,sizeof(father));  
        int now;
        flag[0] = true;  
        q.push(0);  
        while(!q.empty())
        {  
            now=q.front();  
            q.pop();  
            if(now==m-1) break;  
            for(int i=0;i<m;i++)  
            {   
                if(map[now][i] && !flag[i])  
                {  
                    father[i]=now;  
                    flag[i]=true;  
                    q.push(i);  
                }  
            }  
        }  
        if(!flag[m-1]) break;  
        int u,mint=inf;  
        for(u=m-1;u;u=father[u])
        {  
            if(map[father[u]][u]<mint)  
                mint=map[father[u]][u];  
        }  
        for(u=m-1;u;u=father[u])  
        {  
            map[father[u]][u]-=mint;  
            map[u][father[u]]+=mint;  
        }   
        ans+=mint;  
    }  
}
int main()  
{  
    int s,e,w;  
    cin>>n>>m;
    {  
        ans=0;  
        memset(map,0,sizeof(map));  
        for(int i=1;i<=n;i++)  
        {  
            cin>>s>>e>>w;  
            map[s][e]+=w;  
        }  
        Ford_Fulkerson();  
        cout<<ans<<endl;  
    }  
    return 0;  
}  
