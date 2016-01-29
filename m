Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x244.google.com (mail-pa0-x244.google.com
 [IPv6:2607:f8b0:400e:c03::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id EF8A11A1052
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 11:23:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=xBW6l3om; 
 dkim-atps=neutral
Received: by mail-pa0-x244.google.com with SMTP id gi1so2724027pac.2
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2016 16:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=GnHSX814HwI50tLixfkiPqTBNfuvwmZVtwQ/tGx9TQM=;
 b=xBW6l3om2KenjuJQqLzusG5R+W1dIHgjEuU9jePUItYMDINKjOu1mVYSLPTaKm7cuu
 8HmPdb1AYdJJ/aLRQE1US2msKtfOqDyLCJGHRecFolasYGRTB48Sds4zJl0do/TPRipU
 592bivbndlxi+kvuc13t7Dbqz7KnAo37+VIeVFIUAUAzNhJzMrU6Ajw4OA+8UKRq9n3l
 2m+FQwVLc7Ln8r4GpD4ammT4Eh3WuXWG+/Bu8aZs2gb/e+G8EvuAk/kuA/OPmtj2Geqj
 /wfQmquzjbu9WhPgyxPemfNNvnEwiO9ksk6unENubG8/ZzvuBNfqlZO+IoitR25F7MNT
 vojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-type:content-transfer-encoding;
 bh=GnHSX814HwI50tLixfkiPqTBNfuvwmZVtwQ/tGx9TQM=;
 b=g/ZcBm8ewYDbsdjxL/auoBHSwth0c+lzQTotzvSldJb5Cex+/T8Ka3/UTQzzstBpha
 Te/BJrHGzKK9WTAmuXSPL33q4V+ZROaabRvjNcHdfvEusJK01TMIqJzbC3Mep/M4/LHw
 W4EZskebfO1rHBXSvjnZ3lsHnSDiOsp73T2/sAw+5Afb2VjDHKzi1fVIMsrr3TdZw4lH
 +OSEkJmXMqqwjjLwqx49EolofzRIAR3CCgLq2Lh7rnPXeYoTr2DedJbouutZ9M5tBDoD
 +Q4SiOVo7LTT0XASQc9sjyloEuXY4TZydWMVvipemO2bks4QFJYv7+s/oJFI51bH0CoN
 1+Mw==
X-Gm-Message-State: AG10YOSYRIRsEgRjb8HNIf2AMTno7ecI05t8CBnk0xS+t657POs2bNmFX4I0u/iKj9Xl2w==
X-Received: by 10.66.218.40 with SMTP id pd8mr9048835pac.159.1454027025893;
 Thu, 28 Jan 2016 16:23:45 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id lt14sm944853pab.39.2016.01.28.16.23.44
 (version=TLSv1/SSLv3 cipher=OTHER);
 Thu, 28 Jan 2016 16:23:45 -0800 (PST)
Date: Fri, 29 Jan 2016 11:23:37 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, shgoupf <shgoupf@cn.ibm.com>
Subject: Re: [PATCH phosphor-rest-server] The streaming support for obmc-rest.
Message-ID: <20160129112337.6d6d6b9b@camb691>
In-Reply-To: <1453968037-28661-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453968037-28661-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453968037-28661-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 29 Jan 2016 00:23:48 -0000

On Thu, 28 Jan 2016 02:00:37 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: shgoupf <shgoupf@cn.ibm.com>
> 

Hi Peng,

So I'm don't really know python all that well but I do believe this language is
white space sensitive... I'll let a pythoner respond about the rest...

> Changes:
> 1) The main idea of this change is to have a streaming path as below:
>     dbus signal -> obmc-rest capture the dbus signal -> obmc-rest notify the client of the signal receiving.
> 2) Replace rocket with gevent WSGI server to support multiple async accesses.
> 3) Use gevent queue to notify the dbus signal receiving.
> 4) The uri to the streaming should be in the form as below:
>     https://<ip>/<path>/stream/<signal_name>
> ---
>  obmc-rest | 115 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 104 insertions(+), 11 deletions(-)
>  mode change 100644 => 100755 obmc-rest
> 
> diff --git a/obmc-rest b/obmc-rest
> old mode 100644
> new mode 100755
> index c6d2949..481dafa
> --- a/obmc-rest
> +++ b/obmc-rest
> @@ -3,7 +3,9 @@
>  import os
>  import sys
>  import dbus
> +import gobject
>  import dbus.exceptions
> +import dbus.mainloop.glib
>  import json
>  import logging
>  from xml.etree import ElementTree
> @@ -14,6 +16,10 @@ from OpenBMCMapper import Mapper, PathTree, IntrospectionNodeParser, ListMatch
>  import spwd
>  import grp
>  import crypt
> +import threading
> +import gevent
> +from gevent.pywsgi import WSGIServer
> +from gevent.queue import Queue
>  
>  DBUS_UNKNOWN_INTERFACE = 'org.freedesktop.UnknownInterface'
>  DBUS_UNKNOWN_METHOD = 'org.freedesktop.DBus.Error.UnknownMethod'
> @@ -59,12 +65,13 @@ def makelist(data):
>  
>  class RouteHandler(object):
>  	_require_auth = makelist(valid_user)
> -	def __init__(self, app, bus, verbs, rules):
> +	def __init__(self, app, bus, verbs, rules, skips = []):
>  		self.app = app
>  		self.bus = bus
>  		self.mapper = Mapper(bus)
>  		self._verbs = makelist(verbs)
>  		self._rules = rules
> +                self._skips = skips
>  
>  	def _setup(self, **kw):
>  		request.route_data = {}
> @@ -79,7 +86,7 @@ class RouteHandler(object):
>  		return getattr(self, 'do_' + request.method.lower())(**kw)
>  
>  	def install(self):
> -		self.app.route(self._rules, callback = self,
> +		self.app.route(self._rules, callback = self, skip = self._skips,
>  				method = ['GET', 'PUT', 'PATCH', 'POST', 'DELETE'])
>  
>  	@staticmethod
> @@ -108,6 +115,58 @@ class RouteHandler(object):
>  				return None
>  			raise
>  
> +class SignalHandler(RouteHandler):
> +	verbs = ['GET']
> +	rules = '<path:path>/stream/<signal>'
> +
> +	def __init__(self, app, bus):
> +		super(SignalHandler, self).__init__(
> +				app, bus, self.verbs, self.rules)
> +
> +	def find(self, path, signal):
> +		busses = self.try_mapper_call(self.mapper.get_object,
> +				path = path)
> +		for items in busses.iteritems():
> +			s = self.find_signal_on_bus(path, signal, *items)
> +			if s:
> +				return s
> +
> +		abort(404, _4034_msg %('signal', 'found', signal))
> +
> +	def setup(self, path, signal):
> +		request.route_data['map'] = self.find(path, signal)
> +
> +	def do_get(self, path, signal):
> +                body = Queue()
> +                dsignal = DbusSignal(bus, request.route_data['map'][0],
> +                                     request.route_data['map'][1], path)
> +                dsignal.onData(body.put)
> +                dsignal.onFinish(lambda: body.put(StopIteration))
> +                dsignal.signalSnooping()
> +                return body
> +
> +	@staticmethod
> +	def find_signal(signal, signals):
> +		if signals is None:
> +			return None
> +
> +		signal = find_case_insensitive(signal, signals.keys())
> +		if signal is not None:
> +                        return signal
> +
> +	def find_signal_on_bus(self, path, signal, bus, interfaces):
> +		obj = self.bus.get_object(bus, path, introspect = False)
> +		iface = dbus.Interface(obj, dbus.INTROSPECTABLE_IFACE)
> +		data = iface.Introspect()
> +		parser = IntrospectionNodeParser(
> +				ElementTree.fromstring(data),
> +				intf_match = ListMatch(interfaces))
> +		for x,y in parser.get_interfaces().iteritems():
> +			s = self.find_signal(signal,
> +                                             y.get('signal'))
> +			if s:
> +				return (x,s)
> +
>  class DirectoryHandler(RouteHandler):
>  	verbs = 'GET'
>  	rules = '<path:path>/'
> @@ -715,7 +774,8 @@ class RestApp(Bottle):
>  		self.install(JSONPlugin(**json_kw))
>  		self.install(JsonApiErrorsPlugin(**json_kw))
>  		self.install(AuthorizationPlugin())
> -		self.install(JsonApiResponsePlugin())
> +                self.json_response_plugin = JsonApiResponsePlugin()

Indenting?

> +		self.install(self.json_response_plugin)
>  		self.install(JsonApiRequestPlugin())
>  		self.install(JsonApiRequestTypePlugin())
>  
> @@ -726,6 +786,7 @@ class RestApp(Bottle):
>  
>  	def create_handlers(self):
>  		# create route handlers
> +		self.signal_handler = SignalHandler(self, self.bus)
>  		self.session_handler = SessionHandler(self, self.bus)
>  		self.directory_handler = DirectoryHandler(self, self.bus)
>  		self.list_names_handler = ListNamesHandler(self, self.bus)
> @@ -736,6 +797,11 @@ class RestApp(Bottle):
>  		self.instance_handler = InstanceHandler(self, self.bus)
>  
>  	def install_handlers(self):
> +                # Skip json response for signal handler because it requires to
> +                # return a gevent iterable which cannot be handled by json
> +                # response plugin
> +                self.signal_handler._skips = [self.json_response_plugin]

Indenting?

> +		self.signal_handler.install()
>  		self.session_handler.install()
>  		self.directory_handler.install()
>  		self.list_names_handler.install()
> @@ -766,21 +832,48 @@ class RestApp(Bottle):
>  		parts = filter(bool, path.split('/'))
>  		request.environ['PATH_INFO'] = '/' + '/'.join(parts) + trailing
>  
> +class DbusSignal():
> +    def __init__(self, bus, dbus_interface, signal_name, path):
> +        # Register the dbus recieve handler
> +        bus.add_signal_receiver(self.signalReciever,
> +                                dbus_interface = dbus_interface,
> +                                signal_name = signal_name,
> +                                path = path)
> +
> +        self.snooping = True
> +
> +    def signalReciever(self, msg):
> +        self.send("Recieved message: %s" % msg)
> +        self.snooping = False
> +
> +    def onData(self, send):
> +        self.send = send
> +
> +    def onFinish(self, f):
> +        self.finish = f
> +
> +    def signalSnooping(self):
> +        while self.snooping:
> +            mainloop = gobject.MainLoop()
> +            gevent.sleep(1)
> +            gobject.timeout_add(1, mainloop.quit)
> +            mainloop.run()
> +
> +        self.finish()
> +
>  if __name__ == '__main__':
>  	log = logging.getLogger('Rocket.Errors')
>  	log.setLevel(logging.INFO)
>  	log.addHandler(logging.StreamHandler(sys.stdout))
>  
> +        dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)

Indenting?

>  	bus = dbus.SystemBus()
>  	app = RestApp(bus)
> +

?

>  	default_cert = os.path.join(sys.prefix, 'share',
>  			os.path.basename(__file__), 'cert.pem')
>  
> -	server = Rocket(('0.0.0.0',
> -			443,
> -			default_cert,
> -			default_cert),
> -		'wsgi', {'wsgi_app': app},
> -		min_threads = 1,
> -		max_threads = 1)
> -	server.start()
> +        server = WSGIServer(("0.0.0.0", 443), app, keyfile = default_cert,
> +                            certfile = default_cert)
> +
> +        server.serve_forever()

Indenting?
