//%^~
#include <bits/stdc++.h>
#define INF 0x7fffffff
#define MAXN 100005
#define eps 1e-9
#define foru(a,b,c)	for(int a=b;a<=c;a++)
#define RT return 0;
#define LL long long
#define LXF int
#define RIN rin()
#define HH printf("\n")
#define All(x) (x).begin(),(x).end()
#define fi first
#define se second
using namespace std;
inline LXF rin(){
	LXF x=0,w=1;
	char ch=0;
	while(ch<'0'||ch>'9'){ 
	if(ch=='-') w=-1;
	ch=getchar();
	}
	while(ch>='0'&&ch<='9'){
	x=x*10+(ch-'0');
	ch=getchar();
	}
	return x*w;
}
signed main(){
	string reg;
	printf("����Ϊ��ĵ���ָ��һ��Ӣ����(���ֻ�Ӣ����ĸ):");
	cin>>reg;
	HH;
	
	printf("��Ϸ��վ����ĵ���λ��,��õ�,����̨����getpos");
	HH;
	
	double x;
	double y;
	printf("����setang���һ����(������С��,��Ҫֻ����С����ǰ):");
	cin>>y;
	HH; 
	printf("����setang��ڶ�����(������С��,��Ҫֻ����С����ǰ):");
	cin>>x;
	HH;
	printf("����1����վ��������2������Ҫ�¶�:");
	int b=RIN;
	HH;
	printf("����1����ֱ��Ͷ������2������Ͷ������3����ǰ��Ͷ:");
	int a=RIN;
	printf("����1������������2�������⡢����3����ȼ�յ�������4�������ס�����5�����ն���:");
	int c=RIN;
	HH;
	string ls;
	if(c==1){
		ls="SetItemSmoke";
	}else if(c==2){
		ls="SetItemFlash";
	}else if(c==3){
		ls="SetItemMolo";
	}else if(c==4){
		ls="SetItemGrenade";
	}else if(c==5){
		ls="SetItemDecoy";
	}
	x/=-0.05544;
	y/=0.05544;
	freopen("./CustomGrenade/CustomGrenadeRegedit.cfg","a+",stdout);
	string ch="1";
	ch[0]='"';
	HH;
	cout<<("alias "+reg+" "+ch+"yaw ")<<x<<" 1 1;pitch "<<y<<" 1 1;"<<(a==1?"SetT":(a==2?"SetJP":"SetFJP"))<<";"<<(b==1?"SetNone":"SetDuck ")<<";"<<ls<<";SetPreAimOff"<<ch;
	return 0;
}
