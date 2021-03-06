clc;clear;close all;
for loop=1:1:10000
choice=menu('Signals & Systems','      Exponential     ','Ramp','Unit Step','Rectangular','Sinusoidal','Impulse','DC','LTI System');
switch(choice)
    case 1;
a=input('Enter the scaling factor: ');
i=input('Enter the start point: ');
b=input('Enter the end point: ');
f=input('Enter the sampling frequency: ');
t=i:f:b;
y=exp(a*t);
ib=b;
c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,y);
elseif c==1
    stem(t,y);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('Exponential Signal');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
i=1;
bp=input('\nDo you want to add breakpoints?','s' );
bpcmp=strcmp('yes',bp);
if bpcmp==1
bpnum=input('\nEnter the number of breakpoints: ');
for loop2=1:i:bpnum+1
fprintf('\nChoose the signal #%d: ',i+1);
choice=menu('Signals','      Exponential     ','Ramp','Unit Step','Rectangular','Sinusoidal','Impulse','DC');
switch(choice)
    case 1;
ab=input('\nEnter the scaling factor: ');
bb=input('Enter the end point : ');
fb=input('Enter the sampling frequency: ');
tb=ib:fb:bb;
yb=exp(ab*tb);
    plot([t,tb],[y,yb]);
    hold on;
    ib=bb;
    t=tb;
    y=yb;
  case 2;
sb=input('\nEnter the slope of the ramp S: ');
cyb=input('Enter the intercepts with y-axis C: ');
bb=input('Enter the end point : ');
tb=ib:bb;
yb=sb*tb+cyb;
plot([t,tb],[y,yb]);
    hold on;
    ib=bb;
    t=tb;
    y=yb;
    case 3;
ab=input('\nEnter the amplitude: ');
nb=input('\nEnter the length of the step sequence N: ');
nb=nb+1;
tb=(0:nb-1)+ib;
yb=ab*ones(1,nb);  
plot([t,tb],[y,yb]);
    hold on;
    nb=nb+ib;
    ib=nb;
    t=tb;
    y=yb;
    case 4;
        
        fsb=10;
        ab=input('\nEnter tha amplitude: ');
        wb=input('Enter the width: ');
        tb=ib:1/fsb:ib+wb;
        yb=ab*ones(1,length(tb));
        plot([t,tb],[y,yb]);
    hold on;
    ib=ib+wb;
    t=tb;
    y=yb;
        
        
 case 5;
       fb=input('\nEnter the frequency(end point) of the signal:');
       fsb=input('Enter the sampling frequency of the signal:');
       ab=input('Enter the amplitude of the signal:');
       tb=ib:fsb:fb;
       yb=ab*sin(2*pi*tb*fb+ib);
       plot([t,tb],[y,yb]);
       hold on;
    ib=fb;
    t=tb;
    y=yb;
    case 6;      
        eb=input('\nEnter the end of the interval: ');
        tb=ib:eb;
        yb=zeros(1,eb-ib+1);
        fprintf('Enter the location of the impulse(between interval [1,%d]): ',eb-ib+1);
        bbb=input('');
        yb(1,bbb)=1;
         plot([t,tb],[y,yb]);
       hold on;
    ib=eb;
    t=tb;
    y=yb;
    
    case 7;      
        vb=input('\nEnter the value Of The DC: ');
        abb=input('Enter the amplitude: ');
       yb=abb*vb*ones(1,80);
        tb=(0.05:0.05:4)+ib; 
        plot([t,tb],[y,yb]);
        hold on;
    ib=4+ib;
    t=tb;
    y=yb;
     
end
i=i+1;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%    
answer=input('Do you want to add or multiply another signal with this signal?','s');
cmp=strcmp('yes',answer);
if cmp==1
   
fprintf('\nPlease choose the type of the signal you want to add.\n');
choice=menu('Signals','      Exponential     ','Ramp','Unit Step','Rectangular','Sinusoidal','Impulse','DC');
switch(choice)
    case 1;
a=input('\nEnter the scaling factor: ');
t2=t;
y2=exp(a.*t2);
    an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end 
    
  case 2;
s2=input('\nEnter the slope of the ramp S: ');
t2=t;
cy2=input('Enter the intercepts with y-axis C: ');
y2=s2.*t2+cy2;
an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==1
    plot(t,z);
elseif c==2
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
ylabel('Amplitude');
xlabel('Time Index');
title('Ramp signal');

    case 3;
ab=input('\nEnter the amplitude: ');
n=input('\nEnter the length of the step sequence N: '); 
y2=ab*ones(1,n);
an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    case 4;
        
        a2=input('Enter tha amplitude: ');
        w2=input('Enter the width: ');
        c2=input('Enter the centre of the rect: ');
        fs2 = 10000;
        t2 =-1:1/fs2:1;
        y2 = a2.*rectpuls((t2/w2)+c2,20e-3);
        an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
        
%         c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
% if c==2
%    plot(t,y2), axis([-0.1 0.1 -0.2 a2+0.2]);
% elseif c==1
%     stem(t,y2), axis([-0.1 0.1 -0.2 a2+0.2]);
% else
%     disp('WRONG CHOICE');
% end
%         ylabel('Amplitude');
%         xlabel('Time index');
%         title('Rectangular signal');
        
        
 case 5;
       f2=input('\nEnter the frequency(end point) of the signal: ');
       fs2=10000;
       p=input('Enter the phase of the signal: ');
       a=input('Enter the amplitude of the signal: ');
       i=input('Enter the start point: ');
       t=0:1/fs2:1-(1/fs2);
       y2=a*sin(2*pi*t*f2+i);
       an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
       
    case 6;
        
        t2=t;
        a2=input('Enter the interval: ');
        y2=zeros(1,a2);
        fprintf('Enter the location of the impulse(between interval [1,%d]: ',a2);
        b2=input('');
        y2(1,b2)=1;
        an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
         
    case 7;
        v=input('\nEnter the value Of The DC: ');
       y2=v*ones(1,80);
        t2=t;
       an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
     
end
end
    case 2;
s=input('\nEnter the slope of the ramp S: ');
cy=input('Enter the intercepts with y-axis C: ');
b=input('Enter the end point : ');
t=0:b;
y=s*t+cy;
ib=b;
c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
   plot(t,y);
elseif c==1
    stem(t,y);
else
    disp('WRONG CHOICE');
end
ylabel('Amplitude');
xlabel('Time Index');
title('Ramp signal');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
i=1;
bp=input('\nDo you want to add breakpoints?','s' );
bpcmp=strcmp('yes',bp);
if bpcmp==1
bpnum=input('\nEnter the number of breakpoints: ');
for loop2=1:i:bpnum+1
fprintf('\nChoose the signal #%d: ',i+1);
choice=menu('Signals','      Exponential     ','Ramp','Unit Step','Rectangular','Sinusoidal','Impulse','DC');
switch(choice)
    case 1;
ab=input('\nEnter the scaling factor: ');
bb=input('Enter the end point : ');
fb=input('Enter the sampling frequency: ');
tb=ib:fb:bb;
yb=exp(ab*tb);
    plot([t,tb],[y,yb]);
    hold on;
    ib=bb;
    t=tb;
    y=yb;
  case 2;
sb=input('\nEnter the slope of the ramp S: ');
cyb=input('Enter the intercepts with y-axis C: ');
bb=input('Enter the end point : ');
tb=ib:bb;
yb=sb*tb+cyb;
plot([t,tb],[y,yb]);
    hold on;
    ib=bb;
    t=tb;
    y=yb;
    case 3;
ab=input('\nEnter the amplitude: ');
nb=input('\nEnter the length of the step sequence N: ');
nb=nb+1;
tb=(0:nb-1)+ib;
yb=ab*ones(1,nb);  
plot([t,tb],[y,yb]);
    hold on;
    nb=nb+ib;
    ib=nb;
    t=tb;
    y=yb;
    case 4;
        
        fsb=10;
        ab=input('\nEnter tha amplitude: ');
        wb=input('Enter the width: ');
        tb=ib:1/fsb:ib+wb;
        yb=ab*ones(1,length(tb));
        plot([t,tb],[y,yb]);
    hold on;
    ib=ib+wb;
    t=tb;
    y=yb;
        
        
 case 5;
       fb=input('\nEnter the frequency(end point) of the signal:');
       fsb=input('Enter the sampling frequency of the signal:');
       ab=input('Enter the amplitude of the signal:');
       tb=ib:fsb:fb;
       yb=ab*sin(2*pi*tb*fb+ib);
       plot([t,tb],[y,yb]);
       hold on;
    ib=fb;
    t=tb;
    y=yb;
    case 6;      
        eb=input('\nEnter the end of the interval: ');
        tb=ib:eb;
        yb=zeros(1,eb-ib+1);
        fprintf('Enter the location of the impulse(between interval [1,%d]): ',eb-ib+1);
        bbb=input('');
        yb(1,bbb)=1;
         plot([t,tb],[y,yb]);
       hold on;
    ib=eb;
    t=tb;
    y=yb;
    
    case 7;      
        vb=input('\nEnter the value Of The DC: ');
        abb=input('Enter the amplitude: ');
       yb=abb*vb*ones(1,80);
        tb=(0.05:0.05:4)+ib; 
        plot([t,tb],[y,yb]);
        hold on;
    ib=4+ib;
    t=tb;
    y=yb;
     
end
i=i+1;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%    
answer=input('Do you want to add or multiply another signal with this signal?','s');
cmp=strcmp('yes',answer);
if cmp==1
    fprintf('\nPlease choose the type of the signal you want to add.');
choice=menu('Signals','      Exponential     ','Ramp','Unit Step','Rectangular','Sinusoidal','Impulse','DC');
switch(choice)
    case 1;
a=input('\nEnter the scaling factor: ');
t2=t;
y2=exp(a.*t2);
    an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
    
  case 2;
s2=input('\nEnter the slope of the ramp S: ');
t2=t;
cy2=input('Enter the intercepts with y-axis C: ');
y2=s2.*t2+cy2;
an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==1
    plot(t,z);
elseif c==2
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 3;
n=input('\nEnter the length of the step sequence N: ');
ab=input('\nEnter the amplitude: ');
y2=ab*ones(1,n);
an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    case 4;
        
        a2=input('Enter tha amplitude: ');
        w2=input('Enter the width: ');
        c2=input('Enter the centre of the rect: ');
        fs2 = 10000;
        t2 =t;
        y2 = a2*rectpuls((t2/w2)+c2,20e-3);
        an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
        
%         c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
% if c==2
%    plot(t,y2), axis([-0.1 0.1 -0.2 a2+0.2]);
% elseif c==1
%     stem(t,y2), axis([-0.1 0.1 -0.2 a2+0.2]);
% else
%     disp('WRONG CHOICE');
% end
%         ylabel('Amplitude');
%         xlabel('Time index');
%         title('Rectangular signal');
        
        
 case 5;
       f2=input('\nEnter the frequency of the signal: ');
       fs2=10000;
       p=input('Enter the phase of the signal: ');
       a=input('\nEnter the amplitude of the signal: ');
       i=input('Enter the start point: ');
       t=0:1/fs2:1-(1/fs2);
       y2=a*sin(2*pi*t*f2+i);
       an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
       
    case 6;
        
        t2=t;
        a2=input('Enter the interval: ');
        y2=zeros(1,a2);
        fprintf('Enter the location of the impulse(between interval [1,%d]: ',a2);
        b2=input('');
        y2(1,b2)=1;
        an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
         
    case 7;
        v=input('\nEnter the value Of The DC: ');
       y2=v*ones(1,80);
        t2=t;
       an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
     
end
end

    case 3;
        
n=input('\nEnter the length of the step sequence N: ');
ab=input('\nEnter the amplitude: ');
n=n+1;
t=0:n-1;
y=ab*ones(1,n);
ib=n-1;
c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,y);
elseif c==1
    stem(t,y);
else
    disp('WRONG CHOICE');
end
ylabel('Amplitude');
xlabel('Time Index');
title('unit step signal');
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
i=1;
bp=input('\nDo you want to add breakpoints?','s' );
bpcmp=strcmp('yes',bp);
if bpcmp==1
bpnum=input('\nEnter the number of breakpoints: ');
for loop2=1:i:bpnum+1
fprintf('\nChoose the signal #%d: ',i+1);
choice=menu('Signals','      Exponential     ','Ramp','Unit Step','Rectangular','Sinusoidal','Impulse','DC');
switch(choice)
    case 1;
ab=input('\nEnter the scaling factor: ');
bb=input('Enter the end point : ');
fb=input('Enter the sampling frequency: ');
tb=ib:fb:bb;
yb=exp(ab*tb);
    plot([t,tb],[y,yb]);
    hold on;
    ib=bb;
    t=tb;
    y=yb;
  case 2;
sb=input('\nEnter the slope of the ramp S: ');
cyb=input('Enter the intercepts with y-axis C: ');
bb=input('Enter the end point : ');
tb=ib:bb;
yb=sb*tb+cyb;
plot([t,tb],[y,yb]);
    hold on;
    ib=bb;
    t=tb;
    y=yb;
    case 3;
ab=input('\nEnter the amplitude: ');
nb=input('\nEnter the length of the step sequence N: ');
nb=nb+1;
tb=(0:nb-1)+ib;
yb=ab*ones(1,nb);  
plot([t,tb],[y,yb]);
    hold on;
    nb=nb+ib;
    ib=nb;
    t=tb;
    y=yb;
    case 4;
        
        fsb=10;
        ab=input('\nEnter tha amplitude: ');
        wb=input('Enter the width: ');
        tb=ib:1/fsb:ib+wb;
        yb=ab*ones(1,length(tb));
        plot([t,tb],[y,yb]);
    hold on;
    ib=ib+wb;
    t=tb;
    y=yb;
        
        
 case 5;
       fb=input('\nEnter the frequency(end point) of the signal:');
       fsb=input('Enter the sampling frequency of the signal:');
       ab=input('Enter the amplitude of the signal:');
       tb=ib:fsb:fb;
       yb=ab*sin(2*pi*tb*fb+ib);
       plot([t,tb],[y,yb]);
       hold on;
    ib=fb;
    t=tb;
    y=yb;
    case 6;      
        eb=input('\nEnter the end of the interval: ');
        tb=ib:eb;
        yb=zeros(1,eb-ib+1);
        fprintf('Enter the location of the impulse(between interval [1,%d]): ',eb-ib+1);
        bbb=input('');
        yb(1,bbb)=1;
         plot([t,tb],[y,yb]);
       hold on;
    ib=eb;
    t=tb;
    y=yb;
    
    case 7;      
        vb=input('\nEnter the value Of The DC: ');
        abb=input('Enter the amplitude: ');
       yb=abb*vb*ones(1,80);
        tb=(0.05:0.05:4)+ib; 
        plot([t,tb],[y,yb]);
        hold on;
    ib=4+ib;
    t=tb;
    y=yb;
     
end
i=i+1;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  answer=input('Do you want to add or multiply another signal with this signal?','s');
cmp=strcmp('yes',answer);
if cmp==1
    fprintf('\nPlease choose the type of the signal you want to add.');
choice=menu('Signals','      Exponential     ','Ramp','Unit Step','Rectangular','Sinusoidal','Impulse','DC');
switch(choice)
    case 1;
a=input('\nEnter the scaling factor: ');
t2=t;
y2=exp(a.*t2);
    an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
    
  case 2;
s2=input('\nEnter the slope of the ramp S: ');
t2=t;
cy2=input('Enter the intercepts with y-axis C: ');
y2=s2.*t2+cy2;
an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==1
    plot(t,z);
elseif c==2
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    case 3;
n=input('\nEnter the length of the step sequence N: ');ab=input('\nEnter the amplitude: ');
y2=ab*ones(1,n);
an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    case 4;
        
        a2=input('Enter tha amplitude: ');
        w2=input('Enter the width: ');
        c2=input('Enter the centre of the rect: ');
        fs2 = 10000;
        t2 =-1:1/fs2:1;
        y2 = a2.*rectpuls((t2/w2)+c2,20e-3);
        an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
        
%         c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
% if c==2
%    plot(t,y2), axis([-0.1 0.1 -0.2 a2+0.2]);
% elseif c==1
%     stem(t,y2), axis([-0.1 0.1 -0.2 a2+0.2]);
% else
%     disp('WRONG CHOICE');
% end
%         ylabel('Amplitude');
%         xlabel('Time index');
%         title('Rectangular signal');
        
        
 case 5;
       f2=input('\nEnter the frequency(end point) of the signal: ');
       fs2=10000;
       p=input('Enter the phase of the signal: ');
       a=input('Enter the amplitude of the signal: ');
       i=input('Enter the start point: ');
       t=0:1/fs2:1-(1/fs2);
       y2=a*sin(2*pi*t*f2+i);
       an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
       
    case 6;
        
        t2=t;
        a2=input('Enter the interval: ');
        y2=zeros(1,a2);
        fprintf('Enter the location of the impulse(between interval [1,%d]: ',a2);
        b2=input('');
        y2(1,b2)=1;
        an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
         
    case 7;
        v=input('\nEnter the value Of The DC: ');
       y2=v*ones(1,80);
        t2=t;
       an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
     
end
end

    case 4;        
        fs=10;
        a=input('Enter tha amplitude: ');
        w=input('Enter the width: ');
        c=input('Enter the centre of the rect: ');
        t=c-w/2:1/fs:c+w/2;
        y=a*ones(1,length(t));
        ib=w;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
   plot(t,y), axis([-0.1 0.1 -0.2 a+0.2]);
elseif c==1
    stem(t,y), axis([-0.1 0.1 -0.2 a+0.2]);
else
    disp('WRONG CHOICE');
end
        ylabel('Amplitude');
        xlabel('Time index');
        title('Rectangular signal');
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
i=1;
bp=input('\nDo you want to add breakpoints?','s' );
bpcmp=strcmp('yes',bp);
if bpcmp==1
bpnum=input('\nEnter the number of breakpoints: ');
for loop2=1:i:bpnum+1
fprintf('\nChoose the signal #%d: ',i+1);
choice=menu('Signals','      Exponential     ','Ramp','Unit Step','Rectangular','Sinusoidal','Impulse','DC');
switch(choice)
    case 1;
ab=input('\nEnter the scaling factor: ');
bb=input('Enter the end point : ');
fb=input('Enter the sampling frequency: ');
tb=ib:fb:bb;
yb=exp(ab*tb);
    plot([t,tb],[y,yb]);
    hold on;
    ib=bb;
    t=tb;
    y=yb;
  case 2;
sb=input('\nEnter the slope of the ramp S: ');
cyb=input('Enter the intercepts with y-axis C: ');
bb=input('Enter the end point : ');
tb=ib:bb;
yb=sb*tb+cyb;
plot([t,tb],[y,yb]);
    hold on;
    ib=bb;
    t=tb;
    y=yb;
    case 3;
ab=input('\nEnter the amplitude: ');
nb=input('\nEnter the length of the step sequence N: ');
nb=nb+1;
tb=(0:nb-1)+ib;
yb=ab*ones(1,nb);  
plot([t,tb],[y,yb]);
    hold on;
    nb=nb+ib;
    ib=nb;
    t=tb;
    y=yb;
    case 4;
        
        fsb=10;
        ab=input('\nEnter tha amplitude: ');
        wb=input('Enter the width: ');
        tb=ib:1/fsb:ib+wb;
        yb=ab*ones(1,length(tb));
        plot([t,tb],[y,yb]);
    hold on;
    ib=ib+wb;
    t=tb;
    y=yb;
        
        
 case 5;
       fb=input('\nEnter the frequency(end point) of the signal:');
       fsb=input('Enter the sampling frequency of the signal:');
       ab=input('Enter the amplitude of the signal:');
       tb=ib:fsb:fb;
       yb=ab*sin(2*pi*tb*fb+ib);
       plot([t,tb],[y,yb]);
       hold on;
    ib=fb;
    t=tb;
    y=yb;
    case 6;      
        eb=input('\nEnter the end of the interval: ');
        tb=ib:eb;
        yb=zeros(1,eb-ib+1);
        fprintf('Enter the location of the impulse(between interval [1,%d]): ',eb-ib+1);
        bbb=input('');
        yb(1,bbb)=1;
         plot([t,tb],[y,yb]);
       hold on;
    ib=eb;
    t=tb;
    y=yb;
    
    case 7;      
        vb=input('\nEnter the value Of The DC: ');
        abb=input('Enter the amplitude: ');
       yb=abb*vb*ones(1,80);
        tb=(0.05:0.05:4)+ib; 
        plot([t,tb],[y,yb]);
        hold on;
    ib=4+ib;
    t=tb;
    y=yb;
     
end
i=i+1;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%    
        answer=input('Do you want to add or multiply another signal with this signal?','s');
cmp=strcmp('yes',answer);
if cmp==1
    fprintf('\nPlease choose the type of the signal you want to add.');
choice=menu('Signals','      Exponential     ','Ramp','Unit Step','Rectangular','Sinusoidal','Impulse','DC');
switch(choice)
    case 1;
a=input('\nEnter the scaling factor: ');
t2=t;
y2=exp(a.*t2);
    an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
    
  case 2;
s2=input('\nEnter the slope of the ramp S: ');
t2=t;
cy2=input('Enter the intercepts with y-axis C: ');
y2=s2.*t2+cy2;
an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==1
    plot(t,z);
elseif c==2
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    case 3;
n=input('\nEnter the length of the step sequence N: ');ab=input('\nEnter the amplitude: '); 
y2=ab*ones(1,n);
an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    case 4;
        
        a2=input('Enter tha amplitude: ');
        w2=input('Enter the width: ');
        c2=input('Enter the centre of the rect: ');
        t2=c2-w2/2:1/fs:c2+w2/2;
        y2=a2*ones(1,length(t2));        
        an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
        
%         c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
% if c==2
%    plot(t,y2), axis([-0.1 0.1 -0.2 a2+0.2]);
% elseif c==1
%     stem(t,y2), axis([-0.1 0.1 -0.2 a2+0.2]);
% else
%     disp('WRONG CHOICE');
% end
%         ylabel('Amplitude');
%         xlabel('Time index');
%         title('Rectangular signal');
        
        
 case 5;
       f2=input('\nEnter the frequency(end point) of the signal: ');
       fs2=10000;
       a=input('Enter the amplitude of the signal: ');
       i=input('Enter the start point: ');
       t2=i:1/fs2:1-(1/fs2);
       y2=a*sin(2*pi*t2*f2+i);
       
       an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
       
    case 6;
        
        t2=t;
        a2=input('Enter the interval: ');
        y2=zeros(1,a2);
        fprintf('Enter the location of the impulse(between interval [1,%d]: ',a2);
        b2=input('');
        y2(1,b2)=1;
        an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
         
    case 7;
        v=input('\nEnter the value Of The DC: ');
       y2=v*ones(1,80);
        t2=t;
       an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
     
end
end
        
 case 5;
       f=input('Enter the frequency(end point) of the signal:');
       fs=input('Enter the sampling frequency of the signal:');
       a=input('Enter the amplitude of the signal:');
       i=input('Enter the start point:');
       t=i:fs:f;
       y=a*sin(2*pi*t*f+i);
       ib=f;
       c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous:');
if c==2
    plot(t,y);
elseif c==1
    stem(t,y);
else
    disp('WRONG CHOICE');
end
 ylabel('Amplitude');
xlabel('Time Index');
title('Sinousoidal signal');
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
i=1;
bp=input('\nDo you want to add breakpoints?','s' );
bpcmp=strcmp('yes',bp);
if bpcmp==1
bpnum=input('\nEnter the number of breakpoints: ');
for loop2=1:i:bpnum+1
fprintf('\nChoose the signal #%d: ',i+1);
choice=menu('Signals','      Exponential     ','Ramp','Unit Step','Rectangular','Sinusoidal','Impulse','DC');
switch(choice)
    case 1;
ab=input('\nEnter the scaling factor: ');
bb=input('Enter the end point : ');
fb=input('Enter the sampling frequency: ');
tb=ib:fb:bb;
yb=exp(ab*tb);
    plot([t,tb],[y,yb]);
    hold on;
    ib=bb;
    t=tb;
    y=yb;
  case 2;
sb=input('\nEnter the slope of the ramp S: ');
cyb=input('Enter the intercepts with y-axis C: ');
bb=input('Enter the end point : ');
tb=ib:bb;
yb=sb*tb+cyb;
plot([t,tb],[y,yb]);
    hold on;
    ib=bb;
    t=tb;
    y=yb;
    case 3;
ab=input('\nEnter the amplitude: ');
nb=input('\nEnter the length of the step sequence N: ');
nb=nb+1;
tb=(0:nb-1)+ib;
yb=ab*ones(1,nb);  
plot([t,tb],[y,yb]);
    hold on;
    nb=nb+ib;
    ib=nb;
    t=tb;
    y=yb;
    case 4;
        
        fsb=10;
        ab=input('\nEnter tha amplitude: ');
        wb=input('Enter the width: ');
        tb=ib:1/fsb:ib+wb;
        yb=ab*ones(1,length(tb));
        plot([t,tb],[y,yb]);
    hold on;
    ib=ib+wb;
    t=tb;
    y=yb;
        
        
 case 5;
       fb=input('\nEnter the frequency(end point) of the signal:');
       fsb=input('Enter the sampling frequency of the signal:');
       ab=input('Enter the amplitude of the signal:');
       tb=ib:fsb:fb;
       yb=ab*sin(2*pi*tb*fb+ib);
       plot([t,tb],[y,yb]);
       hold on;
    ib=fb;
    t=tb;
    y=yb;
    case 6;      
        eb=input('\nEnter the end of the interval: ');
        tb=ib:eb;
        yb=zeros(1,eb-ib+1);
        fprintf('Enter the location of the impulse(between interval [1,%d]): ',eb-ib+1);
        bbb=input('');
        yb(1,bbb)=1;
         plot([t,tb],[y,yb]);
       hold on;
    ib=eb;
    t=tb;
    y=yb;
    
    case 7;      
        vb=input('\nEnter the value Of The DC: ');
        abb=input('Enter the amplitude: ');
       yb=abb*vb*ones(1,80);
        tb=(0.05:0.05:4)+ib; 
        plot([t,tb],[y,yb]);
        hold on;
    ib=4+ib;
    t=tb;
    y=yb;
     
end
i=i+1;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%    
answer=input('Do you want to add or multiply another signal with this signal?','s');
cmp=strcmp('yes',answer);
if cmp==1
    fprintf('\nPlease choose the type of the signal you want to add.');
choice=menu('Signals','      Exponential     ','Ramp','Unit Step','Rectangular','Sinusoidal','Impulse','DC');
switch(choice)
    case 1;
a=input('\nEnter the scaling factor: ');
t2=t;
y2=exp(a.*t2);
    an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
    
  case 2;
s2=input('\nEnter the slope of the ramp S: ');
t2=t;
cy2=input('Enter the intercepts with y-axis C: ');
y2=s2.*t2+cy2;
an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==1
    plot(t,z);
elseif c==2
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    case 3;
n=input('\nEnter the length of the step sequence N: ');ab=input('\nEnter the amplitude: '); 
y2=ab*ones(1,n);
an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    case 4;
        
        a2=input('Enter tha amplitude: ');
        w2=input('Enter the width: ');
        c2=input('Enter the centre of the rect: ');
        fs2 = 10000;
        t2 =-1:1/fs2:1;
        y2 = a2.*rectpuls((t2/w2)+c2,20e-3);
        an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
        
%         c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
% if c==2
%    plot(t,y2), axis([-0.1 0.1 -0.2 a2+0.2]);
% elseif c==1
%     stem(t,y2), axis([-0.1 0.1 -0.2 a2+0.2]);
% else
%     disp('WRONG CHOICE');
% end
%         ylabel('Amplitude');
%         xlabel('Time index');
%         title('Rectangular signal');
        
        
 case 5;
       f2=input('\nEnter the frequency(end point) of the signal: ');
       fs2=10000;
       p=input('Enter the phase of the signal: ');
       a=input('Enter the amplitude of the signal: ');
       i=input('Enter the start point: ');
       t=0:1/fs2:1-(1/fs2);
       y2=a*sin(2*pi*t*f2+i);
       an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
       
    case 6;
        
        t2=t;
        a2=input('Enter the interval: ');
        y2=zeros(1,a2);
        fprintf('Enter the location of the impulse(between interval [1,%d]: ',a2);
        b2=input('');
        y2(1,b2)=1;
        an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
         
    case 7;
        v=input('\nEnter the value Of The DC: ');
       y2=v*ones(1,80);
        t2=t;
       an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
     
end
end
       
    case 6;
        s=input('Enter the start of the interval: ');
        e=input('Enter the end of the interval: ');
        t=s:e;
        y=zeros(1,e-s+1);
        fprintf('Enter the location of the impulse(between interval [1,%d]): ',e-s+1);
        b=input('');
        y(1,b)=1;
        ib=e;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,y);
elseif c==1
    stem(t,y);
else
    disp('WRONG CHOICE');
end
        ylabel ('Amplitude');
        xlabel ('Time Index');
        TITLE ('Impulse Signal');
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
i=1;
bp=input('\nDo you want to add breakpoints?','s' );
bpcmp=strcmp('yes',bp);
if bpcmp==1
bpnum=input('\nEnter the number of breakpoints: ');
for loop2=1:i:bpnum+1
fprintf('\nChoose the signal #%d: ',i+1);
choice=menu('Signals','      Exponential     ','Ramp','Unit Step','Rectangular','Sinusoidal','Impulse','DC');
switch(choice)
    case 1;
ab=input('\nEnter the scaling factor: ');
bb=input('Enter the end point : ');
fb=input('Enter the sampling frequency: ');
tb=ib:fb:bb;
yb=exp(ab*tb);
    plot([t,tb],[y,yb]);
    hold on;
    ib=bb;
    t=tb;
    y=yb;
  case 2;
sb=input('\nEnter the slope of the ramp S: ');
cyb=input('Enter the intercepts with y-axis C: ');
bb=input('Enter the end point : ');
tb=ib:bb;
yb=sb*tb+cyb;
plot([t,tb],[y,yb]);
    hold on;
    ib=bb;
    t=tb;
    y=yb;
    case 3;
ab=input('\nEnter the amplitude: ');
nb=input('\nEnter the length of the step sequence N: ');
nb=nb+1;
tb=(0:nb-1)+ib;
yb=ab*ones(1,nb);  
plot([t,tb],[y,yb]);
    hold on;
    nb=nb+ib;
    ib=nb;
    t=tb;
    y=yb;
    case 4;
        
        fsb=10;
        ab=input('\nEnter tha amplitude: ');
        wb=input('Enter the width: ');
        tb=ib:1/fsb:ib+wb;
        yb=ab*ones(1,length(tb));
        plot([t,tb],[y,yb]);
    hold on;
    ib=ib+wb;
    t=tb;
    y=yb;
        
        
 case 5;
       fb=input('\nEnter the frequency(end point) of the signal:');
       fsb=input('Enter the sampling frequency of the signal:');
       ab=input('Enter the amplitude of the signal:');
       tb=ib:fsb:fb;
       yb=ab*sin(2*pi*tb*fb+ib);
       plot([t,tb],[y,yb]);
       hold on;
    ib=fb;
    t=tb;
    y=yb;
    case 6;      
        eb=input('\nEnter the end of the interval: ');
        tb=ib:eb;
        yb=zeros(1,eb-ib+1);
        fprintf('Enter the location of the impulse(between interval [1,%d]): ',eb-ib+1);
        bbb=input('');
        yb(1,bbb)=1;
         plot([t,tb],[y,yb]);
       hold on;
    ib=eb;
    t=tb;
    y=yb;
    
    case 7;      
        vb=input('\nEnter the value Of The DC: ');
        abb=input('Enter the amplitude: ');
       yb=abb*vb*ones(1,80);
        tb=(0.05:0.05:4)+ib; 
        plot([t,tb],[y,yb]);
        hold on;
    ib=4+ib;
    t=tb;
    y=yb;
     
end
i=i+1;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%    
        answer=input('Do you want to add or multiply another signal with this signal?','s');
cmp=strcmp('yes',answer);
if cmp==1
    fprintf('\nPlease choose the type of the signal you want to add.');
choice=menu('Signals','      Exponential     ','Ramp','Unit Step','Rectangular','Sinusoidal','Impulse','DC');
switch(choice)
    case 1;
a=input('\nEnter the scaling factor: ');
t2=t;
y2=exp(a.*t2);
    an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
    
  case 2;
s2=input('\nEnter the slope of the ramp S: ');
t2=t;
cy2=input('Enter the intercepts with y-axis C: ');
y2=s2.*t2+cy2;
an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==1
    plot(t,z);
elseif c==2
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 

    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    case 3;
n=input('\nEnter the length of the step sequence N: ');ab=input('\nEnter the amplitude: '); 
y2=ab*ones(1,n);
an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    case 4;
        
        a2=input('Enter tha amplitude: ');
        w2=input('Enter the width: ');
        c2=input('Enter the centre of the rect: ');
        fs2 = 10000;
        t2 =-1:1/fs2:1;
        y2 = a2.*rectpuls((t2/w2)+c2,20e-3);
        an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
        
%         c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
% if c==2
%    plot(t,y2), axis([-0.1 0.1 -0.2 a2+0.2]);
% elseif c==1
%     stem(t,y2), axis([-0.1 0.1 -0.2 a2+0.2]);
% else
%     disp('WRONG CHOICE');
% end
%         ylabel('Amplitude');
%         xlabel('Time index');
%         title('Rectangular signal');
        
        
 case 5;
       f2=input('\nEnter the frequency(end point) of the signal: ');
       fs2=10000;
       p=input('Enter the phase of the signal: ');
       a=input('Enter the amplitude of the signal: ');
       i=input('Enter the start point: ');
       t=0:1/fs2:1-(1/fs2);
       y2=a*sin(2*pi*t*f2+i);
       an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
       
    case 6;
        
        t2=t;
        fprintf('Enter the location of the impulse(between interval [1,%d]): ',e-s+1);
        b2=input('');
        y2(1,b2)=1;
        an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
         
    case 7;
        v=input('\nEnter the value Of The DC: ');
       y2=v*ones(1,80);
        t2=t;
       an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
     
end
end
         
    case 7;
        v=input('\nEnter the value Of The DC: ');
       y=v*ones(1,80);
        t=0.05:0.05:4;
        ib=4;
       c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,y);
elseif c==1
    stem(t,y);
else
    disp('WRONG CHOICE');
end
     ylabel('Amplitude');
     xlabel('Time Index');
     title('DC signal');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
i=1;
bp=input('\nDo you want to add breakpoints?','s' );
bpcmp=strcmp('yes',bp);
if bpcmp==1
bpnum=input('\nEnter the number of breakpoints: ');
for loop2=1:i:bpnum+1
fprintf('\nChoose the signal #%d: ',i+1);
choice=menu('Signals','      Exponential     ','Ramp','Unit Step','Rectangular','Sinusoidal','Impulse','DC');
switch(choice)
    case 1;
ab=input('\nEnter the scaling factor: ');
bb=input('Enter the end point : ');
fb=input('Enter the sampling frequency: ');
tb=ib:fb:bb;
yb=exp(ab*tb);
    plot([t,tb],[y,yb]);
    hold on;
    ib=bb;
    t=tb;
    y=yb;
  case 2;
sb=input('\nEnter the slope of the ramp S: ');
cyb=input('Enter the intercepts with y-axis C: ');
bb=input('Enter the end point : ');
tb=ib:bb;
yb=sb*tb+cyb;
plot([t,tb],[y,yb]);
    hold on;
    ib=bb;
    t=tb;
    y=yb;
    case 3;
ab=input('\nEnter the amplitude: ');
nb=input('\nEnter the length of the step sequence N: ');
nb=nb+1;
tb=(0:nb-1)+ib;
yb=ab*ones(1,nb);  
plot([t,tb],[y,yb]);
    hold on;
    nb=nb+ib;
    ib=nb;
    t=tb;
    y=yb;
    case 4;
        
        fsb=10;
        ab=input('\nEnter tha amplitude: ');
        wb=input('Enter the width: ');
        tb=ib:1/fsb:ib+wb;
        yb=ab*ones(1,length(tb));
        plot([t,tb],[y,yb]);
    hold on;
    ib=ib+wb;
    t=tb;
    y=yb;
        
        
 case 5;
       fb=input('\nEnter the frequency(end point) of the signal:');
       fsb=input('Enter the sampling frequency of the signal:');
       ab=input('Enter the amplitude of the signal:');
       tb=ib:fsb:fb;
       yb=ab*sin(2*pi*tb*fb+ib);
       plot([t,tb],[y,yb]);
       hold on;
    ib=fb;
    t=tb;
    y=yb;
    case 6;      
        eb=input('\nEnter the end of the interval: ');
        tb=ib:eb;
        yb=zeros(1,eb-ib+1);
        fprintf('Enter the location of the impulse(between interval [1,%d]): ',eb-ib+1);
        bbb=input('');
        yb(1,bbb)=1;
         plot([t,tb],[y,yb]);
       hold on;
    ib=eb;
    t=tb;
    y=yb;
    
    case 7;      
        vb=input('\nEnter the value Of The DC: ');
        abb=input('Enter the amplitude: ');
       yb=abb*vb*ones(1,80);
        tb=(0.05:0.05:4)+ib; 
        plot([t,tb],[y,yb]);
        hold on;
    ib=4+ib;
    t=tb;
    y=yb;
     
end
i=i+1;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%    
     answer=input('Do you want to add or multiply another signal with this signal?','s');
cmp=strcmp('yes',answer);
if cmp==1
    fprintf('\nPlease choose the type of the signal you want to add.');
choice=menu('Signals','      Exponential     ','Ramp','Unit Step','Rectangular','Sinusoidal','Impulse','DC');
switch(choice)
    case 1;
a=input('\nEnter the scaling factor: ');
t2=t;
y2=exp(a.*t2);
    an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
    
  case 2;
s2=input('\nEnter the slope of the ramp S: ');
t2=t;
cy2=input('Enter the intercepts with y-axis C: ');
y2=s2.*t2+cy2;
an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==1
    plot(t,z);
elseif c==2
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    case 3;
n=input('\nEnter the length of the step sequence N: ');ab=input('\nEnter the amplitude: '); 
y2=ab*ones(1,n);
an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    case 4;
        
        a2=input('Enter tha amplitude: ');
        w2=input('Enter the width: ');
        c2=input('Enter the centre of the rect: ');
        fs2 = 10000;
        t2 =-1:1/fs2:1;
        y2 = a2.*rectpuls((t2/w2)+c2,20e-3);
        an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
        
%         c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
% if c==2
%    plot(t,y2), axis([-0.1 0.1 -0.2 a2+0.2]);
% elseif c==1
%     stem(t,y2), axis([-0.1 0.1 -0.2 a2+0.2]);
% else
%     disp('WRONG CHOICE');
% end
%         ylabel('Amplitude');
%         xlabel('Time index');
%         title('Rectangular signal');
        
        
 case 5;
       f2=input('\nEnter the frequency(end point) of the signal: ');
       fs2=10000;
       p=input('Enter the phase of the signal: ');
       a=input('Enter the amplitude of the signal: ');
       i=input('Enter the start point: ');
       t=0:1/fs2:1-(1/fs2);
       y2=a*sin(2*pi*t*f2+i);
       an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
       
    case 6;
        
        t2=t;
        a2=input('Enter the interval: ');
        y2=zeros(1,a2);
        fprintf('Enter the location of the impulse(between interval [1,%d]: ',a2);
        b2=input('');
        y2(1,b2)=1;
        an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal');    
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
         
    case 7;
        v=input('\nEnter the value Of The DC: ');
       y2=v*ones(1,80);
        t2=t;
       an=input('Do you want to add or multiply?','s');
    cmp=strcmp('add',an);
    if cmp==1
        disp('Add');
        z=y+y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    else
        disp('Multiply');
        z=y.*y2;
        c=input('Choose discrete OR Continuous 1)Discrete  2)Continuous: ');
if c==2
    plot(t,z);
elseif c==1
    stem(t,z);
else
    disp('WRONG CHOICE');
end
ylabel ('Amlpitude');
xlabel('Time index');
title('The New Signal'); 
    end 
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
Fs = 1./t;
time = y;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*Fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
end
    case 8;
        fs=1000;
        ts=1/fs;
        fprintf('Choose the 1st signal and define it...\n');
        LTIchoice=menu('Signals','      Exponential     ','Ramp','Unit Step','Rectangular','Sinusoidal','Impulse','DC');
switch(LTIchoice)
    case 1;
a=input('\nEnter the scaling factor: ');
i=input('Enter the start point: ');
b=input('Enter the end point: ');
t1=i:ts:b;
y1=exp(a*t1);
    
  case 2;
s=input('\nEnter the slope of the ramp S: ');
cy1=input('Enter the intercepts with y-axis C: ');
t1=0:ts:10;
y1=s*t1+cy1;

    case 3;
n=input('\nEnter the length of the step sequence N: ');ab=input('\nEnter the amplitude: ');
n=n+1;
t1=0:ts:n-1;
y1=ones(1,n);  

    case 4;
        
        a2=input('\nEnter tha amplitude: ');
        w2=input('Enter the width: ');
        c2=input('Enter the centre of the rect: ');
        t1 =-1:ts:1;
        y1 = a2.*rectpuls((t1/w2)+c2,20e-3);
        
        
 case 5;
       f=input('\nEnter the frequency(end point) of the signal: ');
       a=input('Enter the amplitude of the signal: ');
       i=input('Enter the start point: ');
       t1=0:ts:f;
       y1=a*sin(2*pi*t1*f+i);
       
    case 6;
        
        s=input('\nEnter the start of the interval: ');
        e=input('Enter the end of the interval: ');
        t1=s:ts:e;
        y1=zeros(1,e-s+1);
        fprintf('Enter the location of the impulse(between interval [1,%d]): ',e-s+1);
        b=input('');
        y1(1,b)=1;
         
    case 7;
       v=input('\nEnter the value Of The DC: ');
       y1=v*ones(1,80);
        t1=0.05:ts:4; 
     
end
        fprintf('\nChoose the 2nd signal and define it...\n');
        LTIchoice=menu('Signals','      Exponential     ','Ramp','Unit Step','Rectangular','Sinusoidal','Impulse','DC');
        switch(LTIchoice)
    case 1;
a=input('\nEnter the scaling factor: ');
i=input('Enter the start point: ');
b=input('Enter the end point: ');
t2=i:ts:b;
y2=exp(a*t2);
    
  case 2;
s=input('\nEnter the slope of the ramp S: ');
cy2=input('Enter the intercepts with y-axis C: ');
t2=0:ts:10;
y2=s*t2+cy2;

    case 3;
n=input('\nEnter the length of the step sequence N: ');ab=input('\nEnter the amplitude: ');
n=n+1;
t2=0:ts:n-1;
y2=ab*ones(1,n);  

    case 4;
        
        a2=input('\nEnter tha amplitude: ');
        w2=input('Enter the width: ');
        c2=input('Enter the centre of the rect: ');
        t2 =-1:ts:1;
        y2 = a2.*rectpuls((t2/w2)+c2,20e-3);
        
        
 case 5;
       f=input('\nEnter the frequency(end point) of the signal: ');
       a=input('Enter the amplitude of the signal: ');
       i=input('Enter the start point: ');
       t2=0:ts:f;
       y2=a*sin(2*pi*t2*f+i);
       
    case 6;
        
        s=input('\nEnter the start of the interval: ');
        e=input('Enter the end of the interval: ');
        t2=s:ts:e;
        y2=zeros(1,e-s+1);
        fprintf('Enter the location of the impulse(between interval [1,%d]): ',e-s+1);
        b=input('');
        y(1,b)=1;
         
    case 7;
       v=input('\nEnter the value Of The DC: ');
       y2=v*ones(1,80);
       t2=0.05:ts:4;      
        end
start_conv=t1(1)+t2(1);
end_conv=t1(end)+t2(end);
y_conv=conv(y1,y2)./fs;
t_conv=start_conv:ts:end_conv;
plot(t_conv,y_conv);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1);
time = t_conv;
fre_conv = abs(fft(time));
freq_conv = (-length(fre_conv):length(fre_conv) - 1)'*fs/length(fre_conv);
plot(fre_conv,freq_conv);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Freq domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure('Time Domain')
subplot(2,1,1);
time = y_conv;
fre = abs(fft(time));
freq = (-length(fre):length(fre) - 1)'*fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Magnitude');
xlabel('Freq domain');
ylabel('Amplitude');
subplot(2,1,2);
fre = angle(fft(time));
freq = (-length(fre):length(fre) - 1)'*fs/length(fre);
plot(freq,fre);
grid on 
zoom on
title('Phase');
xlabel('Time domain');
ylabel('Amplitude');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
end
