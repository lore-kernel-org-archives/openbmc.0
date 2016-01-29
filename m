Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x244.google.com (mail-pa0-x244.google.com
 [IPv6:2607:f8b0:400e:c03::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 033E91A0E27
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 15:43:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Qsz/3+Pt; 
 dkim-atps=neutral
Received: by mail-pa0-x244.google.com with SMTP id pv5so2994362pac.0
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2016 20:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=iTeFnaCJNgAUXzAQ3Olx13ISFL3YYVzDXHJMUFbz7qU=;
 b=Qsz/3+PtQHFEaY+3yWGv8W2RDj1kjuwiiBYOeVQvUELiSsGvbRW06yeqTJe696Lcgs
 XPe68pTyyXInDVmZFQTKgUtcMv+xRlipuMKXzSYTLjULWjmTgvNhM54oUQN6hmYYzdJM
 +YbhDS+v37+QYVwpr3kdm803/HC/jFVI48gN8Xkc5fM05PV2nnwTgNqGEvzgJSBSsGmo
 IK+gzLoSj8e+K82Y2SnOxUWNKUi9/jRB5IABQEqZQ+6k+v81cbB4Wte7y5sybjyZFZEP
 HAYEJcv+QEyrNVhYVZiblFep450xT9owNI+XCGS93z7Pwh64lMairnD2ijTEoA4IUhKj
 1x4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-type:content-transfer-encoding;
 bh=iTeFnaCJNgAUXzAQ3Olx13ISFL3YYVzDXHJMUFbz7qU=;
 b=UeBRUcS2PWMeQhqsjhkABal+htwZmpcBGV/+03oHniOK9Sk7HS7Ag99zxEd2rWm6es
 t3Cam2ylZQUq3iOSPN/6xc1Ah3hs9wZ/jABWXiHAA6nZ9WUqW+mZk2w3WC85HJ25I3qu
 okY8EtA2tHuw9aVhV2QjA5sky0lT8Zl8xtdczP6WkrLU7XXTDrjvJQop90BxzRg8m+wE
 SuIt/uCftLwf/H30E2yROs6Z6112o+M5703SOP6J7CO5aqW2DDFY15sYZZ2RMKuFcGGD
 NB1cppV4FqLLTmC/gViuR6i4t2axJnxjsKlA46HqeHcoKhjKXRUE/2yY6wPuLxN+2NMK
 tVIw==
X-Gm-Message-State: AG10YOTIsJ5oZYOXsUqwQibrtKvwD04J/upPw8mr6bVX3TTNNjGT6br23Lt+kqc1AYDo/w==
X-Received: by 10.67.14.234 with SMTP id fj10mr10323042pad.149.1454042613787; 
 Thu, 28 Jan 2016 20:43:33 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id xv2sm19965922pab.10.2016.01.28.20.43.31
 (version=TLSv1/SSLv3 cipher=OTHER);
 Thu, 28 Jan 2016 20:43:33 -0800 (PST)
Date: Fri, 29 Jan 2016 15:43:26 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: "Peng Fei BG Gou" <shgoupf@cn.ibm.com>
Cc: openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Subject: Re: =?UTF-8?B?5Zue5aSN77ya5Zue5aSN77yaW1BBVENI?=
 phosphor-rest-server] The streaming support for obmc-rest.
Message-ID: <20160129154326.7c11f275@camb691>
In-Reply-To: <201601290423.u0T4NYkd013405@d23av02.au.ibm.com>
References: <20160129130826.477d4fcd@camb691>
 <OF66059493.03804909-ON00257F49.000380B3-1454027895800@LocalDomain>
 <201601290049.u0T0nquh003020@d23av02.au.ibm.com>
 <201601290423.u0T4NYkd013405@d23av02.au.ibm.com>
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
X-List-Received-Date: Fri, 29 Jan 2016 04:43:37 -0000

On Fri, 29 Jan 2016 04:23:21 +0000
"Peng Fei BG Gou" <shgoupf@cn.ibm.com> wrote:

> Yes Cyril, your suggestion is fair, we should keep it consistent across a=
ll files in a project. There is always debating between tabs and whitespace=
s. Even though personally I prefer white spaces (that's why my editor autom=
atically convert tab to whitespace for me), I agree that for this project, =
I should use tabs. Will make an update soon.

So not being a Python person I was not all over PEP8 that Andrew mentioned
(which states 4 space indenting), we should probably enforce that all new
Python, even new entire functions/classes be PEP8 but single lines changes
are just going to make the code illegible.  Unfortunately we'll have to live
with whats been written.

I'll send a pull request to the docs I suppose.

> =20
> GOU, Peng Fei (=E8=8B=9F=E9=B9=8F=E9=A3=9E), Ph.D.
> OpenPOWER Enablement.
> +86-21-609-28631
> =20
> =20
> ----- Original message -----
> From: Cyril Bur <cyrilbur@gmail.com>
> To: Peng Fei BG Gou/China/IBM@IBMCN
> Cc: "openbmc" <openbmc@lists.ozlabs.org>, "OpenBMC Patches" <openbmc-patc=
hes@stwcx.xyz>
> Subject: Re: =E5=9B=9E=E5=A4=8D=EF=BC=9A=E5=9B=9E=E5=A4=8D=EF=BC=9A[PATCH=
 phosphor-rest-server] The streaming support for obmc-rest.
> Date: Fri, Jan 29, 2016 10:09 AM
> =20
> On Fri, 29 Jan 2016 00:49:39 +0000
> "Peng Fei BG Gou" <shgoupf@cn.ibm.com> wrote:
>=20
> > And the white space you saw in the email thread and coding is probably =
caused by the mixing use of tab and white space. The original code uses tab=
 for indent, while I prefer to use 4 white spaces for indent. I will discus=
s with Brad regarding the indent convention for our code. Will fix it up if=
 we strictly need tab in our project.
>=20
> In a world where we all have to read each others code, we should make an =
effort
> to not make it hard for everyone. What you have done here is mix different
> indenting styles which only makes it harder to read for everyone to read =
the
> code. Imagine a world where I preferred 8 space indenting and I went thro=
ugh
> and my additions to the file were 8 space indented, this would be impossi=
ble to
> read.
>=20
> Typically when a file has been written in one way, it is left that way un=
less
> that particular way is absolutely abhorrent (5 space indenting...). Tabs =
are a
> perfectly valid way of indenting, I don't see the issue here.
>=20
> Futhurmore, I know this isn't really for python, if in doubt we should pr=
obably
> be falling back to the openbmc/docs/contributing file and I quote:
>=20
> Components of the OpenBMC sources should have consistent style.
>=20
> For C code, we typically use the Linux coding style, which is
> documented at:
>=20
> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Docum=
entation/CodingStyle
>=20
> (unless you want to write a completely separate Python document, and chan=
ge all
> the python in this project, I suggest we follow this one where appropriat=
e)
>=20
> Indent with tabs instead of spaces, set at 8 columns
>=20
> tl;dr
>=20
> Don't mix indenting styles, way too hard to read the code.
>=20
> > =20
> > =20
> > =20
> >  =E5=9C=A8 2016=E5=B9=B41=E6=9C=8829=E6=97=A5=EF=BC=8C=E4=B8=8A=E5=8D=
=888:38:15=EF=BC=8C"Peng Fei BG Gou" <shgoupf@cn.ibm.com> =E5=86=99=E9=81=
=93=EF=BC=9A
> > =20
> >       Python is indent based languang, so the function will fail if we =
have
> > incorrect indenting. I have tested this in real bmc machine so I believ=
e the
> > indenting should be fine for now. Please let Brad review this change si=
nce he
> > is familiar with Python.
> >    =E5=9C=A8 2016=E5=B9=B41=E6=9C=8829=E6=97=A5=EF=BC=8C=E4=B8=8A=E5=8D=
=888:24:58=EF=BC=8C"Cyril Bur" <cyrilbur@gmail.com> =E5=86=99=E9=81=93=EF=
=BC=9A
> >   =20
> >        On Thu, 28 Jan 2016 02:00:37 -0600
> >     OpenBMC Patches  wrote:
> >     > From: shgoupf
> >     > =20
> >     Hi Peng,
> >     So I'm don't really know python all that well but I do believe this
> > language is white space sensitive... I'll let a pythoner respond about =
the
> > rest...
> >     > Changes:
> >     > 1) The main idea of this change is to have a streaming path as be=
low:
> >     >     dbus signal -> obmc-rest capture the dbus signal -> obmc-rest
> >     > notify the client of the signal receiving. 2) Replace rocket with
> >     > gevent WSGI server to support multiple async accesses. 3) Use gev=
ent
> >     > queue to notify the dbus signal receiving. 4) The uri to the stre=
aming
> >     > should be in the form as below: https:////stream/
> >     > ---
> >     >  obmc-rest | 115
> >     > ++++++++++++++++++++++++++++++++++++++++++++++++++++++++------ 1 =
file
> >     > changed, 104 insertions(+), 11 deletions(-) mode change 100644 =
=3D>
> >     > 100755 obmc-rest
> >     >
> >     > diff --git a/obmc-rest b/obmc-rest
> >     > old mode 100644
> >     > new mode 100755
> >     > index c6d2949..481dafa
> >     > --- a/obmc-rest
> >     > +++ b/obmc-rest
> >     > @@ -3,7 +3,9 @@
> >     >  import os
> >     >  import sys
> >     >  import dbus
> >     > +import gobject
> >     >  import dbus.exceptions
> >     > +import dbus.mainloop.glib
> >     >  import json
> >     >  import logging
> >     >  from xml.etree import ElementTree
> >     > @@ -14,6 +16,10 @@ from OpenBMCMapper import Mapper, PathTree,
> >     > IntrospectionNodeParser, ListMatch import spwd
> >     >  import grp
> >     >  import crypt
> >     > +import threading
> >     > +import gevent
> >     > +from gevent.pywsgi import WSGIServer
> >     > +from gevent.queue import Queue
> >     > =20
> >     >  DBUS_UNKNOWN_INTERFACE =3D 'org.freedesktop.UnknownInterface'
> >     >  DBUS_UNKNOWN_METHOD =3D 'org.freedesktop.DBus.Error.UnknownMetho=
d'
> >     > @@ -59,12 +65,13 @@ def makelist(data):
> >     > =20
> >     >  class RouteHandler(object):
> >     >   _require_auth =3D makelist(valid_user)
> >     > - def __init__(self, app, bus, verbs, rules):
> >     > + def __init__(self, app, bus, verbs, rules, skips =3D []):
> >     >   self.app =3D app
> >     >   self.bus =3D bus
> >     >   self.mapper =3D Mapper(bus)
> >     >   self._verbs =3D makelist(verbs)
> >     >   self._rules =3D rules
> >     > +                self._skips =3D skips
> >     > =20
> >     >   def _setup(self, **kw):
> >     >   request.route_data =3D {}
> >     > @@ -79,7 +86,7 @@ class RouteHandler(object):
> >     >   return getattr(self, 'do_' + request.method.lower())(**kw)
> >     > =20
> >     >   def install(self):
> >     > - self.app.route(self._rules, callback =3D self,
> >     &gt; + self.app.route(self._rules, callback =3D self, skip =3D self=
._skips,
> >     >   method =3D ['GET', 'PUT', 'PATCH', 'POST', 'DELETE'])
> >     > =20
> >     >   @staticmethod
> >     > @@ -108,6 +115,58 @@ class RouteHandler(object):
> >     >   return None
> >     >   raise
> >     > =20
> >     > +class SignalHandler(RouteHandler):
> >     > + verbs =3D ['GET']
> >     > + rules =3D '/stream/'
> >     > +
> >     > + def __init__(self, app, bus):
> >     > + super(SignalHandler, self).__init__(
> >     > + app, bus, self.verbs, self.rules)
> >     > +
> >     > + def find(self, path, signal):
> >     > + busses =3D self.try_mapper_call(self.mapper.get_object,
> >     > + path =3D path)
> >     > + for items in busses.iteritems():
> >     > + s =3D self.find_signal_on_bus(path, signal, *items)
> >     > + if s:
> >     > + return s
> >     > +
> >     > + abort(404, _4034_msg %('signal', 'found', signal))
> >     > +
> >     > + def setup(self, path, signal):
> >     > + request.route_data['map'] =3D self.find(path, signal)
> >     > +
> >     > + def do_get(self, path, signal):
> >     > +                body =3D Queue()
> >     > +                dsignal =3D DbusSignal(bus, request.route_data['=
map'][0],
> >     > +                                     request.route_data['map'][1=
],
> >     > path)
> >     > +                dsignal.onData(body.put)
> >     > +                dsignal.onFinish(lambda: body.put(StopIteration))
> >     > +                dsignal.signalSnooping()
> >     > +                return body
> >     > +
> >     > + @staticmethod
> >     > + def find_signal(signal, signals):
> >     > + if signals is None:
> >     > + return None
> >     > +
> >     > + signal =3D find_case_insensitive(signal, signals.keys())
> >     > + if signal is not None:
> >     > +                        return signal
> >     > +
> >     > + def find_signal_on_bus(self, path, signal, bus, interfaces):
> >     > + obj =3D self.bus.get_object(bus, path, introspect =3D False)
> >     > + iface =3D dbus.Interface(obj, dbus.INTROSPECTABLE_IFACE)
> >     > + data =3D iface.Introspect()
> >     > + parser =3D IntrospectionNodeParser(
> >     > + ElementTree.fromstring(data),
> >     > + intf_match =3D ListMatch(interfaces))
> >     > + for x,y in parser.get_interfaces().iteritems():
> >     > + s =3D self.find_signal(signal,
> >     > +                                             y.get('signal'))
> >     > + if s:
> >     > + return (x,s)
> >     > +
> >     >  class DirectoryHandler(RouteHandler):
> >     >   verbs =3D 'GET'
> >     >   rules =3D '/'
> >     > @@ -715,7 +774,8 @@ class RestApp(Bottle):
> >     >   self.install(JSONPlugin(**json_kw))
> >     >   self.install(JsonApiErrorsPlugin(**json_kw))
> >     >   self.install(AuthorizationPlugin())
> >     > - self.install(JsonApiResponsePlugin())
> >     > +                self.json_response_plugin =3D JsonApiResponsePlu=
gin() =20
> >     Indenting?
> >     > + self.install(self.json_response_plugin)
> >     >   self.install(JsonApiRequestPlugin())
> >     >   self.install(JsonApiRequestTypePlugin())
> >     > =20
> >     > @@ -726,6 +786,7 @@ class RestApp(Bottle):
> >     > =20
> >     >   def create_handlers(self):
> >     >   # create route handlers
> >     > + self.signal_handler =3D SignalHandler(self, self.bus)
> >     >   self.session_handler =3D SessionHandler(self, self.bus)
> >     >   self.directory_handler =3D DirectoryHandler(self, self.bus)
> >     >   self.list_names_handler =3D ListNamesHandler(self, self.bus)
> >     > @@ -736,6 +797,11 @@ class RestApp(Bottle):
> >     >   self.instance_handler =3D InstanceHandler(self, self.bus)
> >     > =20
> >     >   def install_handlers(self):
> >     > +                # Skip json response for signal handler because =
it
> >     > requires to
> >     > +                # return a gevent iterable which cannot be handl=
ed by
> >     > json
> >     > +                # response plugin
> >     > +                self.signal_handler._skips =3D
> >     > [self.json_response_plugin] =20
> >     Indenting?
> >     > + self.signal_handler.install()
> >     >   self.session_handler.install()
> >     >   self.directory_handler.install()
> >     >   self.list_names_handler.install()
> >     > @@ -766,21 +832,48 @@ class RestApp(Bottle):
> >     >   parts =3D filter(bool, path.split('/'))
> >     >   request.environ['PATH_INFO'] =3D '/' + '/'.join(parts) + traili=
ng
> >     > =20
> >     > +class DbusSignal():
> >     > +    def __init__(self, bus, dbus_interface, signal_name, path):
> >     > +        # Register the dbus recieve handler
> >     > +        bus.add_signal_receiver(self.signalReciever,
> >     > +                                dbus_interface =3D dbus_interfac=
e,
> >     > +                                signal_name =3D signal_name,
> >     > +                                path =3D path)
> >     > +
> >     > +        self.snooping =3D True
> >     > +
> >     > +    def signalReciever(self, msg):
> >     > +        self.send("Recieved message: %s" % msg)
> >     > +        self.snooping =3D False
> >     > +
> >     > +    def onData(self, send):
> >     > +        self.send =3D send
> >     > +
> >     > +    def onFinish(self, f):
> >     > +        self.finish =3D f
> >     > +
> >     > +    def signalSnooping(self):
> >     > +        while self.snooping:
> >     > +            mainloop =3D gobject.MainLoop()
> >     > +            gevent.sleep(1)
> >     > +            gobject.timeout_add(1, mainloop.quit)
> >     > +            mainloop.run()
> >     > +
> >     > +        self.finish()
> >     > +
> >     >  if __name__ =3D=3D '__main__':
> >     >   log =3D logging.getLogger('Rocket.Errors')
> >     >   log.setLevel(logging.INFO)
> >     >   log.addHandler(logging.StreamHandler(sys.stdout))
> >     > =20
> >     > +        dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue) =
=20
> >     Indenting?
> >     >   bus =3D dbus.SystemBus()
> >     >   app =3D RestApp(bus)
> >     > + =20
> >     ?
> >     >   default_cert =3D os.path.join(sys.prefix, 'share',
> >     >   os.path.basename(__file__), 'cert.pem')
> >     > =20
> >     > - server =3D Rocket(('0.0.0.0',
> >     > - 443,
> >     > - default_cert,
> >     > - default_cert),
> >     > - 'wsgi', {'wsgi_app': app},
> >     > - min_threads =3D 1,
> >     > - max_threads =3D 1)
> >     > - server.start()
> >     > +        server =3D WSGIServer(("0.0.0.0", 443), app, keyfile =3D
> >     > default_cert,
> >     > +                            certfile =3D default_cert)
> >     > +
> >     > +        server.serve_forever() =20
> >     Indenting?
> =20
> =20
>=20
>=20
