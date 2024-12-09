import tensorflow as tf

model = tf.keras.models.load_model('./models/skin_model/saved_model.pb')
model.save('./models/skin_model/skin_model.h5')  # Save in HDF5 format
