
if [ ! -z "$MONGO_USERNAME" ] && [ ! -z "$MONGO_DATABASE" ] && [ ! -z "$MONGO_PASSWORD" ] && [ ! -z "$MONGO_INITDB_ROOT_USERNAME" ] && [ ! -z "$MONGO_INITDB_ROOT_PASSWORD" ] ; then

	echo "Running user $MONGO_USERNAME creation"

	USER_FILE=/tmp/create_user.js

	echo "use $MONGO_DATABASE;
	db.createUser(
		{
			\"user\": \"$MONGO_USERNAME\",
			\"pwd\": \"$MONGO_PASSWORD\",
			\"roles\": [
				{ \"role\": \"readWrite\", \"db\": \"$MONGO_DATABASE\" } 
			] 
		}
	);" >> $USER_FILE && \
		chmod u+r $USER_FILE && \
		mongo -u $MONGO_INITDB_ROOT_USERNAME \
		-p $MONGO_INITDB_ROOT_PASSWORD \
		--authenticationDatabase $MONGO_INITDB_DATABASE < $USER_FILE && \
		rm $USER_FILE
fi
