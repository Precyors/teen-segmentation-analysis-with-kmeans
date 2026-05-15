# teen-segmentation-analysis-with-kmeans
K-Means clustering project that segments teenagers into behavioral groups based on demographic data and online interests.
Here’s a clean, professional **README.md** you can use for your project. It’s structured so it looks good on GitHub and also communicates your workflow clearly.

---

# Teen Market Segmentation using K-Means Clustering

## Project Overview

This project applies **unsupervised machine learning (K-Means clustering)** to segment teenagers based on their interests and demographic information. The goal is to identify hidden patterns in teen behavior that can be useful for targeted marketing, recommendation systems, or social media analytics.

---

## Dataset

The dataset used is `snsdata.csv`, which contains:

* Demographic information (age, gender, graduation year, etc.)
* Friendship counts
* Interest-based features (columns representing various online interests)

---

## Objective

* Clean and preprocess teen demographic data
* Handle missing and inconsistent values
* Normalize feature space for clustering
* Apply K-Means clustering
* Analyze and interpret resulting clusters

---

## Tools & Libraries

This project was built using **R**, with base functions including:

* `kmeans()` for clustering
* `aggregate()` for cluster analysis
* `scale()` for normalization
* Base R data manipulation functions

---

## Project Workflow

### 1. Data Loading & Inspection

* Loaded dataset using `read.csv()`
* Inspected structure using `str()`

### 2. Data Cleaning & Feature Engineering

* Checked gender distribution and missing values
* Cleaned unrealistic age values (kept 13–19 only)
* Replaced missing ages using mean age per graduation year
* Created binary variables:

  * `female` (1 if female, else 0)
  * `no_gender` (1 if missing gender, else 0)

### 3. Feature Selection & Scaling

* Selected interest-related variables (columns 5–40)
* Standardized features using `scale()` for fair distance-based clustering

### 4. Model Training (K-Means)

* Applied K-Means clustering with:

  * Number of clusters = 5
  * Fixed seed for reproducibility

### 5. Model Output

* Cluster sizes analyzed
* Cluster centroids examined

### 6. Cluster Interpretation

Each teen was assigned to a cluster and analyzed based on:

* Average age per cluster
* Gender distribution per cluster
* Average number of friends per cluster

---

## Key Findings

* Teens naturally group into distinct segments based on shared interests.
* Some clusters show higher social connectivity (friends count).
* Gender distribution varies across clusters, indicating interest-based behavioral differences.
* Age distribution is relatively balanced after preprocessing.

---

## How to Run the Project

1. Clone the repository:

```bash
git clone https://github.com/yourusername/teen-market-segmentation.git
```

2. Open the R script or RStudio project.

3. Ensure `snsdata.csv` is in the working directory.

4. Run the script step-by-step.

---

## Output Example

After clustering, each teen is assigned a cluster label:

```r
teens$cluster <- teen_clusters$cluster
```

This allows segmentation and further behavioral analysis.

---

## Future Improvements

* Use **Elbow Method / Silhouette Score** to optimize number of clusters
* Try alternative clustering algorithms (DBSCAN, Hierarchical clustering)
* Apply PCA for dimensionality reduction and visualization
* Build a dashboard to visualize clusters interactively


* Add **visualizations section (with R plots explained)**
* Or convert it into a **PowerPoint presentation for defense/interview**
