order_lambda_function_name=order
shipment_lambda_function_name=shipment
region=eu-west-1
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=

build-order:
	rm -f code/order/order-lambda.zip
	zip -j code/order/order-lambda.zip code/order/*

deploy-order:
	export AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID); export AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY); aws lambda update-function-code --region $(region) --function-name $(order_lambda_function_name) --zip-file fileb://code/order/order-lambda.zip 2>&1 > /dev/null

build-shipment:
	rm -f code/shipment/shipment-lambda.zip
	zip -j code/shipment/shipment-lambda.zip code/shipment/*

deploy-shipment:
	export AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID); export AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY); aws lambda update-function-code --region $(region) --function-name $(shipment_lambda_function_name) --zip-file fileb://code/shipment/shipment-lambda.zip 2>&1 > /dev/null

deploy-code:
	echo '--- building order and shipment ---'
	make build-order
	make build-shipment

	echo '--- updating Lambda code for order and shipment ---'
	make deploy-order
	make deploy-shipment

deploy-cloudformation:
	export AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID); export AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY); aws cloudformation deploy --region $(region) --template-file ./template.yaml --stack-name order-system --capabilities CAPABILITY_IAM
