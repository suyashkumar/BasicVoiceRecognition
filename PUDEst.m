load MurphyWordData.mat
WordData = WordMapExtended;
load MurphyVowelData.mat
VowelData = WordMapExtended;
load WordData.mat
nonworddata = WordMapExtended;
keys = WordData.keys();
keys2 = VowelData.keys();
test1 = WordData('beer');
test2 = WordData('hat');
test3 = VowelData('as');
[t1,f1] = pyulear(test1{1,1},12,256,44100);
[t2,f2] = pyulear(test2{1,1},12,256,44100);
[t3,f3] = pyulear(test3{1,1},12,256,44100);
subplot(1,3,1)
plot(f1(1:30),t1(1:30))
subplot(1,3,2)
plot(f2(1:30),t2(1:30))
subplot(1,3,3)
plot(f3(1:30),t3(1:30))
