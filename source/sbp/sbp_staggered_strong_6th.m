function [xp,xm,Pp,Pm,Qp,Qm] = sbp_staggered_strong_6nd(n,h,test)

if nargin < 3
  test = false;
end

assert(n >= 12,'Not enough grid points');

% Free parameters determined by optimizing spectral radius/truncation error
x =[...
   1.135642086672916;
  -0.012832881287791;
   0.006072190532767;
   0.035864312200320;
   1.005358539246049;  
   ];   
qm52 = x(4);
qm50 = x(3);
pm5 = x(5);
qm01 = x(1);
qm05 = x(2);


% Coefficients determined such that the SBP property is satisfied
qm44 = 469*pm5/32 - qm01/4 - 15*qm05/4 + 20*qm50 - 4*qm52 - 20766377/1327104;
qp44 = 97*pm5/4 - qm01 - 15*qm05 + 30*qm50 - 6*qm52 - 54135833/2211840;
qm24 = 911*pm5/48 - 3*qm01/2 - 45*qm05/2 + 20*qm50 - 4*qm52 - 38740633/2211840;
qm31 = -333*pm5/16 - 4*qm01 - 15*qm50 - 3*qm52/2 + 56540719/2211840;
pp3 = -10*pm5 + 1508401/138240;
qp22 = -46*pm5/3 - 6*qm01 - 10*qm05 - qm52 + 69918551/3317760;
qm30 = 95*pm5/12 + qm01 - qm05 + 6*qm50 - 6735193/737280;
qp14 = 333*pm5/16 + 4*qm01 + 15*qm50 + 3*qm52/2 - 56540719/2211840;
pp5 = -pm5 + 547709/276480;
qm51 = -23*pm5/96 - 5*qm50/2 - qm52/4 + 23/96;
qp55 = 95*pm5/12 - qm05 + 6*qm50 - qm52 - 60680021/6635520;
pp4 = 5*pm5 - 1084849/276480;
qp03 = 151*pm5/16 + 3*qm01/2 - 3*qm05/2 + 4*qm50 - 8310521/737280;
qp24 = -9*pm5/2 - 6*qm01 - 10*qm05 - 6*qm52 + 2494291/221184;
qp31 = -11*pm5/12 - qm01 - 5*qm05 + 15191/7680;
pm4 = -5*pm5 + 17383/2880;
qm21 = 91*pm5/3 + 6*qm01 + 10*qm50 + qm52 - 83022143/2211840;
qm22 = -139*pm5/8 - 9*qm01 - 15*qm05 - 4*qm52 + 29333551/1105920;
qp54 = -167*pm5/16 + 4*qm05 - 9*qm50 + 3*qm52/2 + 23476877/2211840;
pm2 = -10*pm5 + 4367/384;
qp40 = 0;
qp13 = -91*pm5/3 - 6*qm01 - 10*qm50 - qm52 + 83022143/2211840;
qm10 = 3*pm5 + qm01 - qm05 + qm50 - 5386343/1327104;
qp30 = 0;
pm3 = 10*pm5 - 17629/1920;
qm20 = -151*pm5/16 - 3*qm01/2 + 3*qm05/2 - 4*qm50 + 8310521/737280;
qp06 = -qm50;
qp02 = -3*pm5 - qm01 + qm05 - qm50 + 5386343/1327104;
qm34 = -97*pm5/4 + qm01 + 15*qm05 - 30*qm50 + 6*qm52 + 54135833/2211840;
qm43 = -37*pm5/4 + qm01 + 5*qm05 - 20*qm50 + 6*qm52 + 27356257/3317760;
qp41 = 7*pm5/32 + qm01/4 + 15*qm05/4 - 9667/20480;
qm11 = -481*pm5/32 - 4*qm01 - 5*qm50/2 - qm52/4 + 123804119/6635520;
qp51 = -qm05;
pp0 = pm5 - 180029/276480;
qp26 = -qm52;
qm35 = 167*pm5/16 - 4*qm05 + 9*qm50 - 3*qm52/2 - 23476877/2211840;
qm42 = -49*pm5/48 - 3*qm01/2 - 5*qm05/2 - 4*qm52 + 9041051/3317760;
qm03 = 11*pm5/12 + qm01 + 5*qm05 - 15191/7680;
qp01 = -71*pm5/96 + qm01/4 - qm05/4 + 98051/61440;
qp50 = 0;
qm23 = -31*pm5/2 + 6*qm01 + 30*qm05 - 20*qm50 + 6*qm52 + 1250449/122880;
pp1 = -5*pm5 + 1721329/276480;
qp12 = 481*pm5/32 + 4*qm01 + 5*qm50/2 + qm52/4 - 123804119/6635520;
qm14 = -17*pm5/4 + qm01 + 15*qm05 - 5*qm50 + qm52 + 21488641/6635520;
qp56 = -87*pm5/32 - 3*qm50/2 + qm52/4 + 249/64;
qm02 = -23*pm5/16 - 3*qm01/2 - 5*qm05/2 + 31763/10240;
qm53 = 39*pm5/16 + 5*qm50 - 3*qm52/2 - 1563/640;
qp16 = 23*pm5/96 + 5*qm50/2 + qm52/4 - 23/96;
qm04 = -7*pm5/32 - qm01/4 - 15*qm05/4 + 9667/20480;
qp25 = 49*pm5/48 + 3*qm01/2 + 5*qm05/2 + 4*qm52 - 9041051/3317760;
qm15 = 169*pm5/96 - 4*qm05 + 3*qm50/2 - qm52/4 - 11802053/6635520;
qp11 = -qm01;
qm25 = -7*pm5 + 6*qm05 - 6*qm50 + qm52 + 15656029/2211840;
qm13 = -13*pm5/16 - 4*qm01 - 20*qm05 + 5*qm50 - 3*qm52/2 + 3327811/663552;
qp46 = 59*pm5/12 + 5*qm50 - qm52 - 1913/384;
qm12 = 46*pm5/3 + 6*qm01 + 10*qm05 + qm52 - 69918551/3317760;
qp36 = -39*pm5/16 - 5*qm50 + 3*qm52/2 + 1563/640;
qp15 = -23*pm5/4 - qm01 - 10*qm50 - qm52 + 45949607/6635520;
qm40 = -71*pm5/32 - qm01/4 + qm05/4 - 4*qm50 + 16707751/6635520;
qp04 = -95*pm5/12 - qm01 + qm05 - 6*qm50 + 6735193/737280;
qm32 = 9*pm5/2 + 6*qm01 + 10*qm05 + 6*qm52 - 2494291/221184;
qm41 = 23*pm5/4 + qm01 + 10*qm50 + qm52 - 45949607/6635520;
qp21 = 23*pm5/16 + 3*qm01/2 + 5*qm05/2 - 31763/10240;
qp20 = 0;
qp53 = 7*pm5 - 6*qm05 + 6*qm50 - qm52 - 15656029/2211840;
qp05 = 71*pm5/32 + qm01/4 - qm05/4 + 4*qm50 - 16707751/6635520;
qm33 = 533*pm5/24 - 4*qm01 - 20*qm05 + 30*qm50 - 9*qm52 - 2336753/122880;
qp33 = 31*pm5/2 - 6*qm01 - 30*qm05 + 20*qm50 - 6*qm52 - 1250449/122880;
qm54 = -59*pm5/12 - 5*qm50 + qm52 + 1913/384;
qp52 = -169*pm5/96 + 4*qm05 - 3*qm50/2 + qm52/4 + 11802053/6635520;
qp23 = 139*pm5/8 + 9*qm01 + 15*qm05 + 4*qm52 - 29333551/1105920;
qp42 = 17*pm5/4 - qm01 - 15*qm05 + 5*qm50 - qm52 - 21488641/6635520;
qp10 = 0;
qp32 = 13*pm5/16 + 4*qm01 + 20*qm05 - 5*qm50 + 3*qm52/2 - 3327811/663552;
pm1 = 5*pm5 - 25253/5760;
qm00 = 71*pm5/96 - qm01/4 + qm05/4 - 98051/61440;
qm55 = 87*pm5/32 + 3*qm50/2 - qm52/4 - 249/64;
qp34 = -533*pm5/24 + 4*qm01 + 20*qm05 - 30*qm50 + 9*qm52 + 2336753/122880;
qm45 = -95*pm5/12 + qm05 - 6*qm50 + qm52 + 60680021/6635520;
qp43 = -911*pm5/48 + 3*qm01/2 + 45*qm05/2 - 20*qm50 + 4*qm52 + 38740633/2211840;
qp35 = 37*pm5/4 - qm01 - 5*qm05 + 20*qm50 - 6*qm52 - 27356257/3317760;
pm0 = -pm5 + 1381/640;
pp2 = 10*pm5 - 1250161/138240;
qp45 = -469*pm5/32 + qm01/4 + 15*qm05/4 - 20*qm50 + 4*qm52 + 20766377/1327104;
qp00 = -1;



% Number of coefficients
b = 6;

% Q+ and Q-, top-left corner
QpL = [...
qp00, qp01, qp02, qp03, qp04, qp05, qp06;
 qp10, qp11, qp12, qp13, qp14, qp15, qp16;
 qp20, qp21, qp22, qp23, qp24, qp25, qp26;
 qp30, qp31, qp32, qp33, qp34, qp35, qp36;
 qp40, qp41, qp42, qp43, qp44, qp45, qp46;
 qp50, qp51, qp52, qp53, qp54, qp55, qp56
];
QmL = [...
0, 0, 0, 0, 0, 0;
 qm00, qm01, qm02, qm03, qm04, qm05;
 qm10, qm11, qm12, qm13, qm14, qm15;
 qm20, qm21, qm22, qm23, qm24, qm25;
 qm30, qm31, qm32, qm33, qm34, qm35;
 qm40, qm41, qm42, qm43, qm44, qm45;
 qm50, qm51, qm52, qm53, qm54, qm55
];

% Q+ and Q-
w = b; 
s = rot90(vander(1:w))\((0:(w-1)).*(w/2-1/2+1).^([0 0:w-2]))';  
Qp = spdiags(repmat(-s(end:-1:1)',[n+2 1]), -(w/2-1):w/2, n+2, n+2); 
Qm = spdiags(repmat(s(:)',[n+2 1]), -(w/2-1)-1:w/2-1, n+2, n+2);
Qp(end,:) = [];
Qm(:,end) = [];

% Add SBP boundary closures
Qp(1:b,1:b+1) = QpL;
Qp(end-b+1:end,end-b:end) = -fliplr(flipud(QpL));
Qm(1:b+1,1:b) = QmL;
Qm(end-b:end,end-b+1:end) = -fliplr(flipud(QmL));

% P+ and P-
Pp = ones(n+1,1);
Pm = ones(n+2,1);

Pp(1:b) = [pp0,  pp1,  pp2,  pp3,  pp4,  pp5]; 
Pp(end-b+1:end) = Pp(b:-1:1);
Pm(1:b+1) = [0,  pm0,  pm1,  pm2,  pm3,  pm4,  pm5];
Pm(end-b:end) = Pm(b+1:-1:1);
Pp = spdiags(Pp,0,n+1,n+1);
Pm = spdiags(Pm,0,n+2,n+2);

Pp = h*Pp;
Pm = h*Pm;

xp = h*[0:n]';
xm = h*[0 1/2+0:n n]';  


% Test operators
if test
for j=0:b/2
  disp([ 'Dp, j = ' num2str(j) ' Error max = ' ...
  num2str(max(abs(Qp*xm.^j-j*Pp*xp.^max([j-1,0]))))]);
  disp([ 'Dm, j = ' num2str(j) ' Error max = '...
  num2str(max(abs(Qm*xp.^j-j*Pm*xm.^max([j-1,0]))))]);
end  
end
