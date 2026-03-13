# Eigenfaces Overview

**Eigenfaces** is a classic method for **face recognition** using **Principal Component Analysis (PCA)**. It reduces high-dimensional face images into a smaller set of key features that capture the most important variations among faces.

## How It Works

1. **Prepare the Data**
   - Convert each face image into a vector (e.g., a 100×100 grayscale image → 10,000-dimensional vector).  
   - Compute the **mean face** and subtract it from each image to center the data.

2. **Compute Eigenfaces**
   - Apply PCA to the centered data to find **principal components**.  
   - These components, called **eigenfaces**, represent the most significant variations in facial features (like eyes, nose, mouth, shadows, etc.).

3. **Project Faces into Face Space**
   - Each face is represented as a **linear combination of eigenfaces**, giving a set of **weights**.  
   - This provides a **compact representation** of the face.

4. **Recognize Faces**
   - To identify a new face, project it into the eigenface space to get its weights.  
   - Compare these weights with those of known faces using a **distance metric** (e.g., Euclidean distance).  
   - The closest match determines the identity.

## Visual Diagram
