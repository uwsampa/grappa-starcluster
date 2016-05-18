
aws_access_key_id = raw_input("aws_access_key_id: ") 
aws_secret_access_key = raw_input("aws_secret_access_key: ")
aws_user_id = raw_input("aws_user_id: ")
key_location = raw_input("key_location: ")

with open("grappacluster.config.template", 'r') as inp:
    with open("grappacluster.config", 'w') as outp:
       s = inp.read().format(AWS_ACCESS_KEY_ID=aws_access_key_id,
        AWS_SECRET_ACCESS_KEY=aws_secret_access_key,
        AWS_USER_ID=aws_user_id,
        KEY_LOCATION=key_location)
       outp.write(s)


