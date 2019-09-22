import galsim
import numpy as np

obj = galsim.Convolve([galsim.Gaussian(fwhm=0.5), galsim.Gaussian(fwhm=0.9)])
img = obj.drawImage()
assert np.all(np.isfinite(img.array))
