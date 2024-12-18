# import tensorflow as tf
#
# model = tf.keras.models.load_model('./models/skin_model/saved_model.pb')
# model.save('./models/skin_model/skin_model.h5')  # Save in HDF5 format

#
# import os
# import tensorflow as tf
# from keras.layers import TFSMLayer
# from tensorflow.keras.preprocessing import image
#
# pb_model_dir = "./models/skin_model/"
# h5_model = "./models/skin_model/skin_model.h5"
#
# # Loading the Tensorflow Saved Model (PB)
# model = TFSMLayer(pb_model_dir, call_endpoint="serving_default")
# print(model.summary())
#
# # Saving the Model in H5 Format
# tf.keras.models.save_model(model, h5_model)
#
# # Loading the H5 Saved Model
# loaded_model_from_h5 = tf.keras.models.load_model(h5_model)
# print(loaded_model_from_h5.summary())






# import tensorflow as tf

# # Path to the directory containing the SavedModel (not the .pb file itself)
# saved_model_dir = './models/skin_model/'  # Adjust the path to your SavedModel directory

# # Load the TensorFlow SavedModel
# model = tf.keras.models.load_model(saved_model_dir)

# # Save the model in Keras format (.keras)
# model.save('./models/skin_model/skin_model.keras', save_format="keras")
# print("Model successfully saved in .keras format.")

# # Alternatively, save the model in HDF5 format (.h5)
# model.save('./models/skin_model/skin_model.h5', save_format="h5")
# print("Model successfully saved in .h5 format.")


import os
import tensorflow as tf
from keras.preprocessing import image

h5_model = "./mymodel.h5"
model = tf.keras.models.load_model('./models/skin_model/')
print(New_Model.summary())

tf.keras.models.save_model(model, h5_model)

# Loading the H5 Saved Model
loaded_model_from_h5 = tf.keras.models.load_model(h5_model)
print(loaded_model_from_h5.summary())