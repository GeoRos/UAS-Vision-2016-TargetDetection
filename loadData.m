function [ trainData, trainLabels, testData, testLabels ] = loadData( )
%LOADDATA Summary of this function goes here
%   Detailed explanation goes here

% imageData = zeros(60,60,50000);
% imageLabels = zeros(50000,1);
load('TargetSamples.mat');
targetSizeData = size(targetCollection,3);
imageData(:,:,1:targetSizeData) = im2double(targetCollection);
imageData(:,:,targetSizeData+1:2*targetSizeData) = im2double(targetCollection);
load('TriangleSamples.mat');
triangleSizeData = size(triangleCollection,3);
imageData(:,:,2*targetSizeData+1:2*targetSizeData+triangleSizeData) = im2double(triangleCollection);
load('CircleSamples.mat');
circleSizeData = size(circleCollection,3);
imageData(:,:,2*targetSizeData+triangleSizeData+1:2*targetSizeData+triangleSizeData+circleSizeData) = im2double(circleCollection);
load('NonTargetSamples.mat');
nonTargetSizeData = size(nonTargetCollection,3);
imageData(:,:,2*targetSizeData+triangleSizeData+circleSizeData+1:2*targetSizeData+triangleSizeData+circleSizeData+nonTargetSizeData) = im2double(nonTargetCollection);
imageLabels = zeros(2*targetSizeData+triangleSizeData+circleSizeData+nonTargetSizeData,1);
imageLabels(1:2*targetSizeData) = 1;

%Random permutation
I = randperm(size(imageData,3));
imageData = imageData(:,:,I);
imageLabels = imageLabels(I);

trainLabels = imageLabels(1:end-5000);
testLabels = imageLabels(end-4999:end);
trainData = imageData(:,:,1:end-5000);
testData = imageData(:,:,end-4999:end);

% contOp = [];
% while isempty(contOp)
%     randomSamp = ceil(rand*40000);
%     imshow(imageData(:,:,randomSamp))
%     contOp = input(num2str(imageLabels(randomSamp)));
% end