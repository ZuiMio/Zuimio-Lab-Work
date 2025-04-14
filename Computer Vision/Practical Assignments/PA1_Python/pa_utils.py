import cv2 as cv
import numpy as np
import matplotlib.pyplot as plt
import sys
from io import StringIO
from IPython import get_ipython


## Draw several images on a sigle plot side-by-side
## @param[in] Is tuples of image names and images to draw
## @param[in] ncols Number of culumns to use (0 to display them separately)
## @param[in] hide_axes If hide axes for a better view
def ShowImages(Is, ncols = 0, hide_axes = True, vmin = None, vmax = None):
  if len(Is) == 0:
    return
  
  # Show images one-by-one
  if len(Is) == 1 or ncols == 0:
    for I in Is:
      if I == None:
        continue

      if I[1].ndim == 2:
        axes = plt.imshow(I[1], cmap='gray', vmin = vmin, vmax = vmax)
      else:
        axes = plt.imshow(cv.cvtColor(I[1], cv.COLOR_BGR2RGB), vmin = vmin, vmax = vmax)
      plt.title(I[0])

      # If we don't need axes display, then let's hide it
      if hide_axes:
        axes.axes.get_xaxis().set_visible(False)
        axes.axes.get_yaxis().set_visible(False)
      
      # And now show image
      plt.show()
    return

  # Show images side-by-side
  fig, axes = plt.subplots(nrows = (len(Is) + ncols - 1) // ncols, ncols = ncols)
  axes = axes.flatten()
  for i in range(len(Is)):
    if Is[i] != None:
      if Is[i][1].ndim == 2:
        axes[i].imshow(Is[i][1], cmap='gray', vmin = vmin, vmax = vmax)
      else:
        axes[i].imshow(cv.cvtColor(Is[i][1], cv.COLOR_BGR2RGB), vmin = vmin, vmax = vmax)
      axes[i].set_title(Is[i][0])

    # If we don't need axes display, then let's hide it
    if hide_axes:
      axes[i].axes.get_xaxis().set_visible(False)
      axes[i].axes.get_yaxis().set_visible(False)
  
  for i in range(len(Is), ncols * ((len(Is) + ncols - 1) // ncols)):
    axes[i].set_visible(False)

  # And now show image
  plt.show()

## Remove small objects from binary image
## @param[in] I Image
## @param[in] dim A minium size of an area to keep
## @param[int] connectivity Pixel connectivity
## @return An image with components less then dim in size removed
def bwareaopen(I : np.ndarray, dim : int, connectivity : int = 8):
  # We work with single layer images only
  if I.ndim > 2:
    return None
  Iout = I.copy()

  # Find all connected components
  num_labels, labels, stats, centroids = cv.connectedComponentsWithStats(Iout, connectivity = connectivity)

  # Check size of all connected components
  for i in range(num_labels):
    # Remove connected components smaller than dim
    if stats[i, cv.CC_STAT_AREA] < dim:
      Iout[labels == i] = 0

  return Iout

## Implementation of MATLAB`s imfill(I, 'holes') function
## @param[in] I Image to process
## @return An image with holes removed
def imfillholes(I):
  if I.ndim != 2 or I.dtype != np.uint8:
    return None

  rows, cols = I.shape[0:2]
  mask = I.copy()

  # Fill mask from all horizontal borders
  for i in range(cols):
    if mask[0, i] == 0:
      cv.floodFill(mask, None, (i, 0), 255, 10, 10)
    if mask[rows - 1, i] == 0:
      cv.floodFill(mask, None, (i, rows - 1), 255, 10, 10)
  # Fill mask from all vertical borders
  for i in range(rows):
    if mask[i, 0] == 0:
      cv.floodFill(mask, None, (0, i), 255, 10, 10)
    if mask[i, cols - 1] == 0:
      cv.floodFill(mask, None, (cols - 1, i), 255, 10, 10)
      
  # Use the mask to create a resulting image
  res = I.copy()
  res[mask == 0] = 255

  return res
  # End of imfillholes()

## Exception class to exit Juputer cell without stopping the kernel
## Exception temporarily redirects stderr to buffer.
class IPythonExitException(SystemExit):
  ## Class constructor
  ## It redirects stderr to buffer to make exit clean
  def __init__(self):
    print("Stopping.")
    sys.stderr = StringIO()

  ## Class destructor
  ## It redirects stderr back to output
  def __del__(self):
    sys.stderr.close()
    sys.stderr = sys.__stderr__

## A custom exit function to exit cell execution without exiting kernel
def ipython_exit_cell():
  raise IPythonExitException

# Check if execution is running with IPython then redefine exit with stopping a cell only
if get_ipython():
  exit = ipython_exit_cell
else:
  exit = exit
