Return-Path: <austenc@us.ibm.com>
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qZFNW2YBKzDq5d
 for <openbmc@lists.ozlabs.org>; Wed, 30 Mar 2016 02:40:43 +1100 (AEDT)
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 29 Mar 2016 11:40:40 -0400
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 29 Mar 2016 11:40:39 -0400
X-IBM-Helo: d01dlp03.pok.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 11F4CC90041
 for <openbmc@lists.ozlabs.org>; Tue, 29 Mar 2016 11:40:34 -0400 (EDT)
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u2TFeco741484540
 for <openbmc@lists.ozlabs.org>; Tue, 29 Mar 2016 15:40:38 GMT
Received: from d01av03.pok.ibm.com (localhost [127.0.0.1])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u2TFebAJ011471
 for <openbmc@lists.ozlabs.org>; Tue, 29 Mar 2016 11:40:38 -0400
Received: from d50lp33.co.us.ibm.com (d50lp33.boulder.ibm.com [9.17.249.38])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u2TFeZYA011264
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Tue, 29 Mar 2016 11:40:37 -0400
Message-Id: <201603291540.u2TFeZYA011264@d01av03.pok.ibm.com>
Received: from localhost
 by d50lp33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 29 Mar 2016 09:40:35 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by d50lp33.co.us.ibm.com (192.168.2.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 29 Mar 2016 09:40:31 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 29 Mar 2016 15:40:28 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 29 Mar 2016 15:39:24 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016032915391994-329011 ;
 Tue, 29 Mar 2016 15:39:19 +0000 
In-Reply-To: <1459242085-10506-2-git-send-email-openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH openbmc v3] meta-phosphor: Move to openbmc-20160329-1
From: "Chris Austen" <austenc@us.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Date: Tue, 29 Mar 2016 15:39:19 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <1459242085-10506-2-git-send-email-openbmc-patches@stwcx.xyz>,
 <1459242085-10506-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_03142016_FP4 March 24, 2016
X-LLNOutbound: False
X-Disclaimed: 11355
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 16032915-0045-0000-0000-000003C6BFCB
X-IBM-ISS-SpamDetectors: Score=0.425523; BY=0.27011; FL=0; FP=0; FZ=0; HX=0;
 KW=0; PH=0; SC=0.425523; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005093; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000155; SDB=6.00680386; UDB=6.00312173; UTC=2016-03-29
 15:39:30
x-cbparentid: 16032915-4536-0000-0000-000006E21194
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
X-List-Received-Date: Tue, 29 Mar 2016 15:40:44 -0000

Joel, have you tested this on real hardware?


Chris Austen
POWER Systems Enablement Manager=20
(512) 286-5184 (T/L: 363-5184)

-----"openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org> wrot=
e: -----
To: openbmc@lists.ozlabs.org
From: OpenBMC Patches=20
Sent by: "openbmc"=20
Date: 03/29/2016 04:02AM
Subject: [PATCH openbmc v3] meta-phosphor: Move to openbmc-20160329-1

From: Joel Stanley <joel@jms.id.au>

We are now on a 4.4 based kernel

 - Fix i2c=5Fsmbus=5Fread=5Fblock=5Fdata error in our i2c bus driver
 - Includes many JFFS2 fixes identified by Milton:
    * Fix directory hardlinks from deleted directories
    * Revert "jffs2: Fix lock acquisition order bug in jffs2=5Fwrite=5Fbegi=
n"
    * jffs2: Fix page lock / f->sem deadlock
    * jffs2: reduce the breakage on recovery from halfway failed rename()
    * mtd: spi-nor: aspeed-smc: Fix flash struct setup for scan
 - Remove our in-tree adm1275 driver in favour of the upstream one,
   which was cherry picked from 4.6-rc1. Adds support for device tree
 - Incremental cleanups to the p8 occ hwmon driver
 - SCU fixes for GPIO configuration relating to Ethernet phy and PCIe

 Squishes down most of the fixes that were found in the 4.3 development
 effort into the commit that added the driver. This is part of the work
 in preparing for upstreaming Aspeed kernel support.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../recipes-kernel/linux/linux-obmc/barreleye.cfg  |   3 -
 .../linux/linux-obmc/hwmon=5Fadm1278.patch           | 165 ---------------=
------
 .../linux/linux-obmc/readme=5Fadm1278.txt            |  78 ----------
 .../recipes-kernel/linux/linux-obmc=5F%.bbappend     |   3 -
 .../common/recipes-kernel/linux/linux-obmc=5F4.3.bb  |  30 ----
 .../common/recipes-kernel/linux/linux-obmc=5F4.4.bb  |  20 +++
 6 files changed, 20 insertions(+), 279 deletions(-)
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/met=
a-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/met=
a-barreleye/recipes-kernel/linux/linux-obmc/hwmon=5Fadm1278.patch
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/met=
a-barreleye/recipes-kernel/linux/linux-obmc/readme=5Fadm1278.txt
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/met=
a-barreleye/recipes-kernel/linux/linux-obmc=5F%.bbappend
 delete mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc=5F=
4.3.bb
 create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc=5F=
4.4.bb

diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barre=
leye/recipes-kernel/linux/linux-obmc/barreleye.cfg b/meta-openbmc-machines/=
meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obm=
c/barreleye.cfg
deleted file mode 100644
index 086f191..0000000
--- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/re=
cipes-kernel/linux/linux-obmc/barreleye.cfg
+++ /dev/null
@@ -1,3 +0,0 @@
-CONFIG=5FPMBUS=3Dy
-CONFIG=5FSENSORS=5FPMBUS=3Dy
-CONFIG=5FSENSORS=5FADM1275=3Dy
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barre=
leye/recipes-kernel/linux/linux-obmc/hwmon=5Fadm1278.patch b/meta-openbmc-m=
achines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/l=
inux-obmc/hwmon=5Fadm1278.patch
deleted file mode 100644
index 074d39f..0000000
--- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/re=
cipes-kernel/linux/linux-obmc/hwmon=5Fadm1278.patch
+++ /dev/null
@@ -1,165 +0,0 @@
-diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
-index 188af4c..a45075d 100644
---- a/drivers/hwmon/pmbus/adm1275.c
-+++ b/drivers/hwmon/pmbus/adm1275.c
-@@ -24,7 +24,7 @@
- #include <linux/bitops.h>
- #include "pmbus.h"
-=20
--enum chips { adm1075, adm1275, adm1276, adm1293, adm1294 };
-+enum chips { adm1075, adm1275, adm1276, adm1278, adm1293, adm1294 };
-=20
- #define ADM1275=5FMFR=5FSTATUS=5FIOUT=5FWARN2	BIT(0)
- #define ADM1293=5FMFR=5FSTATUS=5FVAUX=5FUV=5FWARN	BIT(5)
-@@ -70,6 +70,22 @@ enum chips { adm1075, adm1275, adm1276, adm1293, adm129=
4 };
- #define ADM1075=5FVAUX=5FOV=5FWARN		BIT(7)
- #define ADM1075=5FVAUX=5FUV=5FWARN		BIT(6)
-=20
-+#define ADM1278=5FPMON=5FCONTROL		0xd3
-+#define ADM1278=5FPMON=5FCONFIG		0xd4
-+#define ADM1278=5FCFG=5FTSFLT		BIT(15)
-+#define ADM1278=5FCFG=5FSIMULTANEOUS	BIT(14)
-+#define ADM1278=5FCFG=5FPMON=5FMODE		BIT(4)
-+#define ADM1278=5FCFG=5FTEMP1=5FEN		BIT(3)
-+#define ADM1278=5FCFG=5FVIN=5FEN		BIT(2)
-+#define ADM1278=5FCFG=5FVOUT=5FEN		BIT(1)
-+#define ADM1278=5FPEAK=5FTEMPERATURE	0xd7
-+
-+#define ADM1278=5FR=5FSENSE	1000	/* R=5Fsense resistor value in microohms=
i */
-+
-+static int r=5Fsense =3D ADM1278=5FR=5FSENSE;
-+module=5Fparam(r=5Fsense, int, 0644);
-+MODULE=5FPARM=5FDESC(r=5Fsense, "Rsense resistor value in microohms");
-+
- struct adm1275=5Fdata {
- 	int id;
- 	bool have=5Foc=5Ffault;
-@@ -186,6 +202,11 @@ static int adm1275=5Fread=5Fword=5Fdata(struct i2c=5F=
client *client, int page, int reg)
- 	case PMBUS=5FVIRT=5FREAD=5FVIN=5FMAX:
- 		ret =3D pmbus=5Fread=5Fword=5Fdata(client, 0, ADM1275=5FPEAK=5FVIN);
- 		break;
-+	case PMBUS=5FVIRT=5FREAD=5FTEMP=5FMAX:
-+		if (data->id !=3D adm1278)
-+			return -ENODATA;
-+		ret =3D pmbus=5Fread=5Fword=5Fdata(client, 0, ADM1278=5FPEAK=5FTEMPERAT=
URE);
-+		break;
- 	case PMBUS=5FVIRT=5FREAD=5FPIN=5FMIN:
- 		if (!data->have=5Fpin=5Fmin)
- 			return -ENXIO;
-@@ -199,6 +220,7 @@ static int adm1275=5Fread=5Fword=5Fdata(struct i2c=5Fc=
lient *client, int page, int reg)
- 	case PMBUS=5FVIRT=5FRESET=5FIOUT=5FHISTORY:
- 	case PMBUS=5FVIRT=5FRESET=5FVOUT=5FHISTORY:
- 	case PMBUS=5FVIRT=5FRESET=5FVIN=5FHISTORY:
-+	case PMBUS=5FVIRT=5FRESET=5FTEMP=5FHISTORY:
- 		break;
- 	case PMBUS=5FVIRT=5FRESET=5FPIN=5FHISTORY:
- 		if (!data->have=5Fpin=5Fmax)
-@@ -239,6 +261,9 @@ static int adm1275=5Fwrite=5Fword=5Fdata(struct i2c=5F=
client *client, int page, int reg,
- 	case PMBUS=5FVIRT=5FRESET=5FVIN=5FHISTORY:
- 		ret =3D pmbus=5Fwrite=5Fword=5Fdata(client, 0, ADM1275=5FPEAK=5FVIN, 0);
- 		break;
-+	case PMBUS=5FVIRT=5FRESET=5FTEMP=5FHISTORY:
-+		ret =3D pmbus=5Fwrite=5Fword=5Fdata(client, 0, ADM1278=5FPEAK=5FTEMPERA=
TURE, 0);
-+		break;
- 	case PMBUS=5FVIRT=5FRESET=5FPIN=5FHISTORY:
- 		ret =3D pmbus=5Fwrite=5Fword=5Fdata(client, 0, ADM1276=5FPEAK=5FPIN, 0);
- 		if (!ret && data->have=5Fpin=5Fmin)
-@@ -312,6 +337,7 @@ static const struct i2c=5Fdevice=5Fid adm1275=5Fid[] =
=3D {
- 	{ "adm1075", adm1075 },
- 	{ "adm1275", adm1275 },
- 	{ "adm1276", adm1276 },
-+	{ "adm1278", adm1278 },
- 	{ "adm1293", adm1293 },
- 	{ "adm1294", adm1294 },
- 	{ }
-@@ -335,6 +361,8 @@ static int adm1275=5Fprobe(struct i2c=5Fclient *client,
- 				     | I2C=5FFUNC=5FSMBUS=5FBLOCK=5FDATA))
- 		return -ENODEV;
-=20
-+	/* i2c=5Faspeed driver does not handle i2c=5Fsmbus=5Fread=5Fblock=5Fdata=
 correctly */
-+#if 0
- 	ret =3D i2c=5Fsmbus=5Fread=5Fblock=5Fdata(client, PMBUS=5FMFR=5FID, bloc=
k=5Fbuffer);
- 	if (ret < 0) {
- 		dev=5Ferr(&client->dev, "Failed to read Manufacturer ID\n");
-@@ -363,6 +391,7 @@ static int adm1275=5Fprobe(struct i2c=5Fclient *client,
- 		dev=5Fnotice(&client->dev,
- 			   "Device mismatch: Configured %s, detected %s\n",
- 			   id->name, mid->name);
-+#endif
-=20
- 	config =3D i2c=5Fsmbus=5Fread=5Fbyte=5Fdata(client, ADM1275=5FPMON=5FCON=
FIG);
- 	if (config < 0)
-@@ -377,7 +406,9 @@ static int adm1275=5Fprobe(struct i2c=5Fclient *client,
- 	if (!data)
- 		return -ENOMEM;
-=20
--	data->id =3D mid->driver=5Fdata;
-+	/* i2c=5Faspeed driver does not handle i2c=5Fsmbus=5Fread=5Fblock=5Fdata=
 correctly */
-+	//data->id =3D mid->driver=5Fdata;
-+	data->id =3D adm1278;
-=20
- 	info =3D &data->info;
-=20
-@@ -460,6 +491,62 @@ static int adm1275=5Fprobe(struct i2c=5Fclient *clien=
t,
- 			info->func[0] |=3D
- 			  PMBUS=5FHAVE=5FVOUT | PMBUS=5FHAVE=5FSTATUS=5FVOUT;
- 		break;
-+	case adm1278:
-+		/* Configure monitoring */
-+		ret =3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client,
-+			ADM1278=5FPMON=5FCONTROL, 0);
-+		if (ret < 0)
-+			return ret;
-+		ret =3D i2c=5Fsmbus=5Fread=5Fword=5Fdata(client, ADM1275=5FPMON=5FCONFI=
G);
-+		ret =3D i2c=5Fsmbus=5Fwrite=5Fword=5Fdata(client, ADM1275=5FPMON=5FCONF=
IG,
-+						ADM1278=5FCFG=5FPMON=5FMODE |
-+						ADM1278=5FCFG=5FTEMP1=5FEN |
-+						ADM1278=5FCFG=5FVIN=5FEN |
-+						ADM1278=5FCFG=5FVOUT=5FEN);
-+		if (ret < 0)
-+			return ret;
-+		ret =3D i2c=5Fsmbus=5Fread=5Fword=5Fdata(client, ADM1275=5FPMON=5FCONFI=
G);
-+		dev=5Finfo(&client->dev, "adm1278 config: 0x%x\n", ret);
-+		ret =3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, ADM1278=5FPMON=5FCONT=
ROL,1);
-+		if (ret < 0)
-+			return ret;
-+
-+		info->func[0] |=3D PMBUS=5FHAVE=5FVIN
-+			| PMBUS=5FHAVE=5FVOUT | PMBUS=5FHAVE=5FSTATUS=5FVOUT
-+			| PMBUS=5FHAVE=5FPIN
-+			| PMBUS=5FHAVE=5FSTATUS=5FINPUT
-+			| PMBUS=5FHAVE=5FTEMP | PMBUS=5FHAVE=5FSTATUS=5FTEMP;
-+
-+		data->have=5Foc=5Ffault =3D false;
-+		data->have=5Fuc=5Ffault =3D false;
-+		data->have=5Fvout =3D true;
-+		data->have=5Fvaux=5Fstatus =3D false;
-+		data->have=5Fmfr=5Fvaux=5Fstatus =3D false;
-+		data->have=5Fiout=5Fmin =3D false;
-+		data->have=5Fpin=5Fmin =3D false;
-+		data->have=5Fpin=5Fmax =3D true;
-+
-+		info->m[PSC=5FVOLTAGE=5FIN] =3D 19599;
-+		info->b[PSC=5FVOLTAGE=5FIN] =3D 0;
-+		info->R[PSC=5FVOLTAGE=5FIN] =3D -2;
-+
-+		info->m[PSC=5FVOLTAGE=5FOUT] =3D 19599;
-+		info->b[PSC=5FVOLTAGE=5FOUT] =3D 0;
-+		info->R[PSC=5FVOLTAGE=5FOUT] =3D -2;
-+
-+		info->m[PSC=5FCURRENT=5FOUT] =3D 800 * r=5Fsense / 1000;
-+		info->b[PSC=5FCURRENT=5FOUT] =3D 20475;
-+		info->R[PSC=5FCURRENT=5FOUT] =3D -1;
-+
-+		info->m[PSC=5FPOWER] =3D 6123 * r=5Fsense / 1000;
-+		info->b[PSC=5FPOWER] =3D 0;
-+		info->R[PSC=5FPOWER] =3D -2;
-+
-+		info->format[PSC=5FTEMPERATURE] =3D direct;
-+		info->m[PSC=5FTEMPERATURE] =3D 42;
-+		info->b[PSC=5FTEMPERATURE] =3D 31880;
-+		info->R[PSC=5FTEMPERATURE] =3D -1;
-+		break;
- 	case adm1293:
- 	case adm1294:
- 		data->have=5Fiout=5Fmin =3D true;
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barre=
leye/recipes-kernel/linux/linux-obmc/readme=5Fadm1278.txt b/meta-openbmc-ma=
chines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/li=
nux-obmc/readme=5Fadm1278.txt
deleted file mode 100644
index e86d977..0000000
--- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/re=
cipes-kernel/linux/linux-obmc/readme=5Fadm1278.txt
+++ /dev/null
@@ -1,78 +0,0 @@
-README for adm1278 hwmon driver
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-Yi Li <shliyi@cn.ibm.com>
-
-
-This is a temporary kernel patch to enable hwmon driver for adm1278 chip o=
n Barreleye.
-When this patch is merged into linux kernel, this patch will be removed fr=
om openbmc.
-
-The adm1278 driver is created according to datasheet:
-http://www.analog.com/media/en/technical-documentation/data-sheets/ADM1278=
.pdf
-
-The patch heavily re-used adm1278 enabling code from: https://github.com/f=
acebook/openbmc/blob/master/meta-aspeed/recipes-kernel/linux/files/patch-2.=
6.28.9/0000-linux-openbmc.patch.
-
-This patch has been tested on barreleye, by following these steps:
-
-1) There are 3 adm1278 devices on Barreleye
-
-I2C5: P12v=5Fa for CPU0
-I2C6: P12v=5Fb for CPU1
-I2C7: P12v=5Fc for HDD and IO Board
-
-2) adm1278 driver is based on adm1275.c, which depends on pmbus. This patc=
h builds
-adm1275 and pmbus into kernel.
-
-3) When kernel booted, initialize the adm1278 devices:
-
-root@barreleye:~# echo adm1278 0x10 > /sys/class/i2c-adapter/i2c-4/new=5Fd=
evice
-root@barreleye:~# echo adm1278 0x10 > /sys/class/i2c-adapter/i2c-5/new=5Fd=
evice
-root@barreleye:~# echo adm1278 0x10 > /sys/class/i2c-adapter/i2c-6/new=5Fd=
evice
-
-There will be three new hwmon sysfs entries created:
-
-root@barreleye:~# ls /sys/class/hwmon/hwmon3/
-curr1=5Fhighest         in1=5Fhighest           in1=5Freset=5Fhistory     =
in2=5Fmin=5Falarm         power1=5Flabel          temp1=5Finput
-curr1=5Finput           in1=5Finput             in2=5Fhighest           in=
2=5Freset=5Fhistory     power1=5Fmax            temp1=5Fmax
-curr1=5Flabel           in1=5Flabel             in2=5Finput             na=
me                  power1=5Freset=5Fhistory  temp1=5Fmax=5Falarm
-curr1=5Fmax             in1=5Fmax               in2=5Flabel             po=
wer/                subsystem/            temp1=5Freset=5Fhistory
-curr1=5Fmax=5Falarm       in1=5Fmax=5Falarm         in2=5Fmax             =
  power1=5Falarm          temp1=5Fcrit            uevent
-curr1=5Freset=5Fhistory   in1=5Fmin               in2=5Fmax=5Falarm       =
  power1=5Finput          temp1=5Fcrit=5Falarm
-device/               in1=5Fmin=5Falarm         in2=5Fmin               po=
wer1=5Finput=5Fhighest  temp1=5Fhighest
-root@barreleye:~# ls /sys/class/hwmon/hwmon4/
-curr1=5Fhighest         in1=5Fhighest           in1=5Freset=5Fhistory     =
in2=5Fmin=5Falarm         power1=5Flabel          temp1=5Finput
-curr1=5Finput           in1=5Finput             in2=5Fhighest           in=
2=5Freset=5Fhistory     power1=5Fmax            temp1=5Fmax
-curr1=5Flabel           in1=5Flabel             in2=5Finput             na=
me                  power1=5Freset=5Fhistory  temp1=5Fmax=5Falarm
-curr1=5Fmax             in1=5Fmax               in2=5Flabel             po=
wer/                subsystem/            temp1=5Freset=5Fhistory
-curr1=5Fmax=5Falarm       in1=5Fmax=5Falarm         in2=5Fmax             =
  power1=5Falarm          temp1=5Fcrit            uevent
-curr1=5Freset=5Fhistory   in1=5Fmin               in2=5Fmax=5Falarm       =
  power1=5Finput          temp1=5Fcrit=5Falarm
-device/               in1=5Fmin=5Falarm         in2=5Fmin               po=
wer1=5Finput=5Fhighest  temp1=5Fhighest
-root@barreleye:~# ls /sys/class/hwmon/hwmon5/
-curr1=5Fhighest         in1=5Fhighest           in1=5Freset=5Fhistory     =
in2=5Fmin=5Falarm         power1=5Flabel          temp1=5Finput
-curr1=5Finput           in1=5Finput             in2=5Fhighest           in=
2=5Freset=5Fhistory     power1=5Fmax            temp1=5Fmax
-curr1=5Flabel           in1=5Flabel             in2=5Finput             na=
me                  power1=5Freset=5Fhistory  temp1=5Fmax=5Falarm
-curr1=5Fmax             in1=5Fmax               in2=5Flabel             po=
wer/                subsystem/            temp1=5Freset=5Fhistory
-curr1=5Fmax=5Falarm       in1=5Fmax=5Falarm         in2=5Fmax             =
  power1=5Falarm          temp1=5Fcrit            uevent
-curr1=5Freset=5Fhistory   in1=5Fmin               in2=5Fmax=5Falarm       =
  power1=5Finput          temp1=5Fcrit=5Falarm
-device/               in1=5Fmin=5Falarm         in2=5Fmin               po=
wer1=5Finput=5Fhighest  temp1=5Fhighest
-
-4) For details of what each hwmon sysfs attributes mean, please refer to:
-https://www.kernel.org/doc/Documentation/hwmon/pmbus
-For short, 'curr1=5F*' refers to 'IOUT', 'in1=5F*' refers to 'vin', 'in2=
=5F*' refers to 'vout', 'power1=5F*' refers to 'input power',
-'temp1=5F*' for 'temperature'.
-
-5) Remaining issue:
-
-5.1) Currently, i2c=5Faspeed driver does not handle "i2c=5Fsmbus=5Fread=5F=
block=5Fdata()" correctly. So this patch has to bypass some detection code.
-We need to fix this issue when the patch is merged to kernel.
-5.2) According to adm1278 datasheet, there is a sense resistor used to mea=
sure power and current. The resistor will affect conversion between
-adm1278 register value to real-world value for current and power. I am not=
 very sure about the resistor value. So using 1 mili-ohms (or 1000 micro-oh=
ms) as default value. When build the adm1275 driver as kernel module, we ca=
n set this resistor value by:
-
-# insmod adm1275.ko r=5Fsense=3D500
-
-This will set the 'sense resistor' to 500 micro-ohms.
-5.3) Some of the sensor value, e.g, 'temp1=5Finput' seems not reasonable, =
e.g:
-
-root@barreleye:~# cat /sys/class/hwmon/hwmon4/temp1=5Finput
--270952
-
-Need further check on that.
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barre=
leye/recipes-kernel/linux/linux-obmc=5F%.bbappend b/meta-openbmc-machines/m=
eta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc=
=5F%.bbappend
deleted file mode 100644
index b6e8e16..0000000
--- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/re=
cipes-kernel/linux/linux-obmc=5F%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-FILESEXTRAPATHS=5Fprepend :=3D "${THISDIR}/linux-obmc:"
-SRC=5FURI +=3D "file://barreleye.cfg"
-SRC=5FURI +=3D "file://hwmon=5Fadm1278.patch"
diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc=5F4.3.bb =
b/meta-phosphor/common/recipes-kernel/linux/linux-obmc=5F4.3.bb
deleted file mode 100644
index 3e74f7c..0000000
--- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc=5F4.3.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION =3D "Linux kernel for OpenBMC"
-SECTION =3D "kernel"
-LICENSE =3D "GPLv2"
-
-KBRANCH ?=3D "dev-4.3"
-KCONFIG=5FMODE=3D"--alldefconfig"
-
-SRC=5FURI =3D "git://github.com/openbmc/linux;protocol=3Dgit;branch=3D${KB=
RANCH}"
-
-LINUX=5FVERSION ?=3D "4.3"
-LINUX=5FVERSION=5FEXTENSION ?=3D "-${SRCREV}"
-
-SRCREV=3D"openbmc-20160222-1"
-
-PV =3D "${LINUX=5FVERSION}+git${SRCPV}"
-
-COMPATIBLE=5FMACHINE=5F${MACHINE} =3D "openbmc"
-
-inherit kernel
-require recipes-kernel/linux/linux-yocto.inc
-
-do=5Fpatch=5Fappend() {
-        for DTB in "${KERNEL=5FDEVICETREE}"; do
-		DT=3D`basename ${DTB} .dtb`
-                if [ -r "${WORKDIR}/${DT}.dts" ]; then
-                        cp ${WORKDIR}/${DT}.dts \
-                                ${STAGING=5FKERNEL=5FDIR}/arch/${ARCH}/boo=
t/dts
-		fi
-	done
-}
diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc=5F4.4.bb =
b/meta-phosphor/common/recipes-kernel/linux/linux-obmc=5F4.4.bb
new file mode 100644
index 0000000..2e2c9ce
--- /dev/null
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc=5F4.4.bb
@@ -0,0 +1,20 @@
+DESCRIPTION =3D "Linux kernel for OpenBMC"
+SECTION =3D "kernel"
+LICENSE =3D "GPLv2"
+
+KBRANCH ?=3D "dev-4.4"
+KCONFIG=5FMODE=3D"--alldefconfig"
+
+SRC=5FURI =3D "git://github.com/openbmc/linux;protocol=3Dgit;branch=3D${KB=
RANCH}"
+
+LINUX=5FVERSION ?=3D "4.4"
+LINUX=5FVERSION=5FEXTENSION ?=3D "-${SRCREV}"
+
+SRCREV=3D"openbmc-20160329-2"
+
+PV =3D "${LINUX=5FVERSION}+git${SRCPV}"
+
+COMPATIBLE=5FMACHINE=5F${MACHINE} =3D "openbmc"
+
+inherit kernel
+require recipes-kernel/linux/linux-yocto.inc
--=20
2.7.1


=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc
