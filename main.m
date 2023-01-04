% Comp 2b: Exercise 7
% Jihwan Shin


% Initialize shape coodrinates for the UI element (rectangles containing colour)
rect = {};  
rect{1} = [10 140 140 10 10 ;  110 110 200 200 110];  % top left
rect{2} = translateShape(rect{1},150,0);  % top right
rect{3} = translateShape(rect{1},0,-100);  % bottom left
rect{4} = translateShape(rect{1},150,-100);  % bottom right

% Initialize variables needed for the game
score = 0;  % score of the player
answer_codes = cell(1,5);  % record of all rgb codes for the answers
answer_names = strings(1,5);  % record of all names for the answers

% Initialize axis of the figure
axis([0 300 0 300])

% Display title screen
for frame = 1:10
    text(85,180,'GUESS THE','FontSize',33,'Color',rgbgen()./255,'FontWeight','bold')
    hold on
    text(60,135,'COLOUR','FontSize',60,'Color',rgbgen()./255,'FontWeight','bold')
    hold off
    pause(0.3)
end

% Game start
for question = 1:5  % repeat for 5 questions
    
    % Clear screen before each new question
    cla 

    % Use TheColorAPI to find the name of a random colour
    [rgbarr, rgbstr] = rgbgen();
    api = append("https://www.thecolorapi.com/id?rgb=rgb(",rgbstr,")");
    data = webread(api);
    name = data.name.value;

    % Record all answers to show in the end screen
    answer_codes{question} = rgbarr;
    answer_names(question) = name;

    % Show question
    hold off
    text(10,280,append('Score: ',int2str(score)),'FontSize',20)
    hold on
    text(10,250,'Which one is...','FontSize',30)
    text(10,220,name,'FontSize',30,'FontWeight','bold')

    % Generate the four options (including the answer), and show them in a random permutation
    pick = randperm(4);
    fillshape(rect{pick(1)},rgbarr./255)  % the answer, in ranodm location
    fillshape(rect{pick(2)},rgbgen()./255)
    fillshape(rect{pick(3)},rgbgen()./255)
    fillshape(rect{pick(4)},rgbgen()./255)

    % Player clicks their answer
    [x,y] = ginput(1);

    % Decide whether the click was within the answer bounds
    xrange = rect{pick(1)}(1,[1 2]);
    yrange = rect{pick(1)}(2,[1 3]);

    % If the player is correct, add 20 points and display "CORRECT"
    if (xrange(1)<x && x<xrange(2)) && (yrange(1)<y &&  y<yrange(2))  
        score = score + 20;
        text(23,147,'CORRECT','FontSize',70,'FontWeight','bold','Color','white')
        text(20,150,'CORRECT','FontSize',70,'FontWeight','bold','Color','g')
    % If the player is wrong, display "WRONG"
    else
        text(43,147,'WRONG','FontSize',70,'FontWeight','bold','Color','white')
        text(40,150,'WRONG','FontSize',70,'FontWeight','bold','Color','r')
    end
    pause(1)
end

% Display end screen
cla

% Show the final score and a thank you message
text(20, 260, append('Score: ',num2str(score)),'FontSize',50,'FontWeight','bold')
text(20,220,'Thanks for playing!','FontSize',40)  

% Show the answers to all questions
for question = 1:5
    text(20,(215 - question*35),answer_names(question),'FontSize',25,'Color',answer_codes{question}./255,'FontWeight','bold')
end
