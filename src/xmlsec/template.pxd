from lxml.includes.tree cimport const_xmlChar, xmlNode, xmlDoc
from xmlsec.constants cimport xmlSecTransformId


cdef extern from "xmlsec.h":  # xmlsec/templates.h

    xmlNode* xmlSecTmplSignatureCreateNsPref(
        xmlDoc* document, xmlSecTransformId c14n, xmlSecTransformId sign,
        const_xmlChar* id, const_xmlChar* prefix) nogil

    xmlNode* xmlSecTmplSignatureAddReference(
        xmlNode* node, xmlSecTransformId digest,
        const_xmlChar* id, const_xmlChar* uri, const_xmlChar* type) nogil

    xmlNode* xmlSecTmplManifestAddReference(
        xmlNode* node, xmlSecTransformId digest,
        const_xmlChar* id, const_xmlChar* uri, const_xmlChar* type) nogil

    xmlNode* xmlSecTmplReferenceAddTransform(
        xmlNode* node, xmlSecTransformId transform) nogil

    xmlNode* xmlSecTmplSignatureEnsureKeyInfo(
        xmlNode* node, const_xmlChar* id) nogil

    xmlNode* xmlSecTmplKeyInfoAddKeyName(xmlNode* node, const_xmlChar* name) nogil

    xmlNode* xmlSecTmplKeyInfoAddKeyValue(xmlNode* node) nogil

    xmlNode* xmlSecTmplKeyInfoAddX509Data(xmlNode* node) nogil

    xmlNode* xmlSecTmplSignatureAddObject(xmlNode* node, const_xmlChar* id,
            const_xmlChar* mimeType, const_xmlChar* encoding) nogil
    
    xmlNode* xmlSecTmplObjectAddManifest(xmlNode* node, const_xmlChar* id) nogil
