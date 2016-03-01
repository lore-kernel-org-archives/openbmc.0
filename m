Return-Path: <anoo@us.ibm.com>
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 129311A0007
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2016 08:15:23 +1100 (AEDT)
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Tue, 1 Mar 2016 16:15:20 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 1 Mar 2016 16:15:18 -0500
X-IBM-Helo: d01dlp01.pok.ibm.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id F401B38C8052
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2016 16:15:16 -0500 (EST)
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u21LFGfG33357900
 for <openbmc@lists.ozlabs.org>; Tue, 1 Mar 2016 21:15:16 GMT
Received: from d01av03.pok.ibm.com (localhost [127.0.0.1])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u21LFG86020782
 for <openbmc@lists.ozlabs.org>; Tue, 1 Mar 2016 16:15:16 -0500
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u21LFFHj020687
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 1 Mar 2016 16:15:15 -0500
Message-Id: <201603012115.u21LFFHj020687@d01av03.pok.ibm.com>
Received: from localhost
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Tue, 1 Mar 2016 16:15:15 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.73)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 1 Mar 2016 16:15:13 -0500
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Tue, 1 Mar 2016 21:15:12 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 1 Mar 2016 21:15:11 -0000
Received: from us1a3-mail52.a3.dal06.isc4sb.com ([10.106.154.203])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016030121151076-471964 ;
 Tue, 1 Mar 2016 21:15:10 +0000 
In-Reply-To: <CACPK8XcOB-RzarE67ddZZHj2CuiRAupL07Fe1dPUHHC=W4CweQ@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>, OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH openbmc] Add temporary adm1278 hwmon pmbus driver patch
From: "Adriana Kobylak" <anoo@us.ibm.com>
Date: Tue, 1 Mar 2016 15:15:12 -0600
References: <1455705024-15045-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455705024-15045-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8XcOB-RzarE67ddZZHj2CuiRAupL07Fe1dPUHHC=W4CweQ@mail.gmail.com>
MIME-Version: 1.0
X-KeepSent: 9A917BF2:B59C110A-86257F69:00746FEF;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 1251
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 0074BF2386257F69_="
x-cbid: 16030121-0041-0000-0000-0000036DA6BE
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.119333; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004983; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000149; SDB=6.00667247; UDB=6.00304371; UTC=2016-03-01
 21:15:11
x-cbparentid: 16030121-0598-0000-0000-000006A97CEB
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
X-List-Received-Date: Tue, 01 Mar 2016 21:15:25 -0000


--=_alternative 0074BF2386257F69_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

What makes this pull request different from other openbmc changes to=20
require to be sent via git-send-email before it can be reviewed?






From:   Joel Stanley <joel@jms.id.au>
To:     OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc:     OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date:   02/17/2016 10:24 PM
Subject:        Re: [PATCH openbmc] Add temporary adm1278 hwmon pmbus=20
driver patch
Sent by:        "openbmc"=20
<openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org>



On Wed, Feb 17, 2016 at 9:00 PM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Yi Li <adamliyi@msn.com>
>
> This patch temporarily adds adm1278 hwmon driver as a kernel patch to=20
openbmc,
> for testing on Barreleye.

Can you please send this as a patch with git-send-email so we can review=20
it.

> If in the future this patch will still be useful, it should be put into=20
linux kernel.
>
> Barreleye has three adm1278 devices on three i2c buses.
> This patch enables reading adm1278 sensors via hwmon sysfs interface.
> The enabled sensors are: current, voltage (In and Out), power and=20
temperature.
> Detail usage can be found in 'readme=5Fadm1278.txt'.
>
> Signed-off-by: Yi Li <adamliyi@msn.com>
> ---
>  .../recipes-kernel/linux/linux-obmc/barreleye.cfg  |   3 +
>  .../linux/linux-obmc/hwmon=5Fadm1278.patch           | 165=20
+++++++++++++++++++++
>  .../linux/linux-obmc/readme=5Fadm1278.txt            |  78 ++++++++++
>  .../recipes-kernel/linux/linux-obmc=5F%.bbappend     |   3 +
>  4 files changed, 249 insertions(+)
>  create mode 100644=20
meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-=
kernel/linux/linux-obmc/barreleye.cfg
>  create mode 100644=20
meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-=
kernel/linux/linux-obmc/hwmon=5Fadm1278.patch
>  create mode 100644=20
meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-=
kernel/linux/linux-obmc/readme=5Fadm1278.txt
>  create mode 100644=20
meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-=
kernel/linux/linux-obmc=5F%.bbappend
>
> diff --git=20
a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc/barreleye.cfg=20
b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc/barreleye.cfg
> new file mode 100644
> index 0000000..086f191
> --- /dev/null
> +++=20
b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc/barreleye.cfg
> @@ -0,0 +1,3 @@
> +CONFIG=5FPMBUS=3Dy
> +CONFIG=5FSENSORS=5FPMBUS=3Dy
> +CONFIG=5FSENSORS=5FADM1275=3Dy
> diff --git=20
a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc/hwmon=5Fadm1278.patch=20
b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc/hwmon=5Fadm1278.patch
> new file mode 100644
> index 0000000..074d39f
> --- /dev/null
> +++=20
b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc/hwmon=5Fadm1278.patch
> @@ -0,0 +1,165 @@
> +diff --git a/drivers/hwmon/pmbus/adm1275.c=20
b/drivers/hwmon/pmbus/adm1275.c
> +index 188af4c..a45075d 100644
> +--- a/drivers/hwmon/pmbus/adm1275.c
> ++++ b/drivers/hwmon/pmbus/adm1275.c
> +@@ -24,7 +24,7 @@
> + #include <linux/bitops.h>
> + #include "pmbus.h"
> +
> +-enum chips { adm1075, adm1275, adm1276, adm1293, adm1294 };
> ++enum chips { adm1075, adm1275, adm1276, adm1278, adm1293, adm1294 };
> +
> + #define ADM1275=5FMFR=5FSTATUS=5FIOUT=5FWARN2 BIT(0)
> + #define ADM1293=5FMFR=5FSTATUS=5FVAUX=5FUV=5FWARN       BIT(5)
> +@@ -70,6 +70,22 @@ enum chips { adm1075, adm1275, adm1276, adm1293,=20
adm1294 };
> + #define ADM1075=5FVAUX=5FOV=5FWARN          BIT(7)
> + #define ADM1075=5FVAUX=5FUV=5FWARN          BIT(6)
> +
> ++#define ADM1278=5FPMON=5FCONTROL          0xd3
> ++#define ADM1278=5FPMON=5FCONFIG           0xd4
> ++#define ADM1278=5FCFG=5FTSFLT             BIT(15)
> ++#define ADM1278=5FCFG=5FSIMULTANEOUS      BIT(14)
> ++#define ADM1278=5FCFG=5FPMON=5FMODE         BIT(4)
> ++#define ADM1278=5FCFG=5FTEMP1=5FEN          BIT(3)
> ++#define ADM1278=5FCFG=5FVIN=5FEN            BIT(2)
> ++#define ADM1278=5FCFG=5FVOUT=5FEN           BIT(1)
> ++#define ADM1278=5FPEAK=5FTEMPERATURE      0xd7
> ++
> ++#define ADM1278=5FR=5FSENSE       1000    /* R=5Fsense resistor value i=
n=20
microohmsi */
> ++
> ++static int r=5Fsense =3D ADM1278=5FR=5FSENSE;
> ++module=5Fparam(r=5Fsense, int, 0644);
> ++MODULE=5FPARM=5FDESC(r=5Fsense, "Rsense resistor value in microohms");
> ++
> + struct adm1275=5Fdata {
> +       int id;
> +       bool have=5Foc=5Ffault;
> +@@ -186,6 +202,11 @@ static int adm1275=5Fread=5Fword=5Fdata(struct=20
i2c=5Fclient *client, int page, int reg)
> +       case PMBUS=5FVIRT=5FREAD=5FVIN=5FMAX:
> +               ret =3D pmbus=5Fread=5Fword=5Fdata(client, 0, ADM1275=5FP=
EAK=5FVIN);
> +               break;
> ++      case PMBUS=5FVIRT=5FREAD=5FTEMP=5FMAX:
> ++              if (data->id !=3D adm1278)
> ++                      return -ENODATA;
> ++              ret =3D pmbus=5Fread=5Fword=5Fdata(client, 0,=20
ADM1278=5FPEAK=5FTEMPERATURE);
> ++              break;
> +       case PMBUS=5FVIRT=5FREAD=5FPIN=5FMIN:
> +               if (!data->have=5Fpin=5Fmin)
> +                       return -ENXIO;
> +@@ -199,6 +220,7 @@ static int adm1275=5Fread=5Fword=5Fdata(struct i2c=
=5Fclient=20
*client, int page, int reg)
> +       case PMBUS=5FVIRT=5FRESET=5FIOUT=5FHISTORY:
> +       case PMBUS=5FVIRT=5FRESET=5FVOUT=5FHISTORY:
> +       case PMBUS=5FVIRT=5FRESET=5FVIN=5FHISTORY:
> ++      case PMBUS=5FVIRT=5FRESET=5FTEMP=5FHISTORY:
> +               break;
> +       case PMBUS=5FVIRT=5FRESET=5FPIN=5FHISTORY:
> +               if (!data->have=5Fpin=5Fmax)
> +@@ -239,6 +261,9 @@ static int adm1275=5Fwrite=5Fword=5Fdata(struct=20
i2c=5Fclient *client, int page, int reg,
> +       case PMBUS=5FVIRT=5FRESET=5FVIN=5FHISTORY:
> +               ret =3D pmbus=5Fwrite=5Fword=5Fdata(client, 0, ADM1275=5F=
PEAK=5FVIN,=20
0);
> +               break;
> ++      case PMBUS=5FVIRT=5FRESET=5FTEMP=5FHISTORY:
> ++              ret =3D pmbus=5Fwrite=5Fword=5Fdata(client, 0,=20
ADM1278=5FPEAK=5FTEMPERATURE, 0);
> ++              break;
> +       case PMBUS=5FVIRT=5FRESET=5FPIN=5FHISTORY:
> +               ret =3D pmbus=5Fwrite=5Fword=5Fdata(client, 0, ADM1276=5F=
PEAK=5FPIN,=20
0);
> +               if (!ret && data->have=5Fpin=5Fmin)
> +@@ -312,6 +337,7 @@ static const struct i2c=5Fdevice=5Fid adm1275=5Fid[]=
 =3D {
> +       { "adm1075", adm1075 },
> +       { "adm1275", adm1275 },
> +       { "adm1276", adm1276 },
> ++      { "adm1278", adm1278 },
> +       { "adm1293", adm1293 },
> +       { "adm1294", adm1294 },
> +       { }
> +@@ -335,6 +361,8 @@ static int adm1275=5Fprobe(struct i2c=5Fclient *clie=
nt,
> +                                    | I2C=5FFUNC=5FSMBUS=5FBLOCK=5FDATA))
> +               return -ENODEV;
> +
> ++      /* i2c=5Faspeed driver does not handle i2c=5Fsmbus=5Fread=5Fblock=
=5Fdata=20
correctly */
> ++#if 0
> +       ret =3D i2c=5Fsmbus=5Fread=5Fblock=5Fdata(client, PMBUS=5FMFR=5FI=
D,=20
block=5Fbuffer);
> +       if (ret < 0) {
> +               dev=5Ferr(&client->dev, "Failed to read Manufacturer=20
ID\n");
> +@@ -363,6 +391,7 @@ static int adm1275=5Fprobe(struct i2c=5Fclient *clie=
nt,
> +               dev=5Fnotice(&client->dev,
> +                          "Device mismatch: Configured %s, detected=20
%s\n",
> +                          id->name, mid->name);
> ++#endif
> +
> +       config =3D i2c=5Fsmbus=5Fread=5Fbyte=5Fdata(client, ADM1275=5FPMO=
N=5FCONFIG);
> +       if (config < 0)
> +@@ -377,7 +406,9 @@ static int adm1275=5Fprobe(struct i2c=5Fclient *clie=
nt,
> +       if (!data)
> +               return -ENOMEM;
> +
> +-      data->id =3D mid->driver=5Fdata;
> ++      /* i2c=5Faspeed driver does not handle i2c=5Fsmbus=5Fread=5Fblock=
=5Fdata=20
correctly */
> ++      //data->id =3D mid->driver=5Fdata;
> ++      data->id =3D adm1278;
> +
> +       info =3D &data->info;
> +
> +@@ -460,6 +491,62 @@ static int adm1275=5Fprobe(struct i2c=5Fclient=20
*client,
> +                       info->func[0] |=3D
> +                         PMBUS=5FHAVE=5FVOUT | PMBUS=5FHAVE=5FSTATUS=5FV=
OUT;
> +               break;
> ++      case adm1278:
> ++              /* Configure monitoring */
> ++              ret =3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client,
> ++                      ADM1278=5FPMON=5FCONTROL, 0);
> ++              if (ret < 0)
> ++                      return ret;
> ++              ret =3D i2c=5Fsmbus=5Fread=5Fword=5Fdata(client,=20
ADM1275=5FPMON=5FCONFIG);
> ++              ret =3D i2c=5Fsmbus=5Fwrite=5Fword=5Fdata(client,=20
ADM1275=5FPMON=5FCONFIG,
> ++                                              ADM1278=5FCFG=5FPMON=5FMO=
DE |
> ++                                              ADM1278=5FCFG=5FTEMP1=5FE=
N |
> ++                                              ADM1278=5FCFG=5FVIN=5FEN |
> ++                                              ADM1278=5FCFG=5FVOUT=5FEN=
);
> ++              if (ret < 0)
> ++                      return ret;
> ++              ret =3D i2c=5Fsmbus=5Fread=5Fword=5Fdata(client,=20
ADM1275=5FPMON=5FCONFIG);
> ++              dev=5Finfo(&client->dev, "adm1278 config: 0x%x\n", ret);
> ++              ret =3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client,=20
ADM1278=5FPMON=5FCONTROL,1);
> ++              if (ret < 0)
> ++                      return ret;
> ++
> ++              info->func[0] |=3D PMBUS=5FHAVE=5FVIN
> ++                      | PMBUS=5FHAVE=5FVOUT | PMBUS=5FHAVE=5FSTATUS=5FV=
OUT
> ++                      | PMBUS=5FHAVE=5FPIN
> ++                      | PMBUS=5FHAVE=5FSTATUS=5FINPUT
> ++                      | PMBUS=5FHAVE=5FTEMP | PMBUS=5FHAVE=5FSTATUS=5FT=
EMP;
> ++
> ++              data->have=5Foc=5Ffault =3D false;
> ++              data->have=5Fuc=5Ffault =3D false;
> ++              data->have=5Fvout =3D true;
> ++              data->have=5Fvaux=5Fstatus =3D false;
> ++              data->have=5Fmfr=5Fvaux=5Fstatus =3D false;
> ++              data->have=5Fiout=5Fmin =3D false;
> ++              data->have=5Fpin=5Fmin =3D false;
> ++              data->have=5Fpin=5Fmax =3D true;
> ++
> ++              info->m[PSC=5FVOLTAGE=5FIN] =3D 19599;
> ++              info->b[PSC=5FVOLTAGE=5FIN] =3D 0;
> ++              info->R[PSC=5FVOLTAGE=5FIN] =3D -2;
> ++
> ++              info->m[PSC=5FVOLTAGE=5FOUT] =3D 19599;
> ++              info->b[PSC=5FVOLTAGE=5FOUT] =3D 0;
> ++              info->R[PSC=5FVOLTAGE=5FOUT] =3D -2;
> ++
> ++              info->m[PSC=5FCURRENT=5FOUT] =3D 800 * r=5Fsense / 1000;
> ++              info->b[PSC=5FCURRENT=5FOUT] =3D 20475;
> ++              info->R[PSC=5FCURRENT=5FOUT] =3D -1;
> ++
> ++              info->m[PSC=5FPOWER] =3D 6123 * r=5Fsense / 1000;
> ++              info->b[PSC=5FPOWER] =3D 0;
> ++              info->R[PSC=5FPOWER] =3D -2;
> ++
> ++              info->format[PSC=5FTEMPERATURE] =3D direct;
> ++              info->m[PSC=5FTEMPERATURE] =3D 42;
> ++              info->b[PSC=5FTEMPERATURE] =3D 31880;
> ++              info->R[PSC=5FTEMPERATURE] =3D -1;
> ++              break;
> +       case adm1293:
> +       case adm1294:
> +               data->have=5Fiout=5Fmin =3D true;
> diff --git=20
a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc/readme=5Fadm1278.txt=20
b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc/readme=5Fadm1278.txt
> new file mode 100644
> index 0000000..e86d977
> --- /dev/null
> +++=20
b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc/readme=5Fadm1278.txt
> @@ -0,0 +1,78 @@
> +README for adm1278 hwmon driver
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Yi Li <shliyi@cn.ibm.com>
> +
> +
> +This is a temporary kernel patch to enable hwmon driver for adm1278=20
chip on Barreleye.
> +When this patch is merged into linux kernel, this patch will be removed =

from openbmc.
> +
> +The adm1278 driver is created according to datasheet:
>=20
+http://www.analog.com/media/en/technical-documentation/data-sheets/ADM1278=
.pdf
> +
> +The patch heavily re-used adm1278 enabling code from:=20
https://github.com/facebook/openbmc/blob/master/meta-aspeed/recipes-kernel/=
linux/files/patch-2.6.28.9/0000-linux-openbmc.patch
.
> +
> +This patch has been tested on barreleye, by following these steps:
> +
> +1) There are 3 adm1278 devices on Barreleye
> +
> +I2C5: P12v=5Fa for CPU0
> +I2C6: P12v=5Fb for CPU1
> +I2C7: P12v=5Fc for HDD and IO Board
> +
> +2) adm1278 driver is based on adm1275.c, which depends on pmbus. This=20
patch builds
> +adm1275 and pmbus into kernel.
> +
> +3) When kernel booted, initialize the adm1278 devices:
> +
> +root@barreleye:~# echo adm1278 0x10 >=20
/sys/class/i2c-adapter/i2c-4/new=5Fdevice
> +root@barreleye:~# echo adm1278 0x10 >=20
/sys/class/i2c-adapter/i2c-5/new=5Fdevice
> +root@barreleye:~# echo adm1278 0x10 >=20
/sys/class/i2c-adapter/i2c-6/new=5Fdevice
> +
> +There will be three new hwmon sysfs entries created:
> +
> +root@barreleye:~# ls /sys/class/hwmon/hwmon3/
> +curr1=5Fhighest         in1=5Fhighest           in1=5Freset=5Fhistory=20
in2=5Fmin=5Falarm         power1=5Flabel          temp1=5Finput
> +curr1=5Finput           in1=5Finput             in2=5Fhighest=20
in2=5Freset=5Fhistory     power1=5Fmax            temp1=5Fmax
> +curr1=5Flabel           in1=5Flabel             in2=5Finput             =
name =20
               power1=5Freset=5Fhistory  temp1=5Fmax=5Falarm
> +curr1=5Fmax             in1=5Fmax               in2=5Flabel power/ =20
subsystem/            temp1=5Freset=5Fhistory
> +curr1=5Fmax=5Falarm       in1=5Fmax=5Falarm         in2=5Fmax power1=5Fa=
larm =20
temp1=5Fcrit            uevent
> +curr1=5Freset=5Fhistory   in1=5Fmin               in2=5Fmax=5Falarm powe=
r1=5Finput =20
       temp1=5Fcrit=5Falarm
> +device/               in1=5Fmin=5Falarm         in2=5Fmin=20
power1=5Finput=5Fhighest  temp1=5Fhighest
> +root@barreleye:~# ls /sys/class/hwmon/hwmon4/
> +curr1=5Fhighest         in1=5Fhighest           in1=5Freset=5Fhistory=20
in2=5Fmin=5Falarm         power1=5Flabel          temp1=5Finput
> +curr1=5Finput           in1=5Finput             in2=5Fhighest=20
in2=5Freset=5Fhistory     power1=5Fmax            temp1=5Fmax
> +curr1=5Flabel           in1=5Flabel             in2=5Finput             =
name =20
               power1=5Freset=5Fhistory  temp1=5Fmax=5Falarm
> +curr1=5Fmax             in1=5Fmax               in2=5Flabel power/ =20
subsystem/            temp1=5Freset=5Fhistory
> +curr1=5Fmax=5Falarm       in1=5Fmax=5Falarm         in2=5Fmax power1=5Fa=
larm =20
temp1=5Fcrit            uevent
> +curr1=5Freset=5Fhistory   in1=5Fmin               in2=5Fmax=5Falarm powe=
r1=5Finput =20
       temp1=5Fcrit=5Falarm
> +device/               in1=5Fmin=5Falarm         in2=5Fmin=20
power1=5Finput=5Fhighest  temp1=5Fhighest
> +root@barreleye:~# ls /sys/class/hwmon/hwmon5/
> +curr1=5Fhighest         in1=5Fhighest           in1=5Freset=5Fhistory=20
in2=5Fmin=5Falarm         power1=5Flabel          temp1=5Finput
> +curr1=5Finput           in1=5Finput             in2=5Fhighest=20
in2=5Freset=5Fhistory     power1=5Fmax            temp1=5Fmax
> +curr1=5Flabel           in1=5Flabel             in2=5Finput             =
name =20
               power1=5Freset=5Fhistory  temp1=5Fmax=5Falarm
> +curr1=5Fmax             in1=5Fmax               in2=5Flabel power/ =20
subsystem/            temp1=5Freset=5Fhistory
> +curr1=5Fmax=5Falarm       in1=5Fmax=5Falarm         in2=5Fmax power1=5Fa=
larm =20
temp1=5Fcrit            uevent
> +curr1=5Freset=5Fhistory   in1=5Fmin               in2=5Fmax=5Falarm powe=
r1=5Finput =20
       temp1=5Fcrit=5Falarm
> +device/               in1=5Fmin=5Falarm         in2=5Fmin=20
power1=5Finput=5Fhighest  temp1=5Fhighest
> +
> +4) For details of what each hwmon sysfs attributes mean, please refer=20
to:
> +https://www.kernel.org/doc/Documentation/hwmon/pmbus
> +For short, 'curr1=5F*' refers to 'IOUT', 'in1=5F*' refers to 'vin', 'in2=
=5F*'=20
refers to 'vout', 'power1=5F*' refers to 'input power',
> +'temp1=5F*' for 'temperature'.
> +
> +5) Remaining issue:
> +
> +5.1) Currently, i2c=5Faspeed driver does not handle=20
"i2c=5Fsmbus=5Fread=5Fblock=5Fdata()" correctly. So this patch has to bypas=
s some=20
detection code.
> +We need to fix this issue when the patch is merged to kernel.
> +5.2) According to adm1278 datasheet, there is a sense resistor used to=20
measure power and current. The resistor will affect conversion between
> +adm1278 register value to real-world value for current and power. I am=20
not very sure about the resistor value. So using 1 mili-ohms (or 1000=20
micro-ohms) as default value. When build the adm1275 driver as kernel=20
module, we can set this resistor value by:
> +
> +# insmod adm1275.ko r=5Fsense=3D500
> +
> +This will set the 'sense resistor' to 500 micro-ohms.
> +5.3) Some of the sensor value, e.g, 'temp1=5Finput' seems not reasonable=
,=20
e.g:
> +
> +root@barreleye:~# cat /sys/class/hwmon/hwmon4/temp1=5Finput
> +-270952
> +
> +Need further check on that.
> diff --git=20
a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc=5F%.bbappend=20
b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc=5F%.bbappend
> new file mode 100644
> index 0000000..b6e8e16
> --- /dev/null
> +++=20
b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc=5F%.bbappend
> @@ -0,0 +1,3 @@
> +FILESEXTRAPATHS=5Fprepend :=3D "${THISDIR}/linux-obmc:"
> +SRC=5FURI +=3D "file://barreleye.cfg"
> +SRC=5FURI +=3D "file://hwmon=5Fadm1278.patch"
> --
> 2.7.1
>
>
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc





--=_alternative 0074BF2386257F69_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<font size=3D2 face=3D"sans-serif">What makes this pull request different
from other openbmc changes to require to be sent via git-send-email before
it can be reviewed?</font><br><br><br><br><br><br><br><font size=3D1 color=
=3D#5f5f5f face=3D"sans-serif">From: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">Joel Stanley &lt;joel@jms.i=
d.au&gt;</font><br><font size=3D1 color=3D#5f5f5f face=3D"sans-serif">To: &=
nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">OpenBMC Patches &lt;openbmc=
-patches@stwcx.xyz&gt;</font><br><font size=3D1 color=3D#5f5f5f face=3D"san=
s-serif">Cc: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">OpenBMC Maillist &lt;openbm=
c@lists.ozlabs.org&gt;</font><br><font size=3D1 color=3D#5f5f5f face=3D"san=
s-serif">Date: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">02/17/2016 10:24 PM</font><=
br><font size=3D1 color=3D#5f5f5f face=3D"sans-serif">Subject: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size=3D1 face=3D"sans-serif">Re: [PATCH openbmc]
Add temporary adm1278 hwmon pmbus driver patch</font><br><font size=3D1 col=
or=3D#5f5f5f face=3D"sans-serif">Sent by: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size=3D1 face=3D"sans-serif">&quot;openbmc&quot;
&lt;openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org&gt;</font><br><hr no=
shade><br><br><br><tt><font size=3D2>On Wed, Feb 17, 2016 at 9:00 PM, OpenB=
MC Patches<br>&lt;openbmc-patches@stwcx.xyz&gt; wrote:<br>&gt; From: Yi Li =
&lt;adamliyi@msn.com&gt;<br>&gt;<br>&gt; This patch temporarily adds adm127=
8 hwmon driver as a kernel patch
to openbmc,<br>&gt; for testing on Barreleye.<br><br>Can you please send th=
is as a patch with git-send-email so we can review
it.<br><br>&gt; If in the future this patch will still be useful, it should=
 be put
into linux kernel.<br>&gt;<br>&gt; Barreleye has three adm1278 devices on t=
hree i2c buses.<br>&gt; This patch enables reading adm1278 sensors via hwmo=
n sysfs interface.<br>&gt; The enabled sensors are: current, voltage (In an=
d Out), power and
temperature.<br>&gt; Detail usage can be found in 'readme=5Fadm1278.txt'.<b=
r>&gt;<br>&gt; Signed-off-by: Yi Li &lt;adamliyi@msn.com&gt;<br>&gt; ---<br=
>&gt; &nbsp;.../recipes-kernel/linux/linux-obmc/barreleye.cfg &nbsp;| &nbsp;
3 +<br>&gt; &nbsp;.../linux/linux-obmc/hwmon=5Fadm1278.patch &nbsp; &nbsp; =
&nbsp;
&nbsp; &nbsp; | 165 +++++++++++++++++++++<br>&gt; &nbsp;.../linux/linux-obm=
c/readme=5Fadm1278.txt &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;| &nbsp;78 ++++++++++<br>&gt; &nbsp;.../recipes-kernel/=
linux/linux-obmc=5F%.bbappend &nbsp; &nbsp;
| &nbsp; 3 +<br>&gt; &nbsp;4 files changed, 249 insertions(+)<br>&gt; &nbsp=
;create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/met=
a-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg<br>&gt; &nbsp;cre=
ate mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-ba=
rreleye/recipes-kernel/linux/linux-obmc/hwmon=5Fadm1278.patch<br>&gt; &nbsp=
;create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/met=
a-barreleye/recipes-kernel/linux/linux-obmc/readme=5Fadm1278.txt<br>&gt; &n=
bsp;create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/=
meta-barreleye/recipes-kernel/linux/linux-obmc=5F%.bbappend<br>&gt;<br>&gt;=
 diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barr=
eleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc/barreleye.cfg<br>&gt; new file mode 100644<br>&gt=
; index 0000000..086f191<br>&gt; --- /dev/null<br>&gt; +++ b/meta-openbmc-m=
achines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/l=
inux-obmc/barreleye.cfg<br>&gt; @@ -0,0 +1,3 @@<br>&gt; +CONFIG=5FPMBUS=3Dy=
<br>&gt; +CONFIG=5FSENSORS=5FPMBUS=3Dy<br>&gt; +CONFIG=5FSENSORS=5FADM1275=
=3Dy<br>&gt; diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspa=
ce/meta-barreleye/recipes-kernel/linux/linux-obmc/hwmon=5Fadm1278.patch
b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc/hwmon=5Fadm1278.patch<br>&gt; new file mode 10064=
4<br>&gt; index 0000000..074d39f<br>&gt; --- /dev/null<br>&gt; +++ b/meta-o=
penbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel=
/linux/linux-obmc/hwmon=5Fadm1278.patch<br>&gt; @@ -0,0 +1,165 @@<br>&gt; +=
diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c<=
br>&gt; +index 188af4c..a45075d 100644<br>&gt; +--- a/drivers/hwmon/pmbus/a=
dm1275.c<br>&gt; ++++ b/drivers/hwmon/pmbus/adm1275.c<br>&gt; +@@ -24,7 +24=
,7 @@<br>&gt; + #include &lt;linux/bitops.h&gt;<br>&gt; + #include &quot;pm=
bus.h&quot;<br>&gt; +<br>&gt; +-enum chips { adm1075, adm1275, adm1276, adm=
1293, adm1294 };<br>&gt; ++enum chips { adm1075, adm1275, adm1276, adm1278,=
 adm1293, adm1294
};<br>&gt; +<br>&gt; + #define ADM1275=5FMFR=5FSTATUS=5FIOUT=5FWARN2 BIT(0)=
<br>&gt; + #define ADM1293=5FMFR=5FSTATUS=5FVAUX=5FUV=5FWARN &nbsp; &nbsp; =
&nbsp; BIT(5)<br>&gt; +@@ -70,6 +70,22 @@ enum chips { adm1075, adm1275, ad=
m1276, adm1293,
adm1294 };<br>&gt; + #define ADM1075=5FVAUX=5FOV=5FWARN &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;BIT(7)<br>&gt; + #define ADM1075=5FVAUX=5FUV=5FWARN &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;BIT(6)<br>&gt; +<br>&gt; ++#define ADM1278=5FPMON=
=5FCONTROL &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0xd3<br>&gt; ++#define ADM1278=
=5FPMON=5FCONFIG &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0xd4<br>&gt; ++#define =
ADM1278=5FCFG=5FTSFLT &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
BIT(15)<br>&gt; ++#define ADM1278=5FCFG=5FSIMULTANEOUS &nbsp; &nbsp; &nbsp;=
BIT(14)<br>&gt; ++#define ADM1278=5FCFG=5FPMON=5FMODE &nbsp; &nbsp; &nbsp; =
&nbsp; BIT(4)<br>&gt; ++#define ADM1278=5FCFG=5FTEMP1=5FEN &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;BIT(3)<br>&gt; ++#define ADM1278=5FCFG=5FVIN=5FEN &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;BIT(2)<br>&gt; ++#define ADM1278=5FCFG=5F=
VOUT=5FEN &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; BIT(1)<br>&gt; ++#define ADM12=
78=5FPEAK=5FTEMPERATURE &nbsp; &nbsp; &nbsp;0xd7<br>&gt; ++<br>&gt; ++#defi=
ne ADM1278=5FR=5FSENSE &nbsp; &nbsp; &nbsp; 1000 &nbsp; &nbsp;/*
R=5Fsense resistor value in microohmsi */<br>&gt; ++<br>&gt; ++static int r=
=5Fsense =3D ADM1278=5FR=5FSENSE;<br>&gt; ++module=5Fparam(r=5Fsense, int, =
0644);<br>&gt; ++MODULE=5FPARM=5FDESC(r=5Fsense, &quot;Rsense resistor valu=
e in microohms&quot;);<br>&gt; ++<br>&gt; + struct adm1275=5Fdata {<br>&gt;=
 + &nbsp; &nbsp; &nbsp; int id;<br>&gt; + &nbsp; &nbsp; &nbsp; bool have=5F=
oc=5Ffault;<br>&gt; +@@ -186,6 +202,11 @@ static int adm1275=5Fread=5Fword=
=5Fdata(struct i2c=5Fclient
*client, int page, int reg)<br>&gt; + &nbsp; &nbsp; &nbsp; case PMBUS=5FVIR=
T=5FREAD=5FVIN=5FMAX:<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; ret =3D pmbus=5Fread=5Fword=5Fdata(client,
0, ADM1275=5FPEAK=5FVIN);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; break;<br>&gt; ++ &nbsp; &nbsp; &nbsp;case PMBUS=5FVIRT=5FREAD=5F=
TEMP=5FMAX:<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (=
data-&gt;id
!=3D adm1278)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;
&nbsp; &nbsp;return -ENODATA;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;ret =3D pmbus=5Fread=5Fword=5Fdata(client,
0, ADM1278=5FPEAK=5FTEMPERATURE);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;break;<br>&gt; + &nbsp; &nbsp; &nbsp; case PMBUS=5FVIRT=
=5FREAD=5FPIN=5FMIN:<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; if (!data-&gt;have=5Fpin=5Fmin)<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; return -ENXIO;<br>&gt; +@@ -199,6 +220,7 @@ static int adm1275=5Frea=
d=5Fword=5Fdata(struct i2c=5Fclient
*client, int page, int reg)<br>&gt; + &nbsp; &nbsp; &nbsp; case PMBUS=5FVIR=
T=5FRESET=5FIOUT=5FHISTORY:<br>&gt; + &nbsp; &nbsp; &nbsp; case PMBUS=5FVIR=
T=5FRESET=5FVOUT=5FHISTORY:<br>&gt; + &nbsp; &nbsp; &nbsp; case PMBUS=5FVIR=
T=5FRESET=5FVIN=5FHISTORY:<br>&gt; ++ &nbsp; &nbsp; &nbsp;case PMBUS=5FVIRT=
=5FRESET=5FTEMP=5FHISTORY:<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; break;<br>&gt; + &nbsp; &nbsp; &nbsp; case PMBUS=5FVIRT=5FRESET=
=5FPIN=5FHISTORY:<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; if (!data-&gt;have=5Fpin=5Fmax)<br>&gt; +@@ -239,6 +261,9 @@ static int a=
dm1275=5Fwrite=5Fword=5Fdata(struct i2c=5Fclient
*client, int page, int reg,<br>&gt; + &nbsp; &nbsp; &nbsp; case PMBUS=5FVIR=
T=5FRESET=5FVIN=5FHISTORY:<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; ret =3D pmbus=5Fwrite=5Fword=5Fdata(client,
0, ADM1275=5FPEAK=5FVIN, 0);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; break;<br>&gt; ++ &nbsp; &nbsp; &nbsp;case PMBUS=5FVIRT=5FRESE=
T=5FTEMP=5FHISTORY:<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;ret =3D pmbus=5Fwrite=5Fword=5Fdata(client,
0, ADM1278=5FPEAK=5FTEMPERATURE, 0);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;break;<br>&gt; + &nbsp; &nbsp; &nbsp; case PMBUS=5FVIR=
T=5FRESET=5FPIN=5FHISTORY:<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; ret =3D pmbus=5Fwrite=5Fword=5Fdata(client,
0, ADM1276=5FPEAK=5FPIN, 0);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; if (!ret &amp;&amp;
data-&gt;have=5Fpin=5Fmin)<br>&gt; +@@ -312,6 +337,7 @@ static const struct=
 i2c=5Fdevice=5Fid adm1275=5Fid[]
=3D {<br>&gt; + &nbsp; &nbsp; &nbsp; { &quot;adm1075&quot;, adm1075 },<br>&=
gt; + &nbsp; &nbsp; &nbsp; { &quot;adm1275&quot;, adm1275 },<br>&gt; + &nbs=
p; &nbsp; &nbsp; { &quot;adm1276&quot;, adm1276 },<br>&gt; ++ &nbsp; &nbsp;=
 &nbsp;{ &quot;adm1278&quot;, adm1278 },<br>&gt; + &nbsp; &nbsp; &nbsp; { &=
quot;adm1293&quot;, adm1293 },<br>&gt; + &nbsp; &nbsp; &nbsp; { &quot;adm12=
94&quot;, adm1294 },<br>&gt; + &nbsp; &nbsp; &nbsp; { }<br>&gt; +@@ -335,6 =
+361,8 @@ static int adm1275=5Fprobe(struct i2c=5Fclient *client,<br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| I2C=5FFUNC=5FSMBUS=
=5FBLOCK=5FDATA))<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; return -ENODEV;<br>&gt; +<br>&gt; ++ &nbsp; &nbsp; &nbsp;/* i2c=5Faspeed =
driver does not handle i2c=5Fsmbus=5Fread=5Fblock=5Fdata
correctly */<br>&gt; ++#if 0<br>&gt; + &nbsp; &nbsp; &nbsp; ret =3D i2c=5Fs=
mbus=5Fread=5Fblock=5Fdata(client, PMBUS=5FMFR=5FID,
block=5Fbuffer);<br>&gt; + &nbsp; &nbsp; &nbsp; if (ret &lt; 0) {<br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dev=5Ferr(&amp;client-&gt=
;dev,
&quot;Failed to read Manufacturer ID\n&quot;);<br>&gt; +@@ -363,6 +391,7 @@=
 static int adm1275=5Fprobe(struct i2c=5Fclient *client,<br>&gt; + &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dev=5Fnotice(&amp;client-&gt;dev,<=
br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;
&nbsp; &nbsp; &nbsp;&quot;Device mismatch: Configured %s, detected %s\n&quo=
t;,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;
&nbsp; &nbsp; &nbsp;id-&gt;name, mid-&gt;name);<br>&gt; ++#endif<br>&gt; +<=
br>&gt; + &nbsp; &nbsp; &nbsp; config =3D i2c=5Fsmbus=5Fread=5Fbyte=5Fdata(=
client, ADM1275=5FPMON=5FCONFIG);<br>&gt; + &nbsp; &nbsp; &nbsp; if (config=
 &lt; 0)<br>&gt; +@@ -377,7 +406,9 @@ static int adm1275=5Fprobe(struct i2c=
=5Fclient *client,<br>&gt; + &nbsp; &nbsp; &nbsp; if (!data)<br>&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -ENOMEM;<br>&gt; +<br>&=
gt; +- &nbsp; &nbsp; &nbsp;data-&gt;id =3D mid-&gt;driver=5Fdata;<br>&gt; +=
+ &nbsp; &nbsp; &nbsp;/* i2c=5Faspeed driver does not handle i2c=5Fsmbus=5F=
read=5Fblock=5Fdata
correctly */<br>&gt; ++ &nbsp; &nbsp; &nbsp;//data-&gt;id =3D mid-&gt;drive=
r=5Fdata;<br>&gt; ++ &nbsp; &nbsp; &nbsp;data-&gt;id =3D adm1278;<br>&gt; +=
<br>&gt; + &nbsp; &nbsp; &nbsp; info =3D &amp;data-&gt;info;<br>&gt; +<br>&=
gt; +@@ -460,6 +491,62 @@ static int adm1275=5Fprobe(struct i2c=5Fclient *c=
lient,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;
&nbsp; info-&gt;func[0] |=3D<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; PMBUS=5FHAVE=5FVOUT | PMBUS=5FHAVE=5FSTATUS=5FVOUT;<br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;<br>&gt; ++ &nbsp; =
&nbsp; &nbsp;case adm1278:<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;/* Configure monitoring
*/<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret =3D i2c=
=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client,<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;ADM1278=5FPMON=5FCONTROL, 0);<br>&gt; ++ &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;if (ret &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;return ret;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;ret =3D i2c=5Fsmbus=5Fread=5Fword=5Fdata(client,
ADM1275=5FPMON=5FCONFIG);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;ret =3D i2c=5Fsmbus=5Fwrite=5Fword=5Fdata(client,
ADM1275=5FPMON=5FCONFIG,<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;ADM1278=5FCFG=5FPMON=5FMODE |<br>&gt; ++ &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;ADM1278=5FCFG=5FTEMP1=5FEN |<br>&gt; ++ &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;ADM1278=5FCFG=5FVIN=5FEN |<br>&gt; ++ &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;ADM1278=5FCFG=5FVOUT=5FEN);<br>&gt; ++ &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;if (ret &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;return ret;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;ret =3D i2c=5Fsmbus=5Fread=5Fword=5Fdata(client,
ADM1275=5FPMON=5FCONFIG);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;dev=5Finfo(&amp;client-&gt;dev,
&quot;adm1278 config: 0x%x\n&quot;, ret);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;ret =3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client,
ADM1278=5FPMON=5FCONTROL,1);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;if (ret &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;return ret;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;info-&gt;func[0]
|=3D PMBUS=5FHAVE=5FVIN<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;| PMBUS=5FHAVE=5FVOUT | PMBUS=5FHAVE=5FSTATUS=5FVOUT<br>&gt; +=
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;| PMBUS=5FHAVE=5FPIN<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;| PMBUS=5FHAVE=5FSTATUS=5FINPUT<br>&gt; ++ &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;| PMBUS=5FHAVE=5FTEMP | PMBUS=5FHAVE=5FSTATUS=5FTEMP;<br>&gt; =
++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;data-&gt;have=
=5Foc=5Ffault
=3D false;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;data-=
&gt;have=5Fuc=5Ffault
=3D false;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;data-=
&gt;have=5Fvout
=3D true;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;data-&=
gt;have=5Fvaux=5Fstatus
=3D false;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;data-=
&gt;have=5Fmfr=5Fvaux=5Fstatus
=3D false;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;data-=
&gt;have=5Fiout=5Fmin
=3D false;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;data-=
&gt;have=5Fpin=5Fmin
=3D false;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;data-=
&gt;have=5Fpin=5Fmax
=3D true;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;info-&gt;m[PSC=5FVOLTAGE=5FIN]
=3D 19599;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;info-=
&gt;b[PSC=5FVOLTAGE=5FIN]
=3D 0;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;info-&gt;=
R[PSC=5FVOLTAGE=5FIN]
=3D -2;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;info-&gt;m[PSC=5FVOLTAGE=5FOUT]
=3D 19599;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;info-=
&gt;b[PSC=5FVOLTAGE=5FOUT]
=3D 0;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;info-&gt;=
R[PSC=5FVOLTAGE=5FOUT]
=3D -2;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;info-&gt;m[PSC=5FCURRENT=5FOUT]
=3D 800 * r=5Fsense / 1000;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;info-&gt;b[PSC=5FCURRENT=5FOUT]
=3D 20475;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;info-=
&gt;R[PSC=5FCURRENT=5FOUT]
=3D -1;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;info-&gt;m[PSC=5FPOWER]
=3D 6123 * r=5Fsense / 1000;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;info-&gt;b[PSC=5FPOWER]
=3D 0;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;info-&gt;=
R[PSC=5FPOWER]
=3D -2;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;info-&gt;format[PSC=5FTEMPERATURE]
=3D direct;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;info=
-&gt;m[PSC=5FTEMPERATURE]
=3D 42;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;info-&gt=
;b[PSC=5FTEMPERATURE]
=3D 31880;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;info-=
&gt;R[PSC=5FTEMPERATURE]
=3D -1;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<b=
r>&gt; + &nbsp; &nbsp; &nbsp; case adm1293:<br>&gt; + &nbsp; &nbsp; &nbsp; =
case adm1294:<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; da=
ta-&gt;have=5Fiout=5Fmin
=3D true;<br>&gt; diff --git a/meta-openbmc-machines/meta-openpower/meta-ra=
ckspace/meta-barreleye/recipes-kernel/linux/linux-obmc/readme=5Fadm1278.txt
b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc/readme=5Fadm1278.txt<br>&gt; new file mode 100644=
<br>&gt; index 0000000..e86d977<br>&gt; --- /dev/null<br>&gt; +++ b/meta-op=
enbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/=
linux/linux-obmc/readme=5Fadm1278.txt<br>&gt; @@ -0,0 +1,78 @@<br>&gt; +REA=
DME for adm1278 hwmon driver<br>&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt; =
+Yi Li &lt;shliyi@cn.ibm.com&gt;<br>&gt; +<br>&gt; +<br>&gt; +This is a tem=
porary kernel patch to enable hwmon driver for adm1278
chip on Barreleye.<br>&gt; +When this patch is merged into linux kernel, th=
is patch will be removed
from openbmc.<br>&gt; +<br>&gt; +The adm1278 driver is created according to=
 datasheet:<br>&gt; +http://www.analog.com/media/en/technical-documentation=
/data-sheets/ADM1278.pdf<br>&gt; +<br>&gt; +The patch heavily re-used adm12=
78 enabling code from: </font></tt><a href=3D"https://github.com/facebook/o=
penbmc/blob/master/meta-aspeed/recipes-kernel/linux/files/patch-2.6.28.9/00=
00-linux-openbmc.patch"><tt><font size=3D2>https://github.com/facebook/open=
bmc/blob/master/meta-aspeed/recipes-kernel/linux/files/patch-2.6.28.9/0000-=
linux-openbmc.patch</font></tt></a><tt><font size=3D2>.<br>&gt; +<br>&gt; +=
This patch has been tested on barreleye, by following these steps:<br>&gt; =
+<br>&gt; +1) There are 3 adm1278 devices on Barreleye<br>&gt; +<br>&gt; +I=
2C5: P12v=5Fa for CPU0<br>&gt; +I2C6: P12v=5Fb for CPU1<br>&gt; +I2C7: P12v=
=5Fc for HDD and IO Board<br>&gt; +<br>&gt; +2) adm1278 driver is based on =
adm1275.c, which depends on pmbus.
This patch builds<br>&gt; +adm1275 and pmbus into kernel.<br>&gt; +<br>&gt;=
 +3) When kernel booted, initialize the adm1278 devices:<br>&gt; +<br>&gt; =
+root@barreleye:~# echo adm1278 0x10 &gt; /sys/class/i2c-adapter/i2c-4/new=
=5Fdevice<br>&gt; +root@barreleye:~# echo adm1278 0x10 &gt; /sys/class/i2c-=
adapter/i2c-5/new=5Fdevice<br>&gt; +root@barreleye:~# echo adm1278 0x10 &gt=
; /sys/class/i2c-adapter/i2c-6/new=5Fdevice<br>&gt; +<br>&gt; +There will b=
e three new hwmon sysfs entries created:<br>&gt; +<br>&gt; +root@barreleye:=
~# ls /sys/class/hwmon/hwmon3/<br>&gt; +curr1=5Fhighest &nbsp; &nbsp; &nbsp=
; &nbsp; in1=5Fhighest &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; in1=5Freset=5Fhistory &nbsp; &nbsp; in2=5Fmin=5Falarm =
&nbsp;
&nbsp; &nbsp; &nbsp; power1=5Flabel &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;temp1=
=5Finput<br>&gt; +curr1=5Finput &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in1=5Fin=
put &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; in2=5Fhighest &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
in2=5Freset=5Fhistory &nbsp; &nbsp; power1=5Fmax &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;temp1=5Fmax<br>&gt; +curr1=5Flabel &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; in1=5Flabel &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; in2=5Finput &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;p=
ower1=5Freset=5Fhistory
&nbsp;temp1=5Fmax=5Falarm<br>&gt; +curr1=5Fmax &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; in1=5Fmax &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in2=5Flabel &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; power/ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;subsystem/ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;temp1=5Freset=5Fh=
istory<br>&gt; +curr1=5Fmax=5Falarm &nbsp; &nbsp; &nbsp; in1=5Fmax=5Falarm =
&nbsp; &nbsp;
&nbsp; &nbsp; in2=5Fmax &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
power1=5Falarm &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;temp1=5Fcrit &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;uevent<br>&gt; +curr1=5Freset=5Fhistory &nbsp; i=
n1=5Fmin &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; in2=5Fmax=5Falarm &nbsp; &nbsp; &nbsp; &nbsp; power1=5Finput =
&nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;temp1=5Fcrit=5Falarm<br>&gt; +device/ &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in1=5Fmin=5Falarm
&nbsp; &nbsp; &nbsp; &nbsp; in2=5Fmin &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; power1=5Finput=5Fhighest &nbsp;temp1=5Fhighest<br>&gt; +root@=
barreleye:~# ls /sys/class/hwmon/hwmon4/<br>&gt; +curr1=5Fhighest &nbsp; &n=
bsp; &nbsp; &nbsp; in1=5Fhighest &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; in1=5Freset=5Fhistory &nbsp; &nbsp; in2=5Fmin=5Falarm =
&nbsp;
&nbsp; &nbsp; &nbsp; power1=5Flabel &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;temp1=
=5Finput<br>&gt; +curr1=5Finput &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in1=5Fin=
put &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; in2=5Fhighest &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
in2=5Freset=5Fhistory &nbsp; &nbsp; power1=5Fmax &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;temp1=5Fmax<br>&gt; +curr1=5Flabel &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; in1=5Flabel &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; in2=5Finput &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;p=
ower1=5Freset=5Fhistory
&nbsp;temp1=5Fmax=5Falarm<br>&gt; +curr1=5Fmax &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; in1=5Fmax &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in2=5Flabel &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; power/ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;subsystem/ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;temp1=5Freset=5Fh=
istory<br>&gt; +curr1=5Fmax=5Falarm &nbsp; &nbsp; &nbsp; in1=5Fmax=5Falarm =
&nbsp; &nbsp;
&nbsp; &nbsp; in2=5Fmax &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
power1=5Falarm &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;temp1=5Fcrit &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;uevent<br>&gt; +curr1=5Freset=5Fhistory &nbsp; i=
n1=5Fmin &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; in2=5Fmax=5Falarm &nbsp; &nbsp; &nbsp; &nbsp; power1=5Finput =
&nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;temp1=5Fcrit=5Falarm<br>&gt; +device/ &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in1=5Fmin=5Falarm
&nbsp; &nbsp; &nbsp; &nbsp; in2=5Fmin &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; power1=5Finput=5Fhighest &nbsp;temp1=5Fhighest<br>&gt; +root@=
barreleye:~# ls /sys/class/hwmon/hwmon5/<br>&gt; +curr1=5Fhighest &nbsp; &n=
bsp; &nbsp; &nbsp; in1=5Fhighest &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; in1=5Freset=5Fhistory &nbsp; &nbsp; in2=5Fmin=5Falarm =
&nbsp;
&nbsp; &nbsp; &nbsp; power1=5Flabel &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;temp1=
=5Finput<br>&gt; +curr1=5Finput &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in1=5Fin=
put &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; in2=5Fhighest &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
in2=5Freset=5Fhistory &nbsp; &nbsp; power1=5Fmax &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;temp1=5Fmax<br>&gt; +curr1=5Flabel &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; in1=5Flabel &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; in2=5Finput &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;p=
ower1=5Freset=5Fhistory
&nbsp;temp1=5Fmax=5Falarm<br>&gt; +curr1=5Fmax &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; in1=5Fmax &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in2=5Flabel &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; power/ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;subsystem/ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;temp1=5Freset=5Fh=
istory<br>&gt; +curr1=5Fmax=5Falarm &nbsp; &nbsp; &nbsp; in1=5Fmax=5Falarm =
&nbsp; &nbsp;
&nbsp; &nbsp; in2=5Fmax &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
power1=5Falarm &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;temp1=5Fcrit &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;uevent<br>&gt; +curr1=5Freset=5Fhistory &nbsp; i=
n1=5Fmin &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; in2=5Fmax=5Falarm &nbsp; &nbsp; &nbsp; &nbsp; power1=5Finput =
&nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;temp1=5Fcrit=5Falarm<br>&gt; +device/ &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in1=5Fmin=5Falarm
&nbsp; &nbsp; &nbsp; &nbsp; in2=5Fmin &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; power1=5Finput=5Fhighest &nbsp;temp1=5Fhighest<br>&gt; +<br>&=
gt; +4) For details of what each hwmon sysfs attributes mean, please refer
to:<br>&gt; +https://www.kernel.org/doc/Documentation/hwmon/pmbus<br>&gt; +=
For short, 'curr1=5F*' refers to 'IOUT', 'in1=5F*' refers to 'vin', 'in2=5F=
*'
refers to 'vout', 'power1=5F*' refers to 'input power',<br>&gt; +'temp1=5F*=
' for 'temperature'.<br>&gt; +<br>&gt; +5) Remaining issue:<br>&gt; +<br>&g=
t; +5.1) Currently, i2c=5Faspeed driver does not handle &quot;i2c=5Fsmbus=
=5Fread=5Fblock=5Fdata()&quot;
correctly. So this patch has to bypass some detection code.<br>&gt; +We nee=
d to fix this issue when the patch is merged to kernel.<br>&gt; +5.2) Accor=
ding to adm1278 datasheet, there is a sense resistor used
to measure power and current. The resistor will affect conversion between<b=
r>&gt; +adm1278 register value to real-world value for current and power.
I am not very sure about the resistor value. So using 1 mili-ohms (or 1000
micro-ohms) as default value. When build the adm1275 driver as kernel modul=
e,
we can set this resistor value by:<br>&gt; +<br>&gt; +# insmod adm1275.ko r=
=5Fsense=3D500<br>&gt; +<br>&gt; +This will set the 'sense resistor' to 500=
 micro-ohms.<br>&gt; +5.3) Some of the sensor value, e.g, 'temp1=5Finput' s=
eems not reasonable,
e.g:<br>&gt; +<br>&gt; +root@barreleye:~# cat /sys/class/hwmon/hwmon4/temp1=
=5Finput<br>&gt; +-270952<br>&gt; +<br>&gt; +Need further check on that.<br=
>&gt; diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta=
-barreleye/recipes-kernel/linux/linux-obmc=5F%.bbappend
b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc=5F%.bbappend<br>&gt; new file mode 100644<br>&gt;=
 index 0000000..b6e8e16<br>&gt; --- /dev/null<br>&gt; +++ b/meta-openbmc-ma=
chines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/li=
nux-obmc=5F%.bbappend<br>&gt; @@ -0,0 +1,3 @@<br>&gt; +FILESEXTRAPATHS=5Fpr=
epend :=3D &quot;${THISDIR}/linux-obmc:&quot;<br>&gt; +SRC=5FURI +=3D &quot=
;</font></tt><a href=3Dfile://barreleye.cfgfg/><tt><font size=3D2>file://ba=
rreleye.cfg</font></tt></a><tt><font size=3D2>&quot;<br>&gt; +SRC=5FURI +=
=3D &quot;</font></tt><a href=3Dfile://hwmon=5Fadm1278.patchch/><tt><font s=
ize=3D2>file://hwmon=5Fadm1278.patch</font></tt></a><tt><font size=3D2>&quo=
t;<br>&gt; --<br>&gt; 2.7.1<br>&gt;<br>&gt;<br>&gt; =5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt; openbmc mailing list<=
br>&gt; openbmc@lists.ozlabs.org<br>&gt; </font></tt><a href=3Dhttps://list=
s.ozlabs.org/listinfo/openbmc><tt><font size=3D2>https://lists.ozlabs.org/l=
istinfo/openbmc</font></tt></a><tt><font size=3D2><br>=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br>op=
enbmc@lists.ozlabs.org<br></font></tt><a href=3Dhttps://lists.ozlabs.org/li=
stinfo/openbmc><tt><font size=3D2>https://lists.ozlabs.org/listinfo/openbmc=
</font></tt></a><tt><font size=3D2><br></font></tt><br><br><BR>
--=_alternative 0074BF2386257F69_=--
