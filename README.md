👥 Teen Market Segmentation using K-Means Clustering in R

📌 Project Overview

This project focuses on Teen Market Segmentation using K-Means Clustering in R.

The goal is to group teenagers into different market segments based on their:

Interests

Social behaviors

Lifestyle patterns

Online activity


The dataset contains information collected from teen social networking profiles, including interests in sports, music, shopping, fashion, religion, and other activities.

This project demonstrates:

Data preprocessing

Handling missing values

Feature scaling

Unsupervised machine learning

Customer segmentation



---

📂 Project Structure

├── README.md
├── teen_market_segmentation.R
├── snsdata.csv
├── outputs/
│   ├── Cluster visualization using PCA.png
│   └── Cluster size bar chart.png


---

🎯 Objectives

The main objectives of this project are to:

Clean and preprocess teen social network data

Handle missing and unrealistic values

Standardize numerical features

Apply K-Means clustering

Identify different teen market segments

Interpret cluster characteristics



---

📦 Libraries Used

library(stats)
library(ggplot2)


---

📊 Dataset Information

Dataset used:

snsdata.csv

The dataset contains:

Gender

Age

Number of friends

Graduation year

Interests and activities such as:

basketball

football

soccer

dance

music

shopping

church

fashion

drugs

sports




---

🔍 Data Exploration

Load Dataset

teens <- read.csv("snsdata.csv",
                  stringsAsFactors = FALSE)


---

Inspect Dataset Structure

str(teens)

The dataset contains:

30,000 observations

40 variables



---

🧹 Data Cleaning & Preprocessing

1️⃣ Checking Missing Gender Values

table(teens$gender, useNA = "ifany")

Output showed:

Female users

Male users

Missing gender values



---

2️⃣ Cleaning Unrealistic Ages

Some age values were unrealistic and outside the expected teen range.

teens$age <- ifelse(teens$age >= 13 &
                    teens$age < 20,
                    teens$age,
                    NA)

This step:

Removed invalid ages

Replaced unrealistic values with NA



---

3️⃣ Handling Missing Ages

Missing ages were replaced using the average age within each graduation year.

ave_age <- ave(teens$age,
               teens$gradyear,
               FUN = function(x)
               mean(x, na.rm = TRUE))

teens$age <- ifelse(is.na(teens$age),
                    ave_age,
                    teens$age)


---

4️⃣ Creating Numeric Gender Variables

teens$male <- ifelse(teens$gender == "M" &
                     !is.na(teens$gender),
                     1, 0)

teens$no_gender <- ifelse(is.na(teens$gender),
                          1, 0)

This converted categorical gender data into numerical format for analysis.


---

⚙️ Feature Scaling

The interest variables were standardized using scaling.

interests <- teens[5:40]

interests_z <- as.data.frame(
  lapply(interests, scale)
)

📌 Why Scaling Matters

Scaling ensures:

All variables contribute equally

Variables with larger values do not dominate clustering

Better cluster formation



---

🤖 K-Means Clustering

Model Training

set.seed(2345)

teen_clusters <- kmeans(interests_z,
                        centers = 5)

The model grouped teens into:

5 distinct clusters



---

📊 Cluster Results

Cluster Sizes

teen_clusters$size

Output:

[1] 1038 601 4066 2696 21599

This shows the number of teens in each segment.


---


## 📊 Visualizations

### Cluster Visualization using PCA

This visualization shows how teenagers were grouped into different clusters based on shared interests and behaviors.

![Cluster Visualization using PCA](outputs/Cluster%20visualization%20using%20PCA.png)

---

### Cluster Size Bar Chart

This chart displays the number of teenagers contained in each cluster.

![Cluster Size Bar Chart](outputs/Cluster%20size%20bar%20chart.png)



---

📌 Cluster Interpretation

Cluster 1 — Social & Fashion-Oriented Teens

Characteristics:

High interest in:

music

shopping

clothes

hair

dance


Socially expressive users



---

Cluster 2 — Music & Band Enthusiasts

Characteristics:

Strong interest in:

band

marching

music


Smaller but highly focused group



---

Cluster 3 — Popular & Trend-Focused Teens

Characteristics:

High interest in:

shopping

fashion brands

social activities


Larger social circles



---

Cluster 4 — Sports-Oriented Teens

Characteristics:

Strong interest in:

football

basketball

baseball

sports activities




---

Cluster 5 — General/Low-Interest Users

Characteristics:

Lower activity across most interests

Largest cluster in the dataset



---

📈 Cluster Evaluation

Mean Age by Cluster

aggregate(data = teens,
          age ~ cluster,
          mean)

This helped identify age differences across groups.


---

Gender Distribution

aggregate(data = teens,
          male ~ cluster,
          mean)

This showed the proportion of males within each cluster.


---

Average Number of Friends

aggregate(data = teens,
          friends ~ cluster,
          mean)

This measured social connectivity within each segment.


---

📌 Key Insights

1️⃣ Teens Can Be Grouped by Interests

The clustering algorithm successfully identified distinct groups based on shared interests and behaviors.


---

2️⃣ Sports and Fashion Were Strong Segment Indicators

Activities related to:

sports

shopping

fashion

music


were major factors separating clusters.


---

3️⃣ One Cluster Dominated the Dataset

The largest cluster contained teens with generally low activity across most interests.

This suggests many users had:

fewer profile interests

lower engagement levels



---

4️⃣ Music & Band Teens Formed a Unique Segment

One small cluster strongly focused on:

band

marching

music-related activities


This indicates niche communities within teen social platforms.


---

5️⃣ Social Behavior Varies Across Clusters

Some clusters had:

higher average friend counts

stronger social engagement


while others appeared less socially active.


---

6️⃣ Data Cleaning Was Critical

Handling:

missing ages

unrealistic values

missing gender data


significantly improved clustering quality.


---

🚀 How to Run the Project

1️⃣ Load the Dataset

Place snsdata.csv in your project folder.


---

2️⃣ Open RStudio

Run:

source("teen_market_segmentation.R")


---

🛠 Technologies Used

R Programming

RStudio

K-Means Clustering

Data Scaling

Statistical Analysis

