%% This script is for aggregating all of the palettes into a single struct
%{
   All of the categorical color palettes from Fabio Crameri, as well as the
   categorical color palettes from colorbrewer2 by Cynthia Brewer (who
   calls the palettes "qualitative" rather than categorical), are in the
   "All Palettes" folder as .mat files.
    
   Use the CTRL+H command to replace all instances of the palette name with
   a different name, then run the following lines of code:
%}

%% Visualize a palette
load set3
figure(1)
hold on
 for i = 1:size(set3,1)
  plot(1:10,linspace(0,1,10)+i,'Color',set3(i,:),'LineWidth',3);
 end
hold off
ylim([0 i+1])

%% If the visualization looks good, add the palette to the struct
categorical_palettes.set3 = set3 % Display result in command window

%% Save the categorical_palettes struct in a .mat file
%{
   Un-comment the line below to save the struct if you have updated the
   original.
%}

% save('categorical_palettes.mat',"categorical_palettes")