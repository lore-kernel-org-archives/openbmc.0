Return-Path: <austenc@us.ibm.com>
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B036B1A0190
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 06:38:00 +1100 (AEDT)
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 1 Feb 2016 12:37:57 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 1 Feb 2016 12:37:56 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 197DF1FF0049
 for <openbmc@lists.ozlabs.org>; Mon,  1 Feb 2016 12:26:06 -0700 (MST)
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u11JbuZS31326448
 for <openbmc@lists.ozlabs.org>; Mon, 1 Feb 2016 12:37:56 -0700
Received: from d03av02.boulder.ibm.com (localhost [127.0.0.1])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u11Jbtwi012887
 for <openbmc@lists.ozlabs.org>; Mon, 1 Feb 2016 12:37:55 -0700
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u11JbqH9012502
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 1 Feb 2016 12:37:53 -0700
Message-Id: <201602011937.u11JbqH9012502@d03av02.boulder.ibm.com>
Received: from /spool/local
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 1 Feb 2016 14:37:52 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 1 Feb 2016 14:37:49 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 1 Feb 2016 19:37:48 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.94)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 1 Feb 2016 19:37:47 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016020119385771-383239 ;
 Mon, 1 Feb 2016 19:38:57 +0000 
In-Reply-To: <1454348438-27758-2-git-send-email-openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH skeleton] Makefile changes to fix LED build failures in
 bitbake
From: "Chris Austen" <austenc@us.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Date: Mon, 1 Feb 2016 19:37:46 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <1454348438-27758-2-git-send-email-openbmc-patches@stwcx.xyz>,
 <1454348438-27758-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_01182016_FP3 January 26, 2016
X-LLNOutbound: False
X-Disclaimed: 54631
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 16020119-0029-0000-0000-000010201A58
X-IBM-ISS-SpamDetectors: Score=0.404685; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.404685; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004865; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000138; SDB=6.00653795; UDB=6.00296150; UTC=2016-02-01
 19:37:47
x-cbparentid: 16020119-4536-0000-0000-000005F1FB00
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
X-List-Received-Date: Mon, 01 Feb 2016 19:38:01 -0000

 Reviewed by Chris Austen <austenc@us.ibm.com>
Looks good


Chris Austen
POWER Systems Enablement Manager=20
(512) 286-5184 (T/L: 363-5184)

-----"openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org> wrot=
e: -----
To: openbmc@lists.ozlabs.org
From: OpenBMC Patches=20
Sent by: "openbmc"=20
Date: 02/01/2016 11:40AM
Subject: [PATCH skeleton] Makefile changes to fix LED build failures in bit=
bake

From: vishwa <vishwanath@in.ibm.com>

---
=C2=A0Makefile | 6 ++++--
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 65787ff..e787990 100755
--- a/Makefile
+++ b/Makefile
@@ -6,6 +6,8 @@ OBJS2 =C2=A0 =3D progress.o ast-sf-ctrl.o libflash.o libffs=
.o arm=5Fio.o
=C2=A0OBJS3 =C2=A0 =3D obj/progress.o obj/ast-sf-ctrl.o obj/libflash.o obj/=
libffs.o obj/arm=5Fio.o
=C2=A0INCLUDES=3D$(shell pkg-config --cflags gio-unix-2.0 glib-2.0) -Iinclu=
des -Iobjects/pflash -I.
=C2=A0LIBS=3D$(shell pkg-config --libs gio-unix-2.0 glib-2.0) -Llib -lopenb=
mc=5Fintf
+INC=5FFLAG +=3D $(shell pkg-config --cflags --libs libsystemd) -I. -O2
+LIB=5FFLAG +=3D $(shell pkg-config =C2=A0--libs libsystemd)
=C2=A0
=C2=A0%.o: interfaces/%.c=20
=C2=A0	$(CC) -c -fPIC -o obj/$@ $< $(CFLAGS) $(INCLUDES)
@@ -22,7 +24,7 @@ LIBS=3D$(shell pkg-config --libs gio-unix-2.0 glib-2.0) -=
Llib -lopenbmc=5Fintf
=C2=A0%.o: objects/pflash/libflash/%.c
=C2=A0	$(CC) -c -o obj/$@ $< $(CFLAGS) $(INCLUDES)
=C2=A0
-all: setup libopenbmc=5Fintf power=5Fcontrol led=5Fcontroller button=5Fpow=
er button=5Freset control=5Fhost host=5Fwatchdog board=5Fvpd pcie=5Fslot=5F=
present flash=5Fbios flasher pflash hwmons=5Fbarreleye control=5Fbmc
+all: setup libopenbmc=5Fintf power=5Fcontrol led=5Fcontroller button=5Fpow=
er button=5Freset control=5Fhost host=5Fwatchdog board=5Fvpd pcie=5Fslot=5F=
present flash=5Fbios flasher pflash hwmons=5Fbarreleye control=5Fbmc led=5F=
controller=5Fnew
=C2=A0
=C2=A0setup:=20
=C2=A0	mkdir -p obj lib
@@ -40,7 +42,7 @@ led=5Fcontroller: led=5Fcontroller.o gpio.o object=5Fmapp=
er.o libopenbmc=5Fintf
=C2=A0	$(CC) -o bin/$@.exe obj/gpio.o obj/led=5Fcontroller.o obj/object=5Fm=
apper.o $(LDFLAGS) $(LIBS)
=C2=A0
=C2=A0led=5Fcontroller=5Fnew: led=5Fcontroller=5Fnew.o
-	$(CC) -o bin/$@.exe obj/led=5Fcontroller=5Fnew.o $(LDFLAGS) $(LIBS) -lsys=
temd
+	$(CC) $(INC=5FFLAG) -o bin/$@.exe obj/led=5Fcontroller=5Fnew.o $(LDFLAGS)=
 $(LIBS) $(LIB=5FFLAG)
=C2=A0
=C2=A0button=5Fpower: button=5Fpower=5Fobj.o gpio.o object=5Fmapper.o libop=
enbmc=5Fintf
=C2=A0	$(CC) -o bin/$@.exe obj/button=5Fpower=5Fobj.o obj/gpio.o obj/object=
=5Fmapper.o $(LDFLAGS) $(LIBS)
--=20
2.6.4


=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc
