# -*- coding: utf-8 -*-
from __future__ import absolute_import, unicode_literals, division

from lxml.includes.etreepublic cimport import_lxml__etree
import_lxml__etree()

from lxml.includes.etreepublic cimport _Element, elementFactory
from lxml.includes.tree cimport const_xmlChar, xmlNode
from xmlsec.constants cimport _Transform
from xmlsec.utils cimport *
from xmlsec.template cimport *


def create(
        _Element node not None,
        _Transform c14n_method not None,
        _Transform sign_method not None,
        name=None,
        prefix=None):

    cdef xmlNode* c_node
    cdef const_xmlChar* c_name = _b(name)
    cdef const_xmlChar* c_prefix = _b(prefix)

    c_node = xmlSecTmplSignatureCreateNsPref(
        node._doc._c_doc, c14n_method.target, sign_method.target, c_name, c_prefix)

    return elementFactory(node._doc, c_node)


def add_reference(
        _Element node not None,
        _Transform digest_method not None,
        id=None, uri=None, type=None):

    cdef xmlNode* c_node
    cdef const_xmlChar* c_id = _b(id)
    cdef const_xmlChar* c_uri = _b(uri)
    cdef const_xmlChar* c_type = _b(type)

    c_node = xmlSecTmplSignatureAddReference(
        node._c_node, digest_method.target, c_id, c_uri, c_type)

    return elementFactory(node._doc, c_node)


def manifest_add_reference(
        _Element node not None,
        _Transform digest_method not None,
        id=None, uri=None, type=None):

    cdef xmlNode* c_node
    cdef const_xmlChar* c_id = _b(id)
    cdef const_xmlChar* c_uri = _b(uri)
    cdef const_xmlChar* c_type = _b(type)

    c_node = xmlSecTmplManifestAddReference(
        node._c_node, digest_method.target, c_id, c_uri, c_type)

    return elementFactory(node._doc, c_node)


def add_transform(_Element node not None, _Transform transform not None):
    cdef xmlNode* c_node

    c_node = xmlSecTmplReferenceAddTransform(
        node._c_node, transform.target)

    return elementFactory(node._doc, c_node)


def ensure_key_info(_Element node not None, id=None):

    cdef xmlNode* c_node
    cdef const_xmlChar* c_id = _b(id)

    c_node = xmlSecTmplSignatureEnsureKeyInfo(node._c_node, c_id)

    return elementFactory(node._doc, c_node)


def add_key_name(_Element node not None, name=None):

    cdef xmlNode* c_node
    cdef const_xmlChar* c_name = _b(name)

    c_node = xmlSecTmplKeyInfoAddKeyName(node._c_node, c_name)

    return elementFactory(node._doc, c_node)


def add_key_value(_Element node not None):

    cdef xmlNode* c_node

    c_node = xmlSecTmplKeyInfoAddKeyValue(node._c_node)

    return elementFactory(node._doc, c_node)


def add_x509_data(_Element node not None):

    cdef xmlNode* c_node

    c_node = xmlSecTmplKeyInfoAddX509Data(node._c_node)

    return elementFactory(node._doc, c_node)

def add_manifest(
        _Element node not None,
        id=None):

    cdef xmlNode* c_node
    cdef const_xmlChar* c_id = _b(id)

    c_node = xmlSecTmplObjectAddManifest(
        node._c_node, c_id)

    return elementFactory(node._doc, c_node)

def add_object(
        _Element node not None, id=None, mimeType=None, encoding=None):

    cdef xmlNode* c_node
    cdef const_xmlChar* c_id = _b(id)
    cdef const_xmlChar* c_mimeType = _b(mimeType)
    cdef const_xmlChar* c_encoding = _b(encoding)

    c_node = xmlSecTmplSignatureAddObject(node._c_node, c_id, c_mimeType, c_encoding)
    return elementFactory(node._doc, c_node)
