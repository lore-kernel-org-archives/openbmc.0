Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DDE661A0E27
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 13:08:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=HhfDOMAn; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id x125so2982568pfb.0
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2016 18:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=8dxRbqMrBva2cYJnc9sOs//WLOF11QtMoYhUznjMwZg=;
 b=HhfDOMAnWHffrRmSD/FjtERorZR8ZbbEr4LBHnXwAmTApmRBeX0xWzfFzSsMKhTw3c
 sYt3XFY2C9sd/OHdDsiL6ItP4LXANcwZCPEzOE9UY63eEWNH1RE8SYXTLY6g9bSmiU7Q
 znKETHMpPmbEaU0Q9CVoP3qOwaBszmnpAa94bXmGuQe+50Jh56CPNrkERb1KQ+J+vbzs
 YuArfuBl1QAD+TsfJT+QpCm1VyI79F5gxbUMmRnMenNkvo0TUuZ0eFR0PvyjSiOz5szJ
 cnC4m6KtHKwQc2uryASr0orTIdscc9tF77Bd0XTKCYQsNqwphkEMVhsm4iInxikrzlzC
 XybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-type:content-transfer-encoding;
 bh=8dxRbqMrBva2cYJnc9sOs//WLOF11QtMoYhUznjMwZg=;
 b=Z5eW3eO4XuGWl+0X5EfjxgDZ0sjcywIhQvmED/eXd6PUk3Ohv3VSo6ASx4rIB+rIPI
 43K30hz4ZlV8wPtMFRViu54e9tcUob4j0aI6b7/w1j90B7VUQP5dT7yNyUHD7nKc5pm0
 fqYD+tN7ytDNqJTj5sIPZpf/qdmrZ7LnGt0F6qktYc/DaNkjS6hqskW4Mg3kcxYXLuMC
 Q8lxeGjex+DX0bb/9dUNoztcmyH0SDTEa60x5e7q8z82z0HoIJrehqxon5JeaQmi6gW+
 HJTzwVlQxta6MWCYvKXKM7wVwAUjrAx7vsYpuALnk/sQTIaSX0DJ99EOJr43gH5BJze8
 SjVQ==
X-Gm-Message-State: AG10YOT5dkw7UE+ZEPr2VjyulEd64XYx5UfFxdSJzLGas14gOnU9a7SeoJVNXDKNaulfTg==
X-Received: by 10.98.16.146 with SMTP id 18mr9678211pfq.122.1454033314087;
 Thu, 28 Jan 2016 18:08:34 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id mj1sm19302327pab.34.2016.01.28.18.08.32
 (version=TLSv1/SSLv3 cipher=OTHER);
 Thu, 28 Jan 2016 18:08:33 -0800 (PST)
Date: Fri, 29 Jan 2016 13:08:26 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: "Peng Fei BG Gou" <shgoupf@cn.ibm.com>
Cc: "openbmc" <openbmc@lists.ozlabs.org>, "OpenBMC Patches"
 <openbmc-patches@stwcx.xyz>
Subject: Re: =?UTF-8?B?5Zue5aSN77ya5Zue5aSN77yaW1BBVENI?=
 phosphor-rest-server] The streaming support for obmc-rest.
Message-ID: <20160129130826.477d4fcd@camb691>
In-Reply-To: <201601290049.u0T0nquh003020@d23av02.au.ibm.com>
References: <OF66059493.03804909-ON00257F49.000380B3-1454027895800@LocalDomain>
 <201601290049.u0T0nquh003020@d23av02.au.ibm.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 29 Jan 2016 02:08:37 -0000

On Fri, 29 Jan 2016 00:49:39 +0000
"Peng Fei BG Gou" <shgoupf@cn.ibm.com> wrote:

> And the white space you saw in the email thread and coding is probably ca=
used by the mixing use of tab and white space. The original code uses tab f=
or indent, while I prefer to use 4 white spaces for indent. I will discuss =
with Brad regarding the indent convention for our code. Will fix it up if w=
e strictly need tab in our project.

In a world where we all have to read each others code, we should make an ef=
fort
to not make it hard for everyone. What you have done here is mix different
indenting styles which only makes it harder to read for everyone to read the
code. Imagine a world where I preferred 8 space indenting and I went through
and my additions to the file were 8 space indented, this would be impossibl=
e to
read.

Typically when a file has been written in one way, it is left that way unle=
ss
that particular way is absolutely abhorrent (5 space indenting...). Tabs ar=
e a
perfectly valid way of indenting, I don't see the issue here.

Futhurmore, I know this isn't really for python, if in doubt we should prob=
ably
be falling back to the openbmc/docs/contributing file and I quote:

	Components of the OpenBMC sources should have consistent style.

	For C code, we typically use the Linux coding style, which is
	documented at:

	http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Docume=
ntation/CodingStyle

(unless you want to write a completely separate Python document, and change=
 all
the python in this project, I suggest we follow this one where appropriate)

	Indent with tabs instead of spaces, set at 8 columns

tl;dr

Don't mix indenting styles, way too hard to read the code.

> =20
> =20
> =20
>  =E5=9C=A8 2016=E5=B9=B41=E6=9C=8829=E6=97=A5=EF=BC=8C=E4=B8=8A=E5=8D=888=
:38:15=EF=BC=8C"Peng Fei BG Gou" <shgoupf@cn.ibm.com> =E5=86=99=E9=81=93=EF=
=BC=9A
> =20
>       Python is indent based languang, so the function will fail if we ha=
ve
> incorrect indenting. I have tested this in real bmc machine so I believe =
the
> indenting should be fine for now. Please let Brad review this change sinc=
e he
> is familiar with Python.=20
>    =E5=9C=A8 2016=E5=B9=B41=E6=9C=8829=E6=97=A5=EF=BC=8C=E4=B8=8A=E5=8D=
=888:24:58=EF=BC=8C"Cyril Bur" <cyrilbur@gmail.com> =E5=86=99=E9=81=93=EF=
=BC=9A
>   =20
>        On Thu, 28 Jan 2016 02:00:37 -0600
>     OpenBMC Patches  wrote:
>     > From: shgoupf=20
>     >  =20
>     Hi Peng,
>     So I'm don't really know python all that well but I do believe this
> language is white space sensitive... I'll let a pythoner respond about the
> rest...
>     > Changes:
>     > 1) The main idea of this change is to have a streaming path as belo=
w:
>     >     dbus signal -> obmc-rest capture the dbus signal -> obmc-rest
>     > notify the client of the signal receiving. 2) Replace rocket with
>     > gevent WSGI server to support multiple async accesses. 3) Use gevent
>     > queue to notify the dbus signal receiving. 4) The uri to the stream=
ing
>     > should be in the form as below: https:////stream/
>     > ---
>     >  obmc-rest | 115
>     > ++++++++++++++++++++++++++++++++++++++++++++++++++++++++------ 1 fi=
le
>     > changed, 104 insertions(+), 11 deletions(-) mode change 100644 =3D>
>     > 100755 obmc-rest
>     >=20
>     > diff --git a/obmc-rest b/obmc-rest
>     > old mode 100644
>     > new mode 100755
>     > index c6d2949..481dafa
>     > --- a/obmc-rest
>     > +++ b/obmc-rest
>     > @@ -3,7 +3,9 @@
>     >  import os
>     >  import sys
>     >  import dbus
>     > +import gobject
>     >  import dbus.exceptions
>     > +import dbus.mainloop.glib
>     >  import json
>     >  import logging
>     >  from xml.etree import ElementTree
>     > @@ -14,6 +16,10 @@ from OpenBMCMapper import Mapper, PathTree,
>     > IntrospectionNodeParser, ListMatch import spwd
>     >  import grp
>     >  import crypt
>     > +import threading
>     > +import gevent
>     > +from gevent.pywsgi import WSGIServer
>     > +from gevent.queue import Queue
>     > =20
>     >  DBUS_UNKNOWN_INTERFACE =3D 'org.freedesktop.UnknownInterface'
>     >  DBUS_UNKNOWN_METHOD =3D 'org.freedesktop.DBus.Error.UnknownMethod'
>     > @@ -59,12 +65,13 @@ def makelist(data):
>     > =20
>     >  class RouteHandler(object):
>     >   _require_auth =3D makelist(valid_user)
>     > - def __init__(self, app, bus, verbs, rules):
>     > + def __init__(self, app, bus, verbs, rules, skips =3D []):
>     >   self.app =3D app
>     >   self.bus =3D bus
>     >   self.mapper =3D Mapper(bus)
>     >   self._verbs =3D makelist(verbs)
>     >   self._rules =3D rules
>     > +                self._skips =3D skips
>     > =20
>     >   def _setup(self, **kw):
>     >   request.route_data =3D {}
>     > @@ -79,7 +86,7 @@ class RouteHandler(object):
>     >   return getattr(self, 'do_' + request.method.lower())(**kw)
>     > =20
>     >   def install(self):
>     > - self.app.route(self._rules, callback =3D self,
>     > + self.app.route(self._rules, callback =3D self, skip =3D self._ski=
ps,
>     >   method =3D ['GET', 'PUT', 'PATCH', 'POST', 'DELETE'])
>     > =20
>     >   @staticmethod
>     > @@ -108,6 +115,58 @@ class RouteHandler(object):
>     >   return None
>     >   raise
>     > =20
>     > +class SignalHandler(RouteHandler):
>     > + verbs =3D ['GET']
>     > + rules =3D '/stream/'
>     > +
>     > + def __init__(self, app, bus):
>     > + super(SignalHandler, self).__init__(
>     > + app, bus, self.verbs, self.rules)
>     > +
>     > + def find(self, path, signal):
>     > + busses =3D self.try_mapper_call(self.mapper.get_object,
>     > + path =3D path)
>     > + for items in busses.iteritems():
>     > + s =3D self.find_signal_on_bus(path, signal, *items)
>     > + if s:
>     > + return s
>     > +
>     > + abort(404, _4034_msg %('signal', 'found', signal))
>     > +
>     > + def setup(self, path, signal):
>     > + request.route_data['map'] =3D self.find(path, signal)
>     > +
>     > + def do_get(self, path, signal):
>     > +                body =3D Queue()
>     > +                dsignal =3D DbusSignal(bus, request.route_data['ma=
p'][0],
>     > +                                     request.route_data['map'][1],
>     > path)
>     > +                dsignal.onData(body.put)
>     > +                dsignal.onFinish(lambda: body.put(StopIteration))
>     > +                dsignal.signalSnooping()
>     > +                return body
>     > +
>     > + @staticmethod
>     > + def find_signal(signal, signals):
>     > + if signals is None:
>     > + return None
>     > +
>     > + signal =3D find_case_insensitive(signal, signals.keys())
>     > + if signal is not None:
>     > +                        return signal
>     > +
>     > + def find_signal_on_bus(self, path, signal, bus, interfaces):
>     > + obj =3D self.bus.get_object(bus, path, introspect =3D False)
>     > + iface =3D dbus.Interface(obj, dbus.INTROSPECTABLE_IFACE)
>     > + data =3D iface.Introspect()
>     > + parser =3D IntrospectionNodeParser(
>     > + ElementTree.fromstring(data),
>     > + intf_match =3D ListMatch(interfaces))
>     > + for x,y in parser.get_interfaces().iteritems():
>     > + s =3D self.find_signal(signal,
>     > +                                             y.get('signal'))
>     > + if s:
>     > + return (x,s)
>     > +
>     >  class DirectoryHandler(RouteHandler):
>     >   verbs =3D 'GET'
>     >   rules =3D '/'
>     > @@ -715,7 +774,8 @@ class RestApp(Bottle):
>     >   self.install(JSONPlugin(**json_kw))
>     >   self.install(JsonApiErrorsPlugin(**json_kw))
>     >   self.install(AuthorizationPlugin())
>     > - self.install(JsonApiResponsePlugin())
>     > +                self.json_response_plugin =3D JsonApiResponsePlugi=
n() =20
>     Indenting?
>     > + self.install(self.json_response_plugin)
>     >   self.install(JsonApiRequestPlugin())
>     >   self.install(JsonApiRequestTypePlugin())
>     > =20
>     > @@ -726,6 +786,7 @@ class RestApp(Bottle):
>     > =20
>     >   def create_handlers(self):
>     >   # create route handlers
>     > + self.signal_handler =3D SignalHandler(self, self.bus)
>     >   self.session_handler =3D SessionHandler(self, self.bus)
>     >   self.directory_handler =3D DirectoryHandler(self, self.bus)
>     >   self.list_names_handler =3D ListNamesHandler(self, self.bus)
>     > @@ -736,6 +797,11 @@ class RestApp(Bottle):
>     >   self.instance_handler =3D InstanceHandler(self, self.bus)
>     > =20
>     >   def install_handlers(self):
>     > +                # Skip json response for signal handler because it
>     > requires to
>     > +                # return a gevent iterable which cannot be handled=
 by
>     > json
>     > +                # response plugin
>     > +                self.signal_handler._skips =3D
>     > [self.json_response_plugin] =20
>     Indenting?
>     > + self.signal_handler.install()
>     >   self.session_handler.install()
>     >   self.directory_handler.install()
>     >   self.list_names_handler.install()
>     > @@ -766,21 +832,48 @@ class RestApp(Bottle):
>     >   parts =3D filter(bool, path.split('/'))
>     >   request.environ['PATH_INFO'] =3D '/' + '/'.join(parts) + trailing
>     > =20
>     > +class DbusSignal():
>     > +    def __init__(self, bus, dbus_interface, signal_name, path):
>     > +        # Register the dbus recieve handler
>     > +        bus.add_signal_receiver(self.signalReciever,
>     > +                                dbus_interface =3D dbus_interface,
>     > +                                signal_name =3D signal_name,
>     > +                                path =3D path)
>     > +
>     > +        self.snooping =3D True
>     > +
>     > +    def signalReciever(self, msg):
>     > +        self.send("Recieved message: %s" % msg)
>     > +        self.snooping =3D False
>     > +
>     > +    def onData(self, send):
>     > +        self.send =3D send
>     > +
>     > +    def onFinish(self, f):
>     > +        self.finish =3D f
>     > +
>     > +    def signalSnooping(self):
>     > +        while self.snooping:
>     > +            mainloop =3D gobject.MainLoop()
>     > +            gevent.sleep(1)
>     > +            gobject.timeout_add(1, mainloop.quit)
>     > +            mainloop.run()
>     > +
>     > +        self.finish()
>     > +
>     >  if __name__ =3D=3D '__main__':
>     >   log =3D logging.getLogger('Rocket.Errors')
>     >   log.setLevel(logging.INFO)
>     >   log.addHandler(logging.StreamHandler(sys.stdout))
>     > =20
>     > +        dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue) =20
>     Indenting?
>     >   bus =3D dbus.SystemBus()
>     >   app =3D RestApp(bus)
>     > + =20
>     ?
>     >   default_cert =3D os.path.join(sys.prefix, 'share',
>     >   os.path.basename(__file__), 'cert.pem')
>     > =20
>     > - server =3D Rocket(('0.0.0.0',
>     > - 443,
>     > - default_cert,
>     > - default_cert),
>     > - 'wsgi', {'wsgi_app': app},
>     > - min_threads =3D 1,
>     > - max_threads =3D 1)
>     > - server.start()
>     > +        server =3D WSGIServer(("0.0.0.0", 443), app, keyfile =3D
>     > default_cert,
>     > +                            certfile =3D default_cert)
>     > +
>     > +        server.serve_forever() =20
>     Indenting?
