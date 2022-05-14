# COD_Project_SAS
 ## Introduction
Does employment status have a major effect on gaming performance? Let's find out.
## Data
#### Collection 
Warzone, a Call of Duty game, was at peak popularity when I conducted this experiment. To get data I posted in COD subreddits, sent message to users who posted regularly in the subreddit, did the same in Call of Duty discords, and loaded up the game and asked the people I was randomly paired with.  

#### Work status
Yes = full-time employment  
No = Non-full-time employment  

<p align="center">
<img src="Assets/Work_summary.png" width="1000" height="200"></img>  
</p>
  
#### Wins

<p align="center"> 
<img src="Assets/Wins_summary.png" width="500" height="400"></img>  
</p>

#### Hours  

<p align="center"> 
<img src="Assets/Hours_summary.png" width="500" height="400"></img>  
</p>

#### Kill-Death Ratio

<p align="center">
<img src="Assets/KD_summary.png" width="500" height="400"></img>  
</p>

## Analysis
#### ANOVA

<p align="center">
<img src="Assets/P_value_interpretation.png" width="500" height="400"></img>  
</p>

Using <b>Wins</b> as the dependent variable, looking at the p-values we can see that there is sufficient evident to suggest that only the variable <b>KD</b> explains the variance of <b>Wins</b>.  
#### Regression Model

<p align="center">
<img src="Assets/Regression_graph.png" width="700" height="500"></img>  
</p>

The equation used is <b>Wins</b> = -20 + <b>KD</b>*50

## Conclusion
Given my sample, it can be concluded that eployment status has a significant effect on wins in the game.  
For a more indepth analysis including limitations, other methods, created performance criteria analysis, regression analysis with <b>hours</b> as the dependent variable and more visit the <a href = CODProjectWriteUp.pdf>project write up.</a>  

Thank you for viewing.
