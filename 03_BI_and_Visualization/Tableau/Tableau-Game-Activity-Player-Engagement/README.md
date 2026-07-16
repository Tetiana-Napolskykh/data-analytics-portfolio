# Game Activity & Player Engagement Dashboard

**Overview:**  
This Tableau project analyzes **player activity and engagement** using data from multiple games. The dashboard focuses on time spent in game, activity breakdowns, and engagement trends by age group, language, and device type.

**Data Source:**  
- CSV file: `games_activity_combined(2.0).csv`  
  Fields:
  - `user_id` – unique user identifier
  - `activity_date` – date of the activity
  - `game_activity_name` – name/type of game activity
  - `total_seconds` – time spent in activity (seconds)
  - `language` – user device language
  - `has_older_device_model` – boolean flag for older devices
  - `age` – age of the player

**Key Metrics and KPIs:**  
- Total users per month  
- Percentage of users participating in “Battle pass” activities  
- Average time spent per player (HH:MM)  
- Average time spent by age group and quarter  
- Player engagement trends by language, game activity, and device type  

**Dashboard Components:**  
1. Monthly Activity Summary  
   - Total users and % engaging in “Battle pass”  
2. Average Time Per Player  
   - Displayed in HH:MM format  
   - Label shows average time per player  
3. Engagement Heatmap  
   - Average time by player age group (5-year bins) and quarter of activity  

**Filters Applied:**  
- Activity Date  
- Age Group  
- Game Activity Name  
- Device Language  

**Tableau Implementation:**  
- Calculated fields for user counts, percentages, average time, and age group bins  
- Multi-sheet layout combined into a single dashboard with interactive filters  

**Dashboard Link:**  
- Interactive Tableau dashboard: [Open Dashboard](https://public.tableau.com/app/profile/tetiana.napolskzkh/viz/HomeWork3Blok3/Dashboard1)   