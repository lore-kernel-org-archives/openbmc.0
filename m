Return-Path: <anoo@us.ibm.com>
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 133721A045E
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2016 09:54:52 +1100 (AEDT)
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Tue, 1 Mar 2016 15:54:50 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 1 Mar 2016 15:54:47 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 99C621FF0021
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2016 15:42:56 -0700 (MST)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u21MslpP40829128
 for <openbmc@lists.ozlabs.org>; Tue, 1 Mar 2016 15:54:47 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u21MskDR011881
 for <openbmc@lists.ozlabs.org>; Tue, 1 Mar 2016 15:54:46 -0700
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u21MskBS011851
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Tue, 1 Mar 2016 15:54:46 -0700
Message-Id: <201603012254.u21MskBS011851@d03av04.boulder.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Tue, 1 Mar 2016 15:54:46 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 1 Mar 2016 15:54:45 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Tue, 1 Mar 2016 22:54:44 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 1 Mar 2016 22:54:42 -0000
Received: from us1a3-mail52.a3.dal06.isc4sb.com ([10.106.154.203])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016030122544122-503440 ;
 Tue, 1 Mar 2016 22:54:41 +0000 
In-Reply-To: <20160301224703.GE6601@asimov.pw-on-the.net>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 OpenBMC Patches <openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH openbmc] Add temporary adm1278 hwmon pmbus driver patch
From: "Adriana Kobylak" <anoo@us.ibm.com>
Date: Tue, 1 Mar 2016 16:54:41 -0600
References: <1455705024-15045-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455705024-15045-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8XcOB-RzarE67ddZZHj2CuiRAupL07Fe1dPUHHC=W4CweQ@mail.gmail.com>
 <201603012115.u21LFFHj020687@d01av03.pok.ibm.com>
 <20160301224703.GE6601@asimov.pw-on-the.net>
MIME-Version: 1.0
X-KeepSent: A95A70CE:B722A2EC-86257F69:007D9FFC;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 39003
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 007DDAA486257F69_="
x-cbid: 16030122-0017-0000-0000-000012A559E4
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.11977; FL=0; FP=0; FZ=0; HX=0;
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004984; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000149; SDB=6.00667280; UDB=6.00304391; UTC=2016-03-01
 22:54:43
x-cbparentid: 16030122-5090-0000-0000-0000075FC7ED
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
X-List-Received-Date: Tue, 01 Mar 2016 22:54:54 -0000


--=_alternative 007DDAA486257F69_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

Patrick Williams <patrick@stwcx.xyz> wrote on 03/01/2016 04:47:03 PM:

> From: Patrick Williams <patrick@stwcx.xyz>
> To: Adriana Kobylak/Austin/IBM@IBMUS
> Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Patches <openbmc-
> patches@stwcx.xyz>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Date: 03/01/2016 04:47 PM
> Subject: Re: [PATCH openbmc] Add temporary adm1278 hwmon pmbus driver=20
patch
>=20
> On Tue, Mar 01, 2016 at 03:15:12PM -0600, Adriana Kobylak wrote:
> > What makes this pull request different from other openbmc changes to=20
> > require to be sent via git-send-email before it can be reviewed?
>=20
> I suspect Joel is just asking for it to also be submitted to the Linux
> tree so that its content can be reviewed there.  I agree we should not
> merge patches into the openbmc tree unless it fixes a critical problem
> and has also been submitted to the upstream tree.
>=20
Yi, please submit the patch to the kernel repository as well.

There's a requirement to deliver this driver on Friday, could we get this=20
reviewed/merged this week in openbmc? I believe we did this before for OCC =

then removed the temporary patch once it was upstreamed.
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> > From:   Joel Stanley <joel@jms.id.au>
> > To:     OpenBMC Patches <openbmc-patches@stwcx.xyz>
> > Cc:     OpenBMC Maillist <openbmc@lists.ozlabs.org>
> > Date:   02/17/2016 10:24 PM
> > Subject:        Re: [PATCH openbmc] Add temporary adm1278 hwmon pmbus=20
> > driver patch
> > Sent by:        "openbmc"=20
> > <openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org>
> >=20
> >=20
> >=20
> > On Wed, Feb 17, 2016 at 9:00 PM, OpenBMC Patches
> > <openbmc-patches@stwcx.xyz> wrote:
> > > From: Yi Li <adamliyi@msn.com>
> > >
> > > This patch temporarily adds adm1278 hwmon driver as a kernel patch=20
to=20
> > openbmc,
> > > for testing on Barreleye.
> >=20
> > Can you please send this as a patch with git-send-email so we can=20
review=20
> > it.
> >=20
> > > If in the future this patch will still be useful, it should be put=20
into=20
> > linux kernel.
> > >
> > > Barreleye has three adm1278 devices on three i2c buses.
> > > This patch enables reading adm1278 sensors via hwmon sysfs=20
interface.
> > > The enabled sensors are: current, voltage (In and Out), power and=20
> > temperature.
> > > Detail usage can be found in 'readme=5Fadm1278.txt'.
> > >
> > > Signed-off-by: Yi Li <adamliyi@msn.com>
> > > ---
> > >  .../recipes-kernel/linux/linux-obmc/barreleye.cfg  |   3 +
> > >  .../linux/linux-obmc/hwmon=5Fadm1278.patch           | 165=20
> > +++++++++++++++++++++
> > >  .../linux/linux-obmc/readme=5Fadm1278.txt            |  78 ++++++++++
> > >  .../recipes-kernel/linux/linux-obmc=5F%.bbappend     |   3 +
> > >  4 files changed, 249 insertions(+)
> > >  create mode 100644=20
> > meta-openbmc-machines/meta-openpower/meta-rackspace/meta-
> barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
> > >  create mode 100644=20
> > meta-openbmc-machines/meta-openpower/meta-rackspace/meta-
> barreleye/recipes-kernel/linux/linux-obmc/hwmon=5Fadm1278.patch
> > >  create mode 100644=20
> > meta-openbmc-machines/meta-openpower/meta-rackspace/meta-
> barreleye/recipes-kernel/linux/linux-obmc/readme=5Fadm1278.txt
> > >  create mode 100644=20
> > meta-openbmc-machines/meta-openpower/meta-rackspace/meta-
> barreleye/recipes-kernel/linux/linux-obmc=5F%.bbappend
> > >
> > > diff --git=20
> > a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-
> barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg=20
> > b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-
> barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
> > > new file mode 100644
> > > index 0000000..086f191
> > > --- /dev/null
> > > +++=20
> > b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-
> barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
> > > @@ -0,0 +1,3 @@
> > > +CONFIG=5FPMBUS=3Dy
> > > +CONFIG=5FSENSORS=5FPMBUS=3Dy
> > > +CONFIG=5FSENSORS=5FADM1275=3Dy
> > > diff --git=20
> > a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-
> barreleye/recipes-kernel/linux/linux-obmc/hwmon=5Fadm1278.patch=20
> > b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-
> barreleye/recipes-kernel/linux/linux-obmc/hwmon=5Fadm1278.patch
> > > new file mode 100644
> > > index 0000000..074d39f
> > > --- /dev/null
> > > +++=20
> > b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-
> barreleye/recipes-kernel/linux/linux-obmc/hwmon=5Fadm1278.patch
> > > @@ -0,0 +1,165 @@
> > > +diff --git a/drivers/hwmon/pmbus/adm1275.c=20
> > b/drivers/hwmon/pmbus/adm1275.c
> > > +index 188af4c..a45075d 100644
> > > +--- a/drivers/hwmon/pmbus/adm1275.c
> > > ++++ b/drivers/hwmon/pmbus/adm1275.c
> > > +@@ -24,7 +24,7 @@
> > > + #include <linux/bitops.h>
> > > + #include "pmbus.h"
> > > +
> > > +-enum chips { adm1075, adm1275, adm1276, adm1293, adm1294 };
> > > ++enum chips { adm1075, adm1275, adm1276, adm1278, adm1293, adm1294=20
};
> > > +
> > > + #define ADM1275=5FMFR=5FSTATUS=5FIOUT=5FWARN2 BIT(0)
> > > + #define ADM1293=5FMFR=5FSTATUS=5FVAUX=5FUV=5FWARN       BIT(5)
> > > +@@ -70,6 +70,22 @@ enum chips { adm1075, adm1275, adm1276, adm1293, =


> > adm1294 };
> > > + #define ADM1075=5FVAUX=5FOV=5FWARN          BIT(7)
> > > + #define ADM1075=5FVAUX=5FUV=5FWARN          BIT(6)
> > > +
> > > ++#define ADM1278=5FPMON=5FCONTROL          0xd3
> > > ++#define ADM1278=5FPMON=5FCONFIG           0xd4
> > > ++#define ADM1278=5FCFG=5FTSFLT             BIT(15)
> > > ++#define ADM1278=5FCFG=5FSIMULTANEOUS      BIT(14)
> > > ++#define ADM1278=5FCFG=5FPMON=5FMODE         BIT(4)
> > > ++#define ADM1278=5FCFG=5FTEMP1=5FEN          BIT(3)
> > > ++#define ADM1278=5FCFG=5FVIN=5FEN            BIT(2)
> > > ++#define ADM1278=5FCFG=5FVOUT=5FEN           BIT(1)
> > > ++#define ADM1278=5FPEAK=5FTEMPERATURE      0xd7
> > > ++
> > > ++#define ADM1278=5FR=5FSENSE       1000    /* R=5Fsense resistor val=
ue in=20

> > microohmsi */
> > > ++
> > > ++static int r=5Fsense =3D ADM1278=5FR=5FSENSE;
> > > ++module=5Fparam(r=5Fsense, int, 0644);
> > > ++MODULE=5FPARM=5FDESC(r=5Fsense, "Rsense resistor value in microohms=
");
> > > ++
> > > + struct adm1275=5Fdata {
> > > +       int id;
> > > +       bool have=5Foc=5Ffault;
> > > +@@ -186,6 +202,11 @@ static int adm1275=5Fread=5Fword=5Fdata(struct =

> > i2c=5Fclient *client, int page, int reg)
> > > +       case PMBUS=5FVIRT=5FREAD=5FVIN=5FMAX:
> > > +               ret =3D pmbus=5Fread=5Fword=5Fdata(client, 0,=20
ADM1275=5FPEAK=5FVIN);
> > > +               break;
> > > ++      case PMBUS=5FVIRT=5FREAD=5FTEMP=5FMAX:
> > > ++              if (data->id !=3D adm1278)
> > > ++                      return -ENODATA;
> > > ++              ret =3D pmbus=5Fread=5Fword=5Fdata(client, 0,=20
> > ADM1278=5FPEAK=5FTEMPERATURE);
> > > ++              break;
> > > +       case PMBUS=5FVIRT=5FREAD=5FPIN=5FMIN:
> > > +               if (!data->have=5Fpin=5Fmin)
> > > +                       return -ENXIO;
> > > +@@ -199,6 +220,7 @@ static int adm1275=5Fread=5Fword=5Fdata(struct=20
i2c=5Fclient=20
> > *client, int page, int reg)
> > > +       case PMBUS=5FVIRT=5FRESET=5FIOUT=5FHISTORY:
> > > +       case PMBUS=5FVIRT=5FRESET=5FVOUT=5FHISTORY:
> > > +       case PMBUS=5FVIRT=5FRESET=5FVIN=5FHISTORY:
> > > ++      case PMBUS=5FVIRT=5FRESET=5FTEMP=5FHISTORY:
> > > +               break;
> > > +       case PMBUS=5FVIRT=5FRESET=5FPIN=5FHISTORY:
> > > +               if (!data->have=5Fpin=5Fmax)
> > > +@@ -239,6 +261,9 @@ static int adm1275=5Fwrite=5Fword=5Fdata(struct =

> > i2c=5Fclient *client, int page, int reg,
> > > +       case PMBUS=5FVIRT=5FRESET=5FVIN=5FHISTORY:
> > > +               ret =3D pmbus=5Fwrite=5Fword=5Fdata(client, 0,=20
ADM1275=5FPEAK=5FVIN,=20
> > 0);
> > > +               break;
> > > ++      case PMBUS=5FVIRT=5FRESET=5FTEMP=5FHISTORY:
> > > ++              ret =3D pmbus=5Fwrite=5Fword=5Fdata(client, 0,=20
> > ADM1278=5FPEAK=5FTEMPERATURE, 0);
> > > ++              break;
> > > +       case PMBUS=5FVIRT=5FRESET=5FPIN=5FHISTORY:
> > > +               ret =3D pmbus=5Fwrite=5Fword=5Fdata(client, 0,=20
ADM1276=5FPEAK=5FPIN,=20
> > 0);
> > > +               if (!ret && data->have=5Fpin=5Fmin)
> > > +@@ -312,6 +337,7 @@ static const struct i2c=5Fdevice=5Fid adm1275=5F=
id[]=20
=3D {
> > > +       { "adm1075", adm1075 },
> > > +       { "adm1275", adm1275 },
> > > +       { "adm1276", adm1276 },
> > > ++      { "adm1278", adm1278 },
> > > +       { "adm1293", adm1293 },
> > > +       { "adm1294", adm1294 },
> > > +       { }
> > > +@@ -335,6 +361,8 @@ static int adm1275=5Fprobe(struct i2c=5Fclient=20
*client,
> > > +                                    | I2C=5FFUNC=5FSMBUS=5FBLOCK=5FD=
ATA))
> > > +               return -ENODEV;
> > > +
> > > ++      /* i2c=5Faspeed driver does not handle=20
i2c=5Fsmbus=5Fread=5Fblock=5Fdata=20
> > correctly */
> > > ++#if 0
> > > +       ret =3D i2c=5Fsmbus=5Fread=5Fblock=5Fdata(client, PMBUS=5FMFR=
=5FID,=20
> > block=5Fbuffer);
> > > +       if (ret < 0) {
> > > +               dev=5Ferr(&client->dev, "Failed to read Manufacturer =

> > ID\n");
> > > +@@ -363,6 +391,7 @@ static int adm1275=5Fprobe(struct i2c=5Fclient=20
*client,
> > > +               dev=5Fnotice(&client->dev,
> > > +                          "Device mismatch: Configured %s, detected =


> > %s\n",
> > > +                          id->name, mid->name);
> > > ++#endif
> > > +
> > > +       config =3D i2c=5Fsmbus=5Fread=5Fbyte=5Fdata(client,=20
ADM1275=5FPMON=5FCONFIG);
> > > +       if (config < 0)
> > > +@@ -377,7 +406,9 @@ static int adm1275=5Fprobe(struct i2c=5Fclient=20
*client,
> > > +       if (!data)
> > > +               return -ENOMEM;
> > > +
> > > +-      data->id =3D mid->driver=5Fdata;
> > > ++      /* i2c=5Faspeed driver does not handle=20
i2c=5Fsmbus=5Fread=5Fblock=5Fdata=20
> > correctly */
> > > ++      //data->id =3D mid->driver=5Fdata;
> > > ++      data->id =3D adm1278;
> > > +
> > > +       info =3D &data->info;
> > > +
> > > +@@ -460,6 +491,62 @@ static int adm1275=5Fprobe(struct i2c=5Fclient =

> > *client,
> > > +                       info->func[0] |=3D
> > > +                         PMBUS=5FHAVE=5FVOUT | PMBUS=5FHAVE=5FSTATUS=
=5FVOUT;
> > > +               break;
> > > ++      case adm1278:
> > > ++              /* Configure monitoring */
> > > ++              ret =3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client,
> > > ++                      ADM1278=5FPMON=5FCONTROL, 0);
> > > ++              if (ret < 0)
> > > ++                      return ret;
> > > ++              ret =3D i2c=5Fsmbus=5Fread=5Fword=5Fdata(client,=20
> > ADM1275=5FPMON=5FCONFIG);
> > > ++              ret =3D i2c=5Fsmbus=5Fwrite=5Fword=5Fdata(client,=20
> > ADM1275=5FPMON=5FCONFIG,
> > > ++ ADM1278=5FCFG=5FPMON=5FMODE |
> > > ++                                              ADM1278=5FCFG=5FTEMP1=
=5FEN=20
|
> > > ++                                              ADM1278=5FCFG=5FVIN=
=5FEN |
> > > ++ ADM1278=5FCFG=5FVOUT=5FEN);
> > > ++              if (ret < 0)
> > > ++                      return ret;
> > > ++              ret =3D i2c=5Fsmbus=5Fread=5Fword=5Fdata(client,=20
> > ADM1275=5FPMON=5FCONFIG);
> > > ++              dev=5Finfo(&client->dev, "adm1278 config: 0x%x\n",=20
ret);
> > > ++              ret =3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client,=20
> > ADM1278=5FPMON=5FCONTROL,1);
> > > ++              if (ret < 0)
> > > ++                      return ret;
> > > ++
> > > ++              info->func[0] |=3D PMBUS=5FHAVE=5FVIN
> > > ++                      | PMBUS=5FHAVE=5FVOUT | PMBUS=5FHAVE=5FSTATUS=
=5FVOUT
> > > ++                      | PMBUS=5FHAVE=5FPIN
> > > ++                      | PMBUS=5FHAVE=5FSTATUS=5FINPUT
> > > ++                      | PMBUS=5FHAVE=5FTEMP | PMBUS=5FHAVE=5FSTATUS=
=5FTEMP;
> > > ++
> > > ++              data->have=5Foc=5Ffault =3D false;
> > > ++              data->have=5Fuc=5Ffault =3D false;
> > > ++              data->have=5Fvout =3D true;
> > > ++              data->have=5Fvaux=5Fstatus =3D false;
> > > ++              data->have=5Fmfr=5Fvaux=5Fstatus =3D false;
> > > ++              data->have=5Fiout=5Fmin =3D false;
> > > ++              data->have=5Fpin=5Fmin =3D false;
> > > ++              data->have=5Fpin=5Fmax =3D true;
> > > ++
> > > ++              info->m[PSC=5FVOLTAGE=5FIN] =3D 19599;
> > > ++              info->b[PSC=5FVOLTAGE=5FIN] =3D 0;
> > > ++              info->R[PSC=5FVOLTAGE=5FIN] =3D -2;
> > > ++
> > > ++              info->m[PSC=5FVOLTAGE=5FOUT] =3D 19599;
> > > ++              info->b[PSC=5FVOLTAGE=5FOUT] =3D 0;
> > > ++              info->R[PSC=5FVOLTAGE=5FOUT] =3D -2;
> > > ++
> > > ++              info->m[PSC=5FCURRENT=5FOUT] =3D 800 * r=5Fsense / 10=
00;
> > > ++              info->b[PSC=5FCURRENT=5FOUT] =3D 20475;
> > > ++              info->R[PSC=5FCURRENT=5FOUT] =3D -1;
> > > ++
> > > ++              info->m[PSC=5FPOWER] =3D 6123 * r=5Fsense / 1000;
> > > ++              info->b[PSC=5FPOWER] =3D 0;
> > > ++              info->R[PSC=5FPOWER] =3D -2;
> > > ++
> > > ++              info->format[PSC=5FTEMPERATURE] =3D direct;
> > > ++              info->m[PSC=5FTEMPERATURE] =3D 42;
> > > ++              info->b[PSC=5FTEMPERATURE] =3D 31880;
> > > ++              info->R[PSC=5FTEMPERATURE] =3D -1;
> > > ++              break;
> > > +       case adm1293:
> > > +       case adm1294:
> > > +               data->have=5Fiout=5Fmin =3D true;
> > > diff --git=20
> > a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-
> barreleye/recipes-kernel/linux/linux-obmc/readme=5Fadm1278.txt=20
> > b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-
> barreleye/recipes-kernel/linux/linux-obmc/readme=5Fadm1278.txt
> > > new file mode 100644
> > > index 0000000..e86d977
> > > --- /dev/null
> > > +++=20
> > b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-
> barreleye/recipes-kernel/linux/linux-obmc/readme=5Fadm1278.txt
> > > @@ -0,0 +1,78 @@
> > > +README for adm1278 hwmon driver
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +Yi Li <shliyi@cn.ibm.com>
> > > +
> > > +
> > > +This is a temporary kernel patch to enable hwmon driver for adm1278 =


> > chip on Barreleye.
> > > +When this patch is merged into linux kernel, this patch will be=20
removed=20
> > from openbmc.
> > > +
> > > +The adm1278 driver is created according to datasheet:
> > >=20
> > +http://www.analog.com/media/en/technical-documentation/data-
> sheets/ADM1278.pdf
> > > +
> > > +The patch heavily re-used adm1278 enabling code from:=20
> > https://github.com/facebook/openbmc/blob/master/meta-aspeed/
> recipes-kernel/linux/files/patch-2.6.28.9/0000-linux-openbmc.patch
> > .
> > > +
> > > +This patch has been tested on barreleye, by following these steps:
> > > +
> > > +1) There are 3 adm1278 devices on Barreleye
> > > +
> > > +I2C5: P12v=5Fa for CPU0
> > > +I2C6: P12v=5Fb for CPU1
> > > +I2C7: P12v=5Fc for HDD and IO Board
> > > +
> > > +2) adm1278 driver is based on adm1275.c, which depends on pmbus.=20
This=20
> > patch builds
> > > +adm1275 and pmbus into kernel.
> > > +
> > > +3) When kernel booted, initialize the adm1278 devices:
> > > +
> > > +root@barreleye:~# echo adm1278 0x10 >=20
> > /sys/class/i2c-adapter/i2c-4/new=5Fdevice
> > > +root@barreleye:~# echo adm1278 0x10 >=20
> > /sys/class/i2c-adapter/i2c-5/new=5Fdevice
> > > +root@barreleye:~# echo adm1278 0x10 >=20
> > /sys/class/i2c-adapter/i2c-6/new=5Fdevice
> > > +
> > > +There will be three new hwmon sysfs entries created:
> > > +
> > > +root@barreleye:~# ls /sys/class/hwmon/hwmon3/
> > > +curr1=5Fhighest         in1=5Fhighest           in1=5Freset=5Fhistor=
y=20
> > in2=5Fmin=5Falarm         power1=5Flabel          temp1=5Finput
> > > +curr1=5Finput           in1=5Finput             in2=5Fhighest=20
> > in2=5Freset=5Fhistory     power1=5Fmax            temp1=5Fmax
> > > +curr1=5Flabel           in1=5Flabel             in2=5Finput name=20
> >                power1=5Freset=5Fhistory  temp1=5Fmax=5Falarm
> > > +curr1=5Fmax             in1=5Fmax               in2=5Flabel power/=20
> > subsystem/            temp1=5Freset=5Fhistory
> > > +curr1=5Fmax=5Falarm       in1=5Fmax=5Falarm         in2=5Fmax power1=
=5Falarm=20
> > temp1=5Fcrit            uevent
> > > +curr1=5Freset=5Fhistory   in1=5Fmin               in2=5Fmax=5Falarm =

power1=5Finput=20
> >        temp1=5Fcrit=5Falarm
> > > +device/               in1=5Fmin=5Falarm         in2=5Fmin=20
> > power1=5Finput=5Fhighest  temp1=5Fhighest
> > > +root@barreleye:~# ls /sys/class/hwmon/hwmon4/
> > > +curr1=5Fhighest         in1=5Fhighest           in1=5Freset=5Fhistor=
y=20
> > in2=5Fmin=5Falarm         power1=5Flabel          temp1=5Finput
> > > +curr1=5Finput           in1=5Finput             in2=5Fhighest=20
> > in2=5Freset=5Fhistory     power1=5Fmax            temp1=5Fmax
> > > +curr1=5Flabel           in1=5Flabel             in2=5Finput name=20
> >                power1=5Freset=5Fhistory  temp1=5Fmax=5Falarm
> > > +curr1=5Fmax             in1=5Fmax               in2=5Flabel power/=20
> > subsystem/            temp1=5Freset=5Fhistory
> > > +curr1=5Fmax=5Falarm       in1=5Fmax=5Falarm         in2=5Fmax power1=
=5Falarm=20
> > temp1=5Fcrit            uevent
> > > +curr1=5Freset=5Fhistory   in1=5Fmin               in2=5Fmax=5Falarm =

power1=5Finput=20
> >        temp1=5Fcrit=5Falarm
> > > +device/               in1=5Fmin=5Falarm         in2=5Fmin=20
> > power1=5Finput=5Fhighest  temp1=5Fhighest
> > > +root@barreleye:~# ls /sys/class/hwmon/hwmon5/
> > > +curr1=5Fhighest         in1=5Fhighest           in1=5Freset=5Fhistor=
y=20
> > in2=5Fmin=5Falarm         power1=5Flabel          temp1=5Finput
> > > +curr1=5Finput           in1=5Finput             in2=5Fhighest=20
> > in2=5Freset=5Fhistory     power1=5Fmax            temp1=5Fmax
> > > +curr1=5Flabel           in1=5Flabel             in2=5Finput name=20
> >                power1=5Freset=5Fhistory  temp1=5Fmax=5Falarm
> > > +curr1=5Fmax             in1=5Fmax               in2=5Flabel power/=20
> > subsystem/            temp1=5Freset=5Fhistory
> > > +curr1=5Fmax=5Falarm       in1=5Fmax=5Falarm         in2=5Fmax power1=
=5Falarm=20
> > temp1=5Fcrit            uevent
> > > +curr1=5Freset=5Fhistory   in1=5Fmin               in2=5Fmax=5Falarm =

power1=5Finput=20
> >        temp1=5Fcrit=5Falarm
> > > +device/               in1=5Fmin=5Falarm         in2=5Fmin=20
> > power1=5Finput=5Fhighest  temp1=5Fhighest
> > > +
> > > +4) For details of what each hwmon sysfs attributes mean, please=20
refer=20
> > to:
> > > +https://www.kernel.org/doc/Documentation/hwmon/pmbus
> > > +For short, 'curr1=5F*' refers to 'IOUT', 'in1=5F*' refers to 'vin', =

'in2=5F*'=20
> > refers to 'vout', 'power1=5F*' refers to 'input power',
> > > +'temp1=5F*' for 'temperature'.
> > > +
> > > +5) Remaining issue:
> > > +
> > > +5.1) Currently, i2c=5Faspeed driver does not handle=20
> > "i2c=5Fsmbus=5Fread=5Fblock=5Fdata()" correctly. So this patch has to b=
ypass=20
some=20
> > detection code.
> > > +We need to fix this issue when the patch is merged to kernel.
> > > +5.2) According to adm1278 datasheet, there is a sense resistor used =

to=20
> > measure power and current. The resistor will affect conversion between
> > > +adm1278 register value to real-world value for current and power. I =

am=20
> > not very sure about the resistor value. So using 1 mili-ohms (or 1000=20
> > micro-ohms) as default value. When build the adm1275 driver as kernel=20
> > module, we can set this resistor value by:
> > > +
> > > +# insmod adm1275.ko r=5Fsense=3D500
> > > +
> > > +This will set the 'sense resistor' to 500 micro-ohms.
> > > +5.3) Some of the sensor value, e.g, 'temp1=5Finput' seems not=20
reasonable,=20
> > e.g:
> > > +
> > > +root@barreleye:~# cat /sys/class/hwmon/hwmon4/temp1=5Finput
> > > +-270952
> > > +
> > > +Need further check on that.
> > > diff --git=20
> > a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-
> barreleye/recipes-kernel/linux/linux-obmc=5F%.bbappend=20
> > b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-
> barreleye/recipes-kernel/linux/linux-obmc=5F%.bbappend
> > > new file mode 100644
> > > index 0000000..b6e8e16
> > > --- /dev/null
> > > +++=20
> > b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-
> barreleye/recipes-kernel/linux/linux-obmc=5F%.bbappend
> > > @@ -0,0 +1,3 @@
> > > +FILESEXTRAPATHS=5Fprepend :=3D "${THISDIR}/linux-obmc:"
> > > +SRC=5FURI +=3D "file://barreleye.cfg"
> > > +SRC=5FURI +=3D "file://hwmon=5Fadm1278.patch"
> > > --
> > > 2.7.1
> > >
> > >
> > > =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> > > openbmc mailing list
> > > openbmc@lists.ozlabs.org
> > > https://lists.ozlabs.org/listinfo/openbmc
> > =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
> >=20
> >=20
> >=20
> >=20
>=20
> > =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
>=20
>=20
> --=20
> Patrick Williams
> [attachment "signature.asc" deleted by Adriana Kobylak/Austin/IBM]=20


--=_alternative 007DDAA486257F69_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"


<br><tt><font size=3D2>Patrick Williams &lt;patrick@stwcx.xyz&gt; wrote on
03/01/2016 04:47:03 PM:<br><br>&gt; From: Patrick Williams &lt;patrick@stwc=
x.xyz&gt;</font></tt><br><tt><font size=3D2>&gt; To: Adriana Kobylak/Austin=
/IBM@IBMUS</font></tt><br><tt><font size=3D2>&gt; Cc: Joel Stanley &lt;joel=
@jms.id.au&gt;, OpenBMC
Patches &lt;openbmc-<br>&gt; patches@stwcx.xyz&gt;, OpenBMC Maillist &lt;op=
enbmc@lists.ozlabs.org&gt;</font></tt><br><tt><font size=3D2>&gt; Date: 03/=
01/2016 04:47 PM</font></tt><br><tt><font size=3D2>&gt; Subject: Re: [PATCH=
 openbmc] Add temporary adm1278
hwmon pmbus driver patch</font></tt><br><tt><font size=3D2>&gt; <br>&gt; On=
 Tue, Mar 01, 2016 at 03:15:12PM -0600, Adriana Kobylak wrote:<br>&gt; &gt;=
 What makes this pull request different from other openbmc changes
to <br>&gt; &gt; require to be sent via git-send-email before it can be rev=
iewed?<br>&gt; <br>&gt; I suspect Joel is just asking for it to also be sub=
mitted to the Linux<br>&gt; tree so that its content can be reviewed there.=
 &nbsp;I agree we should
not<br>&gt; merge patches into the openbmc tree unless it fixes a critical =
problem<br>&gt; and has also been submitted to the upstream tree.<br>&gt; <=
/font></tt><br><tt><font size=3D2>Yi, please submit the patch to the kernel=
 repository
as well.<br></font></tt><br><tt><font size=3D2>There's a requirement to del=
iver this driver on Friday,
could we get this reviewed/merged this week in openbmc? I believe we did
this before for OCC then removed the temporary patch once it was upstreamed=
.<br>&gt; &gt; <br>&gt; &gt; <br>&gt; &gt; <br>&gt; &gt; <br>&gt; &gt; <br>=
&gt; &gt; <br>&gt; &gt; From: &nbsp; Joel Stanley &lt;joel@jms.id.au&gt;<br=
>&gt; &gt; To: &nbsp; &nbsp; OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&=
gt;<br>&gt; &gt; Cc: &nbsp; &nbsp; OpenBMC Maillist &lt;openbmc@lists.ozlab=
s.org&gt;<br>&gt; &gt; Date: &nbsp; 02/17/2016 10:24 PM<br>&gt; &gt; Subjec=
t: &nbsp; &nbsp; &nbsp; &nbsp;Re: [PATCH openbmc] Add temporary
adm1278 hwmon pmbus <br>&gt; &gt; driver patch<br>&gt; &gt; Sent by: &nbsp;=
 &nbsp; &nbsp; &nbsp;&quot;openbmc&quot; <br>&gt; &gt; &lt;openbmc-bounces+=
anoo=3Dus.ibm.com@lists.ozlabs.org&gt;<br>&gt; &gt; <br>&gt; &gt; <br>&gt; =
&gt; <br>&gt; &gt; On Wed, Feb 17, 2016 at 9:00 PM, OpenBMC Patches<br>&gt;=
 &gt; &lt;openbmc-patches@stwcx.xyz&gt; wrote:<br>&gt; &gt; &gt; From: Yi L=
i &lt;adamliyi@msn.com&gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; This patch t=
emporarily adds adm1278 hwmon driver as a kernel
patch to <br>&gt; &gt; openbmc,<br>&gt; &gt; &gt; for testing on Barreleye.=
<br>&gt; &gt; <br>&gt; &gt; Can you please send this as a patch with git-se=
nd-email so we
can review <br>&gt; &gt; it.<br>&gt; &gt; <br>&gt; &gt; &gt; If in the futu=
re this patch will still be useful, it should
be put into <br>&gt; &gt; linux kernel.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;=
 Barreleye has three adm1278 devices on three i2c buses.<br>&gt; &gt; &gt; =
This patch enables reading adm1278 sensors via hwmon sysfs
interface.<br>&gt; &gt; &gt; The enabled sensors are: current, voltage (In =
and Out),
power and <br>&gt; &gt; temperature.<br>&gt; &gt; &gt; Detail usage can be =
found in 'readme=5Fadm1278.txt'.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Signed=
-off-by: Yi Li &lt;adamliyi@msn.com&gt;<br>&gt; &gt; &gt; ---<br>&gt; &gt; =
&gt; &nbsp;.../recipes-kernel/linux/linux-obmc/barreleye.cfg
&nbsp;| &nbsp; 3 +<br>&gt; &gt; &gt; &nbsp;.../linux/linux-obmc/hwmon=5Fadm=
1278.patch &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; | 165 <br>&gt; &gt; +++++++++++++++++++++<br>&gt; &gt;=
 &gt; &nbsp;.../linux/linux-obmc/readme=5Fadm1278.txt &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;78 ++++++++++<br>&gt; &gt; &gt; &nbsp;..=
./recipes-kernel/linux/linux-obmc=5F%.bbappend &nbsp;
&nbsp; | &nbsp; 3 +<br>&gt; &gt; &gt; &nbsp;4 files changed, 249 insertions=
(+)<br>&gt; &gt; &gt; &nbsp;create mode 100644 <br>&gt; &gt; meta-openbmc-m=
achines/meta-openpower/meta-rackspace/meta-<br>&gt; barreleye/recipes-kerne=
l/linux/linux-obmc/barreleye.cfg<br>&gt; &gt; &gt; &nbsp;create mode 100644=
 <br>&gt; &gt; meta-openbmc-machines/meta-openpower/meta-rackspace/meta-<br=
>&gt; barreleye/recipes-kernel/linux/linux-obmc/hwmon=5Fadm1278.patch<br>&g=
t; &gt; &gt; &nbsp;create mode 100644 <br>&gt; &gt; meta-openbmc-machines/m=
eta-openpower/meta-rackspace/meta-<br>&gt; barreleye/recipes-kernel/linux/l=
inux-obmc/readme=5Fadm1278.txt<br>&gt; &gt; &gt; &nbsp;create mode 100644 <=
br>&gt; &gt; meta-openbmc-machines/meta-openpower/meta-rackspace/meta-<br>&=
gt; barreleye/recipes-kernel/linux/linux-obmc=5F%.bbappend<br>&gt; &gt; &gt=
;<br>&gt; &gt; &gt; diff --git <br>&gt; &gt; a/meta-openbmc-machines/meta-o=
penpower/meta-rackspace/meta-<br>&gt; barreleye/recipes-kernel/linux/linux-=
obmc/barreleye.cfg <br>&gt; &gt; b/meta-openbmc-machines/meta-openpower/met=
a-rackspace/meta-<br>&gt; barreleye/recipes-kernel/linux/linux-obmc/barrele=
ye.cfg<br>&gt; &gt; &gt; new file mode 100644<br>&gt; &gt; &gt; index 00000=
00..086f191<br>&gt; &gt; &gt; --- /dev/null<br>&gt; &gt; &gt; +++ <br>&gt; =
&gt; b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-<br>&gt; ba=
rreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg<br>&gt; &gt; &gt; @@ =
-0,0 +1,3 @@<br>&gt; &gt; &gt; +CONFIG=5FPMBUS=3Dy<br>&gt; &gt; &gt; +CONFI=
G=5FSENSORS=5FPMBUS=3Dy<br>&gt; &gt; &gt; +CONFIG=5FSENSORS=5FADM1275=3Dy<b=
r>&gt; &gt; &gt; diff --git <br>&gt; &gt; a/meta-openbmc-machines/meta-open=
power/meta-rackspace/meta-<br>&gt; barreleye/recipes-kernel/linux/linux-obm=
c/hwmon=5Fadm1278.patch <br>&gt; &gt; b/meta-openbmc-machines/meta-openpowe=
r/meta-rackspace/meta-<br>&gt; barreleye/recipes-kernel/linux/linux-obmc/hw=
mon=5Fadm1278.patch<br>&gt; &gt; &gt; new file mode 100644<br>&gt; &gt; &gt=
; index 0000000..074d39f<br>&gt; &gt; &gt; --- /dev/null<br>&gt; &gt; &gt; =
+++ <br>&gt; &gt; b/meta-openbmc-machines/meta-openpower/meta-rackspace/met=
a-<br>&gt; barreleye/recipes-kernel/linux/linux-obmc/hwmon=5Fadm1278.patch<=
br>&gt; &gt; &gt; @@ -0,0 +1,165 @@<br>&gt; &gt; &gt; +diff --git a/drivers=
/hwmon/pmbus/adm1275.c <br>&gt; &gt; b/drivers/hwmon/pmbus/adm1275.c<br>&gt=
; &gt; &gt; +index 188af4c..a45075d 100644<br>&gt; &gt; &gt; +--- a/drivers=
/hwmon/pmbus/adm1275.c<br>&gt; &gt; &gt; ++++ b/drivers/hwmon/pmbus/adm1275=
.c<br>&gt; &gt; &gt; +@@ -24,7 +24,7 @@<br>&gt; &gt; &gt; + #include &lt;li=
nux/bitops.h&gt;<br>&gt; &gt; &gt; + #include &quot;pmbus.h&quot;<br>&gt; &=
gt; &gt; +<br>&gt; &gt; &gt; +-enum chips { adm1075, adm1275, adm1276, adm1=
293, adm1294
};<br>&gt; &gt; &gt; ++enum chips { adm1075, adm1275, adm1276, adm1278, adm=
1293,
adm1294 };<br>&gt; &gt; &gt; +<br>&gt; &gt; &gt; + #define ADM1275=5FMFR=5F=
STATUS=5FIOUT=5FWARN2 BIT(0)<br>&gt; &gt; &gt; + #define ADM1293=5FMFR=5FST=
ATUS=5FVAUX=5FUV=5FWARN &nbsp; &nbsp;
&nbsp; BIT(5)<br>&gt; &gt; &gt; +@@ -70,6 +70,22 @@ enum chips { adm1075, a=
dm1275, adm1276,
adm1293, <br>&gt; &gt; adm1294 };<br>&gt; &gt; &gt; + #define ADM1075=5FVAU=
X=5FOV=5FWARN &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;BIT(7)<br>&gt; &gt; &gt; + #define ADM1075=5FVAUX=5FUV=5FWARN &nbsp; =
&nbsp; &nbsp; &nbsp;
&nbsp;BIT(6)<br>&gt; &gt; &gt; +<br>&gt; &gt; &gt; ++#define ADM1278=5FPMON=
=5FCONTROL &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;0xd3<br>&gt; &gt; &gt; ++#define ADM1278=5FPMON=5FCONFIG &nbsp; &nbsp=
; &nbsp; &nbsp;
&nbsp; 0xd4<br>&gt; &gt; &gt; ++#define ADM1278=5FCFG=5FTSFLT &nbsp; &nbsp;=
 &nbsp; &nbsp;
&nbsp; &nbsp; BIT(15)<br>&gt; &gt; &gt; ++#define ADM1278=5FCFG=5FSIMULTANE=
OUS &nbsp; &nbsp; &nbsp;BIT(14)<br>&gt; &gt; &gt; ++#define ADM1278=5FCFG=
=5FPMON=5FMODE &nbsp; &nbsp; &nbsp; &nbsp;
BIT(4)<br>&gt; &gt; &gt; ++#define ADM1278=5FCFG=5FTEMP1=5FEN &nbsp; &nbsp;=
 &nbsp; &nbsp;
&nbsp;BIT(3)<br>&gt; &gt; &gt; ++#define ADM1278=5FCFG=5FVIN=5FEN &nbsp; &n=
bsp; &nbsp; &nbsp;
&nbsp; &nbsp;BIT(2)<br>&gt; &gt; &gt; ++#define ADM1278=5FCFG=5FVOUT=5FEN &=
nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; BIT(1)<br>&gt; &gt; &gt; ++#define ADM1278=5FPEAK=5FTEMPERATURE &nbs=
p; &nbsp; &nbsp;0xd7<br>&gt; &gt; &gt; ++<br>&gt; &gt; &gt; ++#define ADM12=
78=5FR=5FSENSE &nbsp; &nbsp; &nbsp; 1000 &nbsp;
&nbsp;/* R=5Fsense resistor value in <br>&gt; &gt; microohmsi */<br>&gt; &g=
t; &gt; ++<br>&gt; &gt; &gt; ++static int r=5Fsense =3D ADM1278=5FR=5FSENSE=
;<br>&gt; &gt; &gt; ++module=5Fparam(r=5Fsense, int, 0644);<br>&gt; &gt; &g=
t; ++MODULE=5FPARM=5FDESC(r=5Fsense, &quot;Rsense resistor value
in microohms&quot;);<br>&gt; &gt; &gt; ++<br>&gt; &gt; &gt; + struct adm127=
5=5Fdata {<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; int id;<br>&gt; &gt; &g=
t; + &nbsp; &nbsp; &nbsp; bool have=5Foc=5Ffault;<br>&gt; &gt; &gt; +@@ -18=
6,6 +202,11 @@ static int adm1275=5Fread=5Fword=5Fdata(struct
<br>&gt; &gt; i2c=5Fclient *client, int page, int reg)<br>&gt; &gt; &gt; + =
&nbsp; &nbsp; &nbsp; case PMBUS=5FVIRT=5FREAD=5FVIN=5FMAX:<br>&gt; &gt; &gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D
pmbus=5Fread=5Fword=5Fdata(client, 0, ADM1275=5FPEAK=5FVIN);<br>&gt; &gt; &=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;<br>&gt; &gt; =
&gt; ++ &nbsp; &nbsp; &nbsp;case PMBUS=5FVIRT=5FREAD=5FTEMP=5FMAX:<br>&gt; =
&gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (data-&gt;id
!=3D adm1278)<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;return -ENODATA;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;ret =3D
pmbus=5Fread=5Fword=5Fdata(client, 0, <br>&gt; &gt; ADM1278=5FPEAK=5FTEMPER=
ATURE);<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;break;<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; case PMBUS=5FVIRT=5FREAD=
=5FPIN=5FMIN:<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; if (!data-&gt;have=5Fpin=5Fmin)<br>&gt; &gt; &gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; return -ENXIO;<br>&gt; &gt; &gt; +@@ -199,6 +220,7 @@ =
static int adm1275=5Fread=5Fword=5Fdata(struct
i2c=5Fclient <br>&gt; &gt; *client, int page, int reg)<br>&gt; &gt; &gt; + =
&nbsp; &nbsp; &nbsp; case PMBUS=5FVIRT=5FRESET=5FIOUT=5FHISTORY:<br>&gt; &g=
t; &gt; + &nbsp; &nbsp; &nbsp; case PMBUS=5FVIRT=5FRESET=5FVOUT=5FHISTORY:<=
br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; case PMBUS=5FVIRT=5FRESET=5FVIN=5F=
HISTORY:<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp;case PMBUS=5FVIRT=5FRESET=
=5FTEMP=5FHISTORY:<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; break;<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; case PMBUS=5FV=
IRT=5FRESET=5FPIN=5FHISTORY:<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; if (!data-&gt;have=5Fpin=5Fmax)<br>&gt; &gt; &gt; +@=
@ -239,6 +261,9 @@ static int adm1275=5Fwrite=5Fword=5Fdata(struct
<br>&gt; &gt; i2c=5Fclient *client, int page, int reg,<br>&gt; &gt; &gt; + =
&nbsp; &nbsp; &nbsp; case PMBUS=5FVIRT=5FRESET=5FVIN=5FHISTORY:<br>&gt; &gt=
; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D
pmbus=5Fwrite=5Fword=5Fdata(client, 0, ADM1275=5FPEAK=5FVIN, <br>&gt; &gt; =
0);<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; br=
eak;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp;case PMBUS=5FVIRT=5FRESET=5FT=
EMP=5FHISTORY:<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;ret =3D
pmbus=5Fwrite=5Fword=5Fdata(client, 0, <br>&gt; &gt; ADM1278=5FPEAK=5FTEMPE=
RATURE, 0);<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;break;<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; case PMBUS=5FVIRT=5FR=
ESET=5FPIN=5FHISTORY:<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; ret =3D
pmbus=5Fwrite=5Fword=5Fdata(client, 0, ADM1276=5FPEAK=5FPIN, <br>&gt; &gt; =
0);<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if=
 (!ret
&amp;&amp; data-&gt;have=5Fpin=5Fmin)<br>&gt; &gt; &gt; +@@ -312,6 +337,7 @=
@ static const struct i2c=5Fdevice=5Fid adm1275=5Fid[]
=3D {<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; { &quot;adm1075&quot;, adm10=
75 },<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; { &quot;adm1275&quot;, adm12=
75 },<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; { &quot;adm1276&quot;, adm12=
76 },<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp;{ &quot;adm1278&quot;, adm12=
78 },<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; { &quot;adm1293&quot;, adm12=
93 },<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; { &quot;adm1294&quot;, adm12=
94 },<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; { }<br>&gt; &gt; &gt; +@@ -3=
35,6 +361,8 @@ static int adm1275=5Fprobe(struct i2c=5Fclient
*client,<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|
I2C=5FFUNC=5FSMBUS=5FBLOCK=5FDATA))<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; return
-ENODEV;<br>&gt; &gt; &gt; +<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp;/* i2=
c=5Faspeed driver does not handle
i2c=5Fsmbus=5Fread=5Fblock=5Fdata <br>&gt; &gt; correctly */<br>&gt; &gt; &=
gt; ++#if 0<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; ret =3D i2c=5Fsmbus=5F=
read=5Fblock=5Fdata(client,
PMBUS=5FMFR=5FID, <br>&gt; &gt; block=5Fbuffer);<br>&gt; &gt; &gt; + &nbsp;=
 &nbsp; &nbsp; if (ret &lt; 0) {<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; dev=5Ferr(&amp;client-&gt;dev,
&quot;Failed to read Manufacturer <br>&gt; &gt; ID\n&quot;);<br>&gt; &gt; &=
gt; +@@ -363,6 +391,7 @@ static int adm1275=5Fprobe(struct i2c=5Fclient
*client,<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; dev=5Fnotice(&amp;client-&gt;dev,<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;Device mismatch: Configured %s,
detected <br>&gt; &gt; %s\n&quot;,<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;id-&gt;name, mid-&gt;name);<br>&gt; &gt; =
&gt; ++#endif<br>&gt; &gt; &gt; +<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; =
config =3D i2c=5Fsmbus=5Fread=5Fbyte=5Fdata(client,
ADM1275=5FPMON=5FCONFIG);<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; if (conf=
ig &lt; 0)<br>&gt; &gt; &gt; +@@ -377,7 +406,9 @@ static int adm1275=5Fprob=
e(struct i2c=5Fclient
*client,<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; if (!data)<br>&gt; &gt; &=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return
-ENOMEM;<br>&gt; &gt; &gt; +<br>&gt; &gt; &gt; +- &nbsp; &nbsp; &nbsp;data-=
&gt;id =3D mid-&gt;driver=5Fdata;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp;=
/* i2c=5Faspeed driver does not handle
i2c=5Fsmbus=5Fread=5Fblock=5Fdata <br>&gt; &gt; correctly */<br>&gt; &gt; &=
gt; ++ &nbsp; &nbsp; &nbsp;//data-&gt;id =3D mid-&gt;driver=5Fdata;<br>&gt;=
 &gt; &gt; ++ &nbsp; &nbsp; &nbsp;data-&gt;id =3D adm1278;<br>&gt; &gt; &gt=
; +<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; info =3D &amp;data-&gt;info;<b=
r>&gt; &gt; &gt; +<br>&gt; &gt; &gt; +@@ -460,6 +491,62 @@ static int adm12=
75=5Fprobe(struct i2c=5Fclient
<br>&gt; &gt; *client,<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; info-&gt;func[0] |=3D<br>&gt; &gt; &gt; + &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; PMBUS=5FHAVE=5FVOUT | PMBUS=5FHAVE=5FSTATUS=5FV=
OUT;<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; b=
reak;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp;case adm1278:<br>&gt; &gt; &=
gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Configure
monitoring */<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;ret =3D
i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client,<br>&gt; &gt; &gt; ++ &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;ADM1278=5FPMON=5FCONTROL, 0);<br>&gt; &gt; &gt; ++ &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (ret
&lt; 0)<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;
&nbsp; &nbsp; &nbsp;return ret;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;ret =3D
i2c=5Fsmbus=5Fread=5Fword=5Fdata(client, <br>&gt; &gt; ADM1275=5FPMON=5FCON=
FIG);<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
ret =3D
i2c=5Fsmbus=5Fwrite=5Fword=5Fdata(client, <br>&gt; &gt; ADM1275=5FPMON=5FCO=
NFIG,<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;ADM1278=5FCFG=5FPMON=5FMODE |<br>&gt; &gt; &gt; =
++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;ADM1278=5FCFG=5FTEMP1=5FEN |<br>&gt; &gt; &gt; +=
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;ADM1278=5FCFG=5FVIN=5FEN |<br>&gt; &gt; &gt; ++ =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;ADM1278=5FCFG=5FVOUT=5FEN);<br>&gt; &gt; &gt; ++=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (ret
&lt; 0)<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;
&nbsp; &nbsp; &nbsp;return ret;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;ret =3D
i2c=5Fsmbus=5Fread=5Fword=5Fdata(client, <br>&gt; &gt; ADM1275=5FPMON=5FCON=
FIG);<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
dev=5Finfo(&amp;client-&gt;dev,
&quot;adm1278 config: 0x%x\n&quot;, ret);<br>&gt; &gt; &gt; ++ &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret =3D
i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, <br>&gt; &gt; ADM1278=5FPMON=5FCO=
NTROL,1);<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;if (ret
&lt; 0)<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;
&nbsp; &nbsp; &nbsp;return ret;<br>&gt; &gt; &gt; ++<br>&gt; &gt; &gt; ++ &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;info-&gt;func[0]
|=3D PMBUS=5FHAVE=5FVIN<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;| PMBUS=5FHAVE=5FVOUT | PMBUS=5FHAVE=5FSTATUS=5FVOUT<br=
>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;| PMBUS=5FHAVE=5FPIN<br>&gt; &gt; &gt; ++ &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;| PMBUS=5FHAVE=5FSTATUS=5FINPUT<br>&gt; &gt; &gt; ++ &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;| PMBUS=5FHAVE=5FTEMP | PMBUS=5FHAVE=5FSTATUS=5FTEMP;<b=
r>&gt; &gt; &gt; ++<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;data-&gt;have=5Foc=5Ffault
=3D false;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;data-&gt;have=5Fuc=5Ffault
=3D false;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;data-&gt;have=5Fvout
=3D true;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;data-&gt;have=5Fvaux=5Fstatus
=3D false;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;data-&gt;have=5Fmfr=5Fvaux=5Fstatus
=3D false;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;data-&gt;have=5Fiout=5Fmin
=3D false;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;data-&gt;have=5Fpin=5Fmin
=3D false;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;data-&gt;have=5Fpin=5Fmax
=3D true;<br>&gt; &gt; &gt; ++<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;info-&gt;m[PSC=5FVOLTAGE=5FIN]
=3D 19599;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;info-&gt;b[PSC=5FVOLTAGE=5FIN]
=3D 0;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;info-&gt;R[PSC=5FVOLTAGE=5FIN]
=3D -2;<br>&gt; &gt; &gt; ++<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;info-&gt;m[PSC=5FVOLTAGE=5FOUT]
=3D 19599;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;info-&gt;b[PSC=5FVOLTAGE=5FOUT]
=3D 0;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;info-&gt;R[PSC=5FVOLTAGE=5FOUT]
=3D -2;<br>&gt; &gt; &gt; ++<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;info-&gt;m[PSC=5FCURRENT=5FOUT]
=3D 800 * r=5Fsense / 1000;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;info-&gt;b[PSC=5FCURRENT=5FOUT]
=3D 20475;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;info-&gt;R[PSC=5FCURRENT=5FOUT]
=3D -1;<br>&gt; &gt; &gt; ++<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;info-&gt;m[PSC=5FPOWER]
=3D 6123 * r=5Fsense / 1000;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;info-&gt;b[PSC=5FPOWER]
=3D 0;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;info-&gt;R[PSC=5FPOWER]
=3D -2;<br>&gt; &gt; &gt; ++<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;info-&gt;format[PSC=5FTEMPERATURE]
=3D direct;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;info-&gt;m[PSC=5FTEMPERATURE]
=3D 42;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;info-&gt;b[PSC=5FTEMPERATURE]
=3D 31880;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;info-&gt;R[PSC=5FTEMPERATURE]
=3D -1;<br>&gt; &gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;break;<br>&gt; &gt; &gt; + &nbsp; &nbsp; &nbsp; case adm1293:<br>&gt; &gt=
; &gt; + &nbsp; &nbsp; &nbsp; case adm1294:<br>&gt; &gt; &gt; + &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; data-&gt;have=5Fiout=5Fmin
=3D true;<br>&gt; &gt; &gt; diff --git <br>&gt; &gt; a/meta-openbmc-machine=
s/meta-openpower/meta-rackspace/meta-<br>&gt; barreleye/recipes-kernel/linu=
x/linux-obmc/readme=5Fadm1278.txt <br>&gt; &gt; b/meta-openbmc-machines/met=
a-openpower/meta-rackspace/meta-<br>&gt; barreleye/recipes-kernel/linux/lin=
ux-obmc/readme=5Fadm1278.txt<br>&gt; &gt; &gt; new file mode 100644<br>&gt;=
 &gt; &gt; index 0000000..e86d977<br>&gt; &gt; &gt; --- /dev/null<br>&gt; &=
gt; &gt; +++ <br>&gt; &gt; b/meta-openbmc-machines/meta-openpower/meta-rack=
space/meta-<br>&gt; barreleye/recipes-kernel/linux/linux-obmc/readme=5Fadm1=
278.txt<br>&gt; &gt; &gt; @@ -0,0 +1,78 @@<br>&gt; &gt; &gt; +README for ad=
m1278 hwmon driver<br>&gt; &gt; &gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt; =
&gt; &gt; +Yi Li &lt;shliyi@cn.ibm.com&gt;<br>&gt; &gt; &gt; +<br>&gt; &gt;=
 &gt; +<br>&gt; &gt; &gt; +This is a temporary kernel patch to enable hwmon=
 driver
for adm1278 <br>&gt; &gt; chip on Barreleye.<br>&gt; &gt; &gt; +When this p=
atch is merged into linux kernel, this patch
will be removed <br>&gt; &gt; from openbmc.<br>&gt; &gt; &gt; +<br>&gt; &gt=
; &gt; +The adm1278 driver is created according to datasheet:<br>&gt; &gt; =
&gt; <br>&gt; &gt; +http://www.analog.com/media/en/technical-documentation/=
data-<br>&gt; sheets/ADM1278.pdf<br>&gt; &gt; &gt; +<br>&gt; &gt; &gt; +The=
 patch heavily re-used adm1278 enabling code from: <br>&gt; &gt; </font></t=
t><a href=3D"https://github.com/facebook/openbmc/blob/master/meta-aspeed/">=
<tt><font size=3D2>https://github.com/facebook/openbmc/blob/master/meta-asp=
eed/</font></tt></a><tt><font size=3D2><br>&gt; recipes-kernel/linux/files/=
patch-2.6.28.9/0000-linux-openbmc.patch<br>&gt; &gt; .<br>&gt; &gt; &gt; +<=
br>&gt; &gt; &gt; +This patch has been tested on barreleye, by following th=
ese
steps:<br>&gt; &gt; &gt; +<br>&gt; &gt; &gt; +1) There are 3 adm1278 device=
s on Barreleye<br>&gt; &gt; &gt; +<br>&gt; &gt; &gt; +I2C5: P12v=5Fa for CP=
U0<br>&gt; &gt; &gt; +I2C6: P12v=5Fb for CPU1<br>&gt; &gt; &gt; +I2C7: P12v=
=5Fc for HDD and IO Board<br>&gt; &gt; &gt; +<br>&gt; &gt; &gt; +2) adm1278=
 driver is based on adm1275.c, which depends
on pmbus. This <br>&gt; &gt; patch builds<br>&gt; &gt; &gt; +adm1275 and pm=
bus into kernel.<br>&gt; &gt; &gt; +<br>&gt; &gt; &gt; +3) When kernel boot=
ed, initialize the adm1278 devices:<br>&gt; &gt; &gt; +<br>&gt; &gt; &gt; +=
root@barreleye:~# echo adm1278 0x10 &gt; <br>&gt; &gt; /sys/class/i2c-adapt=
er/i2c-4/new=5Fdevice<br>&gt; &gt; &gt; +root@barreleye:~# echo adm1278 0x1=
0 &gt; <br>&gt; &gt; /sys/class/i2c-adapter/i2c-5/new=5Fdevice<br>&gt; &gt;=
 &gt; +root@barreleye:~# echo adm1278 0x10 &gt; <br>&gt; &gt; /sys/class/i2=
c-adapter/i2c-6/new=5Fdevice<br>&gt; &gt; &gt; +<br>&gt; &gt; &gt; +There w=
ill be three new hwmon sysfs entries created:<br>&gt; &gt; &gt; +<br>&gt; &=
gt; &gt; +root@barreleye:~# ls /sys/class/hwmon/hwmon3/<br>&gt; &gt; &gt; +=
curr1=5Fhighest &nbsp; &nbsp; &nbsp; &nbsp; in1=5Fhighest &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; in1=5Freset=5Fhistory <br>&gt; &gt; in2=5Fmin=
=5Falarm &nbsp; &nbsp; &nbsp; &nbsp; power1=5Flabel &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;temp1=5Finput<br>&gt; &gt; &gt; +curr1=5Finput &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in1=5Finput
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in2=5Fhighest <br>&gt; &gt; in2=
=5Freset=5Fhistory &nbsp; &nbsp; power1=5Fmax &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;temp1=5Fmax<br>&gt; &gt; &gt; +curr1=5Flabel &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; in1=5Flabel
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in2=5Finput &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; name &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;power1=5Freset=5Fhistory
&nbsp;temp1=5Fmax=5Falarm<br>&gt; &gt; &gt; +curr1=5Fmax &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; in1=5Fmax
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in2=5Flabel power/ &nbsp;<=
br>&gt; &gt; subsystem/ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;temp1=5Fre=
set=5Fhistory<br>&gt; &gt; &gt; +curr1=5Fmax=5Falarm &nbsp; &nbsp; &nbsp; i=
n1=5Fmax=5Falarm &nbsp;
&nbsp; &nbsp; &nbsp; in2=5Fmax power1=5Falarm &nbsp;<br>&gt; &gt; temp1=5Fc=
rit &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uevent<br>&gt; &gt; &gt; +curr=
1=5Freset=5Fhistory &nbsp; in1=5Fmin &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; in2=5Fmax=5Falarm power1=5Finput &nbsp;<br>&gt;=
 &gt; &nbsp; &nbsp; &nbsp; &nbsp;temp1=5Fcrit=5Falarm<br>&gt; &gt; &gt; +de=
vice/ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
in1=5Fmin=5Falarm &nbsp; &nbsp; &nbsp; &nbsp; in2=5Fmin <br>&gt; &gt; power=
1=5Finput=5Fhighest &nbsp;temp1=5Fhighest<br>&gt; &gt; &gt; +root@barreleye=
:~# ls /sys/class/hwmon/hwmon4/<br>&gt; &gt; &gt; +curr1=5Fhighest &nbsp; &=
nbsp; &nbsp; &nbsp; in1=5Fhighest &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; in1=5Freset=5Fhistory <br>&gt; &gt; in2=5Fmin=
=5Falarm &nbsp; &nbsp; &nbsp; &nbsp; power1=5Flabel &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;temp1=5Finput<br>&gt; &gt; &gt; +curr1=5Finput &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in1=5Finput
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in2=5Fhighest <br>&gt; &gt; in2=
=5Freset=5Fhistory &nbsp; &nbsp; power1=5Fmax &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;temp1=5Fmax<br>&gt; &gt; &gt; +curr1=5Flabel &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; in1=5Flabel
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in2=5Finput &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; name &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;power1=5Freset=5Fhistory
&nbsp;temp1=5Fmax=5Falarm<br>&gt; &gt; &gt; +curr1=5Fmax &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; in1=5Fmax
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in2=5Flabel power/ &nbsp;<=
br>&gt; &gt; subsystem/ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;temp1=5Fre=
set=5Fhistory<br>&gt; &gt; &gt; +curr1=5Fmax=5Falarm &nbsp; &nbsp; &nbsp; i=
n1=5Fmax=5Falarm &nbsp;
&nbsp; &nbsp; &nbsp; in2=5Fmax power1=5Falarm &nbsp;<br>&gt; &gt; temp1=5Fc=
rit &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uevent<br>&gt; &gt; &gt; +curr=
1=5Freset=5Fhistory &nbsp; in1=5Fmin &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; in2=5Fmax=5Falarm power1=5Finput &nbsp;<br>&gt;=
 &gt; &nbsp; &nbsp; &nbsp; &nbsp;temp1=5Fcrit=5Falarm<br>&gt; &gt; &gt; +de=
vice/ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
in1=5Fmin=5Falarm &nbsp; &nbsp; &nbsp; &nbsp; in2=5Fmin <br>&gt; &gt; power=
1=5Finput=5Fhighest &nbsp;temp1=5Fhighest<br>&gt; &gt; &gt; +root@barreleye=
:~# ls /sys/class/hwmon/hwmon5/<br>&gt; &gt; &gt; +curr1=5Fhighest &nbsp; &=
nbsp; &nbsp; &nbsp; in1=5Fhighest &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; in1=5Freset=5Fhistory <br>&gt; &gt; in2=5Fmin=
=5Falarm &nbsp; &nbsp; &nbsp; &nbsp; power1=5Flabel &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;temp1=5Finput<br>&gt; &gt; &gt; +curr1=5Finput &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in1=5Finput
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in2=5Fhighest <br>&gt; &gt; in2=
=5Freset=5Fhistory &nbsp; &nbsp; power1=5Fmax &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;temp1=5Fmax<br>&gt; &gt; &gt; +curr1=5Flabel &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; in1=5Flabel
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in2=5Finput &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; name &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;power1=5Freset=5Fhistory
&nbsp;temp1=5Fmax=5Falarm<br>&gt; &gt; &gt; +curr1=5Fmax &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; in1=5Fmax
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in2=5Flabel power/ &nbsp;<=
br>&gt; &gt; subsystem/ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;temp1=5Fre=
set=5Fhistory<br>&gt; &gt; &gt; +curr1=5Fmax=5Falarm &nbsp; &nbsp; &nbsp; i=
n1=5Fmax=5Falarm &nbsp;
&nbsp; &nbsp; &nbsp; in2=5Fmax power1=5Falarm &nbsp;<br>&gt; &gt; temp1=5Fc=
rit &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uevent<br>&gt; &gt; &gt; +curr=
1=5Freset=5Fhistory &nbsp; in1=5Fmin &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; in2=5Fmax=5Falarm power1=5Finput &nbsp;<br>&gt;=
 &gt; &nbsp; &nbsp; &nbsp; &nbsp;temp1=5Fcrit=5Falarm<br>&gt; &gt; &gt; +de=
vice/ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
in1=5Fmin=5Falarm &nbsp; &nbsp; &nbsp; &nbsp; in2=5Fmin <br>&gt; &gt; power=
1=5Finput=5Fhighest &nbsp;temp1=5Fhighest<br>&gt; &gt; &gt; +<br>&gt; &gt; =
&gt; +4) For details of what each hwmon sysfs attributes mean,
please refer <br>&gt; &gt; to:<br>&gt; &gt; &gt; +https://www.kernel.org/do=
c/Documentation/hwmon/pmbus<br>&gt; &gt; &gt; +For short, 'curr1=5F*' refer=
s to 'IOUT', 'in1=5F*' refers to
'vin', 'in2=5F*' <br>&gt; &gt; refers to 'vout', 'power1=5F*' refers to 'in=
put power',<br>&gt; &gt; &gt; +'temp1=5F*' for 'temperature'.<br>&gt; &gt; =
&gt; +<br>&gt; &gt; &gt; +5) Remaining issue:<br>&gt; &gt; &gt; +<br>&gt; &=
gt; &gt; +5.1) Currently, i2c=5Faspeed driver does not handle <br>&gt; &gt;=
 &quot;i2c=5Fsmbus=5Fread=5Fblock=5Fdata()&quot; correctly. So this patch
has to bypass some <br>&gt; &gt; detection code.<br>&gt; &gt; &gt; +We need=
 to fix this issue when the patch is merged to kernel.<br>&gt; &gt; &gt; +5=
.2) According to adm1278 datasheet, there is a sense resistor
used to <br>&gt; &gt; measure power and current. The resistor will affect c=
onversion
between<br>&gt; &gt; &gt; +adm1278 register value to real-world value for c=
urrent
and power. I am <br>&gt; &gt; not very sure about the resistor value. So us=
ing 1 mili-ohms
(or 1000 <br>&gt; &gt; micro-ohms) as default value. When build the adm1275=
 driver as
kernel <br>&gt; &gt; module, we can set this resistor value by:<br>&gt; &gt=
; &gt; +<br>&gt; &gt; &gt; +# insmod adm1275.ko r=5Fsense=3D500<br>&gt; &gt=
; &gt; +<br>&gt; &gt; &gt; +This will set the 'sense resistor' to 500 micro=
-ohms.<br>&gt; &gt; &gt; +5.3) Some of the sensor value, e.g, 'temp1=5Finpu=
t' seems
not reasonable, <br>&gt; &gt; e.g:<br>&gt; &gt; &gt; +<br>&gt; &gt; &gt; +r=
oot@barreleye:~# cat /sys/class/hwmon/hwmon4/temp1=5Finput<br>&gt; &gt; &gt=
; +-270952<br>&gt; &gt; &gt; +<br>&gt; &gt; &gt; +Need further check on tha=
t.<br>&gt; &gt; &gt; diff --git <br>&gt; &gt; a/meta-openbmc-machines/meta-=
openpower/meta-rackspace/meta-<br>&gt; barreleye/recipes-kernel/linux/linux=
-obmc=5F%.bbappend <br>&gt; &gt; b/meta-openbmc-machines/meta-openpower/met=
a-rackspace/meta-<br>&gt; barreleye/recipes-kernel/linux/linux-obmc=5F%.bba=
ppend<br>&gt; &gt; &gt; new file mode 100644<br>&gt; &gt; &gt; index 000000=
0..b6e8e16<br>&gt; &gt; &gt; --- /dev/null<br>&gt; &gt; &gt; +++ <br>&gt; &=
gt; b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-<br>&gt; bar=
releye/recipes-kernel/linux/linux-obmc=5F%.bbappend<br>&gt; &gt; &gt; @@ -0=
,0 +1,3 @@<br>&gt; &gt; &gt; +FILESEXTRAPATHS=5Fprepend :=3D &quot;${THISDI=
R}/linux-obmc:&quot;<br>&gt; &gt; &gt; +SRC=5FURI +=3D &quot;</font></tt><a=
 href=3Dfile://barreleye.cfgfg/><tt><font size=3D2>file://barreleye.cfg</fo=
nt></tt></a><tt><font size=3D2>&quot;<br>&gt; &gt; &gt; +SRC=5FURI +=3D &qu=
ot;</font></tt><a href=3Dfile://hwmon=5Fadm1278.patchch/><tt><font size=3D2=
>file://hwmon=5Fadm1278.patch</font></tt></a><tt><font size=3D2>&quot;<br>&=
gt; &gt; &gt; --<br>&gt; &gt; &gt; 2.7.1<br>&gt; &gt; &gt;<br>&gt; &gt; &gt=
;<br>&gt; &gt; &gt; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F<br>&gt; &gt; &gt; openbmc mailing list<br>&gt; &gt; &gt; openb=
mc@lists.ozlabs.org<br>&gt; &gt; &gt; </font></tt><a href=3Dhttps://lists.o=
zlabs.org/listinfo/openbmc><tt><font size=3D2>https://lists.ozlabs.org/list=
info/openbmc</font></tt></a><tt><font size=3D2><br>&gt; &gt; =5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt; &gt; openbmc=
 mailing list<br>&gt; &gt; openbmc@lists.ozlabs.org<br>&gt; &gt; </font></t=
t><a href=3Dhttps://lists.ozlabs.org/listinfo/openbmc><tt><font size=3D2>ht=
tps://lists.ozlabs.org/listinfo/openbmc</font></tt></a><tt><font size=3D2><=
br>&gt; &gt; <br>&gt; &gt; <br>&gt; &gt; <br>&gt; &gt; <br>&gt; <br>&gt; &g=
t; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&g=
t; &gt; openbmc mailing list<br>&gt; &gt; openbmc@lists.ozlabs.org<br>&gt; =
&gt; </font></tt><a href=3Dhttps://lists.ozlabs.org/listinfo/openbmc><tt><f=
ont size=3D2>https://lists.ozlabs.org/listinfo/openbmc</font></tt></a><tt><=
font size=3D2><br>&gt; <br>&gt; <br>&gt; -- <br>&gt; Patrick Williams<br>&g=
t; [attachment &quot;signature.asc&quot; deleted by Adriana Kobylak/Austin/=
IBM]
</font></tt><BR>
--=_alternative 007DDAA486257F69_=--
