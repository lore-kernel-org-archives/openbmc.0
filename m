Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E07DD1A0B68
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2015 03:10:35 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449072631263308.6935788689568;
 Wed, 2 Dec 2015 08:10:31 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-rest-server] Add authentication and authorization
Date: Wed,  2 Dec 2015 11:10:29 -0500
Message-Id: <1449072629-6452-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449072629-6452-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449072629-6452-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 02 Dec 2015 16:10:36 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Use session cookie plus in-memory server sessions scheme.
Add /login /logout POST routes: {"data": ["username", "password"]}.
Add authorization plugin with arbitrary authorization callbacks.
Add valid user and user in group authorization callbacks.
Require valid user authorization for all routes (besides login/logout).
---
 obmc-rest | 156 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/obmc-rest b/obmc-rest
index c5ba8dc..42b3a74 100644
--- a/obmc-rest
+++ b/obmc-rest
@@ -11,6 +11,9 @@ from rocket import Rocket
 from bottle import Bottle, abort, request, response, JSONPlugin, HTTPError
 import OpenBMCMapper
 from OpenBMCMapper import Mapper, PathTree, IntrospectionNodeParser, ListMatch
+import spwd
+import grp
+import crypt
 
 DBUS_UNKNOWN_INTERFACE = 'org.freedesktop.UnknownInterface'
 DBUS_UNKNOWN_METHOD = 'org.freedesktop.DBus.Error.UnknownMethod'
@@ -19,6 +22,29 @@ DELETE_IFACE = 'org.openbmc.Object.Delete'
 
 _4034_msg = "The specified %s cannot be %s: '%s'"
 
+def valid_user(session, *a, **kw):
+	''' Authorization plugin callback that checks that the user is logged in. '''
+	if session is None:
+		abort(403, 'Login required')
+
+class UserInGroup:
+	''' Authorization plugin callback that checks that the user is logged in
+	and a member of a group. '''
+	def __init__(self, group):
+		self.group = group
+
+	def __call__(self, session, *a, **kw):
+		valid_user(session, *a, **kw)
+		res = False
+
+		try:
+			res = session['user'] in grp.getgrnam(self.group)[3]
+		except KeyError:
+			pass
+
+		if not res:
+			abort(403, 'Insufficient access')
+
 def find_case_insensitive(value, lst):
 	return next((x for x in lst if x.lower() == value.lower()), None)
 
@@ -31,6 +57,7 @@ def makelist(data):
 		return []
 
 class RouteHandler(object):
+	_require_auth = makelist(valid_user)
 	def __init__(self, app, bus, verbs, rules):
 		self.app = app
 		self.bus = bus
@@ -395,6 +422,132 @@ class InstanceHandler(RouteHandler):
 				obj, dbus_interface = DELETE_IFACE)
 		delete_iface.Delete()
 
+class SessionHandler(MethodHandler):
+	''' Handles the /login and /logout routes, manages server side session store and
+	session cookies.  '''
+
+	rules = ['/login', '/logout']
+	login_str = "User '%s' logged %s"
+	bad_passwd_str = "Invalid username or password"
+	no_user_str = "No user logged in"
+	bad_json_str = "Expecting request format { 'data': [<username>, <password>] }, got '%s'"
+	_require_auth = None
+	MAX_SESSIONS = 16
+
+	def __init__(self, app, bus):
+		super(SessionHandler, self).__init__(
+				app, bus)
+		self.hmac_key = os.urandom(128)
+		self.session_store = []
+
+	@staticmethod
+	def authenticate(username, clear):
+		try:
+			encoded = spwd.getspnam(username)[1]
+			return encoded == crypt.crypt(clear, encoded)
+		except KeyError:
+			return False
+
+	def invalidate_session(self, session):
+		try:
+			self.session_store.remove(session)
+		except ValueError:
+			pass
+
+	def new_session(self):
+		sid = os.urandom(32)
+		if self.MAX_SESSIONS <= len(self.session_store):
+			self.session_store.pop()
+		self.session_store.insert(0, {'sid': sid})
+
+		return self.session_store[0]
+
+	def get_session(self, sid):
+		sids = [ x['sid'] for x in self.session_store ]
+		try:
+			return self.session_store[sids.index(sid)]
+		except ValueError:
+			return None
+
+	def get_session_from_cookie(self):
+		return self.get_session(
+				request.get_cookie('sid',
+					secret = self.hmac_key))
+
+	def do_post(self, **kw):
+		if request.path == '/login':
+			return self.do_login(**kw)
+		else:
+			return self.do_logout(**kw)
+
+	def do_logout(self, **kw):
+		session = self.get_session_from_cookie()
+		if session is not None:
+			user = session['user']
+			self.invalidate_session(session)
+			response.delete_cookie('sid')
+			return self.login_str %(user, 'out')
+
+		return self.no_user_str
+
+	def do_login(self, **kw):
+		session = self.get_session_from_cookie()
+		if session is not None:
+			return self.login_str %(session['user'], 'in')
+
+		if len(request.parameter_list) != 2:
+			abort(400, self.bad_json_str %(request.json))
+
+		if not self.authenticate(*request.parameter_list):
+			return self.bad_passwd_str
+
+		user = request.parameter_list[0]
+		session = self.new_session()
+		session['user'] = user
+		response.set_cookie('sid', session['sid'], secret = self.hmac_key,
+				secure = True,
+				httponly = True)
+		return self.login_str %(user, 'in')
+
+	def find(self, **kw):
+		pass
+
+	def setup(self, **kw):
+		pass
+
+class AuthorizationPlugin(object):
+	''' Invokes an optional list of authorization callbacks. '''
+
+	name = 'authorization'
+	api = 2
+
+	class Compose:
+		def __init__(self, validators, callback, session_mgr):
+			self.validators = validators
+			self.callback = callback
+			self.session_mgr = session_mgr
+
+		def __call__(self, *a, **kw):
+			sid = request.get_cookie('sid', secret = self.session_mgr.hmac_key)
+			session = self.session_mgr.get_session(sid)
+			for x in self.validators:
+				x(session, *a, **kw)
+
+			return self.callback(*a, **kw)
+
+	def apply(self, callback, route):
+		undecorated = route.get_undecorated_callback()
+		if not isinstance(undecorated, RouteHandler):
+			return callback
+
+		auth_types = getattr(undecorated,
+				'_require_auth', None)
+		if not auth_types:
+			return callback
+
+		return self.Compose(auth_types, callback,
+				undecorated.app.session_handler)
+
 class JsonApiRequestPlugin(object):
 	''' Ensures request content satisfies the OpenBMC json api format. '''
 	name = 'json_api_request'
@@ -528,6 +681,7 @@ class RestApp(Bottle):
 		json_kw = {'indent': 2, 'sort_keys': True}
 		self.install(JSONPlugin(**json_kw))
 		self.install(JsonApiErrorsPlugin(**json_kw))
+		self.install(AuthorizationPlugin())
 		self.install(JsonApiResponsePlugin())
 		self.install(JsonApiRequestPlugin())
 		self.install(JsonApiRequestTypePlugin())
@@ -539,6 +693,7 @@ class RestApp(Bottle):
 
 	def create_handlers(self):
 		# create route handlers
+		self.session_handler = SessionHandler(self, self.bus)
 		self.directory_handler = DirectoryHandler(self, self.bus)
 		self.list_names_handler = ListNamesHandler(self, self.bus)
 		self.list_handler = ListHandler(self, self.bus)
@@ -547,6 +702,7 @@ class RestApp(Bottle):
 		self.instance_handler = InstanceHandler(self, self.bus)
 
 	def install_handlers(self):
+		self.session_handler.install()
 		self.directory_handler.install()
 		self.list_names_handler.install()
 		self.list_handler.install()
-- 
2.6.3
