rec1 = audiorecorder;
file = "file.wav"; //audio file name for the test inputs
file2 = "check.wav"; // audio file name for final input
while (1)
chk = input("enter 1 to record data; enter 2 to run voice recognition if data is available");
if (chk == 1)
num = input('enter the number of inputs');
pitcharr = [0,0,0];
dif = [0,0,0];
fs = 10^4; %sampling frequency
for i = 1:num
pittch = 0;
for o = 1:3
disp("say hello!!");
recordblocking(rec1, 2);
noisedata = getaudiodata(rec1);
audiowrite(file, noisedata, fs);
[a, b] = audioread(file);
%autcor1 = hehe(a);
c = abs(fft(a));
disp('done');
ff1 = pitch(a,b);
pittch = pittch + mean(ff1);
end
disp(pittch/3);
pitcharr(i) = pittch/3;
disp("data saved!!");
wait = input("enter any key to continue");
end
elseif (chk == 2)
wait = input ("starting speech recognition: press enter");
disp("say hello!!");
recordblocking(rec1,2);
disp("done");
lol = getaudiodata(rec1);
audiowrite(file2, lol, fs);
[data, f] = audioread(file2);
x = abs(fft(data));
fpitch = mean(pitch(data,f));
disp(fpitch);
dif = [abs(fpitch - pitcharr(1)),abs(fpitch - pitcharr(2)),abs(fpitch - pitcharr(3))];
fin = find(dif==(min(dif)));
disp("i think it's " + int2str(fin)+ " yeet!!!")
else
disp("Neither 1 or 2: Exiting..");
return
end
end