clear;

u = 18;
v = 2;
w = -3;

phi = -30*pi/180;
theta = -15*pi/180;
psi = 60*pi/180;

sp = sin(phi);
cp = cos(phi);
st = sin(theta);
ct = cos(theta);
ss = sin(psi);
cs = cos(psi);

R_v_v1 = [cs  ss 0;...
          -ss cs 0;...
          0   0  1;...
          ];
R_v1_v2 = [ct 0 -st;...
           0  1  0;...
           st 0  ct;...
           ];
R_v2_b = [1  0  0;...
          0  cp sp;...
          0 -sp cp;...
          ];
inertial_velocity = R_v_v1' * R_v1_v2' * R_v2_b' * [u; v; w]

R_v_b = [ct*cs   ct*ss   -st;...
         sp*st*cs-cp*ss     sp*st*ss+cp*cs      sp*ct;...
         cp*st*cs+sp*ss     cp*st*ss-sp*cs      cp*ct;...
         ];
a = R_v_b'*[u;v;w]
% a1 = R_v2_b*R_v1_v2*R_v_v1*[u;v;w]
% a2 = R_v_b*[u;v;w]