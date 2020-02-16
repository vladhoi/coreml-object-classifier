import coremltools

caffe_model = ('resnet50.caffemodel', 'ResNet-50-deploy.prototxt')


coreml_model = coremltools.converters.caffe.convert(
	caffe_model,
	image_input_names='data'
)

coreml_model.save('Resnet50.mlmodel')

