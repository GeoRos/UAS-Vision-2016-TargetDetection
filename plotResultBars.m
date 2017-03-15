function [] = plotResultBars( preds, labels, minibatch, cost )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

maxPred = max(labels);
minPred = min(labels);

classes = zeros(length(minPred:maxPred),4);
resultDiff = 1-minPred;

correct = 0;
for result=1:length(preds)
    classes((preds(result)+resultDiff),1) = classes((preds(result)+resultDiff),1)+1;
    classes((labels(result)+resultDiff),2) = classes((labels(result)+resultDiff),2)+1;
    if (preds(result)==labels(result))
        classes((preds(result)+resultDiff),3) = classes((preds(result)+resultDiff),3)+1;
        correct = correct + 1;
    else
        classes((preds(result)+resultDiff),4) = classes((preds(result)+resultDiff),4)+1;
    end
end

acc = correct/minibatch*100;

bar(classes)
ylim([0 minibatch])
text(0.5,515,['Cost: ', num2str(cost), ' Accuracy: ', num2str(acc), '%'])
pause(eps)

