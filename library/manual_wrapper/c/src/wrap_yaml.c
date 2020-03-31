#include <wrap_yaml.h>



yaml_node_t * yaml_document_get_node_start (yaml_document_t *document)
{
    //assert(document);   /* Non-NULL document object is expected. */
    return document->nodes.start;
}

yaml_node_t * yaml_document_get_node_top (yaml_document_t *document)
{
    //assert(document);   /* Non-NULL document object is expected. */
    return document->nodes.top;
}


yaml_node_t * yaml_document_get_node_end (yaml_document_t *document)
{
    //assert(document);   /* Non-NULL document object is expected. */
    return document->nodes.end;
}


