Json *GetData()
{
    I64 len = 0;
    U8 *buffer = FileRead("./reasons.json", &len);
    Json *json = JsonParse(buffer,len);
    if (!JsonOk(json)) {
        JsonPrintError(json);
        JsonRelease(json);
        return NULL;
    }
    return json;
}

I64 JsonArrayLen(Json *j)
{
    if (!JsonIsArray(j))
        return 0;

    I64 count = 0;
    Json *node = j->array;

    while (node)
    {
        count++;
        node = node->next;
    }

    return count;
}