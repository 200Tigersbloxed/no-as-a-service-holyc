#include "./rand.HC"
#include "./json.HC"
#include "./http.HC"

Json *json = NULL;

U0 GetNo(I32 sockfd, CQueryParams *qp)
{
    I64 count = JsonArrayLen(json);
    I64 randomValue = RandI64() % count;
    U8 *selectionText = MStrPrint("[%d]:s", randomValue);
    "%s\n", selectionText;
    Json *selected = JsonSelect(json, selectionText);
    Free(selectionText);
    U8 *reason = selected->str;
    U8 *response = MStrPrint("{\"reason\":\"%s\"}", reason);
    HandleHttp(sockfd, "application/json", "200 OK", response);
    Free(response);
}

U0 Main()
{
    json = GetData();
    "%s\n", "Got reasons!";
    NewRoute("GET", "/no", &GetNo);
    HttpServer;
    JsonRelease(json);
}