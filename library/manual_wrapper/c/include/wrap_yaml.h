#ifndef __WRAPC_YAML__
#define __WRAPC_YAML__

#include <yaml.h>


yaml_node_t * yaml_document_get_node_start (yaml_document_t *document);
yaml_node_t * yaml_document_get_node_top (yaml_document_t *document);
yaml_node_t * yaml_document_get_node_end (yaml_document_t *document);

#endif

