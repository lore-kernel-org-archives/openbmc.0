Return-Path: <anoo@us.ibm.com>
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNbLf2711zDq5g
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 23:35:52 +1000 (AEST)
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Mon, 6 Jun 2016 07:35:44 -0600
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 6 Jun 2016 07:35:36 -0600
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id A69DE19D8042
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 07:35:16 -0600 (MDT)
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u56DZa4l38928600
 for <openbmc@lists.ozlabs.org>; Mon, 6 Jun 2016 06:35:36 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24107C6037
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 07:35:36 -0600 (MDT)
Received: from d50lp31.co.us.ibm.com (unknown [9.17.249.32])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS id 0BA70C6043
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 07:35:36 -0600 (MDT)
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Mon, 6 Jun 2016 07:35:35 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 6 Jun 2016 07:35:33 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Mon, 6 Jun 2016 13:35:31 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 6 Jun 2016 13:35:29 -0000
Received: from us1a3-mail52.a3.dal06.isc4sb.com ([10.146.77.168])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016060613352783-294396 ;
 Mon, 6 Jun 2016 13:35:27 +0000 
In-Reply-To: <20160606014044.13538-2-openbmc-patches@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, shgoupf <shgoupf@cn.ibm.com>
Subject: Re: [PATCH phosphor-rest-server v3] The streaming support for
 obmc-rest.
From: "Adriana Kobylak" <anoo@us.ibm.com>
Date: Mon, 6 Jun 2016 08:35:28 -0500
References: <20160606014044.13538-1-openbmc-patches@stwcx.xyz>
 <20160606014044.13538-2-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
X-KeepSent: 5D3B7F09:2F9BCFA6-86257FCA:004A7797;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF692 April 27, 2016
X-LLNOutbound: False
X-Disclaimed: 21283
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 004AA7B086257FCA_="
x-cbid: 16060613-0005-0000-0000-000075E0A6C0
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.126314; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005345; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000168; SDB=6.00712736; UDB=6.00331581; UTC=2016-06-06
 13:35:30
x-cbparentid: 16060613-5938-0000-0000-000003FBFB64
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <20160606133536.0BA70C6043@b03ledav006.gho.boulder.ibm.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Jun 2016 13:35:55 -0000


--=_alternative 004AA7B086257FCA_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

Thanks Peng, seems the indentation Cyril pointed out on the first version=20
has been addressed. Perhaps Brad can give a final approval next.


"openbmc" <openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org> wrote on=20
06/05/2016 08:40:44 PM:

> From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
> To: openbmc@lists.ozlabs.org
> Cc: shgoupf <shgoupf@cn.ibm.com>
> Date: 06/05/2016 08:41 PM
> Subject: [PATCH phosphor-rest-server v3] The streaming support for=20
obmc-rest.
> Sent by: "openbmc" <openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org>
>=20
> From: shgoupf <shgoupf@cn.ibm.com>
>=20
> Changes:
> 1) The main idea of this change is to have a streaming path as below:
>     dbus signal -> obmc-rest capture the dbus signal -> obmc-rest=20
> notify the client of the signal receiving.
> 2) Replace rocket with gevent WSGI server to support multiple async=20
accesses.
> 3) Use gevent queue to notify the dbus signal receiving.
> 4) The uri to the streaming should be in the form as below:
>     https://<ip>/<path>/stream/<signal=5Fname>
> ---
>  obmc-rest | 118 +++++++++++++++++++++++++++++++++++++++++++++++++++
> ++++-------
>  1 file changed, 106 insertions(+), 12 deletions(-)
>  mode change 100644 =3D> 100755 obmc-rest
>=20
> diff --git a/obmc-rest b/obmc-rest
> old mode 100644
> new mode 100755
> index e7dbbba..304cb41
> --- a/obmc-rest
> +++ b/obmc-rest
> @@ -19,7 +19,9 @@
>  import os
>  import sys
>  import dbus
> +import gobject
>  import dbus.exceptions
> +import dbus.mainloop.glib
>  import json
>  import logging
>  from xml.etree import ElementTree
> @@ -32,6 +34,10 @@ import obmc.mapper
>  import spwd
>  import grp
>  import crypt
> +import threading
> +import gevent
> +from gevent.pywsgi import WSGIServer
> +from gevent.queue import Queue
>=20
>  DBUS=5FUNKNOWN=5FINTERFACE =3D 'org.freedesktop.UnknownInterface'
>  DBUS=5FUNKNOWN=5FINTERFACE=5FERROR =3D=20
'org.freedesktop.DBus.Error.UnknownInterface'
> @@ -72,13 +78,14 @@ class UserInGroup:
>  class RouteHandler(object):
>      =5Frequire=5Fauth =3D obmc.utils.misc.makelist(valid=5Fuser)
>=20
> -    def =5F=5Finit=5F=5F(self, app, bus, verbs, rules):
> +    def =5F=5Finit=5F=5F(self, app, bus, verbs, rules, skips=3D[]):
>          self.app =3D app
>          self.bus =3D bus
>          self.mapper =3D obmc.mapper.Mapper(bus)
>          self.=5Fverbs =3D obmc.utils.misc.makelist(verbs)
>          self.=5Frules =3D rules
>          self.intf=5Fmatch =3D obmc.utils.misc.org=5Fdot=5Fopenbmc=5Fmatch
> +        self.=5Fskips =3D skips
>=20
>      def =5Fsetup(self, **kw):
>          request.route=5Fdata =3D {}
> @@ -94,7 +101,7 @@ class RouteHandler(object):
>=20
>      def install(self):
>          self.app.route(
> -            self.=5Frules, callback=3Dself,
> +            self.=5Frules, callback=3Dself, skip=3Dself.=5Fskips,
>              method=3D['GET', 'PUT', 'PATCH', 'POST', 'DELETE'])
>=20
>      @staticmethod
> @@ -126,6 +133,57 @@ class RouteHandler(object):
>                  return None
>              raise
>=20
> +class SignalHandler(RouteHandler):
> +    verbs =3D ['GET']
> +    rules =3D '<path:path>/stream/<signal>'
> +
> +    def =5F=5Finit=5F=5F(self, app, bus):
> +        super(SignalHandler, self).=5F=5Finit=5F=5F(
> +                app, bus, self.verbs, self.rules)
> +
> +    def find(self, path, signal):
> +        busses =3D self.try=5Fmapper=5Fcall(self.mapper.get=5Fobject,
> +                path =3D path)
> +        for items in busses.iteritems():
> +            s =3D self.find=5Fsignal=5Fon=5Fbus(path, signal, *items)
> +            if s:
> +                return s
> +
> +        abort(404, =5F4034=5Fmsg %('signal', 'found', signal))
> +
> +    def setup(self, path, signal):
> +        request.route=5Fdata['map'] =3D self.find(path, signal)
> +
> +    def do=5Fget(self, path, signal):
> +                body =3D Queue()
> +                dsignal =3D DbusSignal(bus, request.route=5Fdata['map'][=
0],
> +                                     request.route=5Fdata['map'][1],=20
path)
> +                dsignal.onData(body.put)
> +                dsignal.onFinish(lambda: body.put(StopIteration))
> +                dsignal.signalSnooping()
> +                return body
> +
> +    @staticmethod
> +    def find=5Fsignal(signal, signals):
> +        if signals is None:
> +            return None
> +
> +        signal =3D find=5Fcase=5Finsensitive(signal, signals.keys())
> +        if signal is not None:
> +                        return signal
> +
> +    def find=5Fsignal=5Fon=5Fbus(self, path, signal, bus, interfaces):
> +        obj =3D self.bus.get=5Fobject(bus, path, introspect =3D False)
> +        iface =3D dbus.Interface(obj, dbus.INTROSPECTABLE=5FIFACE)
> +        data =3D iface.Introspect()
> +        parser =3D IntrospectionNodeParser(
> +                ElementTree.fromstring(data),
> +                intf=5Fmatch =3D ListMatch(interfaces))
> +        for x,y in parser.get=5Finterfaces().iteritems():
> +            s =3D self.find=5Fsignal(signal,
> +                                             y.get('signal'))
> +            if s:
> +                return (x,s)
>=20
>  class DirectoryHandler(RouteHandler):
>      verbs =3D 'GET'
> @@ -702,7 +760,8 @@ class RestApp(Bottle):
>          self.install(AuthorizationPlugin())
>          self.install(JsonpPlugin(**json=5Fkw))
>          self.install(JSONPlugin(**json=5Fkw))
> -        self.install(JsonApiResponsePlugin())
> +        self.json=5Fresponse=5Fplugin =3D JsonApiResponsePlugin()
> +        self.install(self.json=5Fresponse=5Fplugin)
>          self.install(JsonApiRequestPlugin())
>          self.install(JsonApiRequestTypePlugin())
>=20
> @@ -713,6 +772,7 @@ class RestApp(Bottle):
>=20
>      def create=5Fhandlers(self):
>          # create route handlers
> +        self.signal=5Fhandler =3D SignalHandler(self, self.bus)
>          self.session=5Fhandler =3D SessionHandler(self, self.bus)
>          self.directory=5Fhandler =3D DirectoryHandler(self, self.bus)
>          self.list=5Fnames=5Fhandler =3D ListNamesHandler(self, self.bus)
> @@ -723,6 +783,11 @@ class RestApp(Bottle):
>          self.instance=5Fhandler =3D InstanceHandler(self, self.bus)
>=20
>      def install=5Fhandlers(self):
> +        # Skip json response for signal handler because it requires to
> +        # return a gevent iterable which cannot be handled by json
> +        # response plugin
> +        self.signal=5Fhandler.=5Fskips =3D [self.json=5Fresponse=5Fplugi=
n]
> +        self.signal=5Fhandler.install()
>          self.session=5Fhandler.install()
>          self.directory=5Fhandler.install()
>          self.list=5Fnames=5Fhandler.install()
> @@ -754,19 +819,48 @@ class RestApp(Bottle):
>          parts =3D filter(bool, path.split('/'))
>          request.environ['PATH=5FINFO'] =3D '/' + '/'.join(parts) + trail=
ing
>=20
> +class DbusSignal():
> +    def =5F=5Finit=5F=5F(self, bus, dbus=5Finterface, signal=5Fname, pat=
h):
> +        # Register the dbus recieve handler
> +        bus.add=5Fsignal=5Freceiver(self.signalReciever,
> +                                dbus=5Finterface =3D dbus=5Finterface,
> +                                signal=5Fname =3D signal=5Fname,
> +                                path =3D path)
> +
> +        self.snooping =3D True
> +
> +    def signalReciever(self, msg):
> +        self.send("Recieved message: %s" % msg)
> +        self.snooping =3D False
> +
> +    def onData(self, send):
> +        self.send =3D send
> +
> +    def onFinish(self, f):
> +        self.finish =3D f
> +
> +    def signalSnooping(self):
> +        while self.snooping:
> +            mainloop =3D gobject.MainLoop()
> +            gevent.sleep(1)
> +            gobject.timeout=5Fadd(1, mainloop.quit)
> +            mainloop.run()
> +
> +        self.finish()
> +
>  if =5F=5Fname=5F=5F =3D=3D '=5F=5Fmain=5F=5F':
>      log =3D logging.getLogger('Rocket.Errors')
>      log.setLevel(logging.INFO)
>      log.addHandler(logging.StreamHandler(sys.stdout))
>=20
> +    dbus.mainloop.glib.DBusGMainLoop(set=5Fas=5Fdefault=3DTrue)
>      bus =3D dbus.SystemBus()
>      app =3D RestApp(bus)
> -    default=5Fcert =3D os.path.join(
> -        sys.prefix, 'share', os.path.basename(=5F=5Ffile=5F=5F), 'cert.p=
em')
> -
> -    server =3D Rocket(
> -        ('0.0.0.0', 443, default=5Fcert, default=5Fcert),
> -        'wsgi', {'wsgi=5Fapp': app},
> -        min=5Fthreads=3D1,
> -        max=5Fthreads=3D1)
> -    server.start()
> +
> +    default=5Fcert =3D os.path.join(sys.prefix, 'share',
> +            os.path.basename(=5F=5Ffile=5F=5F), 'cert.pem')
> +
> +    server =3D WSGIServer(("0.0.0.0", 443), app, keyfile =3D default=5Fc=
ert,
> +                        certfile =3D default=5Fcert)
> +
> +    server.serve=5Fforever()
> --=20
> 2.8.3
>=20
>=20
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc



--=_alternative 004AA7B086257FCA_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<font size=3D2 face=3D"sans-serif">Thanks Peng, seems the indentation Cyril
pointed out on the first version has been addressed. Perhaps Brad can give
a final approval next.</font><br><br><br><tt><font size=3D2>&quot;openbmc&q=
uot; &lt;openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org&gt;
wrote on 06/05/2016 08:40:44 PM:<br><br>&gt; From: OpenBMC Patches &lt;open=
bmc-patches@stwcx.xyz&gt;</font></tt><br><tt><font size=3D2>&gt; To: openbm=
c@lists.ozlabs.org</font></tt><br><tt><font size=3D2>&gt; Cc: shgoupf &lt;s=
hgoupf@cn.ibm.com&gt;</font></tt><br><tt><font size=3D2>&gt; Date: 06/05/20=
16 08:41 PM</font></tt><br><tt><font size=3D2>&gt; Subject: [PATCH phosphor=
-rest-server v3] The
streaming support for obmc-rest.</font></tt><br><tt><font size=3D2>&gt; Sen=
t by: &quot;openbmc&quot; &lt;openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlab=
s.org&gt;</font></tt><br><tt><font size=3D2>&gt; <br>&gt; From: shgoupf &lt=
;shgoupf@cn.ibm.com&gt;<br>&gt; <br>&gt; Changes:<br>&gt; 1) The main idea =
of this change is to have a streaming path as below:<br>&gt; &nbsp; &nbsp; =
dbus signal -&gt; obmc-rest capture the dbus signal
-&gt; obmc-rest <br>&gt; notify the client of the signal receiving.<br>&gt;=
 2) Replace rocket with gevent WSGI server to support multiple async
accesses.<br>&gt; 3) Use gevent queue to notify the dbus signal receiving.<=
br>&gt; 4) The uri to the streaming should be in the form as below:<br>&gt;=
 &nbsp; &nbsp; https://&lt;ip&gt;/&lt;path&gt;/stream/&lt;signal=5Fname&gt;=
<br>&gt; ---<br>&gt; &nbsp;obmc-rest | 118 ++++++++++++++++++++++++++++++++=
+++++++++++++++++++<br>&gt; ++++-------<br>&gt; &nbsp;1 file changed, 106 i=
nsertions(+), 12 deletions(-)<br>&gt; &nbsp;mode change 100644 =3D&gt; 1007=
55 obmc-rest<br>&gt; <br>&gt; diff --git a/obmc-rest b/obmc-rest<br>&gt; ol=
d mode 100644<br>&gt; new mode 100755<br>&gt; index e7dbbba..304cb41<br>&gt=
; --- a/obmc-rest<br>&gt; +++ b/obmc-rest<br>&gt; @@ -19,7 +19,9 @@<br>&gt;=
 &nbsp;import os<br>&gt; &nbsp;import sys<br>&gt; &nbsp;import dbus<br>&gt;=
 +import gobject<br>&gt; &nbsp;import dbus.exceptions<br>&gt; +import dbus.=
mainloop.glib<br>&gt; &nbsp;import json<br>&gt; &nbsp;import logging<br>&gt=
; &nbsp;from xml.etree import ElementTree<br>&gt; @@ -32,6 +34,10 @@ import=
 obmc.mapper<br>&gt; &nbsp;import spwd<br>&gt; &nbsp;import grp<br>&gt; &nb=
sp;import crypt<br>&gt; +import threading<br>&gt; +import gevent<br>&gt; +f=
rom gevent.pywsgi import WSGIServer<br>&gt; +from gevent.queue import Queue=
<br>&gt; &nbsp;<br>&gt; &nbsp;DBUS=5FUNKNOWN=5FINTERFACE =3D 'org.freedeskt=
op.UnknownInterface'<br>&gt; &nbsp;DBUS=5FUNKNOWN=5FINTERFACE=5FERROR =3D '=
org.freedesktop.DBus.Error.UnknownInterface'<br>&gt; @@ -72,13 +78,14 @@ cl=
ass UserInGroup:<br>&gt; &nbsp;class RouteHandler(object):<br>&gt; &nbsp; &=
nbsp; &nbsp;=5Frequire=5Fauth =3D obmc.utils.misc.makelist(valid=5Fuser)<br=
>&gt; &nbsp;<br>&gt; - &nbsp; &nbsp;def =5F=5Finit=5F=5F(self, app, bus, ve=
rbs, rules):<br>&gt; + &nbsp; &nbsp;def =5F=5Finit=5F=5F(self, app, bus, ve=
rbs, rules, skips=3D[]):<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.app=
 =3D app<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.bus =3D bus<br>&gt;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.mapper =3D obmc.mapper.Mapper(bus)<=
br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.=5Fverbs =3D obmc.utils.misc=
.makelist(verbs)<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.=5Frules =
=3D rules<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.intf=5Fmatch =3D o=
bmc.utils.misc.org=5Fdot=5Fopenbmc=5Fmatch<br>&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp;self.=5Fskips =3D skips<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp;def=
 =5Fsetup(self, **kw):<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;request.ro=
ute=5Fdata =3D {}<br>&gt; @@ -94,7 +101,7 @@ class RouteHandler(object):<br=
>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp;def install(self):<br>&gt; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;self.app.route(<br>&gt; - &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;self.=5Frules, callback=3Dself,<br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;self.=5Frules, callback=3Dself,
skip=3Dself.=5Fskips,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;method=3D['GET', 'PUT',
'PATCH', 'POST', 'DELETE'])<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp;@sta=
ticmethod<br>&gt; @@ -126,6 +133,57 @@ class RouteHandler(object):<br>&gt; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
None<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;raise<br>&gt; =
&nbsp;<br>&gt; +class SignalHandler(RouteHandler):<br>&gt; + &nbsp; &nbsp;v=
erbs =3D ['GET']<br>&gt; + &nbsp; &nbsp;rules =3D '&lt;path:path&gt;/stream=
/&lt;signal&gt;'<br>&gt; +<br>&gt; + &nbsp; &nbsp;def =5F=5Finit=5F=5F(self=
, app, bus):<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;super(SignalHandler, self=
).=5F=5Finit=5F=5F(<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;app, bus,
self.verbs, self.rules)<br>&gt; +<br>&gt; + &nbsp; &nbsp;def find(self, pat=
h, signal):<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;busses =3D self.try=5Fmapp=
er=5Fcall(self.mapper.get=5Fobject,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;path =3D path)<br>&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp;for items in busses.iteritems():<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;s =3D self.find=5Fsignal=5Fon=5Fbus(path,
signal, *items)<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if s:<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return s<br>=
&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;abort(404, =5F4034=5Fmsg %('sig=
nal', 'found',
signal))<br>&gt; +<br>&gt; + &nbsp; &nbsp;def setup(self, path, signal):<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;request.route=5Fdata['map'] =3D self.fin=
d(path,
signal)<br>&gt; +<br>&gt; + &nbsp; &nbsp;def do=5Fget(self, path, signal):<=
br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;body =3D Q=
ueue()<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dsi=
gnal =3D
DbusSignal(bus, request.route=5Fdata['map'][0],<br>&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; request.route=5Fdat=
a['map'][1],
path)<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dsig=
nal.onData(body.put)<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;dsignal.onFinish(lambda:
body.put(StopIteration))<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;dsignal.signalSnooping()<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;return body<br>&gt; +<br>&gt; + &nbsp; &nbsp;=
@staticmethod<br>&gt; + &nbsp; &nbsp;def find=5Fsignal(signal, signals):<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if signals is None:<br>&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;return None<br>&gt; +<br>&gt; + &nbsp; &nbsp=
; &nbsp; &nbsp;signal =3D find=5Fcase=5Finsensitive(signal,
signals.keys())<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if signal is not None:=
<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;
&nbsp; &nbsp;return signal<br>&gt; +<br>&gt; + &nbsp; &nbsp;def find=5Fsign=
al=5Fon=5Fbus(self, path, signal, bus, interfaces):<br>&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp;obj =3D self.bus.get=5Fobject(bus, path,
introspect =3D False)<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;iface =3D dbus.I=
nterface(obj, dbus.INTROSPECTABLE=5FIFACE)<br>&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp;data =3D iface.Introspect()<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;parse=
r =3D IntrospectionNodeParser(<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;ElementTree.fromstring(data),<br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;intf=5Fmatch
=3D ListMatch(interfaces))<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;for x,y in =
parser.get=5Finterfaces().iteritems():<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;s =3D self.find=5Fsignal(signal,<br>&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; y.get('signal'))<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
if s:<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;retu=
rn (x,s)<br>&gt; &nbsp;<br>&gt; &nbsp;class DirectoryHandler(RouteHandler):=
<br>&gt; &nbsp; &nbsp; &nbsp;verbs =3D 'GET'<br>&gt; @@ -702,7 +760,8 @@ cl=
ass RestApp(Bottle):<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.install=
(AuthorizationPlugin())<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.inst=
all(JsonpPlugin(**json=5Fkw))<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sel=
f.install(JSONPlugin(**json=5Fkw))<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;sel=
f.install(JsonApiResponsePlugin())<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;sel=
f.json=5Fresponse=5Fplugin =3D JsonApiResponsePlugin()<br>&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp;self.install(self.json=5Fresponse=5Fplugin)<br>&gt; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;self.install(JsonApiRequestPlugin())<br>&gt; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;self.install(JsonApiRequestTypePlugin())<br=
>&gt; &nbsp;<br>&gt; @@ -713,6 +772,7 @@ class RestApp(Bottle):<br>&gt; &nb=
sp;<br>&gt; &nbsp; &nbsp; &nbsp;def create=5Fhandlers(self):<br>&gt; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;# create route handlers<br>&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp;self.signal=5Fhandler =3D SignalHandler(self,
self.bus)<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.session=5Fhandler =
=3D SessionHandler(self,
self.bus)<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.directory=5Fhandle=
r =3D DirectoryHandler(self,
self.bus)<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.list=5Fnames=5Fhan=
dler =3D ListNamesHandler(self,
self.bus)<br>&gt; @@ -723,6 +783,11 @@ class RestApp(Bottle):<br>&gt; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;self.instance=5Fhandler =3D InstanceHandler(se=
lf,
self.bus)<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp;def install=5Fhandlers=
(self):<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;# Skip json response for signa=
l handler
because it requires to<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;# return a geve=
nt iterable which cannot
be handled by json<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;# response plugin<b=
r>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;self.signal=5Fhandler.=5Fskips =3D [sel=
f.json=5Fresponse=5Fplugin]<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;self.signa=
l=5Fhandler.install()<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.sessio=
n=5Fhandler.install()<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.direct=
ory=5Fhandler.install()<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.list=
=5Fnames=5Fhandler.install()<br>&gt; @@ -754,19 +819,48 @@ class RestApp(Bo=
ttle):<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;parts =3D filter(bool, pat=
h.split('/'))<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;request.environ['PA=
TH=5FINFO'] =3D '/'
+ '/'.join(parts) + trailing<br>&gt; &nbsp;<br>&gt; +class DbusSignal():<br=
>&gt; + &nbsp; &nbsp;def =5F=5Finit=5F=5F(self, bus, dbus=5Finterface, sign=
al=5Fname,
path):<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;# Register the dbus recieve han=
dler<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;bus.add=5Fsignal=5Freceiver(self.=
signalReciever,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dbus=5Finterface =3D dbus=5Finterf=
ace,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;signal=5Fname =3D signal=5Fname,<b=
r>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;path =3D path)<br>&gt; +<br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp;self.snooping =3D True<br>&gt; +<br>&gt; + &nbs=
p; &nbsp;def signalReciever(self, msg):<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p;self.send(&quot;Recieved message: %s&quot;
% msg)<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;self.snooping =3D False<br>&gt;=
 +<br>&gt; + &nbsp; &nbsp;def onData(self, send):<br>&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp;self.send =3D send<br>&gt; +<br>&gt; + &nbsp; &nbsp;def onFinis=
h(self, f):<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;self.finish =3D f<br>&gt; =
+<br>&gt; + &nbsp; &nbsp;def signalSnooping(self):<br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp;while self.snooping:<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;mainloop =3D gobject.MainLoop()<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;gevent.sleep(1)<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;gobject.timeout=5Fadd(1,
mainloop.quit)<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mainloop.=
run()<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;self.finish()<br>&gt; =
+<br>&gt; &nbsp;if =5F=5Fname=5F=5F =3D=3D '=5F=5Fmain=5F=5F':<br>&gt; &nbs=
p; &nbsp; &nbsp;log =3D logging.getLogger('Rocket.Errors')<br>&gt; &nbsp; &=
nbsp; &nbsp;log.setLevel(logging.INFO)<br>&gt; &nbsp; &nbsp; &nbsp;log.addH=
andler(logging.StreamHandler(sys.stdout))<br>&gt; &nbsp;<br>&gt; + &nbsp; &=
nbsp;dbus.mainloop.glib.DBusGMainLoop(set=5Fas=5Fdefault=3DTrue)<br>&gt; &n=
bsp; &nbsp; &nbsp;bus =3D dbus.SystemBus()<br>&gt; &nbsp; &nbsp; &nbsp;app =
=3D RestApp(bus)<br>&gt; - &nbsp; &nbsp;default=5Fcert =3D os.path.join(<br=
>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;sys.prefix, 'share', os.path.basename(=
=5F=5Ffile=5F=5F),
'cert.pem')<br>&gt; -<br>&gt; - &nbsp; &nbsp;server =3D Rocket(<br>&gt; - &=
nbsp; &nbsp; &nbsp; &nbsp;('0.0.0.0', 443, default=5Fcert, default=5Fcert),=
<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;'wsgi', {'wsgi=5Fapp': app},<br>&gt; =
- &nbsp; &nbsp; &nbsp; &nbsp;min=5Fthreads=3D1,<br>&gt; - &nbsp; &nbsp; &nb=
sp; &nbsp;max=5Fthreads=3D1)<br>&gt; - &nbsp; &nbsp;server.start()<br>&gt; =
+<br>&gt; + &nbsp; &nbsp;default=5Fcert =3D os.path.join(sys.prefix, 'share=
',<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;os.path.basename(=5F=
=5Ffile=5F=5F),
'cert.pem')<br>&gt; +<br>&gt; + &nbsp; &nbsp;server =3D WSGIServer((&quot;0=
.0.0.0&quot;, 443), app,
keyfile =3D default=5Fcert,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;certfile =3D default=5Fcert)<br>&gt; +<br>&gt; + &nbsp; &nbsp;=
server.serve=5Fforever()<br>&gt; -- <br>&gt; 2.8.3<br>&gt; <br>&gt; <br>&gt=
; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&g=
t; openbmc mailing list<br>&gt; openbmc@lists.ozlabs.org<br>&gt; </font></t=
t><a href=3Dhttps://lists.ozlabs.org/listinfo/openbmc><tt><font size=3D2>ht=
tps://lists.ozlabs.org/listinfo/openbmc</font></tt></a><tt><font size=3D2><=
br></font></tt><BR>
--=_alternative 004AA7B086257FCA_=--
