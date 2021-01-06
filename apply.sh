eval $(cat .ENV | tr -d '\r')
echo "Style: copying $VP_THEME_HOME/style content to $VP_HOME/vocprez/view/style"
cp $VP_THEME_HOME/style/* $VP_HOME/vocprez/view/style

echo "Templates: copying $VP_THEME_HOME/templates content to $VP_HOME/vocprez/view/templates"
cp $VP_THEME_HOME/templates/* $VP_HOME/vocprez/view/templates

echo "Config: creating VocPrez config with $VP_THEME_HOME/config.py"
echo "Alter config.py to include variables"
sed 's#$SPARQL_ENDPOINT#'"$SPARQL_ENDPOINT"'#' $VP_THEME_HOME/config.py > $VP_THEME_HOME/config_updated.py
sed -i 's#$SYSTEM_URI_BASE#'"$SYSTEM_URI_BASE"'#' $VP_THEME_HOME/config_updated.py
if [ -z "$SPARQL_USERNAME" ]
then
      sed -i 's#$SPARQL_USERNAME#None#' $VP_THEME_HOME/config_updated.py
else
      sed -i 's#$SPARQL_USERNAME#'\"$SPARQL_USERNAME\"'#' $VP_THEME_HOME/config_updated.py
fi
if [ -z "$SPARQL_PASSWORD" ]
then
      sed -i 's#$SPARQL_PASSWORD#None#' $VP_THEME_HOME/config_updated.py
else
      sed -i 's#$SPARQL_PASSWORD#'\"$SPARQL_PASSWORD\"'#' $VP_THEME_HOME/config_updated.py
fi

echo "Add config file to VP"
mv $VP_THEME_HOME/config_updated.py $VP_HOME/vocprez/_config/__init__.py

# not used since the home page for all vocabularies is static
#echo "Add endpoints to $VP_HOME/vocprez/app.py"
## find the "# run the Flask app" and remove it and everything below
#run_line=$(grep -n "# run the Flask app" $VP_HOME/vocprez/app.py | head -n 1 | cut -d: -f1)
#run_line=$((run_line -1))
#head -$run_line $VP_HOME/vocprez/app.py > $VP_THEME_HOME/app_temp.py

#echo "Route mapping"
#if `grep -q "# ROUTE vocabularies_set" "$VP_HOME/vocprez/app.py"`; then
#    echo "already there"
#else
#    sed -n '/# END ROUTE cache_reload/q;p' $VP_HOME/vocprez/app.py > $VP_THEME_HOME/app_temp.py
#    cat $VP_THEME_HOME/app_additions.py >> $VP_THEME_HOME/app_temp.py
#    sed -e '1,/# run the Flask app/ d' $VP_HOME/vocprez/app.py >> $VP_THEME_HOME/app_temp.py
#    mv $VP_THEME_HOME/app_temp.py $VP_HOME/vocprez/app.py
#fi

echo "customisation done"