

# ROUTE vocabularies_set
@app.route("/vocabs/<string:set_id>/")
def vocabularies_set(set_id):
    sets = [
        "EarthResourceML",
        "GeoSciML"
    ]

    if set_id not in sets:
        return return_vocprez_error(
            "Invalid ID", 400, "The vocab set ID supplied is invalid. It must be one of {}".format(", ".join(sets))
        )

    # get this set's list of vocabs
    this_vocs = {}
    for k, v in g.VOCABS.items():
        if set_id == "EarthResourceML":
            if v.source == "https://earthresourceml.org":
                this_vocs[k] = v
        elif set_id == "GeoSciML":
            if v.source == "http://www.opengis.net/doc/geosciml/4.1":
                this_vocs[k] = v

    return VocabulariesRenderer(
        request,
        this_vocs,
        config.SYSTEM_URI_BASE,
        config.VOCS_URI,
        config.VOCS_TITLE,
        config.VOCS_DESC
    ).render()
# END ROUTE vocabularies_set


