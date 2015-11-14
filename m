Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 070F31A072B
 for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2015 14:00:34 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447470029658256.90394376034965;
 Fri, 13 Nov 2015 19:00:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-rest-server 2/3] Remove old rest server
Date: Fri, 13 Nov 2015 22:00:26 -0500
Message-Id: <1447470027-22113-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447470027-22113-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447470027-22113-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Nov 2015 03:00:35 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 bottle-rest   | 593 ------------------------------------------
 phosphor-rest | 821 +++++++++++++++++++++++++++++++++++++---------------------
 2 files changed, 522 insertions(+), 892 deletions(-)
 delete mode 100644 bottle-rest

diff --git a/bottle-rest b/bottle-rest
deleted file mode 100644
index f655599..0000000
--- a/bottle-rest
+++ /dev/null
@@ -1,593 +0,0 @@
-#!/usr/bin/env python
-
-import os
-import sys
-import dbus
-import dbus.exceptions
-import json
-import logging
-from xml.etree import ElementTree
-from rocket import Rocket
-from bottle import Bottle, abort, request, response, JSONPlugin, HTTPError
-import OpenBMCMapper
-from OpenBMCMapper import Mapper, PathTree, IntrospectionNodeParser, ListMatch
-
-DBUS_UNKNOWN_INTERFACE = 'org.freedesktop.UnknownInterface'
-DBUS_UNKNOWN_METHOD = 'org.freedesktop.DBus.Error.UnknownMethod'
-DBUS_INVALID_ARGS = 'org.freedesktop.DBus.Error.InvalidArgs'
-DELETE_IFACE = 'org.openbmc.object.Delete'
-
-_4034_msg = "The specified %s cannot be %s: '%s'"
-
-def find_case_insensitive(value, lst):
-	return next((x for x in lst if x.lower() == value.lower()), None)
-
-def makelist(data):
-	if isinstance(data, list):
-		return data
-	elif data:
-		return [data]
-	else:
-		return []
-
-class RouteHandler(object):
-	def __init__(self, app, bus, verbs, rules):
-		self.app = app
-		self.bus = bus
-		self.mapper = Mapper(bus)
-		self._verbs = makelist(verbs)
-		self._rules = rules
-
-	def _setup(self, **kw):
-		request.route_data = {}
-		if request.method in self._verbs:
-			return self.setup(**kw)
-		else:
-			self.find(**kw)
-			raise HTTPError(405, "Method not allowed.",
-					Allow=','.join(self._verbs))
-
-	def __call__(self, **kw):
-		return getattr(self, 'do_' + request.method.lower())(**kw)
-
-	def install(self):
-		self.app.route(self._rules, callback = self,
-				method = ['GET', 'PUT', 'PATCH', 'POST', 'DELETE'])
-
-	@staticmethod
-	def try_mapper_call(f, callback = None, **kw):
-		try:
-			return f(**kw)
-		except dbus.exceptions.DBusException, e:
-			if e.get_dbus_name() != OpenBMCMapper.MAPPER_NOT_FOUND:
-				raise
-			if callback is None:
-				def callback(e, **kw):
-					abort(404, str(e))
-
-			callback(e, **kw)
-
-	@staticmethod
-	def try_properties_interface(f, *a):
-		try:
-			return f(*a)
-		except dbus.exceptions.DBusException, e:
-			if DBUS_UNKNOWN_INTERFACE in e.get_dbus_message():
-				# interface doesn't have any properties
-				return None
-			if DBUS_UNKNOWN_METHOD == e.get_dbus_name():
-				# properties interface not implemented at all
-				return None
-			raise
-
-class DirectoryHandler(RouteHandler):
-	verbs = 'GET'
-	rules = '<path:path>/'
-
-	def __init__(self, app, bus):
-		super(DirectoryHandler, self).__init__(
-				app, bus, self.verbs, self.rules)
-
-	def find(self, path = '/'):
-		return self.try_mapper_call(
-				self.mapper.get_subtree_paths,
-				path = path, depth = 1)
-
-	def setup(self, path = '/'):
-		request.route_data['map'] = self.find(path)
-
-	def do_get(self, path = '/'):
-		return request.route_data['map']
-
-class ListNamesHandler(RouteHandler):
-	verbs = 'GET'
-	rules = ['/list', '<path:path>/list']
-
-	def __init__(self, app, bus):
-		super(ListNamesHandler, self).__init__(
-				app, bus, self.verbs, self.rules)
-
-	def find(self, path = '/'):
-		return self.try_mapper_call(
-				self.mapper.get_subtree, path = path).keys()
-
-	def setup(self, path = '/'):
-		request.route_data['map'] = self.find(path)
-
-	def do_get(self, path = '/'):
-		return request.route_data['map']
-
-class ListHandler(RouteHandler):
-	verbs = 'GET'
-	rules = ['/enumerate', '<path:path>/enumerate']
-
-	def __init__(self, app, bus):
-		super(ListHandler, self).__init__(
-				app, bus, self.verbs, self.rules)
-
-	def find(self, path = '/'):
-		return self.try_mapper_call(
-				self.mapper.get_subtree, path = path)
-
-	def setup(self, path = '/'):
-		request.route_data['map'] = self.find(path)
-
-	def do_get(self, path = '/'):
-		objs = {}
-		mapper_data = request.route_data['map']
-		tree = PathTree()
-		for x,y in mapper_data.iteritems():
-			tree[x] = y
-
-		try:
-			# Check to see if the root path implements
-			# enumerate in addition to any sub tree
-			# objects.
-			root = self.try_mapper_call(self.mapper.get_object,
-					path = path)
-			mapper_data[path] = root
-		except:
-			pass
-
-		have_enumerate = [ (x[0], self.enumerate_capable(*x)) \
-				for x in mapper_data.iteritems() \
-					if self.enumerate_capable(*x) ]
-
-		for x,y in have_enumerate:
-			objs.update(self.call_enumerate(x, y))
-			tmp = tree[x]
-			# remove the subtree
-			del tree[x]
-			# add the new leaf back since enumerate results don't
-			# include the object enumerate is being invoked on
-			tree[x] = tmp
-
-		# make dbus calls for any remaining objects
-		for x,y in tree.dataitems():
-			objs[x] = self.app.instance_handler.do_get(x)
-
-		return objs
-
-	@staticmethod
-	def enumerate_capable(path, bus_data):
-		busses = []
-		for name, ifaces in bus_data.iteritems():
-			if OpenBMCMapper.ENUMERATE_IFACE in ifaces:
-				busses.append(name)
-		return busses
-
-	def call_enumerate(self, path, busses):
-		objs = {}
-		for b in busses:
-			obj = self.bus.get_object(b, path, introspect = False)
-			iface = dbus.Interface(obj, OpenBMCMapper.ENUMERATE_IFACE)
-			objs.update(iface.enumerate())
-		return objs
-
-class MethodHandler(RouteHandler):
-	verbs = 'POST'
-	rules = '<path:path>/action/<method>'
-	request_type = list
-
-	def __init__(self, app, bus):
-		super(MethodHandler, self).__init__(
-				app, bus, self.verbs, self.rules)
-
-	def find(self, path, method):
-		busses = self.try_mapper_call(self.mapper.get_object,
-				path = path)
-		for items in busses.iteritems():
-			m = self.find_method_on_bus(path, method, *items)
-			if m:
-				return m
-
-		abort(404, _4034_msg %('method', 'found', method))
-
-	def setup(self, path, method):
-		request.route_data['method'] = self.find(path, method)
-
-	def do_post(self, path, method):
-		try:
-			if request.parameter_list:
-				return request.route_data['method'](*request.parameter_list)
-			else:
-				return request.route_data['method']()
-
-		except dbus.exceptions.DBusException, e:
-			if e.get_dbus_name() == DBUS_INVALID_ARGS:
-				abort(400, str(e))
-			raise
-
-	@staticmethod
-	def find_method_in_interface(method, obj, interface, methods):
-		if methods is None:
-			return None
-
-		method = find_case_insensitive(method, methods.keys())
-		if method is not None:
-			iface = dbus.Interface(obj, interface)
-			return iface.get_dbus_method(method)
-
-	def find_method_on_bus(self, path, method, bus, interfaces):
-		obj = self.bus.get_object(bus, path, introspect = False)
-		iface = dbus.Interface(obj, dbus.INTROSPECTABLE_IFACE)
-		data = iface.Introspect()
-		parser = IntrospectionNodeParser(
-				ElementTree.fromstring(data),
-				intf_match = ListMatch(interfaces))
-		for x,y in parser.get_interfaces().iteritems():
-			m = self.find_method_in_interface(method, obj, x,
-					y.get('method'))
-			if m:
-				return m
-
-class PropertyHandler(RouteHandler):
-	verbs = ['PUT', 'GET']
-	rules = '<path:path>/attr/<prop>'
-
-	def __init__(self, app, bus):
-		super(PropertyHandler, self).__init__(
-				app, bus, self.verbs, self.rules)
-
-	def find(self, path, prop):
-		self.app.instance_handler.setup(path)
-		obj = self.app.instance_handler.do_get(path)
-		try:
-			obj[prop]
-		except KeyError, e:
-			if request.method == 'PUT':
-				abort(403, _4034_msg %('property', 'created', str(e)))
-			else:
-				abort(404, _4034_msg %('property', 'found', str(e)))
-
-		return { path: obj }
-
-	def setup(self, path, prop):
-		request.route_data['obj'] = self.find(path, prop)
-
-	def do_get(self, path, prop):
-		return request.route_data['obj'][path][prop]
-
-	def do_put(self, path, prop, value = None):
-		if value is None:
-			value = request.parameter_list
-
-		prop, iface, properties_iface = self.get_host_interface(
-				path, prop, request.route_data['map'][path])
-		try:
-			properties_iface.Set(iface, prop, value)
-		except ValueError, e:
-			abort(400, str(e))
-		except dbus.exceptions.DBusException, e:
-			if e.get_dbus_name() == DBUS_INVALID_ARGS:
-				abort(403, str(e))
-			raise
-
-	def get_host_interface(self, path, prop, bus_info):
-		for bus, interfaces in bus_info.iteritems():
-			obj = self.bus.get_object(bus, path, introspect = True)
-			properties_iface = dbus.Interface(
-				obj, dbus_interface=dbus.PROPERTIES_IFACE)
-
-			info = self.get_host_interface_on_bus(
-					path, prop, properties_iface,
-					bus, interfaces)
-			if info is not None:
-				prop, iface = info
-				return prop, iface, properties_iface
-
-	def get_host_interface_on_bus(self, path, prop, iface, bus, interfaces):
-		for i in interfaces:
-			properties = self.try_properties_interface(iface.GetAll, i)
-			if properties is None:
-				continue
-			prop = find_case_insensitive(prop, properties.keys())
-			if prop is None:
-				continue
-			return prop, i
-
-class InstanceHandler(RouteHandler):
-	verbs = ['GET', 'PUT', 'DELETE']
-	rules = '<path:path>'
-	request_type = dict
-
-	def __init__(self, app, bus):
-		super(InstanceHandler, self).__init__(
-				app, bus, self.verbs, self.rules)
-
-	def find(self, path, callback = None):
-		return { path: self.try_mapper_call(
-			self.mapper.get_object,
-			callback,
-			path = path) }
-
-	def setup(self, path):
-		callback = None
-		if request.method == 'PUT':
-			def callback(e, **kw):
-				abort(403, _4034_msg %('resource',
-					'created', path))
-
-		if request.route_data.get('map') is None:
-			request.route_data['map'] = self.find(path, callback)
-
-	def do_get(self, path):
-		properties = {}
-		for item in request.route_data['map'][path].iteritems():
-			properties.update(self.get_properties_on_bus(
-				path, *item))
-
-		return properties
-
-	@staticmethod
-	def get_properties_on_iface(properties_iface, iface):
-		properties = InstanceHandler.try_properties_interface(
-				properties_iface.GetAll, iface)
-		if properties is None:
-			return {}
-		return properties
-
-	def get_properties_on_bus(self, path, bus, interfaces):
-		properties = {}
-		obj = self.bus.get_object(bus, path, introspect = False)
-		properties_iface = dbus.Interface(
-				obj, dbus_interface=dbus.PROPERTIES_IFACE)
-		for i in interfaces:
-			properties.update(self.get_properties_on_iface(
-				properties_iface, i))
-
-		return properties
-
-	def do_put(self, path):
-		# make sure all properties exist in the request
-		obj = set(self.do_get(path).keys())
-		req = set(request.parameter_list.keys())
-
-		diff = list(obj.difference(req))
-		if diff:
-			abort(403, _4034_msg %('resource', 'removed',
-				'%s/attr/%s' %(path, diff[0])))
-
-		diff = list(req.difference(obj))
-		if diff:
-			abort(403, _4034_msg %('resource', 'created',
-				'%s/attr/%s' %(path, diff[0])))
-
-		for p,v in request.parameter_list.iteritems():
-			self.app.property_handler.do_put(
-					path, p, v)
-
-	def do_delete(self, path):
-		for bus_info in request.route_data['map'][path].iteritems():
-			if self.bus_missing_delete(path, *bus_info):
-				abort(403, _4034_msg %('resource', 'removed',
-					path))
-
-		for bus in request.route_data['map'][path].iterkeys():
-			self.delete_on_bus(path, bus)
-
-	def bus_missing_delete(self, path, bus, interfaces):
-		return DELETE_IFACE not in interfaces
-
-	def delete_on_bus(self, path, bus):
-		obj = self.bus.get_object(bus, path, introspect = False)
-		delete_iface = dbus.Interface(
-				obj, dbus_interface = DELETE_IFACE)
-		delete_iface.Delete()
-
-class JsonApiRequestPlugin(object):
-	''' Ensures request content satisfies the OpenBMC json api format. '''
-	name = 'json_api_request'
-	api = 2
-
-	error_str = "Expecting request format { 'data': <value> }, got '%s'"
-	type_error_str = "Unsupported Content-Type: '%s'"
-	json_type = "application/json"
-	request_methods = ['PUT', 'POST', 'PATCH']
-
-	@staticmethod
-	def content_expected():
-		return request.method in JsonApiRequestPlugin.request_methods
-
-	def validate_request(self):
-		if request.content_length > 0 and \
-				request.content_type != self.json_type:
-			abort(415, self.type_error_str %(request.content_type))
-
-		try:
-			request.parameter_list = request.json.get('data')
-		except ValueError, e:
-			abort(400, str(e))
-		except (AttributeError, KeyError, TypeError):
-			abort(400, self.error_str %(request.json))
-
-	def apply(self, callback, route):
-		verbs = getattr(route.get_undecorated_callback(),
-				'_verbs', None)
-		if verbs is None:
-			return callback
-
-		if not set(self.request_methods).intersection(verbs):
-			return callback
-
-		def wrap(*a, **kw):
-			if self.content_expected():
-				self.validate_request()
-			return callback(*a, **kw)
-
-		return wrap
-
-class JsonApiRequestTypePlugin(object):
-	''' Ensures request content type satisfies the OpenBMC json api format. '''
-	name = 'json_api_method_request'
-	api = 2
-
-	error_str = "Expecting request format { 'data': %s }, got '%s'"
-
-	def apply(self, callback, route):
-		request_type = getattr(route.get_undecorated_callback(),
-				'request_type', None)
-		if request_type is None:
-			return callback
-
-		def validate_request():
-			if not isinstance(request.parameter_list, request_type):
-				abort(400, self.error_str %(str(request_type), request.json))
-
-		def wrap(*a, **kw):
-			if JsonApiRequestPlugin.content_expected():
-				validate_request()
-			return callback(*a, **kw)
-
-		return wrap
-
-class JsonApiResponsePlugin(object):
-	''' Emits normal responses in the OpenBMC json api format. '''
-	name = 'json_api_response'
-	api = 2
-
-	def apply(self, callback, route):
-		def wrap(*a, **kw):
-			resp = { 'data': callback(*a, **kw) }
-			resp['status'] = 'ok'
-			resp['message'] = response.status_line
-			return resp
-		return wrap
-
-class JsonApiErrorsPlugin(object):
-	''' Emits error responses in the OpenBMC json api format. '''
-	name = 'json_api_errors'
-	api = 2
-
-	def __init__(self, **kw):
-		self.app = None
-		self.function_type = None
-		self.original = None
-		self.json_opts = { x:y for x,y in kw.iteritems() \
-			if x in ['indent','sort_keys'] }
-
-	def setup(self, app):
-		self.app = app
-		self.function_type = type(app.default_error_handler)
-		self.original = app.default_error_handler
-		self.app.default_error_handler = self.function_type(
-			self.json_errors, app, Bottle)
-
-	def apply(self, callback, route):
-		return callback
-
-	def close(self):
-		self.app.default_error_handler = self.function_type(
-				self.original, self.app, Bottle)
-
-	def json_errors(self, res, error):
-		response_object = {'status': 'error', 'data': {} }
-		response_object['message'] = error.status_line
-		response_object['data']['description'] = str(error.body)
-		if error.status_code == 500:
-			response_object['data']['exception'] = repr(error.exception)
-			response_object['data']['traceback'] = error.traceback.splitlines()
-
-		json_response = json.dumps(response_object, **self.json_opts)
-		res.content_type = 'application/json'
-		return json_response
-
-class RestApp(Bottle):
-	def __init__(self, bus):
-		super(RestApp, self).__init__(autojson = False)
-		self.bus = bus
-		self.mapper = Mapper(bus)
-
-		self.install_hooks()
-		self.install_plugins()
-		self.create_handlers()
-		self.install_handlers()
-
-	def install_plugins(self):
-		# install json api plugins
-		json_kw = {'indent': 2, 'sort_keys': True}
-		self.install(JSONPlugin(**json_kw))
-		self.install(JsonApiErrorsPlugin(**json_kw))
-		self.install(JsonApiResponsePlugin())
-		self.install(JsonApiRequestPlugin())
-		self.install(JsonApiRequestTypePlugin())
-
-	def install_hooks(self):
-		self.real_router_match = self.router.match
-		self.router.match = self.custom_router_match
-		self.add_hook('before_request', self.strip_extra_slashes)
-
-	def create_handlers(self):
-		# create route handlers
-		self.directory_handler = DirectoryHandler(self, self.bus)
-		self.list_names_handler = ListNamesHandler(self, self.bus)
-		self.list_handler = ListHandler(self, self.bus)
-		self.method_handler = MethodHandler(self, self.bus)
-		self.property_handler = PropertyHandler(self, self.bus)
-		self.instance_handler = InstanceHandler(self, self.bus)
-
-	def install_handlers(self):
-		self.directory_handler.install()
-		self.list_names_handler.install()
-		self.list_handler.install()
-		self.method_handler.install()
-		self.property_handler.install()
-		# this has to come last, since it matches everything
-		self.instance_handler.install()
-
-	def custom_router_match(self, environ):
-		''' The built-in Bottle algorithm for figuring out if a 404 or 405 is
-                    needed doesn't work for us since the instance rules match everything.
-                    This monkey-patch lets the route handler figure out which response is
-                    needed.  This could be accomplished with a hook but that would require
-		    calling the router match function twice.
-		'''
-		route, args = self.real_router_match(environ)
-		if isinstance(route.callback, RouteHandler):
-			route.callback._setup(**args)
-
-		return route, args
-
-	@staticmethod
-	def strip_extra_slashes():
-		path = request.environ['PATH_INFO']
-		trailing = ("","/")[path[-1] == '/']
-		parts = filter(bool, path.split('/'))
-		request.environ['PATH_INFO'] = '/' + '/'.join(parts) + trailing
-
-if __name__ == '__main__':
-	log = logging.getLogger('Rocket.Errors')
-	log.setLevel(logging.INFO)
-	log.addHandler(logging.StreamHandler(sys.stdout))
-
-	bus = dbus.SystemBus()
-	app = RestApp(bus)
-	default_cert = os.path.join(sys.prefix, 'share',
-			os.path.basename(__file__), 'cert.pem')
-
-	server = Rocket(('0.0.0.0',
-			443,
-			default_cert,
-			default_cert),
-		'wsgi', {'wsgi_app': app})
-	server.start()
diff --git a/phosphor-rest b/phosphor-rest
index 026eb74..f655599 100644
--- a/phosphor-rest
+++ b/phosphor-rest
@@ -1,273 +1,140 @@
 #!/usr/bin/env python
 
-# Contributors Listed Below - COPYRIGHT 2015
-# [+] International Business Machines Corp.
-#
-#
-# Licensed under the Apache License, Version 2.0 (the "License");
-# you may not use this file except in compliance with the License.
-# You may obtain a copy of the License at
-#
-#     http://www.apache.org/licenses/LICENSE-2.0
-#
-# Unless required by applicable law or agreed to in writing, software
-# distributed under the License is distributed on an "AS IS" BASIS,
-# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
-# implied. See the License for the specific language governing
-# permissions and limitations under the License.
-
-import BaseHTTPServer
-import SocketServer
-import json
+import os
+import sys
 import dbus
-from OpenBMCMapper import Path, Mapper, PathTree
+import dbus.exceptions
+import json
+import logging
+from xml.etree import ElementTree
+from rocket import Rocket
+from bottle import Bottle, abort, request, response, JSONPlugin, HTTPError
 import OpenBMCMapper
+from OpenBMCMapper import Mapper, PathTree, IntrospectionNodeParser, ListMatch
 
-class RestException(Exception):
-	def __init__(self, msg, http_status=403):
-		self.status = http_status
-		super(RestException, self).__init__(msg)
-
-class Response(object):
-	def render(self, handler):
-		raise NotImplemented()
-
-class ErrorResponse(Response):
-	def __init__(self, ex):
-		self.ex = ex
-
-	def render(self, handler):
-		err = {'status': 'error', 'error': self.ex.message,}
-		handler.send_response(self.ex.status)
-		handler.send_header('Content-Type', 'application/json')
-		handler.end_headers()
-		handler.wfile.write(json.dumps(err, indent=2, sort_keys=True))
-
-class JSONResponse(Response):
-	def __init__(self, data):
-		self.data = data
-
-	def render(self, handler):
-		handler.send_response(200)
-		handler.send_header('Content-Type', 'application/json')
-		handler.end_headers()
-		handler.wfile.write(json.dumps(self.data, indent=2, sort_keys=True))
-
-class RequestHandler(object):
-	def __init__(self, req, path, data):
-		self.req = req
-		self.path = path
-		self.bus = req.server.bus
-		self.mapper = req.server.mapper
-		self.data = data
-
-	def do_command(self):
-		f = getattr(self, 'do_' + self.req.command)
-		return f()
-
-	def do_GET(self):
-		raise RestException("Not Implemented", 501)
-
-	def do_PUT(self):
-		raise RestException("Not Implemented", 501)
-
-	def do_POST(self):
-		raise RestException("Not Implemented", 501)
-
-	def do_PATCH(self):
-		raise RestException("Not Implemented", 501)
-
-	def do_DELETE(self):
-		raise RestException("Not Implemented", 501)
-
-class MethodHandler(RequestHandler):
-	def __init__(self, req, path, data):
-		super(MethodHandler, self).__init__(req, path, data)
-		self.method = Path(self.req.path).rel(first = -1)
-
-	def find_method_in_interface(self, obj, interface):
-		try:
-			iface = dbus.Interface(obj, interface)
-			return getattr(iface, self.method)
-		except dbus.DBusException:
-			return None
+DBUS_UNKNOWN_INTERFACE = 'org.freedesktop.UnknownInterface'
+DBUS_UNKNOWN_METHOD = 'org.freedesktop.DBus.Error.UnknownMethod'
+DBUS_INVALID_ARGS = 'org.freedesktop.DBus.Error.InvalidArgs'
+DELETE_IFACE = 'org.openbmc.object.Delete'
 
-	def find_method_on_bus(self, bus, interfaces):
-		obj = self.bus.get_object(bus, self.path)
-		for i in interfaces:
-			m = self.find_method_in_interface(obj, i)
-			if not m:
-				continue
-		return m
+_4034_msg = "The specified %s cannot be %s: '%s'"
 
-	def find_method(self):
-		busses = self.mapper.get_object(
-				self.path)
-		for items in busses.iteritems():
-			m = self.find_method_on_bus(*items)
-			if not m:
-				continue
+def find_case_insensitive(value, lst):
+	return next((x for x in lst if x.lower() == value.lower()), None)
 
-		return m
+def makelist(data):
+	if isinstance(data, list):
+		return data
+	elif data:
+		return [data]
+	else:
+		return []
 
-	def do_POST(self):
-		try:
-			method = self.find_method()
-		except:
-			raise RestException("Not Found", 404)
-		try:
-			d = { 'result': method(*self.data),
-					'status': 'OK'}
-		except Exception, e:
-			d = { 'error': str(e),
-					'status': 'error'}
-		return d
-
-class InstanceHandler(RequestHandler):
-	def __init__(self, req, path, data, busses):
-		super(InstanceHandler, self).__init__(req, path, data)
-		self.busses = busses
-
-	def get_one_iface(self, properties_iface, iface):
+class RouteHandler(object):
+	def __init__(self, app, bus, verbs, rules):
+		self.app = app
+		self.bus = bus
+		self.mapper = Mapper(bus)
+		self._verbs = makelist(verbs)
+		self._rules = rules
+
+	def _setup(self, **kw):
+		request.route_data = {}
+		if request.method in self._verbs:
+			return self.setup(**kw)
+		else:
+			self.find(**kw)
+			raise HTTPError(405, "Method not allowed.",
+					Allow=','.join(self._verbs))
+
+	def __call__(self, **kw):
+		return getattr(self, 'do_' + request.method.lower())(**kw)
+
+	def install(self):
+		self.app.route(self._rules, callback = self,
+				method = ['GET', 'PUT', 'PATCH', 'POST', 'DELETE'])
+
+	@staticmethod
+	def try_mapper_call(f, callback = None, **kw):
 		try:
-			return properties_iface.GetAll(iface)
-		except:
-			# interface doesn't have any properties
-			return {}
-
-	def get_one_bus(self, bus, interfaces):
-		properties = {}
-		obj = self.bus.get_object(bus, self.path)
-		properties_iface = dbus.Interface(
-				obj, dbus_interface=dbus.PROPERTIES_IFACE)
-		for i in interfaces:
-			properties.update(self.get_one_iface(properties_iface, i))
-
-		return properties
-
-	def do_GET(self):
-		properties = {}
-		for item in self.busses.iteritems():
-			properties.update(self.get_one_bus(*item))
-
-		return properties
-
-	def try_set_one_interface(self, prop, value, properties_iface, interface):
+			return f(**kw)
+		except dbus.exceptions.DBusException, e:
+			if e.get_dbus_name() != OpenBMCMapper.MAPPER_NOT_FOUND:
+				raise
+			if callback is None:
+				def callback(e, **kw):
+					abort(404, str(e))
+
+			callback(e, **kw)
+
+	@staticmethod
+	def try_properties_interface(f, *a):
 		try:
-			properties_iface.Set(interface, prop, value)
-			return True
-		except:
-			# property doesn't live on this interface/bus
-			return False
+			return f(*a)
+		except dbus.exceptions.DBusException, e:
+			if DBUS_UNKNOWN_INTERFACE in e.get_dbus_message():
+				# interface doesn't have any properties
+				return None
+			if DBUS_UNKNOWN_METHOD == e.get_dbus_name():
+				# properties interface not implemented at all
+				return None
+			raise
 
-	def try_set_one_bus(self, prop, value, bus, interfaces):
-		obj = self.bus.get_object(bus, self.path)
-		properties_iface = dbus.Interface(
-				obj, dbus_interface=dbus.PROPERTIES_IFACE)
-
-		for iface in interfaces:
-			if self.try_set_one_interface(prop, value,
-					properties_iface, iface):
-				return True
+class DirectoryHandler(RouteHandler):
+	verbs = 'GET'
+	rules = '<path:path>/'
 
-		return False
+	def __init__(self, app, bus):
+		super(DirectoryHandler, self).__init__(
+				app, bus, self.verbs, self.rules)
 
-	def set_one_property(self, prop, value):
-		for item in self.busses.iteritems():
-			if not self.try_set_one_bus(prop, value, *item):
-				raise RestException("Not Found", 404)
+	def find(self, path = '/'):
+		return self.try_mapper_call(
+				self.mapper.get_subtree_paths,
+				path = path, depth = 1)
 
-	def validate_json(self):
-		if type(self.data) != dict:
-			raise RestException("Bad Request", 400)
+	def setup(self, path = '/'):
+		request.route_data['map'] = self.find(path)
 
-		obj = self.do_GET()
-		if len(self.data) != len(obj):
-			raise RestException("Bad Request", 400)
-		for x in obj.iterkeys():
-			if x not in self.data:
-				raise RestException("Bad Request", 400)
+	def do_get(self, path = '/'):
+		return request.route_data['map']
 
-	def do_PUT(self):
-		try:
-			self.validate_json()
-			for p in self.data.iteritems():
-				self.set_one_property(*p)
-
-			d = { 'status': 'OK'}
-		except Exception, e:
-			d = { 'error': str(e),
-					'status': 'error'}
-		return d
-
-	def do_POST(self):
-		for p in self.data.iteritems():
-			self.set_one_property(*p)
-
-class AttrHandler(RequestHandler):
-	def __init__(self, req, path, data):
-		super(AttrHandler, self).__init__(req, path, data)
-		try:
-			self.inst = InstanceHandler(req, path, data,
-					self.mapper.get_object(path))
-		except KeyError:
-			raise RestException("Not Found", 404)
-		self.attr = Path(self.req.path).rel(first = -1)
-
-	def do_GET(self):
-		obj = self.inst.do_GET()
-		try:
-			return obj[self.attr]
-		except KeyError:
-			raise RestException("Not Found", 404)
+class ListNamesHandler(RouteHandler):
+	verbs = 'GET'
+	rules = ['/list', '<path:path>/list']
 
-	def do_PUT(self):
-		self.inst.set_one_property(self.attr, self.data)
+	def __init__(self, app, bus):
+		super(ListNamesHandler, self).__init__(
+				app, bus, self.verbs, self.rules)
 
-class TypesHandler(RequestHandler):
-	def __init__(self, req, path, data):
-		super(TypesHandler, self).__init__(req, path, data)
+	def find(self, path = '/'):
+		return self.try_mapper_call(
+				self.mapper.get_subtree, path = path).keys()
 
-	def do_GET(self):
-		types = self.mapper.get_subtree_paths(self.path, 1)
-		if not types:
-			raise RestException("Not Found", 404)
+	def setup(self, path = '/'):
+		request.route_data['map'] = self.find(path)
 
-		return types
+	def do_get(self, path = '/'):
+		return request.route_data['map']
 
-class ListHandler(RequestHandler):
-	def __init__(self, req, path, data):
-		super(ListHandler, self).__init__(req, path, data)
+class ListHandler(RouteHandler):
+	verbs = 'GET'
+	rules = ['/enumerate', '<path:path>/enumerate']
 
-	def do_GET(self):
-		objs = self.mapper.get_subtree(self.path)
-		if not objs:
-			raise RestException("Not Found", 404)
+	def __init__(self, app, bus):
+		super(ListHandler, self).__init__(
+				app, bus, self.verbs, self.rules)
 
-		return objs.keys()
-
-class EnumerateHandler(RequestHandler):
-	def __init__(self, req, path, data):
-		super(EnumerateHandler, self).__init__(req, path, data)
-
-	def get_enumerate(self, path, data):
-		busses = []
-		for s, i in data.iteritems():
-			if OpenBMCMapper.ENUMERATE_IFACE in i:
-				busses.append(s)
-		return busses
+	def find(self, path = '/'):
+		return self.try_mapper_call(
+				self.mapper.get_subtree, path = path)
 
-	def call_enumerate(self, path, busses):
-		objs = {}
-		for b in busses:
-			obj = self.bus.get_object(b, path)
-			iface = dbus.Interface(obj, OpenBMCMapper.ENUMERATE_IFACE)
-			objs.update(iface.enumerate())
-		return objs
+	def setup(self, path = '/'):
+		request.route_data['map'] = self.find(path)
 
-	def do_GET(self):
+	def do_get(self, path = '/'):
 		objs = {}
-		mapper_data = self.mapper.get_subtree(self.path)
+		mapper_data = request.route_data['map']
 		tree = PathTree()
 		for x,y in mapper_data.iteritems():
 			tree[x] = y
@@ -276,95 +143,451 @@ class EnumerateHandler(RequestHandler):
 			# Check to see if the root path implements
 			# enumerate in addition to any sub tree
 			# objects.
-			root = self.mapper.get_object(self.path)
-			mapper_data[self.path] = root
+			root = self.try_mapper_call(self.mapper.get_object,
+					path = path)
+			mapper_data[path] = root
 		except:
 			pass
 
-		have_enumerate = [ (x[0], self.get_enumerate(*x)) for x in mapper_data.iteritems() \
-				if self.get_enumerate(*x) ]
+		have_enumerate = [ (x[0], self.enumerate_capable(*x)) \
+				for x in mapper_data.iteritems() \
+					if self.enumerate_capable(*x) ]
 
 		for x,y in have_enumerate:
 			objs.update(self.call_enumerate(x, y))
 			tmp = tree[x]
+			# remove the subtree
 			del tree[x]
+			# add the new leaf back since enumerate results don't
+			# include the object enumerate is being invoked on
 			tree[x] = tmp
 
+		# make dbus calls for any remaining objects
 		for x,y in tree.dataitems():
-			objs[x] = InstanceHandler(self.req, x, self.data, y).do_GET()
+			objs[x] = self.app.instance_handler.do_get(x)
+
+		return objs
 
-		if not objs:
-			raise RestException("Not Found", 404)
+	@staticmethod
+	def enumerate_capable(path, bus_data):
+		busses = []
+		for name, ifaces in bus_data.iteritems():
+			if OpenBMCMapper.ENUMERATE_IFACE in ifaces:
+				busses.append(name)
+		return busses
 
+	def call_enumerate(self, path, busses):
+		objs = {}
+		for b in busses:
+			obj = self.bus.get_object(b, path, introspect = False)
+			iface = dbus.Interface(obj, OpenBMCMapper.ENUMERATE_IFACE)
+			objs.update(iface.enumerate())
 		return objs
 
-class DBusRestHandler(BaseHTTPServer.BaseHTTPRequestHandler):
-	def get_real_handler(self, data):
-		path = Path(self.path)
+class MethodHandler(RouteHandler):
+	verbs = 'POST'
+	rules = '<path:path>/action/<method>'
+	request_type = list
+
+	def __init__(self, app, bus):
+		super(MethodHandler, self).__init__(
+				app, bus, self.verbs, self.rules)
+
+	def find(self, path, method):
+		busses = self.try_mapper_call(self.mapper.get_object,
+				path = path)
+		for items in busses.iteritems():
+			m = self.find_method_on_bus(path, method, *items)
+			if m:
+				return m
+
+		abort(404, _4034_msg %('method', 'found', method))
 
-		if self.path[-1] == '/':
-			return TypesHandler(self, path.fq(), data)
+	def setup(self, path, method):
+		request.route_data['method'] = self.find(path, method)
 
-		if path.parts[-1] == 'list':
-			return ListHandler(self, path.fq(last = -1), data)
+	def do_post(self, path, method):
+		try:
+			if request.parameter_list:
+				return request.route_data['method'](*request.parameter_list)
+			else:
+				return request.route_data['method']()
+
+		except dbus.exceptions.DBusException, e:
+			if e.get_dbus_name() == DBUS_INVALID_ARGS:
+				abort(400, str(e))
+			raise
+
+	@staticmethod
+	def find_method_in_interface(method, obj, interface, methods):
+		if methods is None:
+			return None
 
-		if path.parts[-1] == 'enumerate':
-			return EnumerateHandler(self, path.fq(last = -1), data)
+		method = find_case_insensitive(method, methods.keys())
+		if method is not None:
+			iface = dbus.Interface(obj, interface)
+			return iface.get_dbus_method(method)
+
+	def find_method_on_bus(self, path, method, bus, interfaces):
+		obj = self.bus.get_object(bus, path, introspect = False)
+		iface = dbus.Interface(obj, dbus.INTROSPECTABLE_IFACE)
+		data = iface.Introspect()
+		parser = IntrospectionNodeParser(
+				ElementTree.fromstring(data),
+				intf_match = ListMatch(interfaces))
+		for x,y in parser.get_interfaces().iteritems():
+			m = self.find_method_in_interface(method, obj, x,
+					y.get('method'))
+			if m:
+				return m
+
+class PropertyHandler(RouteHandler):
+	verbs = ['PUT', 'GET']
+	rules = '<path:path>/attr/<prop>'
+
+	def __init__(self, app, bus):
+		super(PropertyHandler, self).__init__(
+				app, bus, self.verbs, self.rules)
+
+	def find(self, path, prop):
+		self.app.instance_handler.setup(path)
+		obj = self.app.instance_handler.do_get(path)
+		try:
+			obj[prop]
+		except KeyError, e:
+			if request.method == 'PUT':
+				abort(403, _4034_msg %('property', 'created', str(e)))
+			else:
+				abort(404, _4034_msg %('property', 'found', str(e)))
 
-		if path.depth() > 1 and path.parts[-2] == 'attr':
-			return AttrHandler(self, path.fq(last = -2), data)
+		return { path: obj }
 
-		if path.depth() > 1 and path.parts[-2] == 'action':
-			return MethodHandler(self, path.fq(last = -2), data)
+	def setup(self, path, prop):
+		request.route_data['obj'] = self.find(path, prop)
 
-		# have to do an objectmapper query at this point
-		mapper_entry = self.server.mapper.get_object(path.fq())
-		if mapper_entry:
-			return InstanceHandler(self, path.fq(), data,
-					mapper_entry)
+	def do_get(self, path, prop):
+		return request.route_data['obj'][path][prop]
 
-		raise RestException("Not Found", 404)
+	def do_put(self, path, prop, value = None):
+		if value is None:
+			value = request.parameter_list
 
-	def do_command(self):
-		data = None
+		prop, iface, properties_iface = self.get_host_interface(
+				path, prop, request.route_data['map'][path])
 		try:
-			if self.command in ['POST', 'PUT', 'PATCH']:
-       		 		length = int(self.headers.getheader(
-					'content-length'))
-			        data = json.loads(self.rfile.read(length))
+			properties_iface.Set(iface, prop, value)
+		except ValueError, e:
+			abort(400, str(e))
+		except dbus.exceptions.DBusException, e:
+			if e.get_dbus_name() == DBUS_INVALID_ARGS:
+				abort(403, str(e))
+			raise
+
+	def get_host_interface(self, path, prop, bus_info):
+		for bus, interfaces in bus_info.iteritems():
+			obj = self.bus.get_object(bus, path, introspect = True)
+			properties_iface = dbus.Interface(
+				obj, dbus_interface=dbus.PROPERTIES_IFACE)
 
-			resp = self.get_real_handler(data).do_command()
-			if not resp:
-				resp = {'status': 'OK' }
-			response = JSONResponse(resp)
-		except RestException, ex:
-			response = ErrorResponse(ex)
+			info = self.get_host_interface_on_bus(
+					path, prop, properties_iface,
+					bus, interfaces)
+			if info is not None:
+				prop, iface = info
+				return prop, iface, properties_iface
 
-		response.render(self)
-		self.wfile.close()
+	def get_host_interface_on_bus(self, path, prop, iface, bus, interfaces):
+		for i in interfaces:
+			properties = self.try_properties_interface(iface.GetAll, i)
+			if properties is None:
+				continue
+			prop = find_case_insensitive(prop, properties.keys())
+			if prop is None:
+				continue
+			return prop, i
+
+class InstanceHandler(RouteHandler):
+	verbs = ['GET', 'PUT', 'DELETE']
+	rules = '<path:path>'
+	request_type = dict
+
+	def __init__(self, app, bus):
+		super(InstanceHandler, self).__init__(
+				app, bus, self.verbs, self.rules)
+
+	def find(self, path, callback = None):
+		return { path: self.try_mapper_call(
+			self.mapper.get_object,
+			callback,
+			path = path) }
+
+	def setup(self, path):
+		callback = None
+		if request.method == 'PUT':
+			def callback(e, **kw):
+				abort(403, _4034_msg %('resource',
+					'created', path))
+
+		if request.route_data.get('map') is None:
+			request.route_data['map'] = self.find(path, callback)
+
+	def do_get(self, path):
+		properties = {}
+		for item in request.route_data['map'][path].iteritems():
+			properties.update(self.get_properties_on_bus(
+				path, *item))
 
-	def do_GET(self):
-		return self.do_command()
+		return properties
 
-	def do_POST(self):
-		return self.do_command()
+	@staticmethod
+	def get_properties_on_iface(properties_iface, iface):
+		properties = InstanceHandler.try_properties_interface(
+				properties_iface.GetAll, iface)
+		if properties is None:
+			return {}
+		return properties
 
-	def do_PATCH(self):
-		return self.do_command()
+	def get_properties_on_bus(self, path, bus, interfaces):
+		properties = {}
+		obj = self.bus.get_object(bus, path, introspect = False)
+		properties_iface = dbus.Interface(
+				obj, dbus_interface=dbus.PROPERTIES_IFACE)
+		for i in interfaces:
+			properties.update(self.get_properties_on_iface(
+				properties_iface, i))
 
-	def do_PUT(self):
-		return self.do_command()
+		return properties
 
-	def do_DELETE(self):
-		return self.do_command()
+	def do_put(self, path):
+		# make sure all properties exist in the request
+		obj = set(self.do_get(path).keys())
+		req = set(request.parameter_list.keys())
+
+		diff = list(obj.difference(req))
+		if diff:
+			abort(403, _4034_msg %('resource', 'removed',
+				'%s/attr/%s' %(path, diff[0])))
+
+		diff = list(req.difference(obj))
+		if diff:
+			abort(403, _4034_msg %('resource', 'created',
+				'%s/attr/%s' %(path, diff[0])))
+
+		for p,v in request.parameter_list.iteritems():
+			self.app.property_handler.do_put(
+					path, p, v)
+
+	def do_delete(self, path):
+		for bus_info in request.route_data['map'][path].iteritems():
+			if self.bus_missing_delete(path, *bus_info):
+				abort(403, _4034_msg %('resource', 'removed',
+					path))
+
+		for bus in request.route_data['map'][path].iterkeys():
+			self.delete_on_bus(path, bus)
+
+	def bus_missing_delete(self, path, bus, interfaces):
+		return DELETE_IFACE not in interfaces
+
+	def delete_on_bus(self, path, bus):
+		obj = self.bus.get_object(bus, path, introspect = False)
+		delete_iface = dbus.Interface(
+				obj, dbus_interface = DELETE_IFACE)
+		delete_iface.Delete()
+
+class JsonApiRequestPlugin(object):
+	''' Ensures request content satisfies the OpenBMC json api format. '''
+	name = 'json_api_request'
+	api = 2
+
+	error_str = "Expecting request format { 'data': <value> }, got '%s'"
+	type_error_str = "Unsupported Content-Type: '%s'"
+	json_type = "application/json"
+	request_methods = ['PUT', 'POST', 'PATCH']
+
+	@staticmethod
+	def content_expected():
+		return request.method in JsonApiRequestPlugin.request_methods
+
+	def validate_request(self):
+		if request.content_length > 0 and \
+				request.content_type != self.json_type:
+			abort(415, self.type_error_str %(request.content_type))
 
-class HTTPServer(SocketServer.ThreadingMixIn, BaseHTTPServer.HTTPServer):
-	def __init__(self, bind, handler, bus):
-		BaseHTTPServer.HTTPServer.__init__(self, bind, handler)
+		try:
+			request.parameter_list = request.json.get('data')
+		except ValueError, e:
+			abort(400, str(e))
+		except (AttributeError, KeyError, TypeError):
+			abort(400, self.error_str %(request.json))
+
+	def apply(self, callback, route):
+		verbs = getattr(route.get_undecorated_callback(),
+				'_verbs', None)
+		if verbs is None:
+			return callback
+
+		if not set(self.request_methods).intersection(verbs):
+			return callback
+
+		def wrap(*a, **kw):
+			if self.content_expected():
+				self.validate_request()
+			return callback(*a, **kw)
+
+		return wrap
+
+class JsonApiRequestTypePlugin(object):
+	''' Ensures request content type satisfies the OpenBMC json api format. '''
+	name = 'json_api_method_request'
+	api = 2
+
+	error_str = "Expecting request format { 'data': %s }, got '%s'"
+
+	def apply(self, callback, route):
+		request_type = getattr(route.get_undecorated_callback(),
+				'request_type', None)
+		if request_type is None:
+			return callback
+
+		def validate_request():
+			if not isinstance(request.parameter_list, request_type):
+				abort(400, self.error_str %(str(request_type), request.json))
+
+		def wrap(*a, **kw):
+			if JsonApiRequestPlugin.content_expected():
+				validate_request()
+			return callback(*a, **kw)
+
+		return wrap
+
+class JsonApiResponsePlugin(object):
+	''' Emits normal responses in the OpenBMC json api format. '''
+	name = 'json_api_response'
+	api = 2
+
+	def apply(self, callback, route):
+		def wrap(*a, **kw):
+			resp = { 'data': callback(*a, **kw) }
+			resp['status'] = 'ok'
+			resp['message'] = response.status_line
+			return resp
+		return wrap
+
+class JsonApiErrorsPlugin(object):
+	''' Emits error responses in the OpenBMC json api format. '''
+	name = 'json_api_errors'
+	api = 2
+
+	def __init__(self, **kw):
+		self.app = None
+		self.function_type = None
+		self.original = None
+		self.json_opts = { x:y for x,y in kw.iteritems() \
+			if x in ['indent','sort_keys'] }
+
+	def setup(self, app):
+		self.app = app
+		self.function_type = type(app.default_error_handler)
+		self.original = app.default_error_handler
+		self.app.default_error_handler = self.function_type(
+			self.json_errors, app, Bottle)
+
+	def apply(self, callback, route):
+		return callback
+
+	def close(self):
+		self.app.default_error_handler = self.function_type(
+				self.original, self.app, Bottle)
+
+	def json_errors(self, res, error):
+		response_object = {'status': 'error', 'data': {} }
+		response_object['message'] = error.status_line
+		response_object['data']['description'] = str(error.body)
+		if error.status_code == 500:
+			response_object['data']['exception'] = repr(error.exception)
+			response_object['data']['traceback'] = error.traceback.splitlines()
+
+		json_response = json.dumps(response_object, **self.json_opts)
+		res.content_type = 'application/json'
+		return json_response
+
+class RestApp(Bottle):
+	def __init__(self, bus):
+		super(RestApp, self).__init__(autojson = False)
 		self.bus = bus
-		self.mapper = Mapper(self.bus)
+		self.mapper = Mapper(bus)
+
+		self.install_hooks()
+		self.install_plugins()
+		self.create_handlers()
+		self.install_handlers()
+
+	def install_plugins(self):
+		# install json api plugins
+		json_kw = {'indent': 2, 'sort_keys': True}
+		self.install(JSONPlugin(**json_kw))
+		self.install(JsonApiErrorsPlugin(**json_kw))
+		self.install(JsonApiResponsePlugin())
+		self.install(JsonApiRequestPlugin())
+		self.install(JsonApiRequestTypePlugin())
+
+	def install_hooks(self):
+		self.real_router_match = self.router.match
+		self.router.match = self.custom_router_match
+		self.add_hook('before_request', self.strip_extra_slashes)
+
+	def create_handlers(self):
+		# create route handlers
+		self.directory_handler = DirectoryHandler(self, self.bus)
+		self.list_names_handler = ListNamesHandler(self, self.bus)
+		self.list_handler = ListHandler(self, self.bus)
+		self.method_handler = MethodHandler(self, self.bus)
+		self.property_handler = PropertyHandler(self, self.bus)
+		self.instance_handler = InstanceHandler(self, self.bus)
+
+	def install_handlers(self):
+		self.directory_handler.install()
+		self.list_names_handler.install()
+		self.list_handler.install()
+		self.method_handler.install()
+		self.property_handler.install()
+		# this has to come last, since it matches everything
+		self.instance_handler.install()
+
+	def custom_router_match(self, environ):
+		''' The built-in Bottle algorithm for figuring out if a 404 or 405 is
+                    needed doesn't work for us since the instance rules match everything.
+                    This monkey-patch lets the route handler figure out which response is
+                    needed.  This could be accomplished with a hook but that would require
+		    calling the router match function twice.
+		'''
+		route, args = self.real_router_match(environ)
+		if isinstance(route.callback, RouteHandler):
+			route.callback._setup(**args)
+
+		return route, args
+
+	@staticmethod
+	def strip_extra_slashes():
+		path = request.environ['PATH_INFO']
+		trailing = ("","/")[path[-1] == '/']
+		parts = filter(bool, path.split('/'))
+		request.environ['PATH_INFO'] = '/' + '/'.join(parts) + trailing
 
 if __name__ == '__main__':
+	log = logging.getLogger('Rocket.Errors')
+	log.setLevel(logging.INFO)
+	log.addHandler(logging.StreamHandler(sys.stdout))
+
 	bus = dbus.SystemBus()
-	server = HTTPServer(('', 80), DBusRestHandler, bus)
-	server.serve_forever()
+	app = RestApp(bus)
+	default_cert = os.path.join(sys.prefix, 'share',
+			os.path.basename(__file__), 'cert.pem')
+
+	server = Rocket(('0.0.0.0',
+			443,
+			default_cert,
+			default_cert),
+		'wsgi', {'wsgi_app': app})
+	server.start()
-- 
2.6.3
