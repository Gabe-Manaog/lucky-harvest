# 🌾 Lucky Harvest

### School Project
### Group Members: Milan Hennessy, Gabe Manaog

## 🎮 Concept
**Lucky Harvest** is a farming simulator game where players build and manage their own farm, growing crops and harvesting resources. The goal is to gather enough resources to progress through five uniquely themed islands, each offering new challenges and materials. Some islands feature animals that drop essential resources. However, players must manage their energy wisely—if they run out, they lose all progress!

## ✨ Main Features
- 🌱 **Dynamic Tilling and Farming** – Grow and manage crops
- ⛏️ **Resource Gathering** – Harvest trees, rocks, and more
- 🌞 **Day and Night Cycle** – A working in-game time system
- 🐄 **Animals with Dynamic Pathing** – Move and interact naturally
- 🛒 **Quests & Shop System** – Engage in tasks and buy/sell resources
- 🎨 **2D Top-Down Pixel Art** – A charming, cozy aesthetic

## 🖥️ Target Platform & Audience
Lucky Harvest is designed for **PC players** who enjoy **casual, relaxing games**. It aims to be a **stress-free, cozy experience** where players can progress at their own pace. The game is **family-friendly**, easy to learn, and runs on **low-end systems**, ensuring accessibility.

> **Note:** This game does **not** support controllers.

## 📅 Development Timeline / Milestones
- ✅ **Character Movement & State Machine**
- ✅ **Working World & Animations**
- ✅ **Tool Panel & Inventory UI**
- ✅ **Day & Night Cycle Implementation**
- ✅ **Trees & Rocks Harvesting**
- ✅ **Crops Growth & Tilling System**
- ✅ **Shop System for Buying & Selling**
- ✅ **Energy Bar & Depletion System**
- ✅ **Quest System**

## 🚀 Installation & Running the Game
1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/lucky-harvest.git
   ```
2. Navigate to the project directory:
   ```bash
   cd lucky-harvest
   ```
3. Run the game (instructions vary based on the development environment).

---

## 📝 Postmortem
### **Game Name: Lucky Harvest**
### **Group Members: Milan Hennessy, Gabe Manaog**

### ✅ 3 Successes:
#### **Day and Night Cycle:**
The day and night cycle was a major concern initially but turned out to be manageable with the right approach. By researching the correct formula to calculate time and making it global, we were able to link it to the UI to visually show the passage of time. We also added a gradient and adjusted colors to mimic a natural transition between day and night.

#### **Multiple Islands:**
Initially, we struggled with creating a sense of progression. Our first idea was to make the game a large sandbox experience, similar to Minecraft or Garry’s Mod, where players could explore freely. However, this felt too easy, so we pivoted to a survival-based approach with an energy bar. We introduced multiple islands that players could unlock by gathering resources, adding a structured progression system. This change, combined with the quest system, made the game more engaging and rewarding.

#### **Crops and Tilling System:**
Crops and tilling were essential mechanics that initially seemed daunting. We first planned to have crops spawn near the player's house, requiring only maintenance. However, this lacked interactivity. Leveraging our day and night cycle, we connected crops to a global script that updated their growth stages. To enhance player agency, we implemented a tilling mechanic that allowed players to prepare the land for farming dynamically, giving them more control over where crops could be grown.

### ⚠️ 3 Challenges:
#### **Items and Shops Across Scenes:**
One major issue was maintaining item persistence across scenes. Initially, changing scenes caused crashes due to inventory inconsistencies. To fix this, we reloaded inventory data whenever a scene loaded, ensuring items carried over correctly to shops and player storage.

#### **Checking Requirements for Quests:**
Our dialogue system relied on an external addon that used a different coding style, making it difficult to integrate with our scripts. The addon was designed purely for text interactions, so calling functions like inventory checks proved challenging. After extensive troubleshooting, we managed to globally call the necessary functions, allowing quests to properly check player inventory without breaking the dialogue system.

#### **Energy Bar Across Scenes:**
Initially, the energy bar worked fine, but transitioning between scenes caused issues. Sleeping after reaching a new island led to crashes because our dialogue addon struggled to reference the sleep function within the day and night cycle. The problem stemmed from the dialogue manager not recognizing certain nodes after scene transitions. We resolved this by removing the dialogue-based sleep function and calling it directly from our scripts instead.

---

Happy farming! 🌿🎮

## Screenshots
![image](https://github.com/user-attachments/assets/c153daa4-ef48-4062-a80c-4384a586dbc8)
![image](https://github.com/user-attachments/assets/eded5ba6-d55d-42eb-8006-f5c920db153e)
![image](https://github.com/user-attachments/assets/dceaa894-0da2-4675-9dec-f16d84cf4c68)
![image](https://github.com/user-attachments/assets/7555a803-951e-41d6-bf0a-ac92ff9f7659)


## References
https://cupnooble.itch.io/sprout-lands-asset-pack
Music / Sounds From: Final Fantasy, Octopath Traveler, Minecraft, Berleezy
All rights reserved to their owners

## Helpful Videos
https://www.youtube.com/watch?v=1EkJUdfnVzk&t=1804s&ab_channel=RapidVectors
https://www.youtube.com/watch?v=875z4ZVITEY&ab_channel=RapidVectors
https://www.youtube.com/watch?v=1iucnMQ520Y


