Return-Path: <anoo@us.ibm.com>
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r9FD45P6nzDqBY
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 12:20:52 +1000 (AEST)
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Wed, 18 May 2016 20:20:50 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 18 May 2016 20:20:49 -0600
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 3776F1FF0021
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 20:20:33 -0600 (MDT)
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4J2KmtW44302470
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 19:20:48 -0700
Received: from d03av02.boulder.ibm.com (localhost [127.0.0.1])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4J2KmNc008723
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 20:20:48 -0600
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4J2KlcI008687
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 20:20:47 -0600
Message-Id: <201605190220.u4J2KlcI008687@d03av02.boulder.ibm.com>
Received: from localhost
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Wed, 18 May 2016 22:20:47 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 18 May 2016 22:20:44 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Thu, 19 May 2016 02:20:43 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 19 May 2016 02:20:40 -0000
Received: from us1a3-mail52.a3.dal06.isc4sb.com ([10.146.77.168])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016051902204038-557821 ;
 Thu, 19 May 2016 02:20:40 +0000 
In-Reply-To: <1463570453-15404-4-git-send-email-openbmc-patches@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, "Hariharasubramanian
 Ramasubramanian" <openbmc@lists.ozlabs.org>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH skeleton v3 3/3] Fix code review comments from Chris
 Austen.
From: "Adriana Kobylak" <anoo@us.ibm.com>
Date: Wed, 18 May 2016 21:20:40 -0500
References: <1463570453-15404-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1463570453-15404-4-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
X-KeepSent: E06A4D0D:DDF9E33E-86257FB8:000CA285;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 25615
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 000CE01186257FB8_="
x-cbid: 16051902-8236-0000-0000-000031595FDB
X-IBM-ISS-SpamDetectors: Score=0.449102; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.449102; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005296; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000166; SDB=6.00704161; UDB=6.00326396; UTC=2016-05-19
 02:20:41
x-cbparentid: 16051902-5938-0000-0000-000003B05C5F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-MML: disable
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
X-List-Received-Date: Thu, 19 May 2016 02:20:53 -0000


--=_alternative 000CE01186257FB8_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

Hi Hari,

During tonight's call, it was mentioned that we shouldn't have a separate=20
commit with review comments. If you'd make the changes on the existing=20
commit and refresh the pull request, this can be done with "git commit=20
--amend".

Thanks!



From:   OpenBMC Patches <openbmc-patches@stwcx.xyz>
To:     openbmc@lists.ozlabs.org
Date:   05/18/2016 06:21 AM
Subject:        [PATCH skeleton v3 3/3] Fix code review comments from=20
Chris Austen.
Sent by:        "openbmc"=20
<openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org>



From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 bin/Barreleye.py           |  2 +-
 bin/chassis=5Fcontrol.py     | 20 +++++++-------
 includes/gpio-init-gdbus.c | 22 +++++++--------
 includes/gpio-init-sdbus.c | 53 ++++++++++++++++++------------------
 includes/gpio.c            |  1 -
 objects/host=5Fxstop=5Fobj.c   | 68=20
++++++++++++----------------------------------
 6 files changed, 64 insertions(+), 102 deletions(-)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 44aa6a3..8459311 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -551,7 +551,7 @@ GPIO=5FCONFIG['CPLD=5FTCK']                =3D   {=20
'gpio=5Fpin': 'P0', 'direction': 'out' }
 GPIO=5FCONFIG['CPLD=5FTDO']                   =3D   { 'gpio=5Fpin': 'P1', =

'direction': 'out' }
 GPIO=5FCONFIG['CPLD=5FTDI']                   =3D   { 'gpio=5Fpin': 'P2', =

'direction': 'out' }
 GPIO=5FCONFIG['CPLD=5FTMS']                   =3D   { 'gpio=5Fpin': 'P3', =

'direction': 'out' }
-GPIO=5FCONFIG['CHECKSTOP']      =3D   { 'gpio=5Fpin': 'P5', 'direction': '=
in' }
+GPIO=5FCONFIG['CHECKSTOP0']                                               =
=3D=20
  { 'gpio=5Fpin': 'P5', 'direction': 'in' }
=20
 GPIO=5FCONFIG['SLOT0=5FRISER=5FPRESENT'] =3D   { 'gpio=5Fpin': 'N0', 'dire=
ction':=20
'in' }
 GPIO=5FCONFIG['SLOT1=5FRISER=5FPRESENT'] =3D   { 'gpio=5Fpin': 'N1', 'dire=
ction':=20
'in' }
diff --git a/bin/chassis=5Fcontrol.py b/bin/chassis=5Fcontrol.py
index 953f9fd..7b39a9f 100755
--- a/bin/chassis=5Fcontrol.py
+++ b/bin/chassis=5Fcontrol.py
@@ -217,17 +217,17 @@ class=20
ChassisControlObject(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
=20
                 def host=5Fxstop=5Fsignal=5Fhandler(self):
                                 print "Checkstop Error, Waiting for 30sec =

before Hard Rebooting"
-        time.sleep(30)
+                                time.sleep(30)
                                 self.Set(DBUS=5FNAME,"reboot",1)
                                 self.reboot()
=20
 if =5F=5Fname=5F=5F =3D=3D '=5F=5Fmain=5F=5F':
-    dbus.mainloop.glib.DBusGMainLoop(set=5Fas=5Fdefault=3DTrue)
-
-    bus =3D Openbmc.getDBus()
-    name =3D dbus.service.BusName(DBUS=5FNAME, bus)
-    obj =3D ChassisControlObject(bus, OBJ=5FNAME)
-    mainloop =3D gobject.MainLoop()
-=20
-    print "Running ChassisControlService"
-    mainloop.run()
+ dbus.mainloop.glib.DBusGMainLoop(set=5Fas=5Fdefault=3DTrue)
+
+                                bus =3D Openbmc.getDBus()
+                                name =3D dbus.service.BusName(DBUS=5FNAME,=
=20
bus)
+                                obj =3D ChassisControlObject(bus, OBJ=5FNA=
ME)
+                                mainloop =3D gobject.MainLoop()
+
+                                print "Running ChassisControlService"
+                                mainloop.run()
diff --git a/includes/gpio-init-gdbus.c b/includes/gpio-init-gdbus.c
index b9d7712..cf47fb1 100644
--- a/includes/gpio-init-gdbus.c
+++ b/includes/gpio-init-gdbus.c
@@ -23,13 +23,13 @@ int gpio=5Finit(void *connection, GPIO* gpio)
                 g=5Fassert=5Fno=5Ferror (error);
                 error =3D NULL;
                 proxy =3D g=5Fdbus=5Fproxy=5Fnew=5Fsync=20
((GDBusConnection*)connection,
-                                 G=5FDBUS=5FPROXY=5FFLAGS=5FNONE,
-                                 NULL,                      /*=20
GDBusInterfaceInfo */
-                                 "org.openbmc.managers.System", /* name=20
*/
-                                 "/org/openbmc/managers/System", /*=20
object path */
-                                 "org.openbmc.managers.System",        /* =

interface */
-                                 NULL, /* GCancellable */
-                                 &error);
+                 G=5FDBUS=5FPROXY=5FFLAGS=5FNONE,
+                 NULL,  /* GDBusInterfaceInfo */
+                 "org.openbmc.managers.System",                 /* name=20
*/
+                 "/org/openbmc/managers/System",/* object path */
+                 "org.openbmc.managers.System", /* interface */
+                 NULL,  /* GCancellable */
+                 &error);
                 if (error !=3D NULL) {
                                 return GPIO=5FLOOKUP=5FERROR;
                 }
@@ -58,9 +58,8 @@ int gpio=5Finit(void *connection, GPIO* gpio)
=20
 sprintf(dev,"%s/gpio%d/value",gpio->dev,gpio->num);
                                 //check if gpio is exported, if not=20
export
-                                int result =3D stat(dev, &st);
-                                if (result)
-                                {
+                                int result =3D stat(dev, &st);
+                                if (result) {
 sprintf(dev,"%s/export",gpio->dev);
                                                 fd =3D open(dev, O=5FWRONL=
Y);
                                                 if (fd =3D=3D GPIO=5FERROR=
) {
@@ -76,8 +75,7 @@ int gpio=5Finit(void *connection, GPIO* gpio)
                                                 }
                                 }
                                 const char* file =3D "edge";
-                                if (strcmp(gpio->direction,"in")=3D=3D0 ||=
=20
strcmp(gpio->direction,"out")=3D=3D0)
-                                {
+                                if (strcmp(gpio->direction,"in")=3D=3D0 ||=
=20
strcmp(gpio->direction,"out")=3D=3D0) {
                                                 file =3D "direction";
                                 }
 sprintf(dev,"%s/gpio%d/%s",gpio->dev,gpio->num,file);
diff --git a/includes/gpio-init-sdbus.c b/includes/gpio-init-sdbus.c
index f756038..d2d0a42 100644
--- a/includes/gpio-init-sdbus.c
+++ b/includes/gpio-init-sdbus.c
@@ -10,38 +10,37 @@
 #include "gpio.h"
 #include <systemd/sd-bus.h>
=20
-
 // Gets the gpio device path from gpio manager object
 int gpio=5Finit(void *connection, GPIO* gpio)
 {
                 int rc =3D GPIO=5FOK;
-    sd=5Fbus=5Ferror err    =3D SD=5FBUS=5FERROR=5FNULL;
-    sd=5Fbus=5Fmessage *res =3D NULL;
+                sd=5Fbus=5Ferror err    =3D SD=5FBUS=5FERROR=5FNULL;
+                sd=5Fbus=5Fmessage *res =3D NULL;
=20
-    sd=5Fbus=5Ferror=5Ffree(&err);
-    sd=5Fbus=5Fmessage=5Funref(res);
+                sd=5Fbus=5Ferror=5Ffree(&err);
+                sd=5Fbus=5Fmessage=5Funref(res);
=20
-    rc =3D sd=5Fbus=5Fcall=5Fmethod ((sd=5Fbus*)connection,
-                                "org.openbmc.managers.System",  /* name=20
*/
-                                "/org/openbmc/managers/System", /* object =

path */
-                                "org.openbmc.managers.System",  /*=20
interface */
-                                "gpioInit",
-                                &err,
-                                &res,
-                                "s",
-                                gpio->name);
+                rc =3D sd=5Fbus=5Fcall=5Fmethod ((sd=5Fbus*)connection,
+                                "org.openbmc.managers.System",  /* name=20
*/
+                                "/org/openbmc/managers/System", /* object =

path */
+                                "org.openbmc.managers.System",  /*=20
interface */
+                                "gpioInit",
+                                &err,
+                                &res,
+                                "s",
+                                gpio->name);
=20
-    if(rc < 0)
-    {
-        fprintf(stderr, "Failed to init gpio for %s : %s\n", gpio->name,=20
err.message);
-        return -1;
-    }
+                if(rc < 0)
+                {
+                                fprintf(stderr, "Failed to init gpio for=20
%s : %s\n", gpio->name, err.message);
+                                return -1;
+                }
=20
-    rc =3D sd=5Fbus=5Fmessage=5Fread (res, "sis", &gpio->dev, &gpio->num, =

&gpio->direction);
-    if (rc < 0)
-        return -1;
-    else
-        g=5Fprint("GPIO Lookup:  %s =3D=20
%d,%s\n",gpio->name,gpio->num,gpio->direction);
+                rc =3D sd=5Fbus=5Fmessage=5Fread (res, "sis", &gpio->dev, =

&gpio->num, &gpio->direction);
+                if (rc < 0)
+                                return -1;
+                else
+                                g=5Fprint("GPIO Lookup:  %s =3D=20
%d,%s\n",gpio->name,gpio->num,gpio->direction);
=20
                 //export and set direction
                 char dev[254];
@@ -49,11 +48,11 @@ int gpio=5Finit(void *connection, GPIO* gpio)
                 int fd;
                 do {
                                 struct stat st;
-=20
+
 sprintf(dev,"%s/gpio%d/value",gpio->dev,gpio->num);
                                 //check if gpio is exported, if not=20
export
-                                int result =3D stat(dev, &st);
-                                if (result)
+                                int result =3D stat(dev, &st);
+                                if (result)
                                 {
 sprintf(dev,"%s/export",gpio->dev);
                                                 fd =3D open(dev, O=5FWRONL=
Y);
diff --git a/includes/gpio.c b/includes/gpio.c
index b6fbf13..52cfaeb 100755
--- a/includes/gpio.c
+++ b/includes/gpio.c
@@ -9,7 +9,6 @@
 #include <sys/mman.h>
 #include "gpio.h"
=20
-
 int gpio=5Fwritec(GPIO* gpio, char value)
 {
                 g=5Fassert (gpio !=3D NULL);
diff --git a/objects/host=5Fxstop=5Fobj.c b/objects/host=5Fxstop=5Fobj.c
index 1de4d11..d1f8491 100644
--- a/objects/host=5Fxstop=5Fobj.c
+++ b/objects/host=5Fxstop=5Fobj.c
@@ -10,28 +10,19 @@
 #include <systemd/sd-bus.h>
 #include "gpio.h"
=20
-/*=20
- * -----------------------------------------------
- * FIXME: Fetch GPIO NUM from MRW instead?
- * -----------------------------------------------
- */
-GPIO gpio=5Fxstop    =3D (GPIO){ "CHECKSTOP" }; /* This object will use th=
ese=20
GPIOs */
-const int gpio=5Fnum=5Fxstop    =3D 440;
-const char* gpio=5Fdev=5Fpath   =3D "/sys/class/gpio";
-const char* gpio=5Fdev=5Fexp    =3D "/sys/class/gpio/export";
-const char* gpio=5Fdev=5Fxstop  =3D "/sys/class/gpio/gpio440";
-const char* gpio=5Fval=5Fxstop  =3D "/sys/class/gpio/gpio440/value";
-const char* gpio=5Fdir=5Fxstop  =3D "/sys/class/gpio/gpio440/direction";
+static const char* xstop0      =3D "/org/openbmc/sensors/host/cpu0/Xstop";
+static const char* srvc=5Fname   =3D "org.openbmc.Sensors";
+static const char* iface=5Fname  =3D "org.openbmc.SensorValue";
+
+GPIO gpio=5Fxstop0                =3D (GPIO){ "CHECKSTOP0" }; /* This obje=
ct=20
will use these GPIOs */
+sd=5Fbus* bus         =3D NULL;
+sd=5Fbus=5Fslot* slot   =3D NULL;
=20
 typedef struct {
     bool isXstopped;
 } HostState;
=20
-HostState hostState =3D (HostState) {false};
-
-static const char* xstop0      =3D "/org/openbmc/sensors/host/cpu0/Xstop";
-static const char* srvc=5Fname   =3D "org.openbmc.Sensors";
-static const char* iface=5Fname  =3D "org.openbmc.SensorValue";
+HostState hostState0 =3D (HostState) {false};
=20
 int bus=5Fproperty=5Fget=5Fbool(sd=5Fbus *bus, const char *path, const cha=
r=20
*interface, const char *property, sd=5Fbus=5Fmessage *reply, void *userdata=
,=20
sd=5Fbus=5Ferror *error)
 {=20
@@ -47,10 +38,6 @@ static const sd=5Fbus=5Fvtable host=5Fxstop=5Fvtable[] =
=3D
     SD=5FBUS=5FVTABLE=5FEND,
 };
=20
-
-sd=5Fbus* bus         =3D NULL;
-sd=5Fbus=5Fslot* slot   =3D NULL;
-
 static gboolean
 on=5Fhost=5Fxstop (GIOChannel *channel, GIOCondition condition, gpointer=20
user=5Fdata)
 {
@@ -62,13 +49,11 @@ on=5Fhost=5Fxstop (GIOChannel *channel, GIOCondition=20
condition, gpointer user=5Fdata)
                 g=5Fio=5Fchannel=5Fseek=5Fposition(channel, 0, G=5FSEEK=5F=
SET, 0);
                 GIOStatus rc =3D g=5Fio=5Fchannel=5Fread=5Fchars(channel, =
buf, 1,=20
&bytes=5Fread, &error);
=20
-                printf("%s\n",buf);
-=20
-                if (gpio=5Fxstop.irq=5Finited) {
-         hostState.isXstopped =3D true;
+                if (gpio=5Fxstop0.irq=5Finited) {
+         hostState0.isXstopped =3D true;
     }
     else {
-        gpio=5Fxstop.irq=5Finited =3D true;
+        gpio=5Fxstop0.irq=5Finited =3D true;
     }
=20
                 return true;
@@ -77,11 +62,6 @@ on=5Fhost=5Fxstop (GIOChannel *channel, GIOCondition=20
condition, gpointer user=5Fdata)
 int main(void)
 {
     int rc              =3D 0;
-    int fd              =3D 0;
-    int result          =3D 0;
-    struct stat st;
-                char data[4];
-
     sd=5Fbus=5Ferror err    =3D SD=5FBUS=5FERROR=5FNULL;
     sd=5Fbus=5Fmessage *res =3D NULL;
=20
@@ -104,19 +84,17 @@ int main(void)
         goto cleanup;
     }
=20
-    /*
-     * Setup GPIO IRQ for Host xstop
-     */
+    /* Setup GPIO IRQ for Host xstop */
                 rc =3D GPIO=5FOK;
                 do {
-                                rc =3D gpio=5Finit(bus, &gpio=5Fxstop);
+                                rc =3D gpio=5Finit(bus, &gpio=5Fxstop0);
                                 if (rc !=3D GPIO=5FOK) { goto cleanup; }
-                                rc =3D gpio=5Fopen=5Finterrupt(&gpio=5Fxst=
op,=20
on=5Fhost=5Fxstop, NULL/*object*/);
+                                rc =3D gpio=5Fopen=5Finterrupt(&gpio=5Fxst=
op0,=20
on=5Fhost=5Fxstop, NULL/*object*/);
                                 if (rc !=3D GPIO=5FOK) { goto cleanup; }
                 } while(0);
=20
                 if (rc !=3D GPIO=5FOK) {
-                                printf("ERROR PowerButton: GPIO setup=20
(rc=3D%d)\n",rc);
+                                fprintf(stderr, "ERROR CHECKSTOP0: GPIO=20
setup =3D%d\n", rc);
         goto cleanup;
                 }
=20
@@ -127,18 +105,6 @@ int main(void)
         goto cleanup;
     }
=20
-    /* Register for GPIO IRQ */
-    gpio=5Fxstop.irq=5Finited =3D false;
-                fd =3D open(gpio=5Fval=5Fxstop, O=5FRDONLY | O=5FNONBLOCK =
);
-                if (fd =3D=3D -1) {
-                                rc =3D -1;
-        goto cleanup;
-                }
-                else {
-                                GIOChannel* channel =3D=20
g=5Fio=5Fchannel=5Funix=5Fnew(fd);
-                                g=5Fio=5Fadd=5Fwatch(channel, G=5FIO=5FPRI=
,=20
on=5Fhost=5Fxstop, NULL);
-                }
-
     /* Register with Sensor Manager */
     sd=5Fbus=5Ferror=5Ffree(&err);
     sd=5Fbus=5Fmessage=5Funref(res);
@@ -152,8 +118,8 @@ int main(void)
                                 &res,
                                 "ss",
                                 xstop0,
-                                "HostXstopSensor"); /* FIXME: register=20
method needs the Sensor class name ! */
-=20
+                                "HostXstopSensor");
+
     if(rc < 0) {
         fprintf(stderr, "Failed to init gpio for %s : %s\n", xstop0,=20
err.message);
         return -1;
--=20
2.8.2


=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc





--=_alternative 000CE01186257FB8_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<font size=3D2 face=3D"sans-serif">Hi Hari,</font><br><br><font size=3D2 fa=
ce=3D"sans-serif">During tonight's call, it was mentioned
that we shouldn't have a separate commit with review comments. If you'd
make the changes on the existing commit and refresh the pull request, this
can be done with &quot;git commit --amend&quot;.</font><br><br><font size=
=3D2 face=3D"sans-serif">Thanks!</font><br><br><br><br><font size=3D1 color=
=3D#5f5f5f face=3D"sans-serif">From: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">OpenBMC Patches &lt;openbmc=
-patches@stwcx.xyz&gt;</font><br><font size=3D1 color=3D#5f5f5f face=3D"san=
s-serif">To: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">openbmc@lists.ozlabs.org</f=
ont><br><font size=3D1 color=3D#5f5f5f face=3D"sans-serif">Date: &nbsp; &nb=
sp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">05/18/2016 06:21 AM</font><=
br><font size=3D1 color=3D#5f5f5f face=3D"sans-serif">Subject: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size=3D1 face=3D"sans-serif">[PATCH skeleton
v3 3/3] Fix code review comments from Chris Austen.</font><br><font size=3D=
1 color=3D#5f5f5f face=3D"sans-serif">Sent by: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size=3D1 face=3D"sans-serif">&quot;openbmc&quot;
&lt;openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org&gt;</font><br><hr no=
shade><br><br><br><tt><font size=3D2>From: Hariharasubramanian R &lt;hramas=
ub@in.ibm.com&gt;<br><br>---<br> bin/Barreleye.py &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; | &nbsp;2 +-<br> bin/chassis=5Fcontrol.py &nbsp; &nbsp; | 20 ++++=
+++-------<br> includes/gpio-init-gdbus.c | 22 +++++++--------<br> includes=
/gpio-init-sdbus.c | 53 ++++++++++++++++++------------------<br> includes/g=
pio.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;1 -<br> objects/host=
=5Fxstop=5Fobj.c &nbsp; | 68 ++++++++++++----------------------------------=
<br> 6 files changed, 64 insertions(+), 102 deletions(-)<br><br>diff --git =
a/bin/Barreleye.py b/bin/Barreleye.py<br>index 44aa6a3..8459311 100755<br>-=
-- a/bin/Barreleye.py<br>+++ b/bin/Barreleye.py<br>@@ -551,7 +551,7 @@ GPIO=
=5FCONFIG['CPLD=5FTCK'] &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D &nbsp;
{ 'gpio=5Fpin': 'P0', 'direction': 'out' }<br> GPIO=5FCONFIG['CPLD=5FTDO'] =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D &nbsp; { 'gpio=5Fpin': 'P1',
'direction': 'out' }<br> GPIO=5FCONFIG['CPLD=5FTDI'] &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D &nbsp; { 'gpio=5Fpin': 'P2',
'direction': 'out' }<br> GPIO=5FCONFIG['CPLD=5FTMS'] &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D &nbsp; { 'gpio=5Fpin': 'P3',
'direction': 'out' }<br>-GPIO=5FCONFIG['CHECKSTOP'] &nbsp; &nbsp; &nbsp;=3D=
 &nbsp; { 'gpio=5Fpin': 'P5',
'direction': 'in' }<br>+GPIO=5FCONFIG['CHECKSTOP0'] &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; =3D &nbsp; { 'gpio=5Fpin': 'P5', 'direction':
'in' }<br> <br> GPIO=5FCONFIG['SLOT0=5FRISER=5FPRESENT'] =3D &nbsp; { 'gpio=
=5Fpin': 'N0', 'direction':
'in' }<br> GPIO=5FCONFIG['SLOT1=5FRISER=5FPRESENT'] =3D &nbsp; { 'gpio=5Fpi=
n': 'N1', 'direction':
'in' }<br>diff --git a/bin/chassis=5Fcontrol.py b/bin/chassis=5Fcontrol.py<=
br>index 953f9fd..7b39a9f 100755<br>--- a/bin/chassis=5Fcontrol.py<br>+++ b=
/bin/chassis=5Fcontrol.py<br>@@ -217,17 +217,17 @@ class ChassisControlObje=
ct(Openbmc.DbusProperties,Openbmc.DbusObjectManager):<br> &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;def
host=5Fxstop=5Fsignal=5Fhandler(self):<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
print &quot;Checkstop Error, Waiting for 30sec before Hard Rebooting&quot;<=
br>- &nbsp; &nbsp; &nbsp; &nbsp;time.sleep(30)<br>+ &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;time.sleep(30=
)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
self.Set(DBUS=5FNAME,&quot;reboot&quot;,1)<br> &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
self.reboot()<br> <br> if =5F=5Fname=5F=5F =3D=3D '=5F=5Fmain=5F=5F':<br>- =
&nbsp; &nbsp;dbus.mainloop.glib.DBusGMainLoop(set=5Fas=5Fdefault=3DTrue)<br=
>-<br>- &nbsp; &nbsp;bus =3D Openbmc.getDBus()<br>- &nbsp; &nbsp;name =3D d=
bus.service.BusName(DBUS=5FNAME, bus)<br>- &nbsp; &nbsp;obj =3D ChassisCont=
rolObject(bus, OBJ=5FNAME)<br>- &nbsp; &nbsp;mainloop =3D gobject.MainLoop(=
)<br>- &nbsp; &nbsp;<br>- &nbsp; &nbsp;print &quot;Running ChassisControlSe=
rvice&quot;<br>- &nbsp; &nbsp;mainloop.run()<br>+ &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dbus.mainloop=
.glib.DBusGMainLoop(set=5Fas=5Fdefault=3DTrue)<br>+<br>+ &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bus
=3D Openbmc.getDBus()<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;name
=3D dbus.service.BusName(DBUS=5FNAME, bus)<br>+ &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;obj
=3D ChassisControlObject(bus, OBJ=5FNAME)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mainloop
=3D gobject.MainLoop()<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;print
&quot;Running ChassisControlService&quot;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mainloop.run(=
)<br>diff --git a/includes/gpio-init-gdbus.c b/includes/gpio-init-gdbus.c<b=
r>index b9d7712..cf47fb1 100644<br>--- a/includes/gpio-init-gdbus.c<br>+++ =
b/includes/gpio-init-gdbus.c<br>@@ -23,13 +23,13 @@ int gpio=5Finit(void *c=
onnection, GPIO* gpio)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;g=5Fassert=5Fno=5Ferror
(error);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
error
=3D NULL;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;proxy
=3D g=5Fdbus=5Fproxy=5Fnew=5Fsync ((GDBusConnection*)connection,<br>- &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; G=5FDBUS=5FPROXY=5FFLAGS=5FNONE,<=
br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; NULL, &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* GDBusInterfaceInfo */<br=
>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;org.openbmc.managers.System=
&quot;,
/* name */<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;/org/openbmc/managers/Syste=
m&quot;,
/* object path */<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;org.openbmc.managers.System=
&quot;,
&nbsp; &nbsp; &nbsp; &nbsp;/* interface */<br>- &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; NULL, /* GCancellable */<br>- &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;error);<br>+ &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
G=5FDBUS=5FPROXY=5FFLAGS=5FNONE,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
NULL, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
/* GDBusInterfaceInfo */<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&quot;org.openbmc.managers.System&quot;, &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; /* name */<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&quot;/org/openbmc/managers/System&quot;,/* object path */<br>+ &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&quot;org.openbmc.managers.System&quot;, /* interface */<br>+ &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
NULL, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
/* GCancellable */<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&amp;error);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;if
(error !=3D NULL) {<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return GPIO=5FLOOKUP=5FERROR;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;}<br>@@ -58,9 +58,8 @@ int gpio=5Finit(void *connectio=
n, GPIO* gpio)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
sprintf(dev,&quot;%s/gpio%d/value&quot;,gpio-&gt;dev,gpio-&gt;num);<br> &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
//check if gpio is exported, if not export<br>- &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;int result =3D stat(dev, &amp;st);<br>- &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;if (result)<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{<br>+ &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int
result =3D stat(dev, &amp;st);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(result) {<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sprintf(dev,&=
quot;%s/export&quot;,gpio-&gt;dev);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fd
=3D open(dev, O=5FWRONLY);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(fd =3D=3D GPIO=5FERROR) {<br>@@ -76,8 +75,7 @@ int gpio=5Finit(void *conne=
ction, GPIO* gpio)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br> &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
}<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
const char* file =3D &quot;edge&quot;;<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(strcmp(gpio-&gt;direction,&quot;in&quot;)=3D=3D0 || strcmp(gpio-&gt;direct=
ion,&quot;out&quot;)=3D=3D0)<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{<br>+ &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(strcmp(gpio-&gt;direction,&quot;in&quot;)=3D=3D0 || strcmp(gpio-&gt;direct=
ion,&quot;out&quot;)=3D=3D0)
{<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file
=3D &quot;direction&quot;;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
}<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
sprintf(dev,&quot;%s/gpio%d/%s&quot;,gpio-&gt;dev,gpio-&gt;num,file);<br>di=
ff --git a/includes/gpio-init-sdbus.c b/includes/gpio-init-sdbus.c<br>index=
 f756038..d2d0a42 100644<br>--- a/includes/gpio-init-sdbus.c<br>+++ b/inclu=
des/gpio-init-sdbus.c<br>@@ -10,38 +10,37 @@<br> #include &quot;gpio.h&quot=
;<br> #include &lt;systemd/sd-bus.h&gt;<br> <br>-<br> // Gets the gpio devi=
ce path from gpio manager object<br> int gpio=5Finit(void *connection, GPIO=
* gpio)<br> {<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;int
rc =3D GPIO=5FOK;<br>- &nbsp; &nbsp;sd=5Fbus=5Ferror err &nbsp; &nbsp;=3D S=
D=5FBUS=5FERROR=5FNULL;<br>- &nbsp; &nbsp;sd=5Fbus=5Fmessage *res =3D NULL;=
<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
sd=5Fbus=5Ferror err &nbsp; &nbsp;=3D SD=5FBUS=5FERROR=5FNULL;<br>+ &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
sd=5Fbus=5Fmessage *res =3D NULL;<br> <br>- &nbsp; &nbsp;sd=5Fbus=5Ferror=
=5Ffree(&amp;err);<br>- &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funref(res);<br>+ =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
sd=5Fbus=5Ferror=5Ffree(&amp;err);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;
sd=5Fbus=5Fmessage=5Funref(res);<br> <br>- &nbsp; &nbsp;rc =3D sd=5Fbus=5Fc=
all=5Fmethod ((sd=5Fbus*)connection,<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;org.openbmc.managers.System&=
quot;,
&nbsp;/* name */<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;/org/openbmc/managers/System=
&quot;,
/* object path */<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;org.openbmc.managers.System&=
quot;,
&nbsp;/* interface */<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;gpioInit&quot;,<br>- &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;err,<br>- &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;res,<br>- &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;s&quot;,<br>- &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gpio-&gt;name);<br>+ &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
rc =3D sd=5Fbus=5Fcall=5Fmethod ((sd=5Fbus*)connection,<br>+ &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&quot;org.openbmc.managers.System&quot;, &nbsp;/* name */<br>+ &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&quot;/org/openbmc/managers/System&quot;, /* object path */<br>+ &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&quot;org.openbmc.managers.System&quot;, &nbsp;/* interface */<br>+ &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&quot;gpioInit&quot;,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&amp;err,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&amp;res,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&quot;s&quot;,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
gpio-&gt;name);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>- &nbsp; &nbsp;if(rc &lt; 0)<br>- &nb=
sp; &nbsp;{<br>- &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;Failed to=
 init gpio
for %s : %s\n&quot;, gpio-&gt;name, err.message);<br>- &nbsp; &nbsp; &nbsp;=
 &nbsp;return -1;<br>- &nbsp; &nbsp;}<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;
if(rc &lt; 0)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
{<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stder=
r,
&quot;Failed to init gpio for %s : %s\n&quot;, gpio-&gt;name, err.message);=
<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
-1;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
}<br> &nbsp; &nbsp; <br>- &nbsp; &nbsp;rc =3D sd=5Fbus=5Fmessage=5Fread (re=
s, &quot;sis&quot;, &amp;gpio-&gt;dev,
&amp;gpio-&gt;num, &amp;gpio-&gt;direction);<br>- &nbsp; &nbsp;if (rc &lt; =
0)<br>- &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>- &nbsp; &nbsp;else<br>- &=
nbsp; &nbsp; &nbsp; &nbsp;g=5Fprint(&quot;GPIO Lookup: &nbsp;%s =3D %d,%s\n=
&quot;,gpio-&gt;name,gpio-&gt;num,gpio-&gt;direction);<br>+ &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
rc =3D sd=5Fbus=5Fmessage=5Fread (res, &quot;sis&quot;, &amp;gpio-&gt;dev, =
&amp;gpio-&gt;num,
&amp;gpio-&gt;direction);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;
if (rc &lt; 0)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
-1;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
else<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;g=5Fprint(&qu=
ot;GPIO
Lookup: &nbsp;%s =3D %d,%s\n&quot;,gpio-&gt;name,gpio-&gt;num,gpio-&gt;dire=
ction);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<=
br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//export
and set direction<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;char
dev[254];<br>@@ -49,11 +48,11 @@ int gpio=5Finit(void *connection, GPIO* gp=
io)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int
fd;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;do
{<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
struct stat st;<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>+<br> &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
sprintf(dev,&quot;%s/gpio%d/value&quot;,gpio-&gt;dev,gpio-&gt;num);<br> &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
//check if gpio is exported, if not export<br>- &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;int result =3D stat(dev, &amp;st);<br>- &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;if (result)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int
result =3D stat(dev, &amp;st);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(result)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
{<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sprintf(dev,&=
quot;%s/export&quot;,gpio-&gt;dev);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fd
=3D open(dev, O=5FWRONLY);<br>diff --git a/includes/gpio.c b/includes/gpio.=
c<br>index b6fbf13..52cfaeb 100755<br>--- a/includes/gpio.c<br>+++ b/includ=
es/gpio.c<br>@@ -9,7 +9,6 @@<br> #include &lt;sys/mman.h&gt;<br> #include &=
quot;gpio.h&quot;<br> <br>-<br> int gpio=5Fwritec(GPIO* gpio, char value)<b=
r> {<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;g=5F=
assert
(gpio !=3D NULL);<br>diff --git a/objects/host=5Fxstop=5Fobj.c b/objects/ho=
st=5Fxstop=5Fobj.c<br>index 1de4d11..d1f8491 100644<br>--- a/objects/host=
=5Fxstop=5Fobj.c<br>+++ b/objects/host=5Fxstop=5Fobj.c<br>@@ -10,28 +10,19 =
@@<br> #include &lt;systemd/sd-bus.h&gt;<br> #include &quot;gpio.h&quot;<br=
> <br>-/* <br>- * -----------------------------------------------<br>- * FI=
XME: Fetch GPIO NUM from MRW instead?<br>- * ------------------------------=
-----------------<br>- */<br>-GPIO gpio=5Fxstop &nbsp; &nbsp;=3D (GPIO){ &q=
uot;CHECKSTOP&quot; }; /* This
object will use these GPIOs */<br>-const int gpio=5Fnum=5Fxstop &nbsp; &nbs=
p;=3D 440;<br>-const char* gpio=5Fdev=5Fpath &nbsp; =3D &quot;/sys/class/gp=
io&quot;;<br>-const char* gpio=5Fdev=5Fexp &nbsp; &nbsp;=3D &quot;/sys/clas=
s/gpio/export&quot;;<br>-const char* gpio=5Fdev=5Fxstop &nbsp;=3D &quot;/sy=
s/class/gpio/gpio440&quot;;<br>-const char* gpio=5Fval=5Fxstop &nbsp;=3D &q=
uot;/sys/class/gpio/gpio440/value&quot;;<br>-const char* gpio=5Fdir=5Fxstop=
 &nbsp;=3D &quot;/sys/class/gpio/gpio440/direction&quot;;<br>+static const =
char* xstop0 &nbsp; &nbsp; &nbsp;=3D &quot;/org/openbmc/sensors/host/cpu0/X=
stop&quot;;<br>+static const char* srvc=5Fname &nbsp; =3D &quot;org.openbmc=
.Sensors&quot;;<br>+static const char* iface=5Fname &nbsp;=3D &quot;org.ope=
nbmc.SensorValue&quot;;<br>+<br>+GPIO gpio=5Fxstop0 &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;
&nbsp; =3D (GPIO){ &quot;CHECKSTOP0&quot; }; /* This object will
use these GPIOs */<br>+sd=5Fbus* bus &nbsp; &nbsp; &nbsp; &nbsp; =3D NULL;<=
br>+sd=5Fbus=5Fslot* slot &nbsp; =3D NULL;<br> <br> typedef struct {<br> &n=
bsp; &nbsp; bool isXstopped;<br> } HostState;<br> <br>-HostState hostState =
=3D (HostState) {false};<br>-<br>-static const char* xstop0 &nbsp; &nbsp; &=
nbsp;=3D &quot;/org/openbmc/sensors/host/cpu0/Xstop&quot;;<br>-static const=
 char* srvc=5Fname &nbsp; =3D &quot;org.openbmc.Sensors&quot;;<br>-static c=
onst char* iface=5Fname &nbsp;=3D &quot;org.openbmc.SensorValue&quot;;<br>+=
HostState hostState0 =3D (HostState) {false};<br> <br> int bus=5Fproperty=
=5Fget=5Fbool(sd=5Fbus *bus, const char *path, const char *interface,
const char *property, sd=5Fbus=5Fmessage *reply, void *userdata, sd=5Fbus=
=5Ferror
*error)<br> { <br>@@ -47,10 +38,6 @@ static const sd=5Fbus=5Fvtable host=5F=
xstop=5Fvtable[] =3D<br> &nbsp; &nbsp; SD=5FBUS=5FVTABLE=5FEND,<br> };<br> =
<br>-<br>-sd=5Fbus* bus &nbsp; &nbsp; &nbsp; &nbsp; =3D NULL;<br>-sd=5Fbus=
=5Fslot* slot &nbsp; =3D NULL;<br>-<br> static gboolean<br> on=5Fhost=5Fxst=
op (GIOChannel *channel, GIOCondition condition, gpointer user=5Fdata)<br> =
{<br>@@ -62,13 +49,11 @@ on=5Fhost=5Fxstop (GIOChannel *channel, GIOConditi=
on condition,
gpointer user=5Fdata)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;g=5Fio=5Fchannel=5Fseek=5Fposition(channel,
0, G=5FSEEK=5FSET, 0);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;GIOStatus
rc =3D g=5Fio=5Fchannel=5Fread=5Fchars(channel, buf, 1, &amp;bytes=5Fread, =
&amp;error);<br> <br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;
printf(&quot;%s\n&quot;,buf);<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;
<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (gpio=5Fxstop.irq=5Finited) {<br>- &nbsp; &nbsp; &nbsp; &nbsp; hostState=
.isXstopped =3D true;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;
if (gpio=5Fxstop0.irq=5Finited) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; hostStat=
e0.isXstopped =3D true;<br> &nbsp; &nbsp; }<br> &nbsp; &nbsp; else {<br>- &=
nbsp; &nbsp; &nbsp; &nbsp;gpio=5Fxstop.irq=5Finited =3D true;<br>+ &nbsp; &=
nbsp; &nbsp; &nbsp;gpio=5Fxstop0.irq=5Finited =3D true;<br> &nbsp; &nbsp; }=
<br> <br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret=
urn
true;<br>@@ -77,11 +62,6 @@ on=5Fhost=5Fxstop (GIOChannel *channel, GIOCond=
ition condition,
gpointer user=5Fdata)<br> int main(void)<br> {<br> &nbsp; &nbsp; int rc &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D
0;<br>- &nbsp; &nbsp;int fd &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;=3D
0;<br>- &nbsp; &nbsp;int result &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0;<br=
>- &nbsp; &nbsp;struct stat st;<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;
char data[4];<br>-<br> &nbsp; &nbsp; sd=5Fbus=5Ferror err &nbsp; &nbsp;=3D =
SD=5FBUS=5FERROR=5FNULL;<br> &nbsp; &nbsp; sd=5Fbus=5Fmessage *res =3D NULL=
;<br> <br>@@ -104,19 +84,17 @@ int main(void)<br> &nbsp; &nbsp; &nbsp; &nbs=
p; goto cleanup;<br> &nbsp; &nbsp; }<br> <br>- &nbsp; &nbsp;/*<br>- &nbsp; =
&nbsp; * Setup GPIO IRQ for Host xstop<br>- &nbsp; &nbsp; */<br>+ &nbsp; &n=
bsp;/* Setup GPIO IRQ for Host xstop */<br> &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;rc
=3D GPIO=5FOK;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;do
{<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rc
=3D gpio=5Finit(bus, &amp;gpio=5Fxstop);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rc
=3D gpio=5Finit(bus, &amp;gpio=5Fxstop0);<br> &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (rc !=3D GPIO=5FOK) { goto cleanup; }<br>- &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rc
=3D gpio=5Fopen=5Finterrupt(&amp;gpio=5Fxstop, on=5Fhost=5Fxstop, NULL/*obj=
ect*/);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rc
=3D gpio=5Fopen=5Finterrupt(&amp;gpio=5Fxstop0, on=5Fhost=5Fxstop, NULL/*ob=
ject*/);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (rc !=3D GPIO=5FOK) { goto cleanup; }<br> &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;}
while(0);<br> <br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;if
(rc !=3D GPIO=5FOK) {<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;printf(&quot;=
ERROR
PowerButton: GPIO setup (rc=3D%d)\n&quot;,rc);<br>+ &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stder=
r,
&quot;ERROR CHECKSTOP0: GPIO setup =3D%d\n&quot;, rc);<br> &nbsp; &nbsp; &n=
bsp; &nbsp; goto cleanup;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;}<br> <br>@@ -127,18 +105,6 @@ int main(void)<br> &nbsp; &=
nbsp; &nbsp; &nbsp; goto cleanup;<br> &nbsp; &nbsp; }<br> <br>- &nbsp; &nbs=
p;/* Register for GPIO IRQ */<br>- &nbsp; &nbsp;gpio=5Fxstop.irq=5Finited =
=3D false;<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
fd =3D open(gpio=5Fval=5Fxstop, O=5FRDONLY | O=5FNONBLOCK );<br>- &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (fd =3D=3D -1) {<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rc
=3D -1;<br>- &nbsp; &nbsp; &nbsp; &nbsp;goto cleanup;<br>- &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
}<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
else {<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;GIOChannel*
channel =3D g=5Fio=5Fchannel=5Funix=5Fnew(fd);<br>- &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;g=5Fio=5Fadd=
=5Fwatch(channel,
G=5FIO=5FPRI, on=5Fhost=5Fxstop, NULL);<br>- &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;
}<br>-<br> &nbsp; &nbsp; /* Register with Sensor Manager */<br> &nbsp; &nbs=
p; sd=5Fbus=5Ferror=5Ffree(&amp;err);<br> &nbsp; &nbsp; sd=5Fbus=5Fmessage=
=5Funref(res);<br>@@ -152,8 +118,8 @@ int main(void)<br> &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;res,<br> &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;ss&quot;,<br> &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; xstop0,<br>- &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;HostXstopSensor&quot;);
/* FIXME: register method needs the Sensor class name ! */<br>- &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; <br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;HostXstopSensor&quot;);<br>+=
<br> &nbsp; &nbsp; if(rc &lt; 0) {<br> &nbsp; &nbsp; &nbsp; &nbsp; fprintf(=
stderr, &quot;Failed to init gpio
for %s : %s\n&quot;, xstop0, err.message);<br> &nbsp; &nbsp; &nbsp; &nbsp; =
return -1;<br>-- <br>2.8.2<br><br><br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br>openbmc@lists.ozl=
abs.org<br></font></tt><a href=3Dhttps://lists.ozlabs.org/listinfo/openbmc>=
<tt><font size=3D2>https://lists.ozlabs.org/listinfo/openbmc</font></tt></a=
><tt><font size=3D2><br></font></tt><br><br><BR>
--=_alternative 000CE01186257FB8_=--
