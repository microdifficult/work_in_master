clc
clear all;
pore_a=[0.0905791937075619;0.0126986816293506;0.0913375856139019;0.0632359246225410;0.00975404049994095;0.0278498218867048;0.0546881519204984;0.0957506835434298;0.0964888535199277;0.0157613081677548;0.0970592781760616;0.0957166948242946;0.0485375648722841;0.0800280468888800;0.0141886338627215;0.0421761282626275;0.0915735525189067;0.0792207329559554;0.0959492426392903;0.0655740699156587;0.00357116785741896;0.0849129305868777;0.0933993247757551;0.0678735154857773;0.0757740130578334;0.0743132468124916;0.0392227019534168;0.0655477890177557;0.0171186687811562;0.0706046088019609;0.00318328463774207;0.0276922984960890;0.00461713906311539;0.00971317812358476;0.0823457828327293;0.0694828622975817;0.0317099480060861;0.0950222048838355;0.00344460805029088;0.0438744359656398;0.0381558457093008;0.0765516788149002;0.0795199901137063;0.0186872604554379;0.0489764395788231;0.0445586200710900;0.0646313010111265;0.0709364830858073;0.0754686681982361;0.0276025076998578;0.0679702676853675;0.0655098003973841;0.0162611735194631;0.0118997681558377;0.0498364051982143;0.0959743958516081;0.0340385726666133;0.0585267750979777;0.0223811939491137;0.0751267059305653;0.0255095115459269;0.0505957051665142;0.0699076722656686;0.0890903252535799;0.0959291425205444;0.0547215529963803;0.0138624442828679;0.0149294005559057;0.0257508254123736;0.0840717255983663;0.0254282178971531;0.0814284826068816;0.0243524968724989;0.0929263623187228;0.0349983765984809;0.0196595250431208;0.0251083857976031;0.0616044676146639;0.0473288848902729;0.0351659507062997;0.0830828627896291;0.0585264091152724;0.0549723608291140;0.0917193663829810;0.0285839018820374;0.0757200229110721;0.0753729094278495;0.0380445846975357;0.0567821640725221;0.00758542895630636;0.00539501186666072;0.0530797553008973;0.0779167230102011;0.0934010684229183;0.0129906208473730;0.0568823660872193;0.0469390641058206;0.00119020695012414;0.0337122644398882;0.0162182308193243];
d=input('please input your bits(in)\n');
    m=[4.75,1.0623,2.9986;
        6.25,1.0446,1.1305;
        7.875,1,0;
        9.875,0.958,-1.3467;
        12.25,0.8969,-1.821;
        14,0.8683,-2.6781];
      n=[4.75,-0.0705,1.784,1.1247;
        6.25,-0.03,1.313,0.6707;
        7.875,0,1,0;
        9.875,0.038,0.6078,-0.5109;
        12.25,0.0246,0.6043,-0.9482;
        14,0.0229,0.5335,-1.5386];
    pore_c=zeros(size(pore_a,1),1);
%%算法一：循环法
% for i=1:size(pore_a,1)
%  if pore_a(i)>0.06;
%     site=find(abs(d-m(:,1))<10e-6);
%     b=m(site,2);
%     c=m(site,3);
%     pore_c(i)=b*pore_a(i)+c;
%     
%  
%  else 
%      site=find(abs(d-m(:,1))<10e-6);
%      a=n(site,2);
%      b=n(site,3);
%      c=n(site,4);
%       pore_c(i)=a*(pore_a(i))^2+b*pore_a(i)+c;
%      
%  end
% end
%%
%%算法二：向量法
  
    site1=find(abs(d-m(:,1))<10e-6);
    b1=m(site1,2);
    c1=m(site1,3);
    pore_c=pore_a.*(pore_a>0.06).*b1+c1;%%用到的小算法留取符合条件的值，不符合条件的为0；a.*（a>m）
    pore_c=pore_c.*(pore_a>0.06);

     a2=n(site1,2);
     b2=n(site1,3);
     c2=n(site1,4);
     pore_d=a2*(pore_a.*(pore_a<=0.06)).^2+b2*pore_a.*(pore_a<=0.06)+c2;
     pore_d=pore_d.*(pore_a<=0.06);
     pore_c=pore_c+pore_d;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    