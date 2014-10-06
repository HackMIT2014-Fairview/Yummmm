# Hint-ed

This is our entry for HackMIT 2014.
This is an application to send practice questions on any topic directly to your mobile device via text
A user can add questions and subscribe to multiple subjects
A user may respond to the text with the answer to earn points
Scores are decided by having the correct answer and how much time elapsed from the time of the question being sent
If the user responds with a wrong answer 5 points are deducted
A leaderboard of the fastest and most correct users is maintained online
## Technologies
Rails Stack - (Postgres DB),
Twilio API - SMS handling
## Challenges
We ran into a weird error with comparing the submitted answer and correct answer string.
We believe that it has something to do with the json comming back to the application from twilio which may be in a different format than expected 
