Return-Path: <shliyi@cn.ibm.com>
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A9C311A0356
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 22:11:31 +1100 (AEDT)
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Mon, 22 Feb 2016 21:11:29 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 22 Feb 2016 21:11:26 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 581B92BB005B
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 22:11:21 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1MBBD8557212950
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 22:11:21 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1MBAmMa005449
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 22:10:48 +1100
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1MBAkpE004875
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 22:10:48 +1100
Message-Id: <201602221110.u1MBAkpE004875@d23av03.au.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Mon, 22 Feb 2016 03:00:23 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 22 Feb 2016 03:00:21 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Mon, 22 Feb 2016 10:00:18 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 22 Feb 2016 10:00:16 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016022210001553-105734 ;
 Mon, 22 Feb 2016 10:00:15 +0000 
In-Reply-To: <CACPK8XcOB-RzarE67ddZZHj2CuiRAupL07Fe1dPUHHC=W4CweQ@mail.gmail.com>
Subject: Re: [PATCH openbmc] Add temporary adm1278 hwmon pmbus driver patch
From: "Yi TZ Li" <shliyi@cn.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Mon, 22 Feb 2016 10:00:15 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CACPK8XcOB-RzarE67ddZZHj2CuiRAupL07Fe1dPUHHC=W4CweQ@mail.gmail.com>,
 <1455705024-15045-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455705024-15045-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_02082016_FP1 February 18, 2016
X-LLNOutbound: False
X-Disclaimed: 57351
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16022211-0021-0000-0000-000002CA6252
X-IBM-ISS-SpamDetectors: Score=0.371236; BY=0.293798; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.371236; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004947; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000145; SDB=6.00663316; UDB=6.00302002; UTC=2016-02-22
 10:00:17
x-cbparentid: 16022210-4536-0000-0000-0000063FBDAB
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
X-List-Received-Date: Mon, 22 Feb 2016 11:11:31 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2">Hi Joel,<br><br>This patch is not ready to be formally reviews as a =
kernel patch:<br><br>1. i2c=5Faspeed driver does not handle i2c=5Fsmbus=5Fr=
ead=5Fblock=5Fdata correctly. So I commented out the driver's initializatio=
n code. I will submit a issue to track i2c=5Faspeed problem.<br>2. I will n=
eed to clean-up the patch to meet kernel coding-style requirement.<br><br>W=
hen ready, I will submit a patch to Linux kernel for review.<br><br>Thanks,=
<br>-Yi<br><br><font color=3D"#990099">-----"openbmc" &lt;<a target=3D"=5Fb=
lank" href=3D"mailto:openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org">=
openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org</a>&gt; wrote: -----</=
font><br><br>&gt;To: OpenBMC Patches &lt;<a target=3D"=5Fblank" href=3D"mai=
lto:openbmc-patches@stwcx.xyz">openbmc-patches@stwcx.xyz</a>&gt;<br>&gt;Fro=
m: Joel Stanley <br>&gt;Sent by: "openbmc" <br>&gt;Date: 02/18/2016 12:25PM=
<br>&gt;Cc: OpenBMC Maillist &lt;<a target=3D"=5Fblank" href=3D"mailto:open=
bmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>&gt;<br>&gt;Subject: Re: =
[PATCH openbmc] Add temporary adm1278 hwmon pmbus driver<br>&gt;patch<br>&g=
t;<br>&gt;On Wed, Feb 17, 2016 at 9:00 PM, OpenBMC Patches<br>&gt;&lt;<a ta=
rget=3D"=5Fblank" href=3D"mailto:openbmc-patches@stwcx.xyz">openbmc-patches=
@stwcx.xyz</a>&gt; wrote:<br>&gt;&gt; From: Yi Li &lt;<a target=3D"=5Fblank=
" href=3D"mailto:adamliyi@msn.com">adamliyi@msn.com</a>&gt;<br>&gt;&gt;<br>=
&gt;&gt; This patch temporarily adds adm1278 hwmon driver as a kernel patch=
<br>&gt;to openbmc,<br>&gt;&gt; for testing on Barreleye.<br>&gt;<br>&gt;Ca=
n you please send this as a patch with git-send-email so we can<br>&gt;revi=
ew it.<br>&gt;<br>&gt;&gt; If in the future this patch will still be useful=
, it should be put<br>&gt;into linux kernel.<br>&gt;&gt;<br>&gt;&gt; Barrel=
eye has three adm1278 devices on three i2c buses.<br>&gt;&gt; This patch en=
ables reading adm1278 sensors via hwmon sysfs<br>&gt;interface.<br>&gt;&gt;=
 The enabled sensors are: current, voltage (In and Out), power and<br>&gt;t=
emperature.<br>&gt;&gt; Detail usage can be found in 'readme=5Fadm1278.txt'=
.<br>&gt;&gt;<br>&gt;&gt; Signed-off-by: Yi Li &lt;<a target=3D"=5Fblank" h=
ref=3D"mailto:adamliyi@msn.com">adamliyi@msn.com</a>&gt;<br>&gt;&gt; ---<br=
>&gt;&gt;  .../recipes-kernel/linux/linux-obmc/barreleye.cfg  |   3 +<br>&g=
t;&gt;  .../linux/linux-obmc/hwmon=5Fadm1278.patch           | 165<br>&gt;+=
++++++++++++++++++++<br>&gt;&gt;  .../linux/linux-obmc/readme=5Fadm1278.txt=
            |  78<br>&gt;++++++++++<br>&gt;&gt;  .../recipes-kernel/linux/l=
inux-obmc=5F%.bbappend     |   3 +<br>&gt;&gt;  4 files changed, 249 insert=
ions(+)<br>&gt;&gt;  create mode 100644<br>&gt;meta-openbmc-machines/meta-o=
penpower/meta-rackspace/meta-barreleye/re<br>&gt;cipes-kernel/linux/linux-o=
bmc/barreleye.cfg<br>&gt;&gt;  create mode 100644<br>&gt;meta-openbmc-machi=
nes/meta-openpower/meta-rackspace/meta-barreleye/re<br>&gt;cipes-kernel/lin=
ux/linux-obmc/hwmon=5Fadm1278.patch<br>&gt;&gt;  create mode 100644<br>&gt;=
meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/re<br>&g=
t;cipes-kernel/linux/linux-obmc/readme=5Fadm1278.txt<br>&gt;&gt;  create mo=
de 100644<br>&gt;meta-openbmc-machines/meta-openpower/meta-rackspace/meta-b=
arreleye/re<br>&gt;cipes-kernel/linux/linux-obmc=5F%.bbappend<br>&gt;&gt;<b=
r>&gt;&gt; diff --git<br>&gt;a/meta-openbmc-machines/meta-openpower/meta-ra=
ckspace/meta-barreleye/<br>&gt;recipes-kernel/linux/linux-obmc/barreleye.cf=
g<br>&gt;b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barrele=
ye/<br>&gt;recipes-kernel/linux/linux-obmc/barreleye.cfg<br>&gt;&gt; new fi=
le mode 100644<br>&gt;&gt; index 0000000..086f191<br>&gt;&gt; --- /dev/null=
<br>&gt;&gt; +++<br>&gt;b/meta-openbmc-machines/meta-openpower/meta-rackspa=
ce/meta-barreleye/<br>&gt;recipes-kernel/linux/linux-obmc/barreleye.cfg<br>=
&gt;&gt; @@ -0,0 +1,3 @@<br>&gt;&gt; +CONFIG=5FPMBUS=3Dy<br>&gt;&gt; +CONFI=
G=5FSENSORS=5FPMBUS=3Dy<br>&gt;&gt; +CONFIG=5FSENSORS=5FADM1275=3Dy<br>&gt;=
&gt; diff --git<br>&gt;a/meta-openbmc-machines/meta-openpower/meta-rackspac=
e/meta-barreleye/<br>&gt;recipes-kernel/linux/linux-obmc/hwmon=5Fadm1278.pa=
tch<br>&gt;b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barre=
leye/<br>&gt;recipes-kernel/linux/linux-obmc/hwmon=5Fadm1278.patch<br>&gt;&=
gt; new file mode 100644<br>&gt;&gt; index 0000000..074d39f<br>&gt;&gt; ---=
 /dev/null<br>&gt;&gt; +++<br>&gt;b/meta-openbmc-machines/meta-openpower/me=
ta-rackspace/meta-barreleye/<br>&gt;recipes-kernel/linux/linux-obmc/hwmon=
=5Fadm1278.patch<br>&gt;&gt; @@ -0,0 +1,165 @@<br>&gt;&gt; +diff --git a/dr=
ivers/hwmon/pmbus/adm1275.c<br>&gt;b/drivers/hwmon/pmbus/adm1275.c<br>&gt;&=
gt; +index 188af4c..a45075d 100644<br>&gt;&gt; +--- a/drivers/hwmon/pmbus/a=
dm1275.c<br>&gt;&gt; ++++ b/drivers/hwmon/pmbus/adm1275.c<br>&gt;&gt; +@@ -=
24,7 +24,7 @@<br>&gt;&gt; + #include &lt;linux/bitops.h&gt;<br>&gt;&gt; + #=
include "pmbus.h"<br>&gt;&gt; +<br>&gt;&gt; +-enum chips { adm1075, adm1275=
, adm1276, adm1293, adm1294 };<br>&gt;&gt; ++enum chips { adm1075, adm1275,=
 adm1276, adm1278, adm1293, adm1294<br>&gt;};<br>&gt;&gt; +<br>&gt;&gt; + #=
define ADM1275=5FMFR=5FSTATUS=5FIOUT=5FWARN2 BIT(0)<br>&gt;&gt; + #define A=
DM1293=5FMFR=5FSTATUS=5FVAUX=5FUV=5FWARN       BIT(5)<br>&gt;&gt; +@@ -70,6=
 +70,22 @@ enum chips { adm1075, adm1275, adm1276,<br>&gt;adm1293, adm1294 =
};<br>&gt;&gt; + #define ADM1075=5FVAUX=5FOV=5FWARN          BIT(7)<br>&gt;=
&gt; + #define ADM1075=5FVAUX=5FUV=5FWARN          BIT(6)<br>&gt;&gt; +<br>=
&gt;&gt; ++#define ADM1278=5FPMON=5FCONTROL          0xd3<br>&gt;&gt; ++#de=
fine ADM1278=5FPMON=5FCONFIG           0xd4<br>&gt;&gt; ++#define ADM1278=
=5FCFG=5FTSFLT             BIT(15)<br>&gt;&gt; ++#define ADM1278=5FCFG=5FSI=
MULTANEOUS      BIT(14)<br>&gt;&gt; ++#define ADM1278=5FCFG=5FPMON=5FMODE  =
       BIT(4)<br>&gt;&gt; ++#define ADM1278=5FCFG=5FTEMP1=5FEN          BIT=
(3)<br>&gt;&gt; ++#define ADM1278=5FCFG=5FVIN=5FEN            BIT(2)<br>&gt=
;&gt; ++#define ADM1278=5FCFG=5FVOUT=5FEN           BIT(1)<br>&gt;&gt; ++#d=
efine ADM1278=5FPEAK=5FTEMPERATURE      0xd7<br>&gt;&gt; ++<br>&gt;&gt; ++#=
define ADM1278=5FR=5FSENSE       1000    /* R=5Fsense resistor value<br>&gt=
;in microohmsi */<br>&gt;&gt; ++<br>&gt;&gt; ++static int r=5Fsense =3D ADM=
1278=5FR=5FSENSE;<br>&gt;&gt; ++module=5Fparam(r=5Fsense, int, 0644);<br>&g=
t;&gt; ++MODULE=5FPARM=5FDESC(r=5Fsense, "Rsense resistor value in microohm=
s");<br>&gt;&gt; ++<br>&gt;&gt; + struct adm1275=5Fdata {<br>&gt;&gt; +    =
   int id;<br>&gt;&gt; +       bool have=5Foc=5Ffault;<br>&gt;&gt; +@@ -186=
,6 +202,11 @@ static int adm1275=5Fread=5Fword=5Fdata(struct<br>&gt;i2c=5Fc=
lient *client, int page, int reg)<br>&gt;&gt; +       case PMBUS=5FVIRT=5FR=
EAD=5FVIN=5FMAX:<br>&gt;&gt; +               ret =3D pmbus=5Fread=5Fword=5F=
data(client, 0,<br>&gt;ADM1275=5FPEAK=5FVIN);<br>&gt;&gt; +               b=
reak;<br>&gt;&gt; ++      case PMBUS=5FVIRT=5FREAD=5FTEMP=5FMAX:<br>&gt;&gt=
; ++              if (data-&gt;id !=3D adm1278)<br>&gt;&gt; ++             =
         return -ENODATA;<br>&gt;&gt; ++              ret =3D pmbus=5Fread=
=5Fword=5Fdata(client, 0,<br>&gt;ADM1278=5FPEAK=5FTEMPERATURE);<br>&gt;&gt;=
 ++              break;<br>&gt;&gt; +       case PMBUS=5FVIRT=5FREAD=5FPIN=
=5FMIN:<br>&gt;&gt; +               if (!data-&gt;have=5Fpin=5Fmin)<br>&gt;=
&gt; +                       return -ENXIO;<br>&gt;&gt; +@@ -199,6 +220,7 @=
@ static int adm1275=5Fread=5Fword=5Fdata(struct<br>&gt;i2c=5Fclient *clien=
t, int page, int reg)<br>&gt;&gt; +       case PMBUS=5FVIRT=5FRESET=5FIOUT=
=5FHISTORY:<br>&gt;&gt; +       case PMBUS=5FVIRT=5FRESET=5FVOUT=5FHISTORY:=
<br>&gt;&gt; +       case PMBUS=5FVIRT=5FRESET=5FVIN=5FHISTORY:<br>&gt;&gt;=
 ++      case PMBUS=5FVIRT=5FRESET=5FTEMP=5FHISTORY:<br>&gt;&gt; +         =
      break;<br>&gt;&gt; +       case PMBUS=5FVIRT=5FRESET=5FPIN=5FHISTORY:=
<br>&gt;&gt; +               if (!data-&gt;have=5Fpin=5Fmax)<br>&gt;&gt; +@=
@ -239,6 +261,9 @@ static int adm1275=5Fwrite=5Fword=5Fdata(struct<br>&gt;i=
2c=5Fclient *client, int page, int reg,<br>&gt;&gt; +       case PMBUS=5FVI=
RT=5FRESET=5FVIN=5FHISTORY:<br>&gt;&gt; +               ret =3D pmbus=5Fwri=
te=5Fword=5Fdata(client, 0,<br>&gt;ADM1275=5FPEAK=5FVIN, 0);<br>&gt;&gt; + =
              break;<br>&gt;&gt; ++      case PMBUS=5FVIRT=5FRESET=5FTEMP=
=5FHISTORY:<br>&gt;&gt; ++              ret =3D pmbus=5Fwrite=5Fword=5Fdata=
(client, 0,<br>&gt;ADM1278=5FPEAK=5FTEMPERATURE, 0);<br>&gt;&gt; ++        =
      break;<br>&gt;&gt; +       case PMBUS=5FVIRT=5FRESET=5FPIN=5FHISTORY:=
<br>&gt;&gt; +               ret =3D pmbus=5Fwrite=5Fword=5Fdata(client, 0,=
<br>&gt;ADM1276=5FPEAK=5FPIN, 0);<br>&gt;&gt; +               if (!ret &amp=
;&amp; data-&gt;have=5Fpin=5Fmin)<br>&gt;&gt; +@@ -312,6 +337,7 @@ static c=
onst struct i2c=5Fdevice=5Fid adm1275=5Fid[]<br>&gt;=3D {<br>&gt;&gt; +    =
   { "adm1075", adm1075 },<br>&gt;&gt; +       { "adm1275", adm1275 },<br>&=
gt;&gt; +       { "adm1276", adm1276 },<br>&gt;&gt; ++      { "adm1278", ad=
m1278 },<br>&gt;&gt; +       { "adm1293", adm1293 },<br>&gt;&gt; +       { =
"adm1294", adm1294 },<br>&gt;&gt; +       { }<br>&gt;&gt; +@@ -335,6 +361,8=
 @@ static int adm1275=5Fprobe(struct i2c=5Fclient<br>&gt;*client,<br>&gt;&=
gt; +                                    | I2C=5FFUNC=5FSMBUS=5FBLOCK=5FDAT=
A))<br>&gt;&gt; +               return -ENODEV;<br>&gt;&gt; +<br>&gt;&gt; +=
+      /* i2c=5Faspeed driver does not handle<br>&gt;i2c=5Fsmbus=5Fread=5Fb=
lock=5Fdata correctly */<br>&gt;&gt; ++#if 0<br>&gt;&gt; +       ret =3D i2=
c=5Fsmbus=5Fread=5Fblock=5Fdata(client, PMBUS=5FMFR=5FID,<br>&gt;block=5Fbu=
ffer);<br>&gt;&gt; +       if (ret &lt; 0) {<br>&gt;&gt; +               de=
v=5Ferr(&amp;client-&gt;dev, "Failed to read Manufacturer<br>&gt;ID\n");<br=
>&gt;&gt; +@@ -363,6 +391,7 @@ static int adm1275=5Fprobe(struct i2c=5Fclie=
nt<br>&gt;*client,<br>&gt;&gt; +               dev=5Fnotice(&amp;client-&gt=
;dev,<br>&gt;&gt; +                          "Device mismatch: Configured %=
s,<br>&gt;detected %s\n",<br>&gt;&gt; +                          id-&gt;nam=
e, mid-&gt;name);<br>&gt;&gt; ++#endif<br>&gt;&gt; +<br>&gt;&gt; +       co=
nfig =3D i2c=5Fsmbus=5Fread=5Fbyte=5Fdata(client,<br>&gt;ADM1275=5FPMON=5FC=
ONFIG);<br>&gt;&gt; +       if (config &lt; 0)<br>&gt;&gt; +@@ -377,7 +406,=
9 @@ static int adm1275=5Fprobe(struct i2c=5Fclient<br>&gt;*client,<br>&gt;=
&gt; +       if (!data)<br>&gt;&gt; +               return -ENOMEM;<br>&gt;=
&gt; +<br>&gt;&gt; +-      data-&gt;id =3D mid-&gt;driver=5Fdata;<br>&gt;&g=
t; ++      /* i2c=5Faspeed driver does not handle<br>&gt;i2c=5Fsmbus=5Fread=
=5Fblock=5Fdata correctly */<br>&gt;&gt; ++      //data-&gt;id =3D mid-&gt;=
driver=5Fdata;<br>&gt;&gt; ++      data-&gt;id =3D adm1278;<br>&gt;&gt; +<b=
r>&gt;&gt; +       info =3D &amp;data-&gt;info;<br>&gt;&gt; +<br>&gt;&gt; +=
@@ -460,6 +491,62 @@ static int adm1275=5Fprobe(struct i2c=5Fclient<br>&gt;=
*client,<br>&gt;&gt; +                       info-&gt;func[0] |=3D<br>&gt;&=
gt; +                         PMBUS=5FHAVE=5FVOUT | PMBUS=5FHAVE=5FSTATUS=
=5FVOUT;<br>&gt;&gt; +               break;<br>&gt;&gt; ++      case adm127=
8:<br>&gt;&gt; ++              /* Configure monitoring */<br>&gt;&gt; ++   =
           ret =3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client,<br>&gt;&gt; ++=
                      ADM1278=5FPMON=5FCONTROL, 0);<br>&gt;&gt; ++         =
     if (ret &lt; 0)<br>&gt;&gt; ++                      return ret;<br>&gt=
;&gt; ++              ret =3D i2c=5Fsmbus=5Fread=5Fword=5Fdata(client,<br>&=
gt;ADM1275=5FPMON=5FCONFIG);<br>&gt;&gt; ++              ret =3D i2c=5Fsmbu=
s=5Fwrite=5Fword=5Fdata(client,<br>&gt;ADM1275=5FPMON=5FCONFIG,<br>&gt;&gt;=
 ++<br>&gt;ADM1278=5FCFG=5FPMON=5FMODE |<br>&gt;&gt; ++<br>&gt;ADM1278=5FCF=
G=5FTEMP1=5FEN |<br>&gt;&gt; ++                                            =
  ADM1278=5FCFG=5FVIN=5FEN<br>&gt;|<br>&gt;&gt; ++<br>&gt;ADM1278=5FCFG=5FV=
OUT=5FEN);<br>&gt;&gt; ++              if (ret &lt; 0)<br>&gt;&gt; ++      =
                return ret;<br>&gt;&gt; ++              ret =3D i2c=5Fsmbus=
=5Fread=5Fword=5Fdata(client,<br>&gt;ADM1275=5FPMON=5FCONFIG);<br>&gt;&gt; =
++              dev=5Finfo(&amp;client-&gt;dev, "adm1278 config: 0x%x\n",<b=
r>&gt;ret);<br>&gt;&gt; ++              ret =3D i2c=5Fsmbus=5Fwrite=5Fbyte=
=5Fdata(client,<br>&gt;ADM1278=5FPMON=5FCONTROL,1);<br>&gt;&gt; ++         =
     if (ret &lt; 0)<br>&gt;&gt; ++                      return ret;<br>&gt=
;&gt; ++<br>&gt;&gt; ++              info-&gt;func[0] |=3D PMBUS=5FHAVE=5FV=
IN<br>&gt;&gt; ++                      | PMBUS=5FHAVE=5FVOUT | PMBUS=5FHAVE=
=5FSTATUS=5FVOUT<br>&gt;&gt; ++                      | PMBUS=5FHAVE=5FPIN<b=
r>&gt;&gt; ++                      | PMBUS=5FHAVE=5FSTATUS=5FINPUT<br>&gt;&=
gt; ++                      | PMBUS=5FHAVE=5FTEMP | PMBUS=5FHAVE=5FSTATUS=
=5FTEMP;<br>&gt;&gt; ++<br>&gt;&gt; ++              data-&gt;have=5Foc=5Ffa=
ult =3D false;<br>&gt;&gt; ++              data-&gt;have=5Fuc=5Ffault =3D f=
alse;<br>&gt;&gt; ++              data-&gt;have=5Fvout =3D true;<br>&gt;&gt=
; ++              data-&gt;have=5Fvaux=5Fstatus =3D false;<br>&gt;&gt; ++  =
            data-&gt;have=5Fmfr=5Fvaux=5Fstatus =3D false;<br>&gt;&gt; ++  =
            data-&gt;have=5Fiout=5Fmin =3D false;<br>&gt;&gt; ++           =
   data-&gt;have=5Fpin=5Fmin =3D false;<br>&gt;&gt; ++              data-&g=
t;have=5Fpin=5Fmax =3D true;<br>&gt;&gt; ++<br>&gt;&gt; ++              inf=
o-&gt;m[PSC=5FVOLTAGE=5FIN] =3D 19599;<br>&gt;&gt; ++              info-&gt=
;b[PSC=5FVOLTAGE=5FIN] =3D 0;<br>&gt;&gt; ++              info-&gt;R[PSC=5F=
VOLTAGE=5FIN] =3D -2;<br>&gt;&gt; ++<br>&gt;&gt; ++              info-&gt;m=
[PSC=5FVOLTAGE=5FOUT] =3D 19599;<br>&gt;&gt; ++              info-&gt;b[PSC=
=5FVOLTAGE=5FOUT] =3D 0;<br>&gt;&gt; ++              info-&gt;R[PSC=5FVOLTA=
GE=5FOUT] =3D -2;<br>&gt;&gt; ++<br>&gt;&gt; ++              info-&gt;m[PSC=
=5FCURRENT=5FOUT] =3D 800 * r=5Fsense / 1000;<br>&gt;&gt; ++              i=
nfo-&gt;b[PSC=5FCURRENT=5FOUT] =3D 20475;<br>&gt;&gt; ++              info-=
&gt;R[PSC=5FCURRENT=5FOUT] =3D -1;<br>&gt;&gt; ++<br>&gt;&gt; ++           =
   info-&gt;m[PSC=5FPOWER] =3D 6123 * r=5Fsense / 1000;<br>&gt;&gt; ++     =
         info-&gt;b[PSC=5FPOWER] =3D 0;<br>&gt;&gt; ++              info-&g=
t;R[PSC=5FPOWER] =3D -2;<br>&gt;&gt; ++<br>&gt;&gt; ++              info-&g=
t;format[PSC=5FTEMPERATURE] =3D direct;<br>&gt;&gt; ++              info-&g=
t;m[PSC=5FTEMPERATURE] =3D 42;<br>&gt;&gt; ++              info-&gt;b[PSC=
=5FTEMPERATURE] =3D 31880;<br>&gt;&gt; ++              info-&gt;R[PSC=5FTEM=
PERATURE] =3D -1;<br>&gt;&gt; ++              break;<br>&gt;&gt; +       ca=
se adm1293:<br>&gt;&gt; +       case adm1294:<br>&gt;&gt; +               d=
ata-&gt;have=5Fiout=5Fmin =3D true;<br>&gt;&gt; diff --git<br>&gt;a/meta-op=
enbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/<br>&gt;recipes=
-kernel/linux/linux-obmc/readme=5Fadm1278.txt<br>&gt;b/meta-openbmc-machine=
s/meta-openpower/meta-rackspace/meta-barreleye/<br>&gt;recipes-kernel/linux=
/linux-obmc/readme=5Fadm1278.txt<br>&gt;&gt; new file mode 100644<br>&gt;&g=
t; index 0000000..e86d977<br>&gt;&gt; --- /dev/null<br>&gt;&gt; +++<br>&gt;=
b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/<br>&g=
t;recipes-kernel/linux/linux-obmc/readme=5Fadm1278.txt<br>&gt;&gt; @@ -0,0 =
+1,78 @@<br>&gt;&gt; +README for adm1278 hwmon driver<br>&gt;&gt; +=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br>&gt;&gt; +Yi Li &lt;<a target=3D"=5Fblank" href=3D=
"mailto:shliyi@cn.ibm.com">shliyi@cn.ibm.com</a>&gt;<br>&gt;&gt; +<br>&gt;&=
gt; +<br>&gt;&gt; +This is a temporary kernel patch to enable hwmon driver =
for<br>&gt;adm1278 chip on Barreleye.<br>&gt;&gt; +When this patch is merge=
d into linux kernel, this patch will be<br>&gt;removed from openbmc.<br>&gt=
;&gt; +<br>&gt;&gt; +The adm1278 driver is created according to datasheet:<=
br>&gt;&gt;<br>&gt;+<a target=3D"=5Fblank" href=3D"http://www.analog.com/me=
dia/en/technical-documentation/data-sheets/A">http://www.analog.com/media/e=
n/technical-documentation/data-sheets/A</a><br>&gt;DM1278.pdf<br>&gt;&gt; +=
<br>&gt;&gt; +The patch heavily re-used adm1278 enabling code from:<br>&gt;=
<a target=3D"=5Fblank" href=3D"https://github.com/facebook/openbmc/blob/mas=
ter/meta-aspeed/recipes-k">https://github.com/facebook/openbmc/blob/master/=
meta-aspeed/recipes-k</a><br>&gt;ernel/linux/files/patch-2.6.28.9/0000-linu=
x-openbmc.patch.<br>&gt;&gt; +<br>&gt;&gt; +This patch has been tested on b=
arreleye, by following these steps:<br>&gt;&gt; +<br>&gt;&gt; +1) There are=
 3 adm1278 devices on Barreleye<br>&gt;&gt; +<br>&gt;&gt; +I2C5: P12v=5Fa f=
or CPU0<br>&gt;&gt; +I2C6: P12v=5Fb for CPU1<br>&gt;&gt; +I2C7: P12v=5Fc fo=
r HDD and IO Board<br>&gt;&gt; +<br>&gt;&gt; +2) adm1278 driver is based on=
 adm1275.c, which depends on pmbus.<br>&gt;This patch builds<br>&gt;&gt; +a=
dm1275 and pmbus into kernel.<br>&gt;&gt; +<br>&gt;&gt; +3) When kernel boo=
ted, initialize the adm1278 devices:<br>&gt;&gt; +<br>&gt;&gt; +root@barrel=
eye:~# echo adm1278 0x10 &gt;<br>&gt;/sys/class/i2c-adapter/i2c-4/new=5Fdev=
ice<br>&gt;&gt; +root@barreleye:~# echo adm1278 0x10 &gt;<br>&gt;/sys/class=
/i2c-adapter/i2c-5/new=5Fdevice<br>&gt;&gt; +root@barreleye:~# echo adm1278=
 0x10 &gt;<br>&gt;/sys/class/i2c-adapter/i2c-6/new=5Fdevice<br>&gt;&gt; +<b=
r>&gt;&gt; +There will be three new hwmon sysfs entries created:<br>&gt;&gt=
; +<br>&gt;&gt; +root@barreleye:~# ls /sys/class/hwmon/hwmon3/<br>&gt;&gt; =
+curr1=5Fhighest         in1=5Fhighest           in1=5Freset=5Fhistory<br>&=
gt;in2=5Fmin=5Falarm         power1=5Flabel          temp1=5Finput<br>&gt;&=
gt; +curr1=5Finput           in1=5Finput             in2=5Fhighest<br>&gt;i=
n2=5Freset=5Fhistory     power1=5Fmax            temp1=5Fmax<br>&gt;&gt; +c=
urr1=5Flabel           in1=5Flabel             in2=5Finput<br>&gt;name     =
             power1=5Freset=5Fhistory  temp1=5Fmax=5Falarm<br>&gt;&gt; +cur=
r1=5Fmax             in1=5Fmax               in2=5Flabel<br>&gt;power/     =
           subsystem/            temp1=5Freset=5Fhistory<br>&gt;&gt; +curr1=
=5Fmax=5Falarm       in1=5Fmax=5Falarm         in2=5Fmax<br>&gt;power1=5Fal=
arm          temp1=5Fcrit            uevent<br>&gt;&gt; +curr1=5Freset=5Fhi=
story   in1=5Fmin               in2=5Fmax=5Falarm<br>&gt;power1=5Finput    =
      temp1=5Fcrit=5Falarm<br>&gt;&gt; +device/               in1=5Fmin=5Fa=
larm         in2=5Fmin<br>&gt;power1=5Finput=5Fhighest  temp1=5Fhighest<br>=
&gt;&gt; +root@barreleye:~# ls /sys/class/hwmon/hwmon4/<br>&gt;&gt; +curr1=
=5Fhighest         in1=5Fhighest           in1=5Freset=5Fhistory<br>&gt;in2=
=5Fmin=5Falarm         power1=5Flabel          temp1=5Finput<br>&gt;&gt; +c=
urr1=5Finput           in1=5Finput             in2=5Fhighest<br>&gt;in2=5Fr=
eset=5Fhistory     power1=5Fmax            temp1=5Fmax<br>&gt;&gt; +curr1=
=5Flabel           in1=5Flabel             in2=5Finput<br>&gt;name         =
         power1=5Freset=5Fhistory  temp1=5Fmax=5Falarm<br>&gt;&gt; +curr1=
=5Fmax             in1=5Fmax               in2=5Flabel<br>&gt;power/       =
         subsystem/            temp1=5Freset=5Fhistory<br>&gt;&gt; +curr1=
=5Fmax=5Falarm       in1=5Fmax=5Falarm         in2=5Fmax<br>&gt;power1=5Fal=
arm          temp1=5Fcrit            uevent<br>&gt;&gt; +curr1=5Freset=5Fhi=
story   in1=5Fmin               in2=5Fmax=5Falarm<br>&gt;power1=5Finput    =
      temp1=5Fcrit=5Falarm<br>&gt;&gt; +device/               in1=5Fmin=5Fa=
larm         in2=5Fmin<br>&gt;power1=5Finput=5Fhighest  temp1=5Fhighest<br>=
&gt;&gt; +root@barreleye:~# ls /sys/class/hwmon/hwmon5/<br>&gt;&gt; +curr1=
=5Fhighest         in1=5Fhighest           in1=5Freset=5Fhistory<br>&gt;in2=
=5Fmin=5Falarm         power1=5Flabel          temp1=5Finput<br>&gt;&gt; +c=
urr1=5Finput           in1=5Finput             in2=5Fhighest<br>&gt;in2=5Fr=
eset=5Fhistory     power1=5Fmax            temp1=5Fmax<br>&gt;&gt; +curr1=
=5Flabel           in1=5Flabel             in2=5Finput<br>&gt;name         =
         power1=5Freset=5Fhistory  temp1=5Fmax=5Falarm<br>&gt;&gt; +curr1=
=5Fmax             in1=5Fmax               in2=5Flabel<br>&gt;power/       =
         subsystem/            temp1=5Freset=5Fhistory<br>&gt;&gt; +curr1=
=5Fmax=5Falarm       in1=5Fmax=5Falarm         in2=5Fmax<br>&gt;power1=5Fal=
arm          temp1=5Fcrit            uevent<br>&gt;&gt; +curr1=5Freset=5Fhi=
story   in1=5Fmin               in2=5Fmax=5Falarm<br>&gt;power1=5Finput    =
      temp1=5Fcrit=5Falarm<br>&gt;&gt; +device/               in1=5Fmin=5Fa=
larm         in2=5Fmin<br>&gt;power1=5Finput=5Fhighest  temp1=5Fhighest<br>=
&gt;&gt; +<br>&gt;&gt; +4) For details of what each hwmon sysfs attributes =
mean, please<br>&gt;refer to:<br>&gt;&gt; +<a target=3D"=5Fblank" href=3D"h=
ttps://www.kernel.org/doc/Documentation/hwmon/pmbus">https://www.kernel.org=
/doc/Documentation/hwmon/pmbus</a><br>&gt;&gt; +For short, 'curr1=5F*' refe=
rs to 'IOUT', 'in1=5F*' refers to 'vin',<br>&gt;'in2=5F*' refers to 'vout',=
 'power1=5F*' refers to 'input power',<br>&gt;&gt; +'temp1=5F*' for 'temper=
ature'.<br>&gt;&gt; +<br>&gt;&gt; +5) Remaining issue:<br>&gt;&gt; +<br>&gt=
;&gt; +5.1) Currently, i2c=5Faspeed driver does not handle<br>&gt;"i2c=5Fsm=
bus=5Fread=5Fblock=5Fdata()" correctly. So this patch has to bypass<br>&gt;=
some detection code.<br>&gt;&gt; +We need to fix this issue when the patch =
is merged to kernel.<br>&gt;&gt; +5.2) According to adm1278 datasheet, ther=
e is a sense resistor<br>&gt;used to measure power and current. The resisto=
r will affect<br>&gt;conversion between<br>&gt;&gt; +adm1278 register value=
 to real-world value for current and power.<br>&gt;I am not very sure about=
 the resistor value. So using 1 mili-ohms (or<br>&gt;1000 micro-ohms) as de=
fault value. When build the adm1275 driver as<br>&gt;kernel module, we can =
set this resistor value by:<br>&gt;&gt; +<br>&gt;&gt; +# insmod adm1275.ko =
r=5Fsense=3D500<br>&gt;&gt; +<br>&gt;&gt; +This will set the 'sense resisto=
r' to 500 micro-ohms.<br>&gt;&gt; +5.3) Some of the sensor value, e.g, 'tem=
p1=5Finput' seems not<br>&gt;reasonable, e.g:<br>&gt;&gt; +<br>&gt;&gt; +ro=
ot@barreleye:~# cat /sys/class/hwmon/hwmon4/temp1=5Finput<br>&gt;&gt; +-270=
952<br>&gt;&gt; +<br>&gt;&gt; +Need further check on that.<br>&gt;&gt; diff=
 --git<br>&gt;a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-ba=
rreleye/<br>&gt;recipes-kernel/linux/linux-obmc=5F%.bbappend<br>&gt;b/meta-=
openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/<br>&gt;recip=
es-kernel/linux/linux-obmc=5F%.bbappend<br>&gt;&gt; new file mode 100644<br=
>&gt;&gt; index 0000000..b6e8e16<br>&gt;&gt; --- /dev/null<br>&gt;&gt; +++<=
br>&gt;b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye=
/<br>&gt;recipes-kernel/linux/linux-obmc=5F%.bbappend<br>&gt;&gt; @@ -0,0 +=
1,3 @@<br>&gt;&gt; +FILESEXTRAPATHS=5Fprepend :=3D "${THISDIR}/linux-obmc:"=
<br>&gt;&gt; +SRC=5FURI +=3D "file://barreleye.cfg"<br>&gt;&gt; +SRC=5FURI =
+=3D "file://hwmon=5Fadm1278.patch"<br>&gt;&gt; --<br>&gt;&gt; 2.7.1<br>&gt=
;&gt;<br>&gt;&gt;<br>&gt;&gt; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F<br>&gt;&gt; openbmc mailing list<br>&gt;&gt; <a targe=
t=3D"=5Fblank" href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlab=
s.org</a><br>&gt;&gt; <a target=3D"=5Fblank" href=3D"https://lists.ozlabs.o=
rg/listinfo/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a><br>&gt;=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt;o=
penbmc mailing list<br>&gt;<a target=3D"=5Fblank" href=3D"mailto:openbmc@li=
sts.ozlabs.org">openbmc@lists.ozlabs.org</a><br>&gt;<a target=3D"=5Fblank" =
href=3D"https://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org=
/listinfo/openbmc</a><br>&gt;</font><BR>
