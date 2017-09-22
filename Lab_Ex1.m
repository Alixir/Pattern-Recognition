%% Lab Exercise Week 1
%% Author : Ali Nawaz
close all; clear all; clc;
% addpath('E:\M201\IN4085 Pattern Recognition\Software Resources\prtools532\prtools');
% addpath('E:\M201\IN4085 Pattern Recognition\Software Resources\coursedata');
% addpath('E:\M201\IN4085 Pattern Recognition\Software Resources\kimia');
addpath('H:\Masters\M201\IN4085 Pattern Recognition\Software Resources\prtools532\prtools');
addpath('H:\Masters\M201\IN4085 Pattern Recognition\Software Resources\coursedata');
addpath('H:\Masters\M201\IN4085 Pattern Recognition\Software Resources\kimia');
%% Exercise 1.6a,b
x = rand(10,3); % Fake dataset containing 10 objects with 3 measurements each.
mean_x = mean(x);
mean_x_bar = mean(x');
std_x = std(x);
% Difference between mean(x) and mean(x'): The mean command returns mean of
% the columns,i.e. the mean of x would return mean of the 3 separate
% features. While the mean of x' would return mean of the 3 separate 
% objects.
%% Exercise 1.7a
% When the dataset contains two features per object then the dataset can be
% visualised in a scatterplot.
figure(17)
plot(x(:,1),x(:,2),'b*');
xlabel('x1');
ylabel('x2');
title('Feature plots for x1 and x2');

%% Exercise 1.8a
lab = genlab([6 4],['B'; 'O']); % 6 Banana features and 4 Oranges as class labels.
a = prdataset(x,lab);
% Expected 10 objects, 3 features and 2 classes. Observed the same.

%% Exercise 1.9
% Generating objects with the aid of boomerang function
boom_obj = boomerangs(10);

figure(19)
subplot(1,3,1);
scatterd(boom_obj(:,1:2));
title('Features x1 and x2');
grid on;
% xlabel('x1');
% ylabel('x2');
subplot(1,3,2);
scatterd(boom_obj(:,2:3));
title('Features x2 and x3');
grid on;
% xlabel('x2');
% ylabel('x3');
subplot(1,3,3);
% scatterd(boom_obj,3);
scatterd(boom_obj,3,'legend'); % 3D plot with class labels in legend
title('3D Feature plot for x1,x2 and x3');
grid on;
% xlabel('x1');
% ylabel('x2');
% zlabel('x3');

%% Exercise 1.10a
% time signal size = 5 seconds
t = 5;
freq = 1/t;
% Sampling rate = 11*10^3 
t_samp = 1/(11*10^3);

samples = t/t_samp;

%% Exercise 1.11
obj = kimia_images; % load 12 objects for 18 clases
figure(1111)
show(obj,12); % Shows 18 classes of objects, each represented by 12 examples
figure(1112)
show(obj(100,:)); % Shows the image for the 100th object

%% Exercise 1.11a
x = im_features( obj, obj, {'Area', 'Perimeter', 'Eccentricity'}); % Automatically extracting three features : Area, Perimeter and Eccentricity
% Selecting specific classes from a dataset
featset = seldat(x, [ 3 16]);
% Inspecting the values of featset
featsetval = double(featset);

% visualising the new "class selected" dataset
figure(1113)
show(featset)

%Inspecting a single image, e.g. the first camel

c = data2im(featset,13); % select image 13 and convert it from data to image
figure(1114)
imagesc(c) % plot image with data scaled to use the full colormap
colormap gray; % applying gray colormap
%% Exercise 1.11c
% Note this only plots the first two features
figure(1115);
subplot(1,2,1)
%Analysing the classes for all the objects
scatterd(x,'legend');
subplot(1,2,2);
scatterd(featset,'legend');

%% Exercise 1.12
% delfigs % delete all figures
obj1 = kimia_images;
obj1 = seldat(obj1, [3:3:18]); % Select classes 3,6,9,12,15 and 18
% obj1 = obj1(1:12:37,:); % Further clarification
figure(121)
show(obj1) %Visualising the raw data
title('Raw data visualisation');

obj2 = im_box(obj1,0,1); % put objects in a square box with aspect ratio = 1
figure(122)
show(obj2);
title('Displaying square images');

obj3 = im_rotate(obj2); %Rotate images to the same orientation
figure(123)
show(obj3);
title(' Displaying images after rotation');

obj4 = im_resize(obj3,[ 20 20]); % Resize images to 20x20 pixels
figure(124)
show(obj4);
title('Resize to 20x20 pixel');

obj5 =im_box(obj4,1,10); % Create empty box around objects
figure(125); 
show(obj5); 
title('Empty box around objects');

% showfigs; % Shows all figures on the screen

%% Exercise 1.13a
obj = seldat(obj1,2); % selecting data in class 2
% Combining all the pre-processing operations
prepoc = im_box([],0,1)*im_rotate*im_resize([],[20 20])*im_box( [], 1 , 0);
obj = obj*prepoc ;  % normalizing the dataset with combined pre-processing operations
figure(131)
show(obj)          % show data
% The following part with find out the mean of the image, i.e. centers of
% gravity and later it will be converted in data format
mean_set = im_mean(obj); % Measure the x,y centers of gravity
mean_data = double(mean_set); % Converting average to data

%% Exercise 1.13b
mean_set_val = double(mean_set);

figure(132)
subplot(1,3,1)
histogram(mean_data(:,1),10);
title('Histogram of the mean data: row 1');

subplot(1,3,2)
histogram(mean_data(:,2),10);
title('Histogram of the mean data: row 2')

subplot(1,3,3)
histogram(mean_data,10);
title('Histogram of the mean matrix');

%% Exercise 1.13c
figure(133)
scatterplot(mean_data);
title('Scatterplot')

figure(134)
scatterd(mean_data);
title('Scatterd')

%% Exercise 1.13d
obj_img = kimia_images;
obj13 = seldat(obj_img,13); % selecting data from class 13
obj13 = obj13*prepoc;
figure(135);
show(obj13); % Plot objects in class 13
mean_set13 = im_mean(obj13);
mean_data13 = double(mean_set13);

figure(136)
% hold on
% scatterplot(mean_data);
% hold on
% scatterplot(mean_data13);
% hold off
plot(mean_data(:,1),mean_data(:,2),'ro');
hold on
plot(mean_data13(:,1),mean_data13(:,2),'b*');
hold off
legend('Class 2','Class 13');

figure(137)
hold on 
scatterd(mean_data,'ro');
legend('Class 2');
hold on 
scatterd(mean_data13,'b*');
hold off
legend('Class 13');

showfigs;









