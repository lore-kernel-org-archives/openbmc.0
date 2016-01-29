Return-Path: <shgoupf@cn.ibm.com>
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CDD631A1052
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 11:39:05 +1100 (AEDT)
Received: from localhost
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Fri, 29 Jan 2016 10:39:03 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 29 Jan 2016 10:39:03 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: shgoupf@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 0A6532BB0055
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 11:39:03 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0T0cihQ47055086
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 11:38:52 +1100
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0T0cUl8011129
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 11:38:30 +1100
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0T0cStp010751
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 11:38:29 +1100
Message-Id: <201601290038.u0T0cStp010751@d23av04.au.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Thu, 28 Jan 2016 17:38:20 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 28 Jan 2016 17:38:18 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: shgoupf@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Fri, 29 Jan 2016 00:38:17 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.94)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 29 Jan 2016 00:38:15 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016012900392106-488144 ;
 Fri, 29 Jan 2016 00:39:21 +0000 
To: "Cyril Bur" <cyrilbur@gmail.com>
In-Reply-To: <20160129112337.6d6d6b9b@camb691>
Date: Fri, 29 Jan 2016 00:38:15 +0000
From: "Peng Fei BG Gou" <shgoupf@cn.ibm.com>
Subject: =?GB2312?B?u9i4tKO6W1BBVENIIHBob3NwaG9yLXJlc3Qtc2VydmVyXSBUaGU=?=
 =?GB2312?B?IHN0cmVhbWluZyBzdXBwb3J0IGZvciBvYm1jLXJlc3Qu?=
Cc: "openbmc" <openbmc@lists.ozlabs.org>, "OpenBMC Patches"
 <openbmc-patches@stwcx.xyz>
Importance: Normal
MIME-Version: 1.0
X-Mailer: IBM Traveler 9.0.1.9 Build 201601162041_30
X-KeepSent: 66059493:03804909-00257F49:000380B3;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 32347
X-TNEFEvaluated: 1
Content-Type: multipart/alternative; 
 boundary="----=_Part_102_1664705337.1454027895667"
x-cbid: 16012900-0005-0000-0000-00000336D427
X-IBM-ISS-SpamDetectors: Score=0.43978; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.43978; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004848; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000138; SDB=6.00651998; UDB=6.00295074; UTC=2016-01-29
 00:38:16
x-cbparentid: 16012900-4778-0000-0000-000001C47A46
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
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
X-List-Received-Date: Fri, 29 Jan 2016 00:39:06 -0000


------=_Part_102_1664705337.1454027895667
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Python is indent based languang, so the function will fail if we have incor=
rect indenting. I have tested this in real bmc machine so I believe the ind=
enting should be fine for now. Please let Brad review this change since he =
is familiar with Python.
=20
=20
=20
 =E5=9C=A8 2016=E5=B9=B41=E6=9C=8829=E6=97=A5=EF=BC=8C=E4=B8=8A=E5=8D=888:2=
4:58=EF=BC=8C"Cyril Bur" <cyrilbur@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
=20
   On Thu, 28 Jan 2016 02:00:37 -0600
  OpenBMC Patches  wrote:
  > From: shgoupf=20
  >=20
  Hi Peng,
  So I'm don't really know python all that well but I do believe this langu=
age is
  white space sensitive... I'll let a pythoner respond about the rest...
  > Changes:
  > 1) The main idea of this change is to have a streaming path as below:
  >     dbus signal -> obmc-rest capture the dbus signal -> obmc-rest notif=
y the client of the signal receiving.
  > 2) Replace rocket with gevent WSGI server to support multiple async acc=
esses.
  > 3) Use gevent queue to notify the dbus signal receiving.
  > 4) The uri to the streaming should be in the form as below:
  >     https:////stream/
  > ---
  >  obmc-rest | 115 ++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++------
  >  1 file changed, 104 insertions(+), 11 deletions(-)
  >  mode change 100644 =3D> 100755 obmc-rest
  >=20
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
  > @@ -14,6 +16,10 @@ from OpenBMCMapper import Mapper, PathTree, Introspe=
ctionNodeParser, ListMatch
  >  import spwd
  >  import grp
  >  import crypt
  > +import threading
  > +import gevent
  > +from gevent.pywsgi import WSGIServer
  > +from gevent.queue import Queue
  > =20
  >  DBUS=5FUNKNOWN=5FINTERFACE =3D 'org.freedesktop.UnknownInterface'
  >  DBUS=5FUNKNOWN=5FMETHOD =3D 'org.freedesktop.DBus.Error.UnknownMethod'
  > @@ -59,12 +65,13 @@ def makelist(data):
  > =20
  >  class RouteHandler(object):
  >   =5Frequire=5Fauth =3D makelist(valid=5Fuser)
  > - def =5F=5Finit=5F=5F(self, app, bus, verbs, rules):
  > + def =5F=5Finit=5F=5F(self, app, bus, verbs, rules, skips =3D []):
  >   self.app =3D app
  >   self.bus =3D bus
  >   self.mapper =3D Mapper(bus)
  >   self.=5Fverbs =3D makelist(verbs)
  >   self.=5Frules =3D rules
  > +                self.=5Fskips =3D skips
  > =20
  >   def =5Fsetup(self, **kw):
  >   request.route=5Fdata =3D {}
  > @@ -79,7 +86,7 @@ class RouteHandler(object):
  >   return getattr(self, 'do=5F' + request.method.lower())(**kw)
  > =20
  >   def install(self):
  > - self.app.route(self.=5Frules, callback =3D self,
  > + self.app.route(self.=5Frules, callback =3D self, skip =3D self.=5Fski=
ps,
  >   method =3D ['GET', 'PUT', 'PATCH', 'POST', 'DELETE'])
  > =20
  >   @staticmethod
  > @@ -108,6 +115,58 @@ class RouteHandler(object):
  >   return None
  >   raise
  > =20
  > +class SignalHandler(RouteHandler):
  > + verbs =3D ['GET']
  > + rules =3D '/stream/'
  > +
  > + def =5F=5Finit=5F=5F(self, app, bus):
  > + super(SignalHandler, self).=5F=5Finit=5F=5F(
  > + app, bus, self.verbs, self.rules)
  > +
  > + def find(self, path, signal):
  > + busses =3D self.try=5Fmapper=5Fcall(self.mapper.get=5Fobject,
  > + path =3D path)
  > + for items in busses.iteritems():
  > + s =3D self.find=5Fsignal=5Fon=5Fbus(path, signal, *items)
  > + if s:
  > + return s
  > +
  > + abort(404, =5F4034=5Fmsg %('signal', 'found', signal))
  > +
  > + def setup(self, path, signal):
  > + request.route=5Fdata['map'] =3D self.find(path, signal)
  > +
  > + def do=5Fget(self, path, signal):
  > +                body =3D Queue()
  > +                dsignal =3D DbusSignal(bus, request.route=5Fdata['map'=
][0],
  > +                                     request.route=5Fdata['map'][1], p=
ath)
  > +                dsignal.onData(body.put)
  > +                dsignal.onFinish(lambda: body.put(StopIteration))
  > +                dsignal.signalSnooping()
  > +                return body
  > +
  > + @staticmethod
  > + def find=5Fsignal(signal, signals):
  > + if signals is None:
  > + return None
  > +
  > + signal =3D find=5Fcase=5Finsensitive(signal, signals.keys())
  > + if signal is not None:
  > +                        return signal
  > +
  > + def find=5Fsignal=5Fon=5Fbus(self, path, signal, bus, interfaces):
  > + obj =3D self.bus.get=5Fobject(bus, path, introspect =3D False)
  > + iface =3D dbus.Interface(obj, dbus.INTROSPECTABLE=5FIFACE)
  > + data =3D iface.Introspect()
  > + parser =3D IntrospectionNodeParser(
  > + ElementTree.fromstring(data),
  > + intf=5Fmatch =3D ListMatch(interfaces))
  > + for x,y in parser.get=5Finterfaces().iteritems():
  > + s =3D self.find=5Fsignal(signal,
  > +                                             y.get('signal'))
  > + if s:
  > + return (x,s)
  > +
  >  class DirectoryHandler(RouteHandler):
  >   verbs =3D 'GET'
  >   rules =3D '/'
  > @@ -715,7 +774,8 @@ class RestApp(Bottle):
  >   self.install(JSONPlugin(**json=5Fkw))
  >   self.install(JsonApiErrorsPlugin(**json=5Fkw))
  >   self.install(AuthorizationPlugin())
  > - self.install(JsonApiResponsePlugin())
  > +                self.json=5Fresponse=5Fplugin =3D JsonApiResponsePlugi=
n()
  Indenting?
  > + self.install(self.json=5Fresponse=5Fplugin)
  >   self.install(JsonApiRequestPlugin())
  >   self.install(JsonApiRequestTypePlugin())
  > =20
  > @@ -726,6 +786,7 @@ class RestApp(Bottle):
  > =20
  >   def create=5Fhandlers(self):
  >   # create route handlers
  > + self.signal=5Fhandler =3D SignalHandler(self, self.bus)
  >   self.session=5Fhandler =3D SessionHandler(self, self.bus)
  >   self.directory=5Fhandler =3D DirectoryHandler(self, self.bus)
  >   self.list=5Fnames=5Fhandler =3D ListNamesHandler(self, self.bus)
  > @@ -736,6 +797,11 @@ class RestApp(Bottle):
  >   self.instance=5Fhandler =3D InstanceHandler(self, self.bus)
  > =20
  >   def install=5Fhandlers(self):
  > +                # Skip json response for signal handler because it req=
uires to
  > +                # return a gevent iterable which cannot be handled by =
json
  > +                # response plugin
  > +                self.signal=5Fhandler.=5Fskips =3D [self.json=5Frespon=
se=5Fplugin]
  Indenting?
  > + self.signal=5Fhandler.install()
  >   self.session=5Fhandler.install()
  >   self.directory=5Fhandler.install()
  >   self.list=5Fnames=5Fhandler.install()
  > @@ -766,21 +832,48 @@ class RestApp(Bottle):
  >   parts =3D filter(bool, path.split('/'))
  >   request.environ['PATH=5FINFO'] =3D '/' + '/'.join(parts) + trailing
  > =20
  > +class DbusSignal():
  > +    def =5F=5Finit=5F=5F(self, bus, dbus=5Finterface, signal=5Fname, p=
ath):
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
  >   log =3D logging.getLogger('Rocket.Errors')
  >   log.setLevel(logging.INFO)
  >   log.addHandler(logging.StreamHandler(sys.stdout))
  > =20
  > +        dbus.mainloop.glib.DBusGMainLoop(set=5Fas=5Fdefault=3DTrue)
  Indenting?
  >   bus =3D dbus.SystemBus()
  >   app =3D RestApp(bus)
  > +
  ?
  >   default=5Fcert =3D os.path.join(sys.prefix, 'share',
  >   os.path.basename(=5F=5Ffile=5F=5F), 'cert.pem')
  > =20
  > - server =3D Rocket(('0.0.0.0',
  > - 443,
  > - default=5Fcert,
  > - default=5Fcert),
  > - 'wsgi', {'wsgi=5Fapp': app},
  > - min=5Fthreads =3D 1,
  > - max=5Fthreads =3D 1)
  > - server.start()
  > +        server =3D WSGIServer(("0.0.0.0", 443), app, keyfile =3D defau=
lt=5Fcert,
  > +                            certfile =3D default=5Fcert)
  > +
  > +        server.serve=5Fforever()
  Indenting?

------=_Part_102_1664705337.1454027895667
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8

<html><head><META http-equiv=3D"Content-Type" content=3D"text/html;charset=
=3Dutf-8"></head><body><div id=3D"content" contenteditable=3D"true" spellch=
eck=3D"true" autocorrect=3D"true" autocapitalize=3D"true" style=3D"font-fam=
ily: Helvetica;">Python is indent based languang, so the function will fail=
 if we have incorrect indenting. I have tested this in real bmc machine so =
I believe the indenting should be fine for now. Please let Brad review this=
 change since he is familiar with Python.<br><br><br><br><hr>=E5=9C=A8 2016=
=E5=B9=B41=E6=9C=8829=E6=97=A5=EF=BC=8C=E4=B8=8A=E5=8D=888:24:58=EF=BC=8C"C=
yril Bur" &lt;cyrilbur@gmail.com&gt; =E5=86=99=E9=81=93=EF=BC=9A<br><div st=
yle=3D"margin-left: 15px;" id=3D"MaaS360PIMSDKOriginalMessageId">On&nbsp;Th=
u,&nbsp;28&nbsp;Jan&nbsp;2016&nbsp;02:00:37&nbsp;-0600<br>OpenBMC&nbsp;Patc=
hes&nbsp;<openbmc-patches@stwcx.xyz>&nbsp;wrote:<br>&gt;&nbsp;From:&nbsp;sh=
goupf&nbsp;<shgoupf@cn.ibm.com><br>&gt;&nbsp;<br>Hi&nbsp;Peng,<br>So&nbsp;I=
'm&nbsp;don't&nbsp;really&nbsp;know&nbsp;python&nbsp;all&nbsp;that&nbsp;wel=
l&nbsp;but&nbsp;I&nbsp;do&nbsp;believe&nbsp;this&nbsp;language&nbsp;is<br>w=
hite&nbsp;space&nbsp;sensitive...&nbsp;I'll&nbsp;let&nbsp;a&nbsp;pythoner&n=
bsp;respond&nbsp;about&nbsp;the&nbsp;rest...<br>&gt;&nbsp;Changes:<br>&gt;&=
nbsp;1)&nbsp;The&nbsp;main&nbsp;idea&nbsp;of&nbsp;this&nbsp;change&nbsp;is&=
nbsp;to&nbsp;have&nbsp;a&nbsp;streaming&nbsp;path&nbsp;as&nbsp;below:<br>&g=
t;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dbus&nbsp;signal&nbsp;-&gt;&nbsp;obmc-rest&=
nbsp;capture&nbsp;the&nbsp;dbus&nbsp;signal&nbsp;-&gt;&nbsp;obmc-rest&nbsp;=
notify&nbsp;the&nbsp;client&nbsp;of&nbsp;the&nbsp;signal&nbsp;receiving.<br=
>&gt;&nbsp;2)&nbsp;Replace&nbsp;rocket&nbsp;with&nbsp;gevent&nbsp;WSGI&nbsp=
;server&nbsp;to&nbsp;support&nbsp;multiple&nbsp;async&nbsp;accesses.<br>&gt=
;&nbsp;3)&nbsp;Use&nbsp;gevent&nbsp;queue&nbsp;to&nbsp;notify&nbsp;the&nbsp=
;dbus&nbsp;signal&nbsp;receiving.<br>&gt;&nbsp;4)&nbsp;The&nbsp;uri&nbsp;to=
&nbsp;the&nbsp;streaming&nbsp;should&nbsp;be&nbsp;in&nbsp;the&nbsp;form&nbs=
p;as&nbsp;below:<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;https://<ip>/<path>/s=
tream/<signal=5Fname><br>&gt;&nbsp;---<br>&gt;&nbsp;&nbsp;obmc-rest&nbsp;|&=
nbsp;115&nbsp;++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----=
-<br>&gt;&nbsp;&nbsp;1&nbsp;file&nbsp;changed,&nbsp;104&nbsp;insertions(+),=
&nbsp;11&nbsp;deletions(-)<br>&gt;&nbsp;&nbsp;mode&nbsp;change&nbsp;100644&=
nbsp;=3D&gt;&nbsp;100755&nbsp;obmc-rest<br>&gt;&nbsp;<br>&gt;&nbsp;diff&nbs=
p;--git&nbsp;a/obmc-rest&nbsp;b/obmc-rest<br>&gt;&nbsp;old&nbsp;mode&nbsp;1=
00644<br>&gt;&nbsp;new&nbsp;mode&nbsp;100755<br>&gt;&nbsp;index&nbsp;c6d294=
9..481dafa<br>&gt;&nbsp;---&nbsp;a/obmc-rest<br>&gt;&nbsp;+++&nbsp;b/obmc-r=
est<br>&gt;&nbsp;@@&nbsp;-3,7&nbsp;+3,9&nbsp;@@<br>&gt;&nbsp;&nbsp;import&n=
bsp;os<br>&gt;&nbsp;&nbsp;import&nbsp;sys<br>&gt;&nbsp;&nbsp;import&nbsp;db=
us<br>&gt;&nbsp;+import&nbsp;gobject<br>&gt;&nbsp;&nbsp;import&nbsp;dbus.ex=
ceptions<br>&gt;&nbsp;+import&nbsp;dbus.mainloop.glib<br>&gt;&nbsp;&nbsp;im=
port&nbsp;json<br>&gt;&nbsp;&nbsp;import&nbsp;logging<br>&gt;&nbsp;&nbsp;fr=
om&nbsp;xml.etree&nbsp;import&nbsp;ElementTree<br>&gt;&nbsp;@@&nbsp;-14,6&n=
bsp;+16,10&nbsp;@@&nbsp;from&nbsp;OpenBMCMapper&nbsp;import&nbsp;Mapper,&nb=
sp;PathTree,&nbsp;IntrospectionNodeParser,&nbsp;ListMatch<br>&gt;&nbsp;&nbs=
p;import&nbsp;spwd<br>&gt;&nbsp;&nbsp;import&nbsp;grp<br>&gt;&nbsp;&nbsp;im=
port&nbsp;crypt<br>&gt;&nbsp;+import&nbsp;threading<br>&gt;&nbsp;+import&nb=
sp;gevent<br>&gt;&nbsp;+from&nbsp;gevent.pywsgi&nbsp;import&nbsp;WSGIServer=
<br>&gt;&nbsp;+from&nbsp;gevent.queue&nbsp;import&nbsp;Queue<br>&gt;&nbsp;&=
nbsp;<br>&gt;&nbsp;&nbsp;DBUS=5FUNKNOWN=5FINTERFACE&nbsp;=3D&nbsp;'org.free=
desktop.UnknownInterface'<br>&gt;&nbsp;&nbsp;DBUS=5FUNKNOWN=5FMETHOD&nbsp;=
=3D&nbsp;'org.freedesktop.DBus.Error.UnknownMethod'<br>&gt;&nbsp;@@&nbsp;-5=
9,12&nbsp;+65,13&nbsp;@@&nbsp;def&nbsp;makelist(data):<br>&gt;&nbsp;&nbsp;<=
br>&gt;&nbsp;&nbsp;class&nbsp;RouteHandler(object):<br>&gt;&nbsp;&nbsp;    =
    =5Frequire=5Fauth&nbsp;=3D&nbsp;makelist(valid=5Fuser)<br>&gt;&nbsp;-  =
      def&nbsp;=5F=5Finit=5F=5F(self,&nbsp;app,&nbsp;bus,&nbsp;verbs,&nbsp;=
rules):<br>&gt;&nbsp;+        def&nbsp;=5F=5Finit=5F=5F(self,&nbsp;app,&nbs=
p;bus,&nbsp;verbs,&nbsp;rules,&nbsp;skips&nbsp;=3D&nbsp;[]):<br>&gt;&nbsp;&=
nbsp;                self.app&nbsp;=3D&nbsp;app<br>&gt;&nbsp;&nbsp;        =
        self.bus&nbsp;=3D&nbsp;bus<br>&gt;&nbsp;&nbsp;                self.=
mapper&nbsp;=3D&nbsp;Mapper(bus)<br>&gt;&nbsp;&nbsp;                self.=
=5Fverbs&nbsp;=3D&nbsp;makelist(verbs)<br>&gt;&nbsp;&nbsp;                s=
elf.=5Frules&nbsp;=3D&nbsp;rules<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.=
=5Fskips&nbsp;=3D&nbsp;skips<br>&gt;&nbsp;&nbsp;<br>&gt;&nbsp;&nbsp;       =
 def&nbsp;=5Fsetup(self,&nbsp;**kw):<br>&gt;&nbsp;&nbsp;                req=
uest.route=5Fdata&nbsp;=3D&nbsp;{}<br>&gt;&nbsp;@@&nbsp;-79,7&nbsp;+86,7&nb=
sp;@@&nbsp;class&nbsp;RouteHandler(object):<br>&gt;&nbsp;&nbsp;            =
    return&nbsp;getattr(self,&nbsp;'do=5F'&nbsp;+&nbsp;request.method.lower=
())(**kw)<br>&gt;&nbsp;&nbsp;<br>&gt;&nbsp;&nbsp;        def&nbsp;install(s=
elf):<br>&gt;&nbsp;-                self.app.route(self.=5Frules,&nbsp;call=
back&nbsp;=3D&nbsp;self,<br>&gt;&nbsp;+                self.app.route(self.=
=5Frules,&nbsp;callback&nbsp;=3D&nbsp;self,&nbsp;skip&nbsp;=3D&nbsp;self.=
=5Fskips,<br>&gt;&nbsp;&nbsp;                                method&nbsp;=
=3D&nbsp;['GET',&nbsp;'PUT',&nbsp;'PATCH',&nbsp;'POST',&nbsp;'DELETE'])<br>=
&gt;&nbsp;&nbsp;<br>&gt;&nbsp;&nbsp;        @staticmethod<br>&gt;&nbsp;@@&n=
bsp;-108,6&nbsp;+115,58&nbsp;@@&nbsp;class&nbsp;RouteHandler(object):<br>&g=
t;&nbsp;&nbsp;                                return&nbsp;None<br>&gt;&nbsp=
;&nbsp;                        raise<br>&gt;&nbsp;&nbsp;<br>&gt;&nbsp;+clas=
s&nbsp;SignalHandler(RouteHandler):<br>&gt;&nbsp;+        verbs&nbsp;=3D&nb=
sp;['GET']<br>&gt;&nbsp;+        rules&nbsp;=3D&nbsp;'<path:path>/stream/<s=
ignal>'<br>&gt;&nbsp;+<br>&gt;&nbsp;+        def&nbsp;=5F=5Finit=5F=5F(self=
,&nbsp;app,&nbsp;bus):<br>&gt;&nbsp;+                super(SignalHandler,&n=
bsp;self).=5F=5Finit=5F=5F(<br>&gt;&nbsp;+                                a=
pp,&nbsp;bus,&nbsp;self.verbs,&nbsp;self.rules)<br>&gt;&nbsp;+<br>&gt;&nbsp=
;+        def&nbsp;find(self,&nbsp;path,&nbsp;signal):<br>&gt;&nbsp;+      =
          busses&nbsp;=3D&nbsp;self.try=5Fmapper=5Fcall(self.mapper.get=5Fo=
bject,<br>&gt;&nbsp;+                                path&nbsp;=3D&nbsp;pat=
h)<br>&gt;&nbsp;+                for&nbsp;items&nbsp;in&nbsp;busses.iterite=
ms():<br>&gt;&nbsp;+                        s&nbsp;=3D&nbsp;self.find=5Fsig=
nal=5Fon=5Fbus(path,&nbsp;signal,&nbsp;*items)<br>&gt;&nbsp;+              =
          if&nbsp;s:<br>&gt;&nbsp;+                                return&n=
bsp;s<br>&gt;&nbsp;+<br>&gt;&nbsp;+                abort(404,&nbsp;=5F4034=
=5Fmsg&nbsp;%('signal',&nbsp;'found',&nbsp;signal))<br>&gt;&nbsp;+<br>&gt;&=
nbsp;+        def&nbsp;setup(self,&nbsp;path,&nbsp;signal):<br>&gt;&nbsp;+ =
               request.route=5Fdata['map']&nbsp;=3D&nbsp;self.find(path,&nb=
sp;signal)<br>&gt;&nbsp;+<br>&gt;&nbsp;+        def&nbsp;do=5Fget(self,&nbs=
p;path,&nbsp;signal):<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;body&nbsp;=3D&nbsp=
;Queue()<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dsignal&nbsp;=3D&nbsp;DbusSigna=
l(bus,&nbsp;request.route=5Fdata['map'][0],<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;request.route=5Fdata=
['map'][1],&nbsp;path)<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dsignal.onData(bo=
dy.put)<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dsignal.onFinish(lambda:&nbsp;bo=
dy.put(StopIteration))<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dsignal.signalSno=
oping()<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;body<br>&gt;&nbsp;+<=
br>&gt;&nbsp;+        @staticmethod<br>&gt;&nbsp;+        def&nbsp;find=5Fs=
ignal(signal,&nbsp;signals):<br>&gt;&nbsp;+                if&nbsp;signals&=
nbsp;is&nbsp;None:<br>&gt;&nbsp;+                        return&nbsp;None<b=
r>&gt;&nbsp;+<br>&gt;&nbsp;+                signal&nbsp;=3D&nbsp;find=5Fcas=
e=5Finsensitive(signal,&nbsp;signals.keys())<br>&gt;&nbsp;+                =
if&nbsp;signal&nbsp;is&nbsp;not&nbsp;None:<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;signal<br>&g=
t;&nbsp;+<br>&gt;&nbsp;+        def&nbsp;find=5Fsignal=5Fon=5Fbus(self,&nbs=
p;path,&nbsp;signal,&nbsp;bus,&nbsp;interfaces):<br>&gt;&nbsp;+            =
    obj&nbsp;=3D&nbsp;self.bus.get=5Fobject(bus,&nbsp;path,&nbsp;introspect=
&nbsp;=3D&nbsp;False)<br>&gt;&nbsp;+                iface&nbsp;=3D&nbsp;dbu=
s.Interface(obj,&nbsp;dbus.INTROSPECTABLE=5FIFACE)<br>&gt;&nbsp;+          =
      data&nbsp;=3D&nbsp;iface.Introspect()<br>&gt;&nbsp;+                p=
arser&nbsp;=3D&nbsp;IntrospectionNodeParser(<br>&gt;&nbsp;+                =
                ElementTree.fromstring(data),<br>&gt;&nbsp;+               =
                 intf=5Fmatch&nbsp;=3D&nbsp;ListMatch(interfaces))<br>&gt;&=
nbsp;+                for&nbsp;x,y&nbsp;in&nbsp;parser.get=5Finterfaces().i=
teritems():<br>&gt;&nbsp;+                        s&nbsp;=3D&nbsp;self.find=
=5Fsignal(signal,<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;y.get('signal'))<br>&gt;&nbsp;+                        if&nbsp;s:<br>&gt;=
&nbsp;+                                return&nbsp;(x,s)<br>&gt;&nbsp;+<br>=
&gt;&nbsp;&nbsp;class&nbsp;DirectoryHandler(RouteHandler):<br>&gt;&nbsp;&nb=
sp;        verbs&nbsp;=3D&nbsp;'GET'<br>&gt;&nbsp;&nbsp;        rules&nbsp;=
=3D&nbsp;'<path:path>/'<br>&gt;&nbsp;@@&nbsp;-715,7&nbsp;+774,8&nbsp;@@&nbs=
p;class&nbsp;RestApp(Bottle):<br>&gt;&nbsp;&nbsp;                self.insta=
ll(JSONPlugin(**json=5Fkw))<br>&gt;&nbsp;&nbsp;                self.install=
(JsonApiErrorsPlugin(**json=5Fkw))<br>&gt;&nbsp;&nbsp;                self.=
install(AuthorizationPlugin())<br>&gt;&nbsp;-                self.install(J=
sonApiResponsePlugin())<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.json=5Fresp=
onse=5Fplugin&nbsp;=3D&nbsp;JsonApiResponsePlugin()<br>Indenting?<br>&gt;&n=
bsp;+                self.install(self.json=5Fresponse=5Fplugin)<br>&gt;&nb=
sp;&nbsp;                self.install(JsonApiRequestPlugin())<br>&gt;&nbsp;=
&nbsp;                self.install(JsonApiRequestTypePlugin())<br>&gt;&nbsp=
;&nbsp;<br>&gt;&nbsp;@@&nbsp;-726,6&nbsp;+786,7&nbsp;@@&nbsp;class&nbsp;Res=
tApp(Bottle):<br>&gt;&nbsp;&nbsp;<br>&gt;&nbsp;&nbsp;        def&nbsp;creat=
e=5Fhandlers(self):<br>&gt;&nbsp;&nbsp;                #&nbsp;create&nbsp;r=
oute&nbsp;handlers<br>&gt;&nbsp;+                self.signal=5Fhandler&nbsp=
;=3D&nbsp;SignalHandler(self,&nbsp;self.bus)<br>&gt;&nbsp;&nbsp;           =
     self.session=5Fhandler&nbsp;=3D&nbsp;SessionHandler(self,&nbsp;self.bu=
s)<br>&gt;&nbsp;&nbsp;                self.directory=5Fhandler&nbsp;=3D&nbs=
p;DirectoryHandler(self,&nbsp;self.bus)<br>&gt;&nbsp;&nbsp;                =
self.list=5Fnames=5Fhandler&nbsp;=3D&nbsp;ListNamesHandler(self,&nbsp;self.=
bus)<br>&gt;&nbsp;@@&nbsp;-736,6&nbsp;+797,11&nbsp;@@&nbsp;class&nbsp;RestA=
pp(Bottle):<br>&gt;&nbsp;&nbsp;                self.instance=5Fhandler&nbsp=
;=3D&nbsp;InstanceHandler(self,&nbsp;self.bus)<br>&gt;&nbsp;&nbsp;<br>&gt;&=
nbsp;&nbsp;        def&nbsp;install=5Fhandlers(self):<br>&gt;&nbsp;+&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;#&nbsp;Skip&nbsp;json&nbsp;response&nbsp;for&nbsp;signal&nbsp=
;handler&nbsp;because&nbsp;it&nbsp;requires&nbsp;to<br>&gt;&nbsp;+&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;#&nbsp;return&nbsp;a&nbsp;gevent&nbsp;iterable&nbsp;which&nbsp;=
cannot&nbsp;be&nbsp;handled&nbsp;by&nbsp;json<br>&gt;&nbsp;+&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;#&nbsp;response&nbsp;plugin<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.s=
ignal=5Fhandler.=5Fskips&nbsp;=3D&nbsp;[self.json=5Fresponse=5Fplugin]<br>I=
ndenting?<br>&gt;&nbsp;+                self.signal=5Fhandler.install()<br>=
&gt;&nbsp;&nbsp;                self.session=5Fhandler.install()<br>&gt;&nb=
sp;&nbsp;                self.directory=5Fhandler.install()<br>&gt;&nbsp;&n=
bsp;                self.list=5Fnames=5Fhandler.install()<br>&gt;&nbsp;@@&n=
bsp;-766,21&nbsp;+832,48&nbsp;@@&nbsp;class&nbsp;RestApp(Bottle):<br>&gt;&n=
bsp;&nbsp;                parts&nbsp;=3D&nbsp;filter(bool,&nbsp;path.split(=
'/'))<br>&gt;&nbsp;&nbsp;                request.environ['PATH=5FINFO']&nbs=
p;=3D&nbsp;'/'&nbsp;+&nbsp;'/'.join(parts)&nbsp;+&nbsp;trailing<br>&gt;&nbs=
p;&nbsp;<br>&gt;&nbsp;+class&nbsp;DbusSignal():<br>&gt;&nbsp;+&nbsp;&nbsp;&=
nbsp;&nbsp;def&nbsp;=5F=5Finit=5F=5F(self,&nbsp;bus,&nbsp;dbus=5Finterface,=
&nbsp;signal=5Fname,&nbsp;path):<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;#&nbsp;Register&nbsp;the&nbsp;dbus&nbsp;recieve&nbsp;ha=
ndler<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bus.add=
=5Fsignal=5Freceiver(self.signalReciever,<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;dbus=5Finterface&nbsp;=3D&nbsp;dbus=5Finterface,<br>=
&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;signal=5Fname&nbsp;=3D=
&nbsp;signal=5Fname,<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;path&nbsp;=3D&nbsp;path)<br>&gt;&nbsp;+<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.snooping&nbsp;=3D&nbsp;True<br>&gt;&nbsp;=
+<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;def&nbsp;signalReciever(self,&nbsp;=
msg):<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.se=
nd("Recieved&nbsp;message:&nbsp;%s"&nbsp;%&nbsp;msg)<br>&gt;&nbsp;+&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.snooping&nbsp;=3D&nbsp;False<b=
r>&gt;&nbsp;+<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;def&nbsp;onData(self,&n=
bsp;send):<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;se=
lf.send&nbsp;=3D&nbsp;send<br>&gt;&nbsp;+<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&=
nbsp;def&nbsp;onFinish(self,&nbsp;f):<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;self.finish&nbsp;=3D&nbsp;f<br>&gt;&nbsp;+<br>&gt;=
&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;def&nbsp;signalSnooping(self):<br>&gt;&nbsp;=
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;while&nbsp;self.snooping:<=
br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;mainloop&nbsp;=3D&nbsp;gobject.MainLoop()<br>&gt;&nbsp;+&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gevent.slee=
p(1)<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;gobject.timeout=5Fadd(1,&nbsp;mainloop.quit)<br>&gt;&nbsp;+=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mai=
nloop.run()<br>&gt;&nbsp;+<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;self.finish()<br>&gt;&nbsp;+<br>&gt;&nbsp;&nbsp;if&nbsp;=5F=
=5Fname=5F=5F&nbsp;=3D=3D&nbsp;'=5F=5Fmain=5F=5F':<br>&gt;&nbsp;&nbsp;     =
   log&nbsp;=3D&nbsp;logging.getLogger('Rocket.Errors')<br>&gt;&nbsp;&nbsp;=
        log.setLevel(logging.INFO)<br>&gt;&nbsp;&nbsp;        log.addHandle=
r(logging.StreamHandler(sys.stdout))<br>&gt;&nbsp;&nbsp;<br>&gt;&nbsp;+&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dbus.mainloop.glib.DBusGMainLoo=
p(set=5Fas=5Fdefault=3DTrue)<br>Indenting?<br>&gt;&nbsp;&nbsp;        bus&n=
bsp;=3D&nbsp;dbus.SystemBus()<br>&gt;&nbsp;&nbsp;        app&nbsp;=3D&nbsp;=
RestApp(bus)<br>&gt;&nbsp;+<br>?<br>&gt;&nbsp;&nbsp;        default=5Fcert&=
nbsp;=3D&nbsp;os.path.join(sys.prefix,&nbsp;'share',<br>&gt;&nbsp;&nbsp;   =
                     os.path.basename(=5F=5Ffile=5F=5F),&nbsp;'cert.pem')<b=
r>&gt;&nbsp;&nbsp;<br>&gt;&nbsp;-        server&nbsp;=3D&nbsp;Rocket(('0.0.=
0.0',<br>&gt;&nbsp;-                        443,<br>&gt;&nbsp;-            =
            default=5Fcert,<br>&gt;&nbsp;-                        default=
=5Fcert),<br>&gt;&nbsp;-                'wsgi',&nbsp;{'wsgi=5Fapp':&nbsp;ap=
p},<br>&gt;&nbsp;-                min=5Fthreads&nbsp;=3D&nbsp;1,<br>&gt;&nb=
sp;-                max=5Fthreads&nbsp;=3D&nbsp;1)<br>&gt;&nbsp;-        se=
rver.start()<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
server&nbsp;=3D&nbsp;WSGIServer(("0.0.0.0",&nbsp;443),&nbsp;app,&nbsp;keyfi=
le&nbsp;=3D&nbsp;default=5Fcert,<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;certfile&n=
bsp;=3D&nbsp;default=5Fcert)<br>&gt;&nbsp;+<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;server.serve=5Fforever()<br>Indenting?<br></=
path:path></signal></path:path></signal=5Fname></path></ip></shgoupf@cn.ibm=
.com></openbmc-patches@stwcx.xyz></div></div><BR>
</body></html>

------=_Part_102_1664705337.1454027895667--
