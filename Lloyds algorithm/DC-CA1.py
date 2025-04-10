import numpy as np
import matplotlib.pyplot as plt

def lloyd_quantizer(sigma, b, num_samples=10000, max_iterations=100, tol=1e-5):

    samples = np.random.normal(0, sigma, num_samples)
    
    num_regions = 2 ** b
    min_x, max_x = -3 * sigma, 3 * sigma  
    boundaries = np.linspace(min_x, max_x, num_regions + 1)
    centroids = [(boundaries[i] + boundaries[i + 1]) / 2 for i in range(num_regions)]

    
    for iteration in range(max_iterations):
        new_centroids = []
        
        
        for i in range(num_regions):
           
            region_samples = samples[(samples >= boundaries[i]) & (samples < boundaries[i + 1])]
            if len(region_samples) > 0:
                
                new_centroid = np.mean(region_samples)
            else:
                
                new_centroid = centroids[i]
            new_centroids.append(new_centroid)
        
       
        new_boundaries = [min_x] + [(new_centroids[i] + new_centroids[i + 1]) / 2 for i in range(num_regions - 1)] + [max_x]
        
        
        centroid_shift = np.sum(np.abs(np.array(new_centroids) - np.array(centroids)))
        if centroid_shift < tol:
            print(f"Converged after {iteration + 1} iterations")
            break
        
        centroids = new_centroids
        boundaries = new_boundaries

    
    return centroids, boundaries


sigma = 1.0  # Standard deviation of Gaussian
b = 2        # Number of bits for quantizer

centroids, boundaries = lloyd_quantizer(sigma, b)

print("Optimized Centroids:", centroids)
print("Region Boundaries:", boundaries)

x = np.linspace(-3 * sigma, 3 * sigma, 1000)
pdf = (1 / (np.sqrt(2 * np.pi) * sigma)) * np.exp(-x**2 / (2 * sigma**2))

plt.plot(x, pdf, label="Gaussian PDF", color="blue")
plt.axhline(0, color='black', linewidth=0.5)

for boundary in boundaries:
    plt.axvline(boundary, color="orange", linestyle="--", label="Boundary" if boundary == boundaries[1] else "")
for centroid in centroids:
    plt.plot(centroid, 0, 'ro', label="Centroid" if centroid == centroids[0] else "")

plt.title("Lloyd-Max Quantization Regions for Gaussian Source")
plt.xlabel("Value")
plt.ylabel("Probability Density")
plt.legend()
plt.show()
