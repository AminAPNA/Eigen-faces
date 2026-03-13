# Eigenfaces: Face Recognition with PCA

As you may concern, in many applications, independently of the possible presence of noise, a low-dimensional approximation of the data may be perfectly adequate for the task at hand, or becomes necessary because of limited computing resources. In this respect, **image recognition** is one of the most important applications of modern technology, in which **linear algebra** plays a key role. Linear algebra provides many tools for image recognition. Spectral properties, such as **eigenvalues** and **eigenvectors**, are able to detect core features of a picture. By using eigenvectors, we can analyze and compare images effectively. The goal of this demo is to find the most similar face in a dataset of famous people to a given face.

Each image is compressed to have `x × y` pixels in black & white (the values of `x` and `y` are arbitrary, a different choice can be made). Then each image is converted into a row vector of length `x * y`: Image = [row_1, row_2, ..., row_x]. Vectorized images of the dataset are denoted as B1, B2, ..., Bm, and we form the matrix B = [B1, B2, ..., Bm]. In our case, m (the number of images) is much smaller than x * y, so B is a short and wide matrix. It is not sparse, but low-rank, so PCA is very effective for handling such high-dimensional, low-rank data.

To reduce the problem using PCA, we take the following steps: First, create the correlation matrix C = B^T * B. Second, compute the significant eigenvectors of C: C * v_i = lambda_i * v_i for i = 1, ..., m, where lambda_1, ..., lambda_m are the largest eigenvalues of C. Third, form the eigenvector matrix V = [v1, v2, ..., vm]. Fourth, project a picture F (stored as a row vector) onto the eigenface space: proj(F) = F * V. Fifth, reconstruct the projected image: F_reconstructed = F * V * V^T.

To compare faces, we use the following distance measure between two images F1 and F2: distance(F1, F2) = || F1 * V - F2 * V ||_2. A smaller distance indicates a closer resemblance between the faces.

For more details about the process, you can refer to this YouTube video: [Eigenfaces Explained](https://www.youtube.com/watch?v=YVfI-NeoyEc&t=58s)

A piece of MATLAB code has been provided to try out this interesting test. Take a picture of your face (or someone else's) and save it as `"T.jpg"` in the project folder. Then, run the MATLAB code. The program will compare your photo against a dataset of 300 celebrity images and show the celebrity you most closely resemble.
