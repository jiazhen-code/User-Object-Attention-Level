%%
% Running the program, get four values:
% 1. Uniform rendering power allocation strategy
% 2. Random rendering power allocation strategy
% 3. Optimial power Allocation (GT) - bound
% 4. Optimial Allocation base on our Predictions

clc;clear;
A1 = readmatrix(".\gd.txt"); % The ground truth
A2 = readmatrix(".\predall.txt"); % Prediction results
A3 = readmatrix(".\experiment.txt");% Randomly generated sparse interactions
A3 = A3+1; % Start with 1

%% Generate attention matrix
usernum = 5;% change to try different users (1~30)
Atemp=[];
for k = 1: length(A3(usernum,:))
    if A3(usernum,k)>=0
        Atemp(k) = A3(usernum,k);
    end
end

uoal = [];
uoalpre = [];
cixu = [];

for k = 1:length(Atemp)
    uoal(k) = A1(usernum,Atemp(k)); % User attention to different objects (GT)
    uoalpre(k) = A2(usernum,Atemp(k)); % Predicted user attention for different objects
end

numO = length(Atemp); % Total number of objects in one virtual tour

%% Initialize rendering power
PthR = 10; % Minimum rendering power per object
PkR = 1000; % The total rendering power of one virtual metaverse service assigned to user k
PnkR = zeros(1,length(uoal)); % Initialize the power assigned to each object

%% Uniform rendering power allocation strategy
PnkR = PkR/numO + PnkR;
sum(uoal.*log(PnkR./PthR))

%% Random rendering power allocation strategy
Rp = [];
cishu = 100;
for l = 1:cishu
PnkR = zeros(1,length(uoal)); % Initialize the power assigned to each object
p = 1; i = 1;
for j = 1:1000-10*length(PnkR)
    while p == 1
        t = rand(1);
        if t < 1/40
        PnkR(i) = PnkR(i) + 1;
        p = -1;
        end
        if i < length(PnkR)
            i = i + 1;
        else 
            i = 1;
        end
    end
    p = 1;
end
PnkR = PnkR + 10;
Rp(l) = sum(uoal.*log(PnkR./PthR));
end
% max(Rp)
% min(Rp)
mean(Rp)

%% Optimial Allocation GT
uxing = sum(uoal)/PkR;
PnkR = uoal./uxing;
j = 1;
t1 = [];t2 = [];
while min(PnkR)<PthR 
% When the condition that the minimum rendering power 
% must be greater than PthR is not satisfied
    [a,b] = min(PnkR); 
    % a records the minimum renderning power,
    % b records the corresponding position
    t1(j) = b;
    t2(j) = uoal(b);
    uxing = (sum(uoal)-sum(t2))/(PkR - PthR*j); %Solve for the new u*
    PnkR = uoal./uxing; 
    for q = 1:j
    PnkR(t1(q)) = PthR;
    end
    j = j+1;
%     sum(PnkR)
end
sum(uoal.*log(PnkR./PthR))

%% Optimial Allocation Predictions
uxing = sum(uoalpre)/PkR;
PnkR = uoalpre./uxing;
j = 1;
t1 = [];t2 = [];
while min(PnkR)<PthR 
    [a,b] = min(PnkR); 
    t1(j) = b;
    t2(j) = uoalpre(b); 
    uxing = (sum(uoalpre)-sum(t2))/(PkR - PthR*j); 
    PnkR = uoalpre./uxing; 
    for q = 1:j
    PnkR(t1(q)) = PthR;
    end
    j = j+1;
%     sum(PnkR)
end
sum(uoal.*log(PnkR./PthR))


