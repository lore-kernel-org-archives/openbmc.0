Return-Path: <cbostic@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYs0G4JSCzDq5c
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2016 01:22:04 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5LFIkpc071742
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 11:22:01 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 23q6r3bque-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 11:22:01 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@us.ibm.com>;
 Tue, 21 Jun 2016 09:21:59 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 21 Jun 2016 09:21:57 -0600
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: cbostic@us.ibm.com
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 234753E4006F
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 09:21:57 -0600 (MDT)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5LFLhEU40042604
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 08:21:57 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E84446A03F
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 09:21:56 -0600 (MDT)
Received: from d50lp31.co.us.ibm.com (unknown [9.17.249.32])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS id 186196A05F
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 09:21:56 -0600 (MDT)
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@us.ibm.com>;
 Tue, 21 Jun 2016 09:21:53 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.93)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 21 Jun 2016 09:21:51 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: cbostic@us.ibm.com
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <cbostic@us.ibm.com>;
 Tue, 21 Jun 2016 15:21:49 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 21 Jun 2016 15:21:48 -0000
Received: from us1a3-mail60.a3.dal09.isc4sb.com ([10.142.3.52])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016062115214779-995724 ;
 Tue, 21 Jun 2016 15:21:47 +0000 
MIME-Version: 1.0
Subject: [PATCH linux] FSI: Initial stubs for device driver
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Reed B Frandsen" <rfrandse@us.ibm.com>, "Edward James"
 <eajames@us.ibm.com>
From: "Christopher Bostic" <cbostic@us.ibm.com>
Date: Tue, 21 Jun 2016 10:21:45 -0500
X-KeepSent: 25FAD433:8D8FCEB7-00257FD9:005434D4;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 31827
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=8FBBF54ADFC7B2448f9e8a93df938690918c8FBBF54ADFC7B244"
x-cbid: 16062115-0020-0000-0000-000009260518
X-IBM-ISS-SpamDetectors: Score=0.380009; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.380009; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005414; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000170; SDB=6.00719488; UDB=6.00335695; UTC=2016-06-21
 15:21:48
x-cbparentid: 16062115-3202-0000-0000-000000E18DD2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF25FAD433.8D8FCEB7-ON00257FD9.005434D4-86257FD9.005463AC@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-21_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=4
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1606210174
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
X-List-Received-Date: Tue, 21 Jun 2016 15:22:07 -0000

--0__=8FBBF54ADFC7B2448f9e8a93df938690918c8FBBF54ADFC7B244
Content-type: multipart/alternative; 
	Boundary="1__=8FBBF54ADFC7B2448f9e8a93df938690918c8FBBF54ADFC7B244"


--1__=8FBBF54ADFC7B2448f9e8a93df938690918c8FBBF54ADFC7B244
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII




From: Christopher Bostic <cbostic@us.ibm.com>
Date: Thu, 9 Jun 2016 13:42:59 -0500

Initial FSI device driver stubs

---
 drivers/Makefile      |  1 +
 drivers/fsi/Makefile  |  5 +++++
 drivers/fsi/fsiinit.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++
++++
 drivers/fsi/fsiinit.h | 45 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 105 insertions(+)
 create mode 100644 drivers/fsi/Makefile
 create mode 100644 drivers/fsi/fsiinit.c
 create mode 100644 drivers/fsi/fsiinit.h

diff --git a/drivers/Makefile b/drivers/Makefile
index 795d0ca..8ea7c58 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -172,3 +172,4 @@ obj-$(CONFIG=5FSTM)        +=3D hwtracing/stm/
 obj-$(CONFIG=5FANDROID)        +=3D android/
 obj-$(CONFIG=5FNVMEM)        +=3D nvmem/
 obj-$(CONFIG=5FFPGA)        +=3D fpga/
+obj-$(CONFIG=5FFSI)        +=3D fsi/
diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
new file mode 100644
index 0000000..f547c08
--- /dev/null
+++ b/drivers/fsi/Makefile
@@ -0,0 +1,5 @@
+#
+# Makefile for the FSI bus specific drivers.
+#
+
+obj-y        +=3D fsiinit.o
diff --git a/drivers/fsi/fsiinit.c b/drivers/fsi/fsiinit.c
new file mode 100644
index 0000000..d7902d8
--- /dev/null
+++ b/drivers/fsi/fsiinit.c
@@ -0,0 +1,54 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2012
+ *
+ * FSI Master device driver
+ *
+ * Thomas Richter, IBM Boeblingen, Germany, 17-Jun-2010
+ * Christopher Bostic, IBM Austin, TX  2016
+ *
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include "fsiinit.h"
+
+MODULE=5FAUTHOR("Christopher Bostic cbostic@us.ibm.com");
+MODULE=5FDESCRIPTION("FSI master device driver");
+
+#define FSIDD=5FMAJOR    0        /* FSI device driver major */
+#define    FSIDD=5FTOSTR(x)    #x
+#define    FSIDD=5FVERNO    4000
+#define    FSIDD=5FVER(x)    FSIDD=5FTOSTR(x)
+
+struct fsidd fsidd =3D {        /* FSI device driver structure definition =
*/
+    .magic =3D FSI=5FDD=5FMAGIC,
+    .strno =3D FSI=5FDD=5FSTRNO,
+};
+
+
+static int fsi=5Fstart(void)
+{
+    int rc =3D 0;
+
+
+    printk("FSI DD %s installation ok\n", fsidd.vstr);
+    return rc;
+}
+
+static void fsi=5Fexit(void)
+{
+
+}
+
+static int =5F=5Finit fsi=5Finit(void)
+{
+    int rc =3D 0;
+
+    /* Set up the host controller */
+    fsi=5Fstart();
+    return rc;
+}
+
+module=5Finit(fsi=5Finit);
+module=5Fexit(fsi=5Fexit);
+
diff --git a/drivers/fsi/fsiinit.h b/drivers/fsi/fsiinit.h
new file mode 100644
index 0000000..2383610
--- /dev/null
+++ b/drivers/fsi/fsiinit.h
@@ -0,0 +1,45 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2010
+ *
+ * FSI Master device driver
+ *
+ * Thomas Richter, IBM Boeblingen, Germany, Jun-2010
+ * Christopher Bostic, IBM Austin, TX 2013
+ *
+ *
+ * Structure definitions and defines.
+ */
+
+#ifndef DRIVERS=5FFSIINIT=5FH
+#define DRIVERS=5FFSIINIT=5FH
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/kobject.h>
+#include <linux/workqueue.h>
+#include <linux/hrtimer.h>
+
+#define VSTRLEN        32        /* Version string length */
+
+enum {
+    FSI=5FDD=5FMAGIC =3D 0x64644632,    /* ddF2 */
+    FSI=5FDD=5FSTRNO =3D 0x1        /* Structure version number */
+};
+
+struct fsidd {                /* FSI Main structure */
+    unsigned long magic;        /* Magic number */
+    unsigned long strno;        /* Structure version number */
+    char vstr[VSTRLEN];        /* Version string */
+    dev=5Ft major;            /* Major number of device */
+    struct workqueue=5Fstruct *hotp=5Fwq;    /* Hot plug work queue */
+    wait=5Fqueue=5Fhead=5Ft error=5Fwq;    /* Wait queue for port errors */
+    wait=5Fqueue=5Fhead=5Ft lbus=5Fwq;    /* Wait queue for lbus events */
+    wait=5Fqueue=5Fhead=5Ft irq=5Fwq;    /* Wait queue for IRQ loops */
+    wait=5Fqueue=5Fhead=5Ft link=5Fwq;    /* Wait queue for link changes */
+    unsigned long state;        /* State driver is in */
+    struct kobject kobj;        /* Anchor point in /sys/kernel */
+};
+
+#define    to=5Ffsidd(a)        container=5Fof(a, struct fsidd, kobj)
+
+#endif /* DRIVERS=5FFSIINIT=5FH */
--
1.8.2.2


                                                                           =
         =20
                                                                           =
         =20
                                                                           =
         =20
  Christopher L Bostic                                                     =
      IBM=20
                                                                           =
         =20
  Phone: 1-512-286-5411 | Tie-Line: 363-5411                               =
         =20
                                                                           =
         =20
  Enterprise Systems Group - Power Firmware                                =
         =20
  Service Processor Microcode Development  Dept 3ALS                       =
         =20
  11400 Burnet Road                                                        =
         =20
  Austin, TX 78759                                                         =
         =20
                                                                           =
         =20
                                                                           =
         =20




--1__=8FBBF54ADFC7B2448f9e8a93df938690918c8FBBF54ADFC7B244
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt>From: Christopher Bostic &lt;cbostic@us.ibm.com&gt;<br>D=
ate: Thu, 9 Jun 2016 13:42:59 -0500<br></tt><br><tt>Initial FSI device driv=
er stubs</tt><br><tt><br>---<br> drivers/Makefile &nbsp; &nbsp; &nbsp;| &nb=
sp;1 +<br> drivers/fsi/Makefile &nbsp;| &nbsp;5 +++++<br> drivers/fsi/fsiin=
it.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++++<br> drivers/f=
si/fsiinit.h | 45 ++++++++++++++++++++++++++++++++++++++++++<br> 4 files ch=
anged, 105 insertions(+)<br> create mode 100644 drivers/fsi/Makefile<br> cr=
eate mode 100644 drivers/fsi/fsiinit.c<br> create mode 100644 drivers/fsi/f=
siinit.h<br><br>diff --git a/drivers/Makefile b/drivers/Makefile<br>index 7=
95d0ca..8ea7c58 100644<br>--- a/drivers/Makefile<br>+++ b/drivers/Makefile<=
br>@@ -172,3 +172,4 @@ obj-$(CONFIG=5FSTM) &nbsp; &nbsp; &nbsp; &nbsp;+=3D =
hwtracing/stm/<br> obj-$(CONFIG=5FANDROID) &nbsp; &nbsp; &nbsp; &nbsp;+=3D =
android/<br> obj-$(CONFIG=5FNVMEM) &nbsp; &nbsp; &nbsp; &nbsp;+=3D nvmem/<b=
r> obj-$(CONFIG=5FFPGA) &nbsp; &nbsp; &nbsp; &nbsp;+=3D fpga/<br>+obj-$(CON=
FIG=5FFSI) &nbsp; &nbsp; &nbsp; &nbsp;+=3D fsi/<br>diff --git a/drivers/fsi=
/Makefile b/drivers/fsi/Makefile<br>new file mode 100644<br>index 0000000..=
f547c08<br>--- /dev/null<br>+++ b/drivers/fsi/Makefile<br>@@ -0,0 +1,5 @@<b=
r>+#<br>+# Makefile for the FSI bus specific drivers.<br>+#<br>+<br>+obj-y =
&nbsp; &nbsp; &nbsp; &nbsp;+=3D fsiinit.o<br>diff --git a/drivers/fsi/fsiin=
it.c b/drivers/fsi/fsiinit.c<br>new file mode 100644<br>index 0000000..d790=
2d8<br>--- /dev/null<br>+++ b/drivers/fsi/fsiinit.c<br>@@ -0,0 +1,54 @@<br>=
+/*<br>+ * Copyright (c) International Business Machines Corp., 2012<br>+ *=
<br>+ * FSI Master device driver<br>+ *<br>+ * Thomas Richter, IBM Boebling=
en, Germany, 17-Jun-2010<br>+ * Christopher Bostic, IBM Austin, TX &nbsp;20=
16<br>+ *<br>+ */<br>+<br>+#include &lt;linux/init.h&gt;<br>+#include &lt;l=
inux/module.h&gt;<br>+#include &quot;fsiinit.h&quot;<br>+<br>+MODULE=5FAUTH=
OR(&quot;Christopher Bostic cbostic@us.ibm.com&quot;);<br>+MODULE=5FDESCRIP=
TION(&quot;FSI master device driver&quot;);<br>+<br>+#define FSIDD=5FMAJOR =
&nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp;/* FSI device driver major */<br>=
+#define &nbsp; &nbsp;FSIDD=5FTOSTR(x) &nbsp; &nbsp;#x<br>+#define &nbsp; &=
nbsp;FSIDD=5FVERNO &nbsp; &nbsp;4000<br>+#define &nbsp; &nbsp;FSIDD=5FVER(x=
) &nbsp; &nbsp;FSIDD=5FTOSTR(x)<br>+<br>+struct fsidd fsidd =3D { &nbsp; &n=
bsp; &nbsp; &nbsp;/* FSI device driver structure definition */<br>+ &nbsp; =
&nbsp;.magic =3D FSI=5FDD=5FMAGIC,<br>+ &nbsp; &nbsp;.strno =3D FSI=5FDD=5F=
STRNO,<br>+};<br>+<br>+<br>+static int fsi=5Fstart(void)<br>+{<br>+ &nbsp; =
&nbsp;int rc =3D 0;<br>+<br>+<br>+ &nbsp; &nbsp;printk(&quot;FSI DD %s inst=
allation ok\n&quot;, fsidd.vstr);<br>+ &nbsp; &nbsp;return rc;<br>+}<br>+<b=
r>+static void fsi=5Fexit(void)<br>+{<br>+<br>+}<br>+<br>+static int =5F=5F=
init fsi=5Finit(void)<br>+{<br>+ &nbsp; &nbsp;int rc =3D 0;<br>+<br>+ &nbsp=
; &nbsp;/* Set up the host controller */<br>+ &nbsp; &nbsp;fsi=5Fstart();<b=
r>+ &nbsp; &nbsp;return rc;<br>+}<br>+<br>+module=5Finit(fsi=5Finit);<br>+m=
odule=5Fexit(fsi=5Fexit);<br>+<br>diff --git a/drivers/fsi/fsiinit.h b/driv=
ers/fsi/fsiinit.h<br>new file mode 100644<br>index 0000000..2383610<br>--- =
/dev/null<br>+++ b/drivers/fsi/fsiinit.h<br>@@ -0,0 +1,45 @@<br>+/*<br>+ * =
Copyright (c) International Business Machines Corp., 2010<br>+ *<br>+ * FSI=
 Master device driver<br>+ *<br>+ * Thomas Richter, IBM Boeblingen, Germany=
, Jun-2010<br>+ * Christopher Bostic, IBM Austin, TX 2013<br>+ *<br>+ *<br>=
+ * Structure definitions and defines.<br>+ */<br>+<br>+#ifndef DRIVERS=5FF=
SIINIT=5FH<br>+#define DRIVERS=5FFSIINIT=5FH<br>+<br>+#include &lt;linux/ke=
rnel.h&gt;<br>+#include &lt;linux/types.h&gt;<br>+#include &lt;linux/kobjec=
t.h&gt;<br>+#include &lt;linux/workqueue.h&gt;<br>+#include &lt;linux/hrtim=
er.h&gt;<br>+<br>+#define VSTRLEN &nbsp; &nbsp; &nbsp; &nbsp;32 &nbsp; &nbs=
p; &nbsp; &nbsp;/* Version string length */<br>+<br>+enum {<br>+ &nbsp; &nb=
sp;FSI=5FDD=5FMAGIC =3D 0x64644632, &nbsp; &nbsp;/* ddF2 */<br>+ &nbsp; &nb=
sp;FSI=5FDD=5FSTRNO =3D 0x1 &nbsp; &nbsp; &nbsp; &nbsp;/* Structure version=
 number */<br>+};<br>+<br>+struct fsidd { &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;/* FSI Main structure */<br>+ &nbsp; &nbsp;unsigned l=
ong magic; &nbsp; &nbsp; &nbsp; &nbsp;/* Magic number */<br>+ &nbsp; &nbsp;=
unsigned long strno; &nbsp; &nbsp; &nbsp; &nbsp;/* Structure version number=
 */<br>+ &nbsp; &nbsp;char vstr[VSTRLEN]; &nbsp; &nbsp; &nbsp; &nbsp;/* Ver=
sion string */<br>+ &nbsp; &nbsp;dev=5Ft major; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;/* Major number of device */<br>+ &nbsp; &nbsp;struct workque=
ue=5Fstruct *hotp=5Fwq; &nbsp; &nbsp;/* Hot plug work queue */<br>+ &nbsp; =
&nbsp;wait=5Fqueue=5Fhead=5Ft error=5Fwq; &nbsp; &nbsp;/* Wait queue for po=
rt errors */<br>+ &nbsp; &nbsp;wait=5Fqueue=5Fhead=5Ft lbus=5Fwq; &nbsp; &n=
bsp;/* Wait queue for lbus events */<br>+ &nbsp; &nbsp;wait=5Fqueue=5Fhead=
=5Ft irq=5Fwq; &nbsp; &nbsp;/* Wait queue for IRQ loops */<br>+ &nbsp; &nbs=
p;wait=5Fqueue=5Fhead=5Ft link=5Fwq; &nbsp; &nbsp;/* Wait queue for link ch=
anges */<br>+ &nbsp; &nbsp;unsigned long state; &nbsp; &nbsp; &nbsp; &nbsp;=
/* State driver is in */<br>+ &nbsp; &nbsp;struct kobject kobj; &nbsp; &nbs=
p; &nbsp; &nbsp;/* Anchor point in /sys/kernel */<br>+};<br>+<br>+#define &=
nbsp; &nbsp;to=5Ffsidd(a) &nbsp; &nbsp; &nbsp; &nbsp;container=5Fof(a, stru=
ct fsidd, kobj)<br>+<br>+#endif /* DRIVERS=5FFSIINIT=5FH */<br>-- <br>1.8.2=
.2<br></tt><br><br><br>
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tr valign=3D"top">=
<td width=3D"650" colspan=3D"2" valign=3D"middle"><hr width=3D"100%" size=
=3D"2" align=3D"left"></td></tr>
<tr valign=3D"top"><td width=3D"398"><b><i><font size=3D"4" color=3D"#466BB=
0" face=3D"Arial">Christopher L Bostic</font></i></b><br><br><b><font size=
=3D"2" color=3D"#466BB0" face=3D"Arial">Phone:</font></b><font size=3D"2" c=
olor=3D"#5F5F5F" face=3D"Arial"> </font><b><font size=3D"2" color=3D"#33333=
3" face=3D"Arial">1-512-286-5411</font></b><font size=3D"2" color=3D"#466BB=
0" face=3D"Arial"> | </font><b><font size=3D"2" color=3D"#466BB0" face=3D"A=
rial">Tie-Line:</font></b><font size=3D"2" color=3D"#5F5F5F" face=3D"Arial"=
> </font><b><font size=3D"2" color=3D"#333333" face=3D"Arial">363-5411</fon=
t></b><b><font size=3D"2" color=3D"#466BB0" face=3D"Arial"><br></font></b><=
br>Enterprise Systems Group - Power Firmware <br>Service Processor Microcod=
e Development  Dept 3ALS<br>11400 Burnet Road<br>Austin, TX 78759<br></td><=
td width=3D"252"><div align=3D"right"><img src=3D"cid:1=5F=5F=3D8FBBF54ADFC=
7B2448f9e8a93df938690918c8FB@" width=3D"87" height=3D"30" alt=3D"IBM"><font=
 size=3D"2" color=3D"#5F5F5F" face=3D"Arial"><br></font></div></td></tr></t=
able><br><BR>
</body></html>

--1__=8FBBF54ADFC7B2448f9e8a93df938690918c8FBBF54ADFC7B244--


--0__=8FBBF54ADFC7B2448f9e8a93df938690918c8FBBF54ADFC7B244
Content-type: image/gif; 
	name="14810419.gif"
Content-Disposition: inline; filename="14810419.gif"
Content-ID: <1__=8FBBF54ADFC7B2448f9e8a93df938690918c8FB@>
Content-Transfer-Encoding: base64

R0lGODlhVwAeAPcAAAAAAIAAAACAAICAAAAAgIAAgACAgMDAwMDcwKbK8ER3u8bGxv///wAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAP/78KCgpICAgP8AAAD/AP//AAAA//8A/wD//////yH5BAAAAAAALAAAAABXAB4A
hwAAAIAAAACAAICAAAAAgIAAgACAgMDAwMDcwKbK8ER3u8bGxv///wAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP/7
8KCgpICAgP8AAAD/AP//AAAA//8A/wD//////wj+ABcoGEiwYMEFDAQaXGhwAUIGEBMyLBixIsSJ
By1qVIiRIEKOHRc+hAiS4ciKJU1qXMmypcuXMGPKnEmzps2bLlNO/Biy40OdBlf2VHByJVCREoeq
TOrT4tGMOKNKnUq1qtWrDBjmDIoSacWOFpve1NqypNOFGsUyXYq1rdu3cOO2JMvyKdq0Te0WnUnX
qFKiQkUebOhVruHDiBPD7Lvx796sDddmLFyT8dm/gaFOvBhZsefPoN9a7kqRdOmvnVNGpExzdESz
pj2G7QxZNmeooXPr3o1aAUmlPP/ePToSZG+2F1dLxhhcuG3ivU+qzZpVIHXecH0PTI5dNHXtdmUZ
h9/5mnnXotOvUx8PmP3Bk9C/4iU/2zeDgAA7


--0__=8FBBF54ADFC7B2448f9e8a93df938690918c8FBBF54ADFC7B244--
