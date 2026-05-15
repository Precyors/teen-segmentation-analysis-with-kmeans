# Clustering with k-means: Teen Market Segmentation 

## Step 1: Load the data
teens <- read.csv("snsdata.csv", stringsAsFactors = FALSE)

# Inspect structure
str(teens)

## Step 2: Explore and prepare the data

# Check gender distribution (including missing values)
table(teens$gender)
table(teens$gender, useNA = "ifany")

# Check age summary
summary(teens$age)

# Remove unrealistic ages (keep only 13–19)
teens$age <- ifelse(teens$age >= 13 & teens$age < 20,
                    teens$age, NA)

# Check again
summary(teens$age)

# Create numeric gender variables
teens$female <- ifelse(teens$gender == "F" & !is.na(teens$gender), 1, 0)
teens$no_gender <- ifelse(is.na(teens$gender), 1, 0)

# Verify recoding
table(teens$female, useNA = "ifany")
table(teens$no_gender, useNA = "ifany")

# Mean age (handling missing values)
mean(teens$age, na.rm = TRUE)

# Mean age by graduation year
aggregate(data = teens, age ~ gradyear, mean, na.rm = TRUE)

# Fill missing ages using average age within each gradyear
ave_age <- ave(teens$age, teens$gradyear,
               FUN = function(x) mean(x, na.rm = TRUE))

teens$age <- ifelse(is.na(teens$age), ave_age, teens$age)

# Confirm no missing ages remain
summary(teens$age)

## Step 3: Prepare data for clustering ----

# Select interest variables (columns 5 to 40)
interests <- teens[5:40]

# Normalize (scale) the data
interests_z <- as.data.frame(lapply(interests, scale))

## Step 4: Train k-means model ----

set.seed(2345)  # for reproducibility

teen_clusters <- kmeans(interests_z, centers = 5)

## Step 5: Evaluate model ----

# Cluster sizes
teen_clusters$size

# Cluster centers
teen_clusters$centers

## Step 6: Interpret clusters ----

# Add cluster labels to original data
teens$cluster <- teen_clusters$cluster

# View sample records
teens[1:5, c("cluster", "gender", "age", "friends")]

# Analyze clusters

# Mean age by cluster
aggregate(data = teens, age ~ cluster, mean)

# Proportion of females by cluster
aggregate(data = teens, female ~ cluster, mean)

# Average number of friends by cluster
aggregate(data = teens, friends ~ cluster, mean)