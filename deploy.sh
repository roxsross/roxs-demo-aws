ZIP="codigo.zip"
FUNCTION="http-crud-tutorial-function"

zip -r $ZIP index.mjs

aws lambda update-function-code \
    --function-name $FUNCTION \
    --zip-file fileb://$ZIP > /dev/null



if [  $? -eq 0 ]; then
    echo "Deployed successfully"
else
    echo "Deploy failed"
fi

rm $ZIP