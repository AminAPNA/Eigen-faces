# Eigenfaces: Face Recognition with PCA

As you may concern, in many applications, independently of the possible presence of noise, a low-dimensional approximation of the data may be perfectly adequate for the task at hand, or becomes necessary because of limited computing resources. In this respect, **image recognition** is one of the most important applications of modern technology, in which **linear algebra** plays a key role. Linear algebra provides many tools for image recognition. Spectral properties, such as **eigenvalues** and **eigenvectors**, are able to detect core features of a picture. By using eigenvectors, we can analyze and compare images effectively. 

In this exercise session, the goal is to find the most similar face in a dataset of famous people to a given face.

---

## Data Preparation

Each image is compressed to have \(x \times y\) pixels in black & white (the values of \(x\) and \(y\) are arbitrary; a different definition can be chosen). Then each image is converted into a **row vector** of length \(x \times y\):

\[
\text{Image} =
\begin{bmatrix}
\text{row}_1 \\
\text{row}_2 \\
\vdots \\
\text{row}_x
\end{bmatrix},
\quad
\text{Vectorized image} =
\begin{bmatrix}
\text{row}_1 & \text{row}_2 & \cdots & \text{row}_x
\end{bmatrix}
\]

- Vectorized images of the dataset: \(B_1, B_2, \dots, B_m\)  
- Form the matrix:

\[
B =
\begin{bmatrix}
B_1 \\
B_2 \\
\vdots \\
B_m
\end{bmatrix}
\]

In our case, \(m\) (the number of images) is much smaller than \(x \times y\), so \(B\) is a short and wide matrix. It is not sparse but **low-rank**, so the PCA method can be very effective for handling such high-dimensional, low-rank data.

---

## PCA Steps

To reduce the problem using PCA, we follow these steps:

1. **Create the correlation matrix**:  
   \[
   C = B^T B
   \]

2. **Compute the significant eigenvectors of \(C\)**:  
   \[
   C v_i = \lambda_i v_i, \quad i = 1, \dots, m
   \]  
   where \(\lambda_1, \dots, \lambda_m\) are the greatest eigenvalues of \(C\).

3. **Form the eigenvector matrix**:  
   \[
   V = [v_1, v_2, \dots, v_m]
   \]

4. **Project a picture \(F\) (stored as a row vector) onto the eigenface space**:  
   \[
   \text{proj}(F) = F V
   \]

5. **Reconstruct the projected image**:  
   \[
   F_{\text{reconstructed}} = F V V^T
   \]

---

## Comparing Faces

To measure the similarity between two images:

\[
\text{Distance}(F_1, F_2) = \| F_1 V - F_2 V \|_2
\]

- A **smaller distance** means a closer resemblance between faces.

---

## Reference Video

For more details about the process, you can refer to this YouTube video:  
[Eigenfaces Explained](https://www.youtube.com/watch?v=YVfI-NeoyEc&t=58s)
