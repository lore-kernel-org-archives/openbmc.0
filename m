Return-Path: <shliyi@cn.ibm.com>
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4EE7A1A032F
 for <openbmc@lists.ozlabs.org>; Thu, 26 Nov 2015 02:50:26 +1100 (AEDT)
Received: from localhost
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Thu, 26 Nov 2015 01:50:24 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 26 Nov 2015 01:50:22 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id D03D82CE8050
 for <openbmc@lists.ozlabs.org>; Thu, 26 Nov 2015 02:50:20 +1100 (EST)
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tAPFoEFP22872076
 for <openbmc@lists.ozlabs.org>; Thu, 26 Nov 2015 02:50:22 +1100
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tAPFnm0J022645
 for <openbmc@lists.ozlabs.org>; Thu, 26 Nov 2015 02:49:48 +1100
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tAPFnjte022373
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Thu, 26 Nov 2015 02:49:46 +1100
Message-Id: <201511251549.tAPFnjte022373@d23av05.au.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Wed, 25 Nov 2015 08:49:21 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 25 Nov 2015 08:49:18 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Wed, 25 Nov 2015 15:49:12 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.94)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 25 Nov 2015 15:49:06 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2015112515495186-299667 ;
 Wed, 25 Nov 2015 15:49:51 +0000 
In-Reply-To: <CACPK8XekT4dCvLkfx4fxeE=DUAf=h_=9KX41zMkcCDYVPStcVg@mail.gmail.com>
Subject: Re: [PATCH openbmc] add occ hwmon driver as kernel patch
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, adamliyi <adamliyi@msn.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: "Yi TZ Li" <shliyi@cn.ibm.com>
Date: Wed, 25 Nov 2015 23:48:56 +0800
References: <1448383220-17822-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1448383220-17822-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8XekT4dCvLkfx4fxeE=DUAf=h_=9KX41zMkcCDYVPStcVg@mail.gmail.com>
X-KeepSent: E6767CD6:EDC62307-00257F08:00562A98;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1SHF211 December 19, 2013
X-LLNOutbound: False
X-Disclaimed: 23815
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=8FBBF59BDFC5AC088f9e8a93df938690918c8FBBF59BDFC5AC08"
x-cbid: 15112515-0029-0000-0000-00000282B73F
X-IBM-ISS-SpamDetectors: Score=0.360268; BY=0.293992; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.360268; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004610; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000121; SDB=6.00622455; UDB=6.00276767; UTC=2015-11-25
 15:49:10
x-cbparentid: 15112515-9900-0000-0000-000005106611
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-Mailman-Approved-At: Tue, 01 Dec 2015 02:06:31 +1100
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
X-List-Received-Date: Wed, 25 Nov 2015 15:50:27 -0000

--0__=8FBBF59BDFC5AC088f9e8a93df938690918c8FBBF59BDFC5AC08
Content-type: multipart/alternative; 
	Boundary="1__=8FBBF59BDFC5AC088f9e8a93df938690918c8FBBF59BDFC5AC08"


--1__=8FBBF59BDFC5AC088f9e8a93df938690918c8FBBF59BDFC5AC08
Content-type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable


Hi Stanley,

Thanks for your detailed comments. I will made changes based on your
suggestions.

Yi Li (Adam)
OpenPower China Application Engineer Team
021-60928951
13524695440




From:	Joel Stanley <joel@jms.id.au>
To:	OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc:	adamliyi <adamliyi@msn.com>, OpenBMC Maillist
            <openbmc@lists.ozlabs.org>
Date:	11/25/2015 07:35 AM
Subject:	Re: [PATCH openbmc] add occ hwmon driver as kernel patch
Sent by:	"openbmc" <openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org>



Hello Adam,

Thanks for posting your code.

I've had a quick look and pointed out some style related changes that
you can make. This is important in getting upstream to accept your
patch, but also to make the code clear.

Once you've made the fixes I suggest, try running your patch through
scripts/checkpatch.pl in the Linux source tree. This will point out
lines that do not confirm to the coding standards the kernel uses. Try
to fix all of these warnings, and send an updated version of the
patch.

Next time you send the patch, send it as a PR to the kernel tree at
https://github.com/openbmc/linux. This is easier than reading a
patch-against-patch, and it's good practice for submitting the patch
upstream.

Please jump on the IRC channel at #openbmc on irc.freenode.net if you
want do discuss any changes, or have any questions.

Once you've fixed up the style issues, we will see what changes need
to be made to the structure of the driver.

Cheers,

Joel

On Wed, Nov 25, 2015 at 3:10 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> +--- a/drivers/hwmon/Kconfig
> ++++ b/drivers/hwmon/Kconfig
> +@@ -1167,6 +1167,13 @@ config SENSORS=5FNCT7904
> +         This driver can also be built as a module.  If so, the module
> +         will be called nct7904.
> +
> ++config SENSORS=5FOCC
> ++      tristate "OCC sensor driver for IBM Power CPU"
> ++      depends on I2C
> ++      help
> ++        If you say yes here you get support for driver to read sensors
in
> ++        IBM Power CPU On-Chip-Controller. module will be called occ.

Is this a driver for BMCs, or for the Power8 host? This should be made
clear.

> ++
> + config SENSORS=5FPCF8591
> +       tristate "Philips PCF8591 ADC/DAC"
> +       depends on I2C
> +diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> +index 9e0f3dd..53dc3b3 100644
> +--- a/drivers/hwmon/Makefile
> ++++ b/drivers/hwmon/Makefile
> +@@ -123,6 +123,7 @@ obj-$(CONFIG=5FSENSORS=5FNCT6775)      +=3D nct6775.o
> + obj-$(CONFIG=5FSENSORS=5FNCT7802) +=3D nct7802.o
> + obj-$(CONFIG=5FSENSORS=5FNCT7904) +=3D nct7904.o
> + obj-$(CONFIG=5FSENSORS=5FNTC=5FTHERMISTOR)  +=3D ntc=5Fthermistor.o
> ++obj-$(CONFIG=5FSENSORS=5FOCC)     +=3D occ.o
> + obj-$(CONFIG=5FSENSORS=5FPC87360) +=3D pc87360.o
> + obj-$(CONFIG=5FSENSORS=5FPC87427) +=3D pc87427.o
> + obj-$(CONFIG=5FSENSORS=5FPCF8591) +=3D pcf8591.o
> +diff --git a/drivers/hwmon/occ.c b/drivers/hwmon/occ.c
> +new file mode 100644
> +index 0000000..f265ff3
> +--- /dev/null
> ++++ b/drivers/hwmon/occ.c
> +@@ -0,0 +1,1529 @@
> ++/*
> ++ * Open BMC OCC HWMON driver - read Power8 OCC (On Chip Controller)
sensor data via i2c.
> ++ *
> ++ * Copyright (c) 2015 IBM (Alvin Wang, Li Yi)
> ++ *
> ++ * This program is free software; you can redistribute it and/or modify
> ++ * it under the terms of the GNU General Public License as published by
> ++ * the Free Software Foundation; either version 2 of the License, or
> ++ * (at your option) any later version.
> ++ *
> ++ * This program is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++ * GNU General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU General Public License
> ++ * along with this program; if not, write to the Free Software
> ++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
> ++ */
> ++
> ++#include <linux/module.h>
> ++#include <linux/init.h>
> ++#include <linux/slab.h>
> ++#include <linux/jiffies.h>
> ++#include <linux/i2c.h>
> ++#include <linux/hwmon.h>
> ++#include <linux/hwmon-sysfs.h>
> ++#include <linux/err.h>
> ++#include <linux/mutex.h>
> ++#include <linux/of.h>
> ++#include <linux/delay.h>
> ++
> ++//#define DEBUG    1

No C++ comments please.

> ++
> ++/* ------------------------------------------------------------*/

Drop the ASCII art.

> ++/* OCC sensor data format */
> ++typedef struct {
> ++      uint16=5Ft sensor=5Fid;
> ++      uint16=5Ft value;
> ++} occ=5Fsensor;
> ++

In the kernel we tend not to typedef our structures. So this would be
"struct occ=5Fsensor { ..."

The same comment applies to all of your structures.

> ++typedef struct {
> ++      uint16=5Ft sensor=5Fid;
> ++      uint32=5Ft update=5Ftag;
> ++      uint32=5Ft accumulator;
> ++      uint16=5Ft value;
> ++} powr=5Fsensor;

I'll buy you a vowel. Call this "struct power=5Fsensor".

> ++
> ++typedef struct {
> ++      uint16=5Ft curr=5Fpowercap;
> ++      uint16=5Ft curr=5Fpowerreading;
> ++      uint16=5Ft norm=5Fpowercap;
> ++      uint16=5Ft max=5Fpowercap;
> ++      uint16=5Ft min=5Fpowercap;
> ++      uint16=5Ft user=5Fpowerlimit;
> ++} caps=5Fsensor;

typedef

> ++
> ++typedef struct {
> ++      char sensor=5Ftype[5];

uint8=5Ft instead of a char?

> ++      uint8=5Ft reserved0;
> ++      uint8=5Ft sensor=5Fformat;
> ++      uint8=5Ft sensor=5Flength;
> ++      uint8=5Ft num=5Fof=5Fsensors;
> ++      occ=5Fsensor *sensor;
> ++      powr=5Fsensor *powr;
> ++      caps=5Fsensor *caps;
> ++} sensor=5Fdata=5Fblock;

typedef

> ++
> ++typedef struct {
> ++      uint8=5Ft status;
> ++      uint8=5Ft ext=5Fstatus;
> ++      uint8=5Ft occs=5Fpresent;
> ++      uint8=5Ft config;
> ++      uint8=5Ft occ=5Fstate;
> ++      uint8=5Ft reserved0;
> ++      uint8=5Ft reserved1;
> ++      uint8=5Ft error=5Flog=5Fid;
> ++      uint32=5Ft error=5Flog=5Faddr=5Fstart;
> ++      uint16=5Ft error=5Flog=5Flength;
> ++      uint8=5Ft reserved2;
> ++      uint8=5Ft reserved3;
> ++      char occ=5Fcode=5Flevel[17];

Code level is an IBM term. Perhaps call this version=5Fstring?

> ++      char sensor=5Feye=5Fcatcher[7];
> ++      uint8=5Ft num=5Fof=5Fsensor=5Fblocks;
> ++      uint8=5Ft sensor=5Fdata=5Fversion;
> ++      sensor=5Fdata=5Fblock* blocks;
> ++} occ=5Fpoll=5Fdata;

typedef

> ++
> ++typedef struct {
> ++      uint8=5Ft sequence=5Fnum;
> ++      uint8=5Ft cmd=5Ftype;
> ++      uint8=5Ft rtn=5Fstatus;
> ++      uint16=5Ft data=5Flength;
> ++      occ=5Fpoll=5Fdata data;
> ++      uint16=5Ft chk=5Fsum;
> ++      int temp=5Fblock=5Fid;
> ++      int freq=5Fblock=5Fid;
> ++      int power=5Fblock=5Fid;
> ++      int caps=5Fblock=5Fid;
> ++} occ=5Fresponse=5Ft;

typedef

> ++
> ++//static occ=5Fresponse=5Ft occ=5Fresp;

C++ comments.

> ++/* Each client has this additional data */

I don't understand this comment.

> ++struct occ=5Fdrv=5Fdata {
> ++      struct i2c=5Fclient       *client;
> ++      struct device           *hwmon=5Fdev;
> ++      struct mutex            update=5Flock;
> ++      char                    valid;          /* !=3D0 if sensor data a=
re
valid */

make this a bool, and you can drop the comment.

> ++      unsigned long           last=5Fupdated;   /* In jiffies */
> ++      unsigned long           sample=5Ftime;    /* Mininum timer interv=
al
for sampling In jiffies */

Minimum.

> ++      occ=5Fresponse=5Ft          occ=5Fresp;
> ++};
> ++
> +
+/*-----------------------------------------------------------------------*/


Drop this.

> ++/* i2c read and write occ sensors */
> ++
> ++#define OCC=5FDATA=5FMAX 4096 /* 4KB at most */
> ++#define I2C=5FSTATUS=5FREG 0x000d0001
> ++#define I2C=5FERROR=5FREG  0x000d0002
> ++#define I2C=5FREAD=5FERROR 1
> ++#define I2C=5FWRITE=5FERROR 2
> ++#define I2C=5FDATABUFFER=5FSIZE=5FERROR 3
> ++
> ++/*

Why is this commented out?

> ++#define SCOM=5FOCC=5FSRAM=5FWOX  0x0006B013
> ++#define SCOM=5FOCC=5FSRAM=5FWAND 0x0006B012
> ++#define SCOM=5FOCC=5FSRAM=5FADDR 0x0006B010
> ++#define SCOM=5FOCC=5FSRAM=5FDATA 0x0006B015
> ++*/
> ++
> ++// To generate attn to OCC

Use C commenting style.

> ++#define ATTN=5FDATA                0x0006B035
> ++
> ++// For BMC to read/write SRAM

Use C commenting style.

> ++#define OCB=5FADDRESS              0x0006B070
> ++#define OCB=5FDATA                 0x0006B075
> ++#define OCB=5FSTATUS=5FCONTROL=5FAND   0x0006B072
> ++#define OCB=5FSTATUS=5FCONTROL=5FOR    0x0006B073
> ++
> ++#define OCC=5FCOMMAND=5FADDR 0xFFFF6000
> ++#define OCC=5FRESPONSE=5FADDR 0xFFFF7000
> ++
> ++static int deinit=5Focc=5Fresp=5Fbuf(occ=5Fresponse=5Ft *p)
> ++{
> ++      int b;
> ++
> ++      if (p =3D=3D NULL)

You can check for null by just doing if (p).

> ++              return 0;

We normally return a negative number when there is an error.

This function only returns 0, which is not useful for the callee.

> ++
> ++      if (p->data.blocks =3D=3D NULL)
> ++              return 0;
> ++
> ++      for(b =3D 0; b < p->data.num=5Fof=5Fsensor=5Fblocks; b++) {
> ++              if (!p->data.blocks[b].sensor)
> ++                      kfree(p->data.blocks[b].sensor);
> ++              if (!p->data.blocks[b].powr)
> ++                      kfree(p->data.blocks[b].powr);
> ++              if (!p->data.blocks[b].caps)
> ++                      kfree(p->data.blocks[b].caps);
> ++      }
> ++
> ++      kfree(p->data.blocks);
> ++
> ++      memset(p, 0, sizeof(*p));
> ++
> ++
> ++      return 0;
> ++}
> ++
> ++static ssize=5Ft occ=5Fi2c=5Fread(struct i2c=5Fclient *client, char *bu=
f,
size=5Ft count)
> ++{
> ++      int ret =3D 0;
> ++
> ++      if (count > 8192)
> ++              count =3D 8192;

This should at least log an informative message.

> ++
> ++      //printk("i2c=5Fread: reading %zu bytes @0x%x.\n", count, client->
addr);

Delete it, or use dev=5Fdbg() to make your debugging info dynamically
configurable.

> ++      ret =3D i2c=5Fmaster=5Frecv(client, buf, count);
> ++      return ret;

This can be one line.

> ++}
> ++
> ++static ssize=5Ft occ=5Fi2c=5Fwrite(struct i2c=5Fclient *client, const c=
har
*buf, size=5Ft count)
> ++{
> ++      int ret =3D 0;
> ++
> ++      if (count > 8192)
> ++              count =3D 8192;
> ++
> ++      //printk("i2c=5Fwrite: writing %zu bytes @0x%x.\n", count, client=
->
addr);
> ++      ret =3D i2c=5Fmaster=5Fsend(client, buf, count);
> ++      return ret;

Similar comments to the occ=5Fi2c=5Fread.

> ++}
> ++
> ++/* read two 4-byte value */
> ++static int occ=5Fgetscom(struct i2c=5Fclient *client, uint32=5Ft addres=
s,
uint32=5Ft *value0, uint32=5Ft *value1)
> ++{
> ++      uint32=5Ft ret =3D 0;
> ++      char buf[8];
> ++      const char* address=5Fbuf =3D (const char*)&address;
> ++
> ++      //P8 i2c slave requires address to be shifted by 1

C++ comments.

> ++      address =3D address << 1;
> ++
> ++      ret =3D occ=5Fi2c=5Fwrite(client, address=5Fbuf, sizeof(address));
> ++      /* FIXME: ast i2c driver does not read corret value */
> ++      //if (ret !=3D sizeof(address))
> ++      //      return -I2C=5FWRITE=5FERROR;
> ++
> ++      ret =3D occ=5Fi2c=5Fread(client, buf, sizeof(buf));
> ++      //if (ret !=3D sizeof(buf))
> ++      //      return -I2C=5FREAD=5FERROR;

You've commented out the error handling here. Did you get to the
bottom of why you're not getting the return value you're expecting?

> ++
> ++      memcpy(value1, &buf[0], sizeof(*value1));
> ++      memcpy(value0, &buf[4], sizeof(*value0));

*value1 =3D buf[0]?

> ++
> ++      return 0;
> ++}
> ++
> ++/* read 8-byte value and put into data[offset] */
> ++static int occ=5Fgetscomb(struct i2c=5Fclient *client, uint32=5Ft addre=
ss,
char* data, int offset)
> ++{

data is bytes, just make it u8.

> ++      uint32=5Ft ret =3D 0;
> ++      const char* address=5Fbuf =3D (const char*)&address;
> ++      char buf[8];
> ++      int b =3D 0;

Convention is to use i for counters.

> ++
> ++      //P8 i2c slave requires address to be shifted by 1
> ++      address =3D address << 1;
> ++
> ++      ret =3D occ=5Fi2c=5Fwrite(client, address=5Fbuf, sizeof(address));
> ++      //if (ret !=3D sizeof(address))
> ++      //      return -I2C=5FWRITE=5FERROR;
> ++
> ++      ret =3D occ=5Fi2c=5Fread(client, buf, sizeof(buf));
> ++      //if (ret !=3D sizeof(buf))
> ++      //      return -I2C=5FREAD=5FERROR;
> ++
> ++      for (b =3D 0; b < 8; b++) {
> ++              data[offset + b] =3D buf[7 - b];
> ++      }
> ++
> ++      return 0;
> ++}
> ++
> ++static int occ=5Fputscom(struct i2c=5Fclient *client, uint32=5Ft addres=
s,
uint32=5Ft data0, uint32=5Ft data1)
> ++{
> ++      const char* address=5Fbuf =3D (const char*)&address;
> ++      const char* d0 =3D (const char*)&data0;
> ++      const char* d1 =3D (const char*)&data1;

This messing about with types is unnecessary.

> ++      char buf[12];
> ++      uint32=5Ft ret =3D 0;
> ++
> ++      //P8 i2c slave requires address to be shifted by 1
> ++      address =3D address << 1;
> ++
> ++      memcpy(&buf[0], address=5Fbuf, sizeof(address));
> ++      memcpy(&buf[4], d1, sizeof(data1));
> ++      memcpy(&buf[8], d0, sizeof(data0));

I think there's a better way to create your buffer. This is not endian
safe, and it's hard to read.

> ++
> ++      ret =3D occ=5Fi2c=5Fwrite(client, buf, sizeof(buf));
> ++      //if (ret !=3D sizeof(buf))
> ++      //      return I2C=5FWRITE=5FERROR;
> ++
> ++      return 0;
> ++}
> ++
> ++static int occ=5Fcheck=5Fi2c=5Ferrors(struct i2c=5Fclient *client)
> ++{
> ++      uint32=5Ft v0;
> ++      uint32=5Ft v1;
> ++
> ++      occ=5Fgetscom(client, I2C=5FSTATUS=5FREG, &v0, &v1);
> ++      if (v0 !=3D 0x80000000) {

Create #defines for your magic number.

> ++              printk("ERROR present in P8 I2C Slave.  Clearing...\n");
> ++              occ=5Fputscom(client, I2C=5FERROR=5FREG, 0x00000000,
0x00000000);
> ++              occ=5Fputscom(client, I2C=5FSTATUS=5FREG, 0x00000000,
0x00000000);
> ++              return -1;
> ++      }
> ++
> ++      return 0;
> ++}
> ++
> ++
> ++static inline uint16=5Ft get=5Foccdata=5Flength(char* d)

u8 instead of char.

> ++{
> ++      uint16=5Ft data=5Flength =3D 0;
> ++
> ++      data=5Flength =3D d[3] << 8;
> ++      data=5Flength =3D data=5Flength | d[4];
> ++      return data=5Flength;
> ++}
> ++
> ++
> ++static int parse=5Focc=5Fresponse(char* d, occ=5Fresponse=5Ft* o)
> ++{
> ++      int b =3D 0;
> ++      int s =3D 0;
> ++      int ret =3D 0;
> ++      int dnum =3D 45;
> ++
> ++      o->sequence=5Fnum =3D d[0];
> ++      o->cmd=5Ftype =3D d[1];
> ++      o->rtn=5Fstatus =3D d[2];
> ++      o->data=5Flength =3D d[3] << 8;
> ++      o->data=5Flength =3D o->data=5Flength | d[4];
> ++      o->data.status =3D d[5];
> ++      o->data.ext=5Fstatus =3D d[6];
> ++      o->data.occs=5Fpresent =3D d[7];
> ++      o->data.config =3D d[8];
> ++      o->data.occ=5Fstate =3D d[9];
> ++      o->data.reserved0 =3D d[10];
> ++      o->data.reserved1 =3D d[11];
> ++      o->data.error=5Flog=5Fid =3D d[12];
> ++      o->data.error=5Flog=5Faddr=5Fstart =3D d[13] << 24;
> ++      o->data.error=5Flog=5Faddr=5Fstart =3D o->data.error=5Flog=5Faddr=
=5Fstart | d
[14] << 16;
> ++      o->data.error=5Flog=5Faddr=5Fstart =3D o->data.error=5Flog=5Faddr=
=5Fstart | d
[15] << 8;
> ++      o->data.error=5Flog=5Faddr=5Fstart =3D o->data.error=5Flog=5Faddr=
=5Fstart | d
[16];
> ++      o->data.error=5Flog=5Flength =3D d[17] << 8;
> ++      o->data.error=5Flog=5Flength =3D o->data.error=5Flog=5Flength | d=
[18];
> ++      o->data.reserved2 =3D d[19];
> ++      o->data.reserved3 =3D d[20];
> ++      strncpy(&o->data.occ=5Fcode=5Flevel[0], (const char*)&d[21], 16);

You shouldn't need to play games with the types:

 strncpy(o->data.occ=5Fcode=5Flevel, d[21], 16)

> ++      strncpy(&o->data.sensor=5Feye=5Fcatcher[0], (const char*)&d[37], =
6);
> ++      o->data.sensor=5Feye=5Fcatcher[6]=3D'\0';

use strscpy which provdies the null termination for you.

> ++      o->data.num=5Fof=5Fsensor=5Fblocks=3Dd[43];
> ++      o->data.sensor=5Fdata=5Fversion =3D d[44];
> ++
> ++      if (strcmp(o->data.sensor=5Feye=5Fcatcher, "SENSOR") !=3D 0) {
> ++              printk("ERROR: SENSOR not found at byte 37 (%s)\n",o->
data.sensor=5Feye=5Fcatcher);
> ++              return -1;
> ++      }
> ++
> ++      if (o->data.num=5Fof=5Fsensor=5Fblocks =3D=3D 0) {
> ++              printk("ERROR: SENSOR block num is 0\n");
> ++              return -1;
> ++      }

Should these checks be before you parse the data?

> ++
> ++      o->data.blocks =3D kzalloc(sizeof(sensor=5Fdata=5Fblock) * o->
data.num=5Fof=5Fsensor=5Fblocks, GFP=5FKERNEL);
> ++      if (o->data.blocks =3D=3D NULL)
> ++              return -ENOMEM;
> ++
> ++      //printk("Reading %d sensor blocks\n", o->
data.num=5Fof=5Fsensor=5Fblocks);

use dev=5Fdbg

> ++      o->temp=5Fblock=5Fid =3D -1;
> ++      o->freq=5Fblock=5Fid =3D -1;
> ++      o->power=5Fblock=5Fid =3D -1;
> ++      o->caps=5Fblock=5Fid =3D -1;
> ++      for(b =3D 0; b < o->data.num=5Fof=5Fsensor=5Fblocks; b++) {
> ++              /* 8-byte sensor block head */
> ++              strncpy(&o->data.blocks[b].sensor=5Ftype[0], (const
char*)&d[dnum], 4);
> ++              o->data.blocks[b].reserved0 =3D d[dnum+4];
> ++              o->data.blocks[b].sensor=5Fformat =3D d[dnum+5];
> ++              o->data.blocks[b].sensor=5Flength =3D d[dnum+6];
> ++              o->data.blocks[b].num=5Fof=5Fsensors =3D d[dnum+7];
> ++              dnum =3D dnum + 8;
> ++
> ++              //printk("sensor block[%d]: type: %s, num=5Fof=5Fsensors:=
 %d,
sensor=5Flength: %u\n",
> ++                      //b, o->data.blocks[b].sensor=5Ftype, o->
data.blocks[b].num=5Fof=5Fsensors,
> ++                      //o->data.blocks[b].sensor=5Flength);

dev=5Fdbg

> ++
> ++              /* empty sensor block */
> ++              if (o->data.blocks[b].num=5Fof=5Fsensors <=3D 0)
> ++                      continue;
> ++              if (o->data.blocks[b].sensor=5Flength =3D=3D 0)
> ++                      continue;
> ++
> ++              if (strcmp(o->data.blocks[b].sensor=5Ftype, "FREQ") =3D=
=3D 0) {
> ++                      o->data.blocks[b].sensor =3D
> ++                              kzalloc(sizeof(occ=5Fsensor) * o->
data.blocks[b].num=5Fof=5Fsensors, GFP=5FKERNEL);
> ++
> ++                      if (o->data.blocks[b].sensor =3D=3D NULL) {
> ++                              ret =3D -ENOMEM;
> ++                              goto abort;

More commonly used is "out" or "error", but abort is fine if you want.

> ++                      }
> ++                      o->freq=5Fblock=5Fid =3D b;
> ++                      for (s =3D 0; s < o->data.blocks[b].num=5Fof=5Fse=
nsors;
s++) {
> ++                              o->data.blocks[b].sensor[s].sensor=5Fid =
=3D d
[dnum] << 8;
> ++                              o->data.blocks[b].sensor[s].sensor=5Fid =
=3D
> ++                                      o->data.blocks[b].sensor
[s].sensor=5Fid | d[dnum+1];
> ++                              o->data.blocks[b].sensor[s].value =3D d
[dnum+2] << 8;
> ++                              o->data.blocks[b].sensor[s].value =3D o->
data.blocks[b].sensor[s].value | d[dnum+3];
> ++                              //printk("sensor[%d]-[%d]: id: %u, value:
%u\n",
> ++                              //      b, s, o->data.blocks[b].sensor
[s].sensor=5Fid, o->data.blocks[b].sensor[s].value);

dev=5Fdbg

> ++                              dnum =3D dnum + o->data.blocks
[b].sensor=5Flength;
> ++                      }
> ++              }
> ++              else if (strcmp(o->data.blocks[b].sensor=5Ftype, "TEMP") =
=3D=3D
0) {
> ++
> ++                      o->data.blocks[b].sensor =3D
> ++                              kzalloc(sizeof(occ=5Fsensor) * o->
data.blocks[b].num=5Fof=5Fsensors, GFP=5FKERNEL);
> ++
> ++                      if (o->data.blocks[b].sensor =3D=3D NULL) {
> ++                              ret =3D -ENOMEM;
> ++                              goto abort;
> ++                      }
> ++
> ++                      o->temp=5Fblock=5Fid =3D b;
> ++                      for (s =3D 0; s < o->data.blocks[b].num=5Fof=5Fse=
nsors;
s++) {
> ++                              o->data.blocks[b].sensor[s].sensor=5Fid =
=3D d
[dnum] << 8;
> ++                              o->data.blocks[b].sensor[s].sensor=5Fid =
=3D
> ++                                      o->data.blocks[b].sensor
[s].sensor=5Fid | d[dnum+1];
> ++                              o->data.blocks[b].sensor[s].value =3D d
[dnum+2] << 8;
> ++                              o->data.blocks[b].sensor[s].value =3D o->
data.blocks[b].sensor[s].value | d[dnum+3];
> ++                              //printk("sensor[%d]-[%d]: id: %u, value:
%u\n",
> ++                              //      b, s, o->data.blocks[b].sensor
[s].sensor=5Fid, o->data.blocks[b].sensor[s].value);
> ++                              dnum =3D dnum + o->data.blocks
[b].sensor=5Flength;
> ++                      }
> ++              }
> ++              else if (strcmp(o->data.blocks[b].sensor=5Ftype, "POWR") =
=3D=3D
0) {
> ++
> ++                      o->data.blocks[b].powr =3D
> ++                              kzalloc(sizeof(powr=5Fsensor) * o->
data.blocks[b].num=5Fof=5Fsensors, GFP=5FKERNEL);
> ++
> ++                      if (o->data.blocks[b].powr =3D=3D NULL) {
> ++                              ret =3D -ENOMEM;
> ++                              goto abort;
> ++                      }
> ++                      o->power=5Fblock=5Fid =3D b;
> ++                      for (s =3D 0; s < o->data.blocks[b].num=5Fof=5Fse=
nsors;
s++) {
> ++                              o->data.blocks[b].powr[s].sensor=5Fid =3D=
 d
[dnum] << 8;
> ++                              o->data.blocks[b].powr[s].sensor=5Fid =3D=
 o->
data.blocks[b].powr[s].sensor=5Fid | d[dnum+1];
> ++                              o->data.blocks[b].powr[s].update=5Ftag =
=3D d
[dnum+2] << 24;
> ++                              o->data.blocks[b].powr[s].update=5Ftag =3D
o->data.blocks[b].powr[s].update=5Ftag | d[dnum+3] << 16;
> ++                              o->data.blocks[b].powr[s].update=5Ftag =3D
o->data.blocks[b].powr[s].update=5Ftag | d[dnum+4] << 8;
> ++                              o->data.blocks[b].powr[s].update=5Ftag =3D
o->data.blocks[b].powr[s].update=5Ftag | d[dnum+5];
> ++                              o->data.blocks[b].powr[s].accumulator =3D=
 d
[dnum+6] << 24;
> ++                              o->data.blocks[b].powr[s].accumulator =3D
o->data.blocks[b].powr[s].accumulator | d[dnum+7] << 16;
> ++                              o->data.blocks[b].powr[s].accumulator =3D
o->data.blocks[b].powr[s].accumulator | d[dnum+8] << 8;
> ++                              o->data.blocks[b].powr[s].accumulator =3D
o->data.blocks[b].powr[s].accumulator | d[dnum+9];
> ++                              o->data.blocks[b].powr[s].value =3D d[dnum
+10] << 8;
> ++                              o->data.blocks[b].powr[s].value =3D o->
data.blocks[b].powr[s].value | d[dnum+11];
> ++
> ++                              //printk("sensor[%d]-[%d]: id: %u, value:
%u\n",
> ++                              //      b, s, o->data.blocks[b].powr
[s].sensor=5Fid, o->data.blocks[b].powr[s].value);
> ++
> ++                              dnum =3D dnum + o->data.blocks
[b].sensor=5Flength;
> ++                      }
> ++              }
> ++              else if (strcmp(o->data.blocks[b].sensor=5Ftype, "CAPS") =
=3D=3D
0) {
> ++
> ++                      o->data.blocks[b].caps =3D
> ++                              kzalloc(sizeof(caps=5Fsensor) * o->
data.blocks[b].num=5Fof=5Fsensors, GFP=5FKERNEL);
> ++
> ++                      if (o->data.blocks[b].caps =3D=3D NULL) {
> ++                              ret =3D -ENOMEM;
> ++                              goto abort;
> ++                      }
> ++                      o->caps=5Fblock=5Fid =3D b;
> ++                      for (s =3D 0; s < o->data.blocks[b].num=5Fof=5Fse=
nsors;
s++) {
> ++                              o->data.blocks[b].caps[s].curr=5Fpowercap=
 =3D
d[dnum] << 8;
> ++                              o->data.blocks[b].caps[s].curr=5Fpowercap=
 =3D
o->data.blocks[b].caps[s].curr=5Fpowercap | d[dnum+1];
> ++                              o->data.blocks[b].caps
[s].curr=5Fpowerreading =3D d[dnum+2] << 8;
> ++                              o->data.blocks[b].caps
[s].curr=5Fpowerreading =3D o->data.blocks[b].caps[s].curr=5Fpowerreading |=
 d
[dnum+3];
> ++                              o->data.blocks[b].caps[s].norm=5Fpowercap=
 =3D
d[dnum+4] << 8;
> ++                              o->data.blocks[b].caps[s].norm=5Fpowercap=
 =3D
o->data.blocks[b].caps[s].norm=5Fpowercap | d[dnum+5];
> ++                              o->data.blocks[b].caps[s].max=5Fpowercap =
=3D
d[dnum+6] << 8;
> ++                              o->data.blocks[b].caps[s].max=5Fpowercap =
=3D
o->data.blocks[b].caps[s].max=5Fpowercap| d[dnum+7];
> ++                              o->data.blocks[b].caps[s].min=5Fpowercap =
=3D
d[dnum+8] << 8;
> ++                              o->data.blocks[b].caps[s].min=5Fpowercap =
=3D
o->data.blocks[b].caps[s].min=5Fpowercap| d[dnum+9];
> ++                              o->data.blocks[b].caps[s].user=5Fpowerlim=
it
=3D d[dnum+10] << 8;
> ++                              o->data.blocks[b].caps[s].user=5Fpowerlim=
it
=3D o->data.blocks[b].caps[s].user=5Fpowerlimit| d[dnum+11];
> ++
> ++                              dnum =3D dnum + o->data.blocks
[b].sensor=5Flength;
> ++                              //printk("CAPS sensor #%d:\n", s);
> ++                              //printk("curr=5Fpowercap is %x \n", o->
data.blocks[b].caps[s].curr=5Fpowercap);
> ++                              //printk("curr=5Fpowerreading is %x \n",
o->data.blocks[b].caps[s].curr=5Fpowerreading);
> ++                              //printk("norm=5Fpowercap is %x \n", o->
data.blocks[b].caps[s].norm=5Fpowercap);
> ++                              //printk("max=5Fpowercap is %x \n", o->
data.blocks[b].caps[s].max=5Fpowercap);
> ++                              //printk("min=5Fpowercap is %x \n", o->
data.blocks[b].caps[s].min=5Fpowercap);
> ++                              //printk("user=5Fpowerlimit is %x \n", o->
data.blocks[b].caps[s].user=5Fpowerlimit);
> ++                      }
> ++
> ++              }
> ++              else {
> ++                      printk("ERROR: sensor type %s not supported\n",
o->data.blocks[b].sensor=5Ftype);
> ++                      ret =3D -1;
> ++                      goto abort;
> ++              }
> ++      }
> ++
> ++      return 0;
> ++abort:
> ++      deinit=5Focc=5Fresp=5Fbuf(o);
> ++      return ret;
> ++}
> ++
> ++/* used for testing */
> ++char fake=5Focc=5Frsp[OCC=5FDATA=5FMAX] =3D {
> ++0x69, 0x00, 0x00, 0x00, 0xa4, 0xc3, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00,
> ++0x00, 0x00, 0x00, 0x00, 0x00, 0x6f, 0x70, 0x5f, 0x6f, 0x63, 0x63, 0x5f,
0x31, 0x35, 0x30, 0x37,
> ++0x31, 0x36, 0x61, 0x00, 0x00, 0x53, 0x45, 0x4e, 0x53, 0x4f, 0x52, 0x04,
0x01, 0x54, 0x45, 0x4d,
> ++0x50, 0x00, 0x01, 0x04, 0x0a, 0x00 ,0x6a, 0x00, 0x00, 0x00, 0x6c, 0x00,
0x00, 0x00, 0x6d, 0x00,
> ++0x00,0x00,0x6e,0x00, 0x00,0x00,0x6f,0x00, 0x00,0x00,0x70,0x00,
0x00,0x00,0x71,0x00,
> ++0x00,0x00,0x73,0x00, 0x00,0x00,0x74,0x00, 0x00,0x00,0x75,0x00,
0x00,0x46,0x52,0x45,
> ++0x51,0x00,0x01,0x04, 0x0a,0x00,0x76,0x00, 0x00,0x00,0x78,0x00,
0x00,0x00,0x79,0x00,
> ++0x00,0x00,0x7a,0x00, 0x00,0x00,0x7b,0x00, 0x00,0x00,0x7c,0x00,
0x00,0x00,0x7d,0x00,
> ++0x00,0x00,0x7f,0x00, 0x00,0x00,0x80,0x00, 0x00,0x00,0x81,0x00,
0x00,0x50,0x4f,0x57,
> ++0x52,0x00,0x01,0x0c, 0x00,0x43,0x41,0x50, 0x53,0x00,0x01,0x0c,
0x01,0x00,0x00,0x00,
> ++0x00,0x04,0xb0,0x09, 0x60,0x04,0x4c,0x00, 0x00,0x17,0xc5,};
> ++
> ++//#define DUMP=5FRAW 1
> ++
> ++static int occ=5Fget=5Fall(struct i2c=5Fclient *client, occ=5Fresponse=
=5Ft
*occ=5Fresp)
> ++{
> ++      char occ=5Fdata[OCC=5FDATA=5FMAX];
> ++      uint16=5Ft num=5Fbytes =3D 0;
> ++      int b =3D 0;
> ++      int ret =3D 0;
> ++/*
> ++      //Procedure to access SRAM where OCC data is located
> ++      occ=5Fputscom(client, SCOM=5FOCC=5FSRAM=5FWOX, 0x08000000, 0x0000=
0000);
> ++      occ=5Fputscom(client, SCOM=5FOCC=5FSRAM=5FWAND, 0xFBFFFFFF, 0xFFF=
FFFFF);
> ++      occ=5Fputscom(client, SCOM=5FOCC=5FSRAM=5FADDR, OCC=5FRESPONSE=5F=
ADDR,
0x00000000);
> ++      occ=5Fputscom(client, SCOM=5FOCC=5FSRAM=5FADDR, OCC=5FRESPONSE=5F=
ADDR,
0x00000000);
> ++
> ++      occ=5Fgetscomb(client, SCOM=5FOCC=5FSRAM=5FDATA, occ=5Fdata, 0);
> ++
> ++*/

Remove commented out code.

> ++
> ++      // Init OCB
> ++      occ=5Fputscom(client, OCB=5FSTATUS=5FCONTROL=5FOR,  0x08000000,
0x00000000);
> ++      occ=5Fputscom(client, OCB=5FSTATUS=5FCONTROL=5FAND, 0xFBFFFFFF,
0xFFFFFFFF);
> ++
> ++      // Send poll command to OCC
> ++      occ=5Fputscom(client, OCB=5FADDRESS, OCC=5FCOMMAND=5FADDR, 0x0000=
0000);
> ++      occ=5Fputscom(client, OCB=5FADDRESS, OCC=5FCOMMAND=5FADDR, 0x0000=
0000);
> ++      occ=5Fputscom(client, OCB=5FDATA, 0x00000001, 0x10001100);
> ++
> ++      // Trigger ATTN
> ++      occ=5Fputscom(client, ATTN=5FDATA, 0x01010000, 0x00000000);
> ++
> ++      // TODO: check command status Refere to
> ++      // "1.6.2 OCC Command/Response Sequence" in
OCC=5FOpenPwr=5FFW=5FInterfaces1.2.pdf

Use C style comments.

This needs more information as to why you're sleeping for so long.

> ++      // Use sleep as workaround
> ++      //msleep(2000);
> ++
> ++      // Get response data
> ++      occ=5Fputscom(client, OCB=5FADDRESS, OCC=5FRESPONSE=5FADDR, 0x000=
00000);
> ++      occ=5Fgetscomb(client, OCB=5FDATA, occ=5Fdata, 0);
> ++
> ++      /* FIXME: use fake data to test driver without hw */
> ++      //printk("i2c-occ: using FAKE occ data\n");
> ++      //memcpy(&occ=5Fdata[0], &fake=5Focc=5Frsp[0], sizeof(occ=5Fdata)=
);

Making your code testable is a good idea. We can't have commented out
code, but perhaps we could use debugfs to pass the driver fake data
from userspace?

> ++
> ++      num=5Fbytes =3D get=5Foccdata=5Flength(occ=5Fdata);
> ++
> ++      //printk("OCC data length: %d\n", num=5Fbytes);
> ++
> ++#ifdef DUMP=5FRAW
> ++      int i =3D 0;
> ++      printk("\nRAW data\n=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D\n");
> ++      for (i =3D 0; i < 8; i++) {
> ++              if(i =3D=3D 4) printk("  ");
> ++              printk("%02x", occ=5Fdata[i]);
> ++      }
> ++      printk("\n");
> ++#endif

Use something that can be run-time  enabled to dump this out. A sysfs file?

> ++
> ++      if (num=5Fbytes > OCC=5FDATA=5FMAX) {
> ++              printk("ERROR: OCC data length must be < 4KB\n");
> ++              return -1;
> ++      }
> ++
> ++      if (num=5Fbytes <=3D 0) {
> ++              printk("ERROR: OCC data length is zero\n");
> ++              return -1;
> ++      }
> ++
> ++      for (b =3D 8; b < num=5Fbytes + 8; b =3D b + 8) {
> ++              //occ=5Fgetscomb(client, SCOM=5FOCC=5FSRAM=5FDATA, occ=5F=
data, b);
> ++              occ=5Fgetscomb(client, OCB=5FDATA, occ=5Fdata, b);
> ++#ifdef DUMP=5FRAW
> ++      for (i =3D 0; i < 8; i++) {
> ++              if(i =3D=3D 4) printk("  ");
> ++              printk("%02x", occ=5Fdata[b+i]);
> ++      }
> ++      printk("\n");
> ++#endif
> ++
> ++      }
> ++
> ++      /* FIXME: use fake data to test driver without hw */
> ++      //memcpy(&occ=5Fdata[0], &fake=5Focc=5Frsp[0], sizeof(occ=5Fdata)=
);
> ++
> ++      ret =3D parse=5Focc=5Fresponse(occ=5Fdata, occ=5Fresp);
> ++
> ++      return ret;
> ++}
> ++
> ++
> ++static int occ=5Fupdate=5Fdevice(struct device *dev)
> ++{
> ++      struct occ=5Fdrv=5Fdata *data =3D dev=5Fget=5Fdrvdata(dev);
> ++      struct i2c=5Fclient *client =3D data->client;
> ++      int ret =3D 0;
> ++
> ++      mutex=5Flock(&data->update=5Flock);
> ++
> ++      if (time=5Fafter(jiffies, data->last=5Fupdated + data->sample=5Ft=
ime)
> ++          || !data->valid) {
> ++              deinit=5Focc=5Fresp=5Fbuf(&data->occ=5Fresp);
> ++
> ++              ret =3D occ=5Fget=5Fall(client, &data->occ=5Fresp);
> ++
> ++              data->last=5Fupdated =3D jiffies;
> ++              data->valid =3D 1;
> ++      }
> ++      mutex=5Funlock(&data->update=5Flock);
> ++
> ++      return ret;
> ++}
> ++
> ++/*
----------------------------------------------------------------------*/
> ++/* sysfs attributes for hwmon */
> ++
> ++static ssize=5Ft show=5Focc=5Ftemp=5Finput(struct device *hwmon=5Fdev, =
struct
device=5Fattribute *da, char *buf)
> ++{
> ++      struct sensor=5Fdevice=5Fattribute *attr =3D to=5Fsensor=5Fdev=5F=
attr(da);
> ++      int n =3D attr->index;
> ++      struct device * dev =3D hwmon=5Fdev->parent;
> ++      struct occ=5Fdrv=5Fdata *data =3D dev=5Fget=5Fdrvdata(dev);
> ++      int ret =3D 0;
> ++      occ=5Fsensor *sensor;
> ++      int val =3D 0;
> ++
> ++      ret =3D occ=5Fupdate=5Fdevice(dev);
> ++
> ++      if (ret !=3D 0)
> ++      {
> ++              /* FIXME: to test fake data */
> ++              printk("ERROR: cannot get occ sensor data: %d\n", ret);
> ++              return ret;
> ++      }
> ++
> ++      if (data->occ=5Fresp.data.blocks =3D=3D NULL ||
> ++              data->occ=5Fresp.data.blocks[data->
occ=5Fresp.temp=5Fblock=5Fid].sensor =3D=3D NULL)
> ++              return -1;
> ++
> ++      //printk("block=5Fid: %d, sensor: %d\n", data->
occ=5Fresp.temp=5Fblock=5Fid, n -1);
> ++      sensor =3D &data->occ=5Fresp.data.blocks[data->
occ=5Fresp.temp=5Fblock=5Fid].sensor[n - 1];
> ++      /* in millidegree Celsius */
> ++      val =3D sensor->value * 1000;
> ++      //printk("temp%d sensor value: %d\n", n, val);
> ++
> ++      //printk("------------- above are debug message, bellow is real
output------------\n");
> ++      return sprintf(buf, "%d\n", val);
> ++}
> ++
> ++static ssize=5Ft show=5Focc=5Ftemp=5Flabel(struct device *hwmon=5Fdev, =
struct
device=5Fattribute *da, char *buf)
> ++{
> ++      struct sensor=5Fdevice=5Fattribute *attr =3D to=5Fsensor=5Fdev=5F=
attr(da);
> ++      int n =3D attr->index;
> ++      struct device *dev =3D hwmon=5Fdev->parent;
> ++      struct occ=5Fdrv=5Fdata *data =3D dev=5Fget=5Fdrvdata(dev);
> ++      int ret =3D 0;
> ++      occ=5Fsensor *sensor;
> ++      int val =3D 0;
> ++
> ++      ret =3D occ=5Fupdate=5Fdevice(dev);
> ++
> ++      if (ret !=3D 0)
> ++      {
> ++              /* FIXME: to test fake data */
> ++              printk("ERROR: cannot get occ sensor data: %d\n", ret);
> ++              return ret;
> ++      }
> ++
> ++      if (data->occ=5Fresp.data.blocks =3D=3D NULL ||
> ++              data->occ=5Fresp.data.blocks[data->
occ=5Fresp.temp=5Fblock=5Fid].sensor =3D=3D NULL)
> ++              return -1;
> ++
> ++      //printk("temp=5Fblock=5Fid: %d, sensor: %d\n", data->
occ=5Fresp.temp=5Fblock=5Fid, n -1);
> ++      sensor =3D &data->occ=5Fresp.data.blocks[data->
occ=5Fresp.temp=5Fblock=5Fid].sensor[n - 1];
> ++      val =3D sensor->sensor=5Fid;
> ++      //printk("temp%d sensor id: %d\n", n, val);
> ++
> ++      //printk("------------- above are debug message, bellow is real
output------------\n");
> ++      return sprintf(buf, "%d\n", val);
> ++}
> ++
> ++static ssize=5Ft show=5Focc=5Fpower=5Flabel(struct device *hwmon=5Fdev,=
 struct
device=5Fattribute *da, char *buf)
> ++{
> ++      struct sensor=5Fdevice=5Fattribute *attr =3D to=5Fsensor=5Fdev=5F=
attr(da);
> ++      int n =3D attr->index;
> ++      struct device *dev =3D hwmon=5Fdev->parent;
> ++      struct occ=5Fdrv=5Fdata *data =3D dev=5Fget=5Fdrvdata(dev);
> ++      int ret =3D 0;
> ++      powr=5Fsensor *sensor;
> ++      int val =3D 0;
> ++
> ++      ret =3D occ=5Fupdate=5Fdevice(dev);
> ++
> ++      if (ret !=3D 0)
> ++      {
> ++              /* FIXME: to test fake data */
> ++              printk("ERROR: cannot get occ sensor data: %d\n", ret);
> ++              return ret;
> ++      }
> ++
> ++      //printk("power=5Fblock=5Fid: %d, sensor: %d\n", data->
occ=5Fresp.power=5Fblock=5Fid, n -1);
> ++
> ++      if (data->occ=5Fresp.data.blocks =3D=3D NULL ||
> ++              data->occ=5Fresp.data.blocks[data->
occ=5Fresp.power=5Fblock=5Fid].powr =3D=3D NULL)
> ++              return -1;
> ++
> ++      sensor =3D &data->occ=5Fresp.data.blocks[data->
occ=5Fresp.power=5Fblock=5Fid].powr[n - 1];
> ++      val =3D sensor->sensor=5Fid;
> ++      //printk("power%d sensor id: %d\n", n, val);
> ++
> ++      //printk("------------- above are debug message, bellow is real
output------------\n");
> ++      return sprintf(buf, "%d\n", val);
> ++}
> ++
> ++
> ++static ssize=5Ft show=5Focc=5Fpower=5Finput(struct device *hwmon=5Fdev,=
 struct
device=5Fattribute *da, char *buf)
> ++{
> ++      struct sensor=5Fdevice=5Fattribute *attr =3D to=5Fsensor=5Fdev=5F=
attr(da);
> ++      int n =3D attr->index;
> ++      struct device *dev =3D hwmon=5Fdev->parent;
> ++      struct occ=5Fdrv=5Fdata *data =3D dev=5Fget=5Fdrvdata(dev);
> ++      int ret =3D 0;
> ++      powr=5Fsensor *sensor;
> ++      int val =3D 0;
> ++
> ++      ret =3D occ=5Fupdate=5Fdevice(dev);
> ++
> ++      if (ret !=3D 0)
> ++      {
> ++              /* FIXME: to test fake data */
> ++              printk("ERROR: cannot get occ sensor data: %d\n", ret);
> ++              return ret;
> ++      }
> ++
> ++      //printk("power block=5Fid: %d, sensor: %d\n", data->
occ=5Fresp.power=5Fblock=5Fid, n -1);
> ++
> ++      if (data->occ=5Fresp.data.blocks =3D=3D NULL ||
> ++              data->occ=5Fresp.data.blocks[data->
occ=5Fresp.power=5Fblock=5Fid].powr =3D=3D NULL)
> ++              return -1;
> ++
> ++
> ++      sensor =3D &data->occ=5Fresp.data.blocks[data->
occ=5Fresp.power=5Fblock=5Fid].powr[n - 1];
> ++      val =3D sensor->value;
> ++      //printk("power%d sensor value: %d\n", n, val);
> ++
> ++      //printk("------------- above are debug message, bellow is real
output------------\n");
> ++      return sprintf(buf, "%d\n", val);
> ++}
> ++
> ++
> ++static ssize=5Ft show=5Focc=5Ffreq=5Flabel(struct device *hwmon=5Fdev, =
struct
device=5Fattribute *da, char *buf)
> ++{
> ++      struct sensor=5Fdevice=5Fattribute *attr =3D to=5Fsensor=5Fdev=5F=
attr(da);
> ++      int n =3D attr->index;
> ++      struct device *dev =3D hwmon=5Fdev->parent;
> ++      struct occ=5Fdrv=5Fdata *data =3D dev=5Fget=5Fdrvdata(dev);
> ++      int ret =3D 0;
> ++      occ=5Fsensor *sensor;
> ++      int val =3D 0;
> ++
> ++      ret =3D occ=5Fupdate=5Fdevice(dev);
> ++
> ++      if (ret !=3D 0)
> ++      {
> ++              /* FIXME: to test fake data */
> ++              printk("ERROR: cannot get occ sensor data: %d\n", ret);
> ++              return ret;
> ++      }
> ++
> ++      if (data->occ=5Fresp.data.blocks =3D=3D NULL ||
> ++              data->occ=5Fresp.data.blocks[data->
occ=5Fresp.freq=5Fblock=5Fid].sensor =3D=3D NULL)
> ++              return -1;
> ++
> ++      //printk("freq=5Fblock=5Fid: %d, sensor: %d\n", data->
occ=5Fresp.freq=5Fblock=5Fid, n -1);
> ++      sensor =3D &data->occ=5Fresp.data.blocks[data->
occ=5Fresp.freq=5Fblock=5Fid].sensor[n - 1];
> ++      val =3D sensor->sensor=5Fid;
> ++      //printk("freq%d sensor id: %d\n", n, val);
> ++
> ++      //printk("------------- above are debug message, bellow is real
output------------\n");
> ++      return sprintf(buf, "%d\n", val);
> ++}
> ++
> ++
> ++static ssize=5Ft show=5Focc=5Ffreq=5Finput(struct device *hwmon=5Fdev, =
struct
device=5Fattribute *da, char *buf)
> ++{
> ++      struct sensor=5Fdevice=5Fattribute *attr =3D to=5Fsensor=5Fdev=5F=
attr(da);
> ++      int n =3D attr->index;
> ++      struct device *dev =3D hwmon=5Fdev->parent;
> ++      struct occ=5Fdrv=5Fdata *data =3D dev=5Fget=5Fdrvdata(dev);
> ++      int ret =3D 0;
> ++      occ=5Fsensor *sensor;
> ++      int val =3D 0;
> ++
> ++      ret =3D occ=5Fupdate=5Fdevice(dev);
> ++
> ++      if (ret !=3D 0)
> ++      {
> ++              /* FIXME: to test fake data */
> ++              printk("ERROR: cannot get occ sensor data: %d\n", ret);
> ++              return ret;
> ++      }
> ++
> ++      if (data->occ=5Fresp.data.blocks =3D=3D NULL ||
> ++              data->occ=5Fresp.data.blocks[data->
occ=5Fresp.freq=5Fblock=5Fid].sensor =3D=3D NULL)
> ++              return -1;
> ++
> ++      //printk("block=5Fid: %d, sensor: %d\n", data->
occ=5Fresp.freq=5Fblock=5Fid, n -1);
> ++      sensor =3D &data->occ=5Fresp.data.blocks[data->
occ=5Fresp.freq=5Fblock=5Fid].sensor[n - 1];
> ++      val =3D sensor->value;
> ++      //printk("freq%d sensor value: %d\n", n, val);
> ++
> ++      //printk("------------- above are debug message, bellow is real
output------------\n");
> ++      return sprintf(buf, "%d\n", val);
> ++}
> ++
> ++static ssize=5Ft show=5Focc=5Fcaps(struct device *hwmon=5Fdev, struct
device=5Fattribute *da, char *buf)
> ++{
> ++      struct sensor=5Fdevice=5Fattribute=5F2 *attr =3D to=5Fsensor=5Fde=
v=5Fattr=5F2
(da);
> ++      int nr =3D attr->nr;
> ++      int n =3D attr->index;
> ++      struct device *dev =3D hwmon=5Fdev->parent;
> ++      struct occ=5Fdrv=5Fdata *data =3D dev=5Fget=5Fdrvdata(dev);
> ++      int ret =3D 0;
> ++      caps=5Fsensor *sensor;
> ++      int val =3D 0;
> ++
> ++      ret =3D occ=5Fupdate=5Fdevice(dev);
> ++      if (ret !=3D 0)
> ++      {
> ++              /* FIXME: to test fake data */
> ++              printk("ERROR: cannot get occ sensor data: %d\n", ret);
> ++              return ret;
> ++      }
> ++
> ++      //printk("block=5Fid: %d, sensor: %d, nr: %d\n", data->
occ=5Fresp.caps=5Fblock=5Fid, n - 1, nr);
> ++      if (data->occ=5Fresp.data.blocks =3D=3D NULL ||
> ++              data->occ=5Fresp.data.blocks[data->
occ=5Fresp.caps=5Fblock=5Fid].caps =3D=3D NULL)
> ++              return -1;
> ++
> ++      sensor =3D &data->occ=5Fresp.data.blocks[data->
occ=5Fresp.caps=5Fblock=5Fid].caps[n - 1];
> ++
> ++      switch (nr) {
> ++              case 0:
> ++                      val =3D sensor->curr=5Fpowercap;
> ++                      break;
> ++              case 1:
> ++                      val =3D sensor->curr=5Fpowerreading;
> ++                      break;
> ++              case 2:
> ++                      val =3D sensor->norm=5Fpowercap;
> ++                      break;
> ++              case 3:
> ++                      val =3D sensor->max=5Fpowercap;
> ++                      break;
> ++              case 4:
> ++                      val =3D sensor->min=5Fpowercap;
> ++                      break;
> ++              case 5:
> ++                      val =3D sensor->user=5Fpowerlimit;
> ++                      break;
> ++              default:
> ++                      val =3D 0;
> ++      }
> ++
> ++      //printk("caps%d sensor value: %d, nr: %d\n", n, val, nr);
> ++
> ++      //printk("------------- above are debug message, bellow is real
output------------\n");
> ++      return sprintf(buf, "%d\n", val);
> ++}
> ++
> ++#if 0
> ++static SENSOR=5FDEVICE=5FATTR(temp1=5Finput, S=5FIRUGO, show=5Focc=5Fte=
mp=5Finput,
NULL, 1);
> ++static SENSOR=5FDEVICE=5FATTR(temp2=5Finput, S=5FIRUGO, show=5Focc=5Fte=
mp=5Finput,
NULL, 2);
> ++static SENSOR=5FDEVICE=5FATTR(temp3=5Finput, S=5FIRUGO, show=5Focc=5Fte=
mp=5Finput,
NULL, 3);
> ++static SENSOR=5FDEVICE=5FATTR(temp4=5Finput, S=5FIRUGO, show=5Focc=5Fte=
mp=5Finput,
NULL, 4);
> ++static SENSOR=5FDEVICE=5FATTR(temp5=5Finput, S=5FIRUGO, show=5Focc=5Fte=
mp=5Finput,
NULL, 5);
> ++static SENSOR=5FDEVICE=5FATTR(temp6=5Finput, S=5FIRUGO, show=5Focc=5Fte=
mp=5Finput,
NULL, 6);
> ++static SENSOR=5FDEVICE=5FATTR(temp7=5Finput, S=5FIRUGO, show=5Focc=5Fte=
mp=5Finput,
NULL, 7);
> ++static SENSOR=5FDEVICE=5FATTR(temp8=5Finput, S=5FIRUGO, show=5Focc=5Fte=
mp=5Finput,
NULL, 8);
> ++static SENSOR=5FDEVICE=5FATTR(temp9=5Finput, S=5FIRUGO, show=5Focc=5Fte=
mp=5Finput,
NULL, 9);
> ++static SENSOR=5FDEVICE=5FATTR(temp1=5Flabel, S=5FIRUGO, show=5Focc=5Fte=
mp=5Flabel,
NULL, 1);
> ++static SENSOR=5FDEVICE=5FATTR(temp2=5Flabel, S=5FIRUGO, show=5Focc=5Fte=
mp=5Flabel,
NULL, 2);
> ++static SENSOR=5FDEVICE=5FATTR(temp3=5Flabel, S=5FIRUGO, show=5Focc=5Fte=
mp=5Flabel,
NULL, 3);
> ++static SENSOR=5FDEVICE=5FATTR(temp4=5Flabel, S=5FIRUGO, show=5Focc=5Fte=
mp=5Flabel,
NULL, 4);
> ++static SENSOR=5FDEVICE=5FATTR(temp5=5Flabel, S=5FIRUGO, show=5Focc=5Fte=
mp=5Flabel,
NULL, 5);
> ++static SENSOR=5FDEVICE=5FATTR(temp6=5Flabel, S=5FIRUGO, show=5Focc=5Fte=
mp=5Flabel,
NULL, 6);
> ++static SENSOR=5FDEVICE=5FATTR(temp7=5Flabel, S=5FIRUGO, show=5Focc=5Fte=
mp=5Flabel,
NULL, 7);
> ++static SENSOR=5FDEVICE=5FATTR(temp8=5Flabel, S=5FIRUGO, show=5Focc=5Fte=
mp=5Flabel,
NULL, 8);
> ++static SENSOR=5FDEVICE=5FATTR(temp9=5Flabel, S=5FIRUGO, show=5Focc=5Fte=
mp=5Flabel,
NULL, 9);
> ++
> ++static SENSOR=5FDEVICE=5FATTR(power1=5Finput, S=5FIRUGO, show=5Focc=5Fp=
ower=5Finput,
NULL, 1);
> ++static SENSOR=5FDEVICE=5FATTR(power1=5Flabel, S=5FIRUGO, show=5Focc=5Fp=
ower=5Flabel,
NULL, 1);
> ++static SENSOR=5FDEVICE=5FATTR(power2=5Finput, S=5FIRUGO, show=5Focc=5Fp=
ower=5Finput,
NULL, 2);
> ++static SENSOR=5FDEVICE=5FATTR(power2=5Flabel, S=5FIRUGO, show=5Focc=5Fp=
ower=5Flabel,
NULL, 2);
> ++static SENSOR=5FDEVICE=5FATTR(power3=5Finput, S=5FIRUGO, show=5Focc=5Fp=
ower=5Finput,
NULL, 3);
> ++static SENSOR=5FDEVICE=5FATTR(power3=5Flabel, S=5FIRUGO, show=5Focc=5Fp=
ower=5Flabel,
NULL, 3);
> ++static SENSOR=5FDEVICE=5FATTR(power4=5Finput, S=5FIRUGO, show=5Focc=5Fp=
ower=5Finput,
NULL, 4);
> ++static SENSOR=5FDEVICE=5FATTR(power4=5Flabel, S=5FIRUGO, show=5Focc=5Fp=
ower=5Flabel,
NULL, 4);
> ++
> ++static SENSOR=5FDEVICE=5FATTR(freq1=5Finput, S=5FIRUGO, show=5Focc=5Ffr=
eq=5Finput,
NULL, 1);
> ++static SENSOR=5FDEVICE=5FATTR(freq1=5Flabel, S=5FIRUGO, show=5Focc=5Ffr=
eq=5Flabel,
NULL, 1);
> ++static SENSOR=5FDEVICE=5FATTR(freq2=5Finput, S=5FIRUGO, show=5Focc=5Ffr=
eq=5Finput,
NULL, 2);
> ++static SENSOR=5FDEVICE=5FATTR(freq2=5Flabel, S=5FIRUGO, show=5Focc=5Ffr=
eq=5Flabel,
NULL, 2);
> ++static SENSOR=5FDEVICE=5FATTR(freq3=5Finput, S=5FIRUGO, show=5Focc=5Ffr=
eq=5Finput,
NULL, 3);
> ++static SENSOR=5FDEVICE=5FATTR(freq3=5Flabel, S=5FIRUGO, show=5Focc=5Ffr=
eq=5Flabel,
NULL, 3);
> ++static SENSOR=5FDEVICE=5FATTR(freq4=5Finput, S=5FIRUGO, show=5Focc=5Ffr=
eq=5Finput,
NULL, 4);
> ++static SENSOR=5FDEVICE=5FATTR(freq4=5Flabel, S=5FIRUGO, show=5Focc=5Ffr=
eq=5Flabel,
NULL, 4);
> ++
> ++static struct attribute *occ=5Fattrs[] =3D {
> ++      &sensor=5Fdev=5Fattr=5Ftemp1=5Finput.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ftemp2=5Finput.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ftemp3=5Finput.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ftemp4=5Finput.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ftemp5=5Finput.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ftemp6=5Finput.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ftemp7=5Finput.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ftemp8=5Finput.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ftemp9=5Finput.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ftemp1=5Flabel.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ftemp2=5Flabel.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ftemp3=5Flabel.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ftemp4=5Flabel.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ftemp5=5Flabel.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ftemp6=5Flabel.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ftemp7=5Flabel.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ftemp8=5Flabel.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ftemp9=5Flabel.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Fpower1=5Finput.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Fpower2=5Finput.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Fpower3=5Finput.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Fpower4=5Finput.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Fpower1=5Flabel.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Fpower2=5Flabel.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Fpower3=5Flabel.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Fpower4=5Flabel.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ffreq1=5Finput.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ffreq2=5Finput.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ffreq3=5Finput.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ffreq4=5Finput.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ffreq1=5Flabel.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ffreq2=5Flabel.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ffreq3=5Flabel.dev=5Fattr.attr,
> ++      &sensor=5Fdev=5Fattr=5Ffreq4=5Flabel.dev=5Fattr.attr,
> ++
> ++      NULL
> ++};
> ++ATTRIBUTE=5FGROUPS(occ);
> ++
> ++#endif
> ++
> ++static struct sensor=5Fdevice=5Fattribute temp=5Finput[] =3D {
> ++      SENSOR=5FATTR(temp1=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput=
, NULL, 1),
> ++      SENSOR=5FATTR(temp2=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput=
, NULL, 2),
> ++      SENSOR=5FATTR(temp3=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput=
, NULL, 3),
> ++      SENSOR=5FATTR(temp4=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput=
, NULL, 4),
> ++      SENSOR=5FATTR(temp5=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput=
, NULL, 5),
> ++      SENSOR=5FATTR(temp6=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput=
, NULL, 6),
> ++      SENSOR=5FATTR(temp7=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput=
, NULL, 7),
> ++      SENSOR=5FATTR(temp8=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput=
, NULL, 8),
> ++      SENSOR=5FATTR(temp9=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput=
, NULL, 9),
> ++      SENSOR=5FATTR(temp10=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finpu=
t, NULL,
10),
> ++      SENSOR=5FATTR(temp11=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finpu=
t, NULL,
11),
> ++      SENSOR=5FATTR(temp12=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finpu=
t, NULL,
12),
> ++      SENSOR=5FATTR(temp13=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finpu=
t, NULL,
13),
> ++      SENSOR=5FATTR(temp14=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finpu=
t, NULL,
14),
> ++      SENSOR=5FATTR(temp15=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finpu=
t, NULL,
15),
> ++      SENSOR=5FATTR(temp16=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finpu=
t, NULL,
16),
> ++      SENSOR=5FATTR(temp17=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finpu=
t, NULL,
17),
> ++      SENSOR=5FATTR(temp18=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finpu=
t, NULL,
18),
> ++      SENSOR=5FATTR(temp19=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finpu=
t, NULL,
19),
> ++      SENSOR=5FATTR(temp20=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finpu=
t, NULL,
20),
> ++      SENSOR=5FATTR(temp21=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finpu=
t, NULL,
21),
> ++      SENSOR=5FATTR(temp22=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finpu=
t, NULL,
22),
> ++};
> ++
> ++static struct sensor=5Fdevice=5Fattribute temp=5Flabel[] =3D {
> ++      SENSOR=5FATTR(temp1=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel=
, NULL, 1),
> ++      SENSOR=5FATTR(temp2=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel=
, NULL, 2),
> ++      SENSOR=5FATTR(temp3=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel=
, NULL, 3),
> ++      SENSOR=5FATTR(temp4=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel=
, NULL, 4),
> ++      SENSOR=5FATTR(temp5=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel=
, NULL, 5),
> ++      SENSOR=5FATTR(temp6=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel=
, NULL, 6),
> ++      SENSOR=5FATTR(temp7=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel=
, NULL, 7),
> ++      SENSOR=5FATTR(temp8=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel=
, NULL, 8),
> ++      SENSOR=5FATTR(temp9=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel=
, NULL, 9),
> ++      SENSOR=5FATTR(temp10=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabe=
l, NULL,
10),
> ++      SENSOR=5FATTR(temp11=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabe=
l, NULL,
11),
> ++      SENSOR=5FATTR(temp12=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabe=
l, NULL,
12),
> ++      SENSOR=5FATTR(temp13=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabe=
l, NULL,
13),
> ++      SENSOR=5FATTR(temp14=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabe=
l, NULL,
14),
> ++      SENSOR=5FATTR(temp15=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabe=
l, NULL,
15),
> ++      SENSOR=5FATTR(temp16=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabe=
l, NULL,
16),
> ++      SENSOR=5FATTR(temp17=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabe=
l, NULL,
17),
> ++      SENSOR=5FATTR(temp18=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabe=
l, NULL,
18),
> ++      SENSOR=5FATTR(temp19=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabe=
l, NULL,
19),
> ++      SENSOR=5FATTR(temp20=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabe=
l, NULL,
20),
> ++      SENSOR=5FATTR(temp21=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabe=
l, NULL,
21),
> ++      SENSOR=5FATTR(temp22=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabe=
l, NULL,
22),
> ++
> ++};
> ++
> ++#define TEMP=5FUNIT=5FATTRS(X)                      \
> ++{     &temp=5Finput[X].dev=5Fattr.attr,           \
> ++      &temp=5Flabel[X].dev=5Fattr.attr,          \
> ++      NULL                                    \
> ++}
> ++
> ++/* 10-core CPU, occ has 22 temp sensors, more socket, more sensors */
> ++static struct attribute *occ=5Ftemp=5Fattr[][3] =3D {
> ++      TEMP=5FUNIT=5FATTRS(0),
> ++      TEMP=5FUNIT=5FATTRS(1),
> ++      TEMP=5FUNIT=5FATTRS(2),
> ++      TEMP=5FUNIT=5FATTRS(3),
> ++      TEMP=5FUNIT=5FATTRS(4),
> ++      TEMP=5FUNIT=5FATTRS(5),
> ++      TEMP=5FUNIT=5FATTRS(6),
> ++      TEMP=5FUNIT=5FATTRS(7),
> ++      TEMP=5FUNIT=5FATTRS(8),
> ++      TEMP=5FUNIT=5FATTRS(9),
> ++      TEMP=5FUNIT=5FATTRS(10),
> ++      TEMP=5FUNIT=5FATTRS(11),
> ++      TEMP=5FUNIT=5FATTRS(12),
> ++      TEMP=5FUNIT=5FATTRS(13),
> ++      TEMP=5FUNIT=5FATTRS(14),
> ++      TEMP=5FUNIT=5FATTRS(15),
> ++      TEMP=5FUNIT=5FATTRS(16),
> ++      TEMP=5FUNIT=5FATTRS(17),
> ++      TEMP=5FUNIT=5FATTRS(18),
> ++      TEMP=5FUNIT=5FATTRS(19),
> ++      TEMP=5FUNIT=5FATTRS(20),
> ++      TEMP=5FUNIT=5FATTRS(21),
> ++};
> ++
> ++static const struct attribute=5Fgroup occ=5Ftemp=5Fattr=5Fgroup[] =3D {
> ++      { .attrs =3D occ=5Ftemp=5Fattr[0] },
> ++      { .attrs =3D occ=5Ftemp=5Fattr[1] },
> ++      { .attrs =3D occ=5Ftemp=5Fattr[2] },
> ++      { .attrs =3D occ=5Ftemp=5Fattr[3] },
> ++      { .attrs =3D occ=5Ftemp=5Fattr[4] },
> ++      { .attrs =3D occ=5Ftemp=5Fattr[5] },
> ++      { .attrs =3D occ=5Ftemp=5Fattr[6] },
> ++      { .attrs =3D occ=5Ftemp=5Fattr[7] },
> ++      { .attrs =3D occ=5Ftemp=5Fattr[8] },
> ++      { .attrs =3D occ=5Ftemp=5Fattr[9] },
> ++      { .attrs =3D occ=5Ftemp=5Fattr[10] },
> ++      { .attrs =3D occ=5Ftemp=5Fattr[11] },
> ++      { .attrs =3D occ=5Ftemp=5Fattr[12] },
> ++      { .attrs =3D occ=5Ftemp=5Fattr[13] },
> ++      { .attrs =3D occ=5Ftemp=5Fattr[14] },
> ++      { .attrs =3D occ=5Ftemp=5Fattr[15] },
> ++      { .attrs =3D occ=5Ftemp=5Fattr[16] },
> ++      { .attrs =3D occ=5Ftemp=5Fattr[17] },
> ++      { .attrs =3D occ=5Ftemp=5Fattr[18] },
> ++      { .attrs =3D occ=5Ftemp=5Fattr[19] },
> ++      { .attrs =3D occ=5Ftemp=5Fattr[20] },
> ++      { .attrs =3D occ=5Ftemp=5Fattr[21] },
> ++};
> ++
> ++
> ++static struct sensor=5Fdevice=5Fattribute freq=5Finput[] =3D {
> ++      SENSOR=5FATTR(freq1=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput=
, NULL, 1),
> ++      SENSOR=5FATTR(freq2=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput=
, NULL, 2),
> ++      SENSOR=5FATTR(freq3=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput=
, NULL, 3),
> ++      SENSOR=5FATTR(freq4=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput=
, NULL, 4),
> ++      SENSOR=5FATTR(freq5=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput=
, NULL, 5),
> ++      SENSOR=5FATTR(freq6=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput=
, NULL, 6),
> ++      SENSOR=5FATTR(freq7=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput=
, NULL, 7),
> ++      SENSOR=5FATTR(freq8=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput=
, NULL, 8),
> ++      SENSOR=5FATTR(freq9=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput=
, NULL, 9),
> ++      SENSOR=5FATTR(freq10=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finpu=
t, NULL,
10),
> ++};
> ++
> ++static struct sensor=5Fdevice=5Fattribute freq=5Flabel[] =3D {
> ++      SENSOR=5FATTR(freq1=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel=
, NULL, 1),
> ++      SENSOR=5FATTR(freq2=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel=
, NULL, 2),
> ++      SENSOR=5FATTR(freq3=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel=
, NULL, 3),
> ++      SENSOR=5FATTR(freq4=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel=
, NULL, 4),
> ++      SENSOR=5FATTR(freq5=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel=
, NULL, 5),
> ++      SENSOR=5FATTR(freq6=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel=
, NULL, 6),
> ++      SENSOR=5FATTR(freq7=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel=
, NULL, 7),
> ++      SENSOR=5FATTR(freq8=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel=
, NULL, 8),
> ++      SENSOR=5FATTR(freq9=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel=
, NULL, 9),
> ++      SENSOR=5FATTR(freq10=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabe=
l, NULL,
10),
> ++
> ++};
> ++
> ++#define FREQ=5FUNIT=5FATTRS(X)                      \
> ++{     &freq=5Finput[X].dev=5Fattr.attr,           \
> ++      &freq=5Flabel[X].dev=5Fattr.attr,          \
> ++      NULL                                    \
> ++}
> ++
> ++/* 10-core CPU, occ has 22 freq sensors, more socket, more sensors */
> ++static struct attribute *occ=5Ffreq=5Fattr[][3] =3D {
> ++      FREQ=5FUNIT=5FATTRS(0),
> ++      FREQ=5FUNIT=5FATTRS(1),
> ++      FREQ=5FUNIT=5FATTRS(2),
> ++      FREQ=5FUNIT=5FATTRS(3),
> ++      FREQ=5FUNIT=5FATTRS(4),
> ++      FREQ=5FUNIT=5FATTRS(5),
> ++      FREQ=5FUNIT=5FATTRS(6),
> ++      FREQ=5FUNIT=5FATTRS(7),
> ++      FREQ=5FUNIT=5FATTRS(8),
> ++      FREQ=5FUNIT=5FATTRS(9),
> ++};
> ++
> ++static const struct attribute=5Fgroup occ=5Ffreq=5Fattr=5Fgroup[] =3D {
> ++      { .attrs =3D occ=5Ffreq=5Fattr[0] },
> ++      { .attrs =3D occ=5Ffreq=5Fattr[1] },
> ++      { .attrs =3D occ=5Ffreq=5Fattr[2] },
> ++      { .attrs =3D occ=5Ffreq=5Fattr[3] },
> ++      { .attrs =3D occ=5Ffreq=5Fattr[4] },
> ++      { .attrs =3D occ=5Ffreq=5Fattr[5] },
> ++      { .attrs =3D occ=5Ffreq=5Fattr[6] },
> ++      { .attrs =3D occ=5Ffreq=5Fattr[7] },
> ++      { .attrs =3D occ=5Ffreq=5Fattr[8] },
> ++      { .attrs =3D occ=5Ffreq=5Fattr[9] },
> ++};
> ++
> ++static struct sensor=5Fdevice=5Fattribute=5F2 caps=5Fcurr=5Fpowercap[] =
=3D {
> ++      SENSOR=5FATTR=5F2(caps=5Fcurr=5Fpowercap, S=5FIRUGO, show=5Focc=
=5Fcaps, NULL,
0, 1),
> ++};
> ++static struct sensor=5Fdevice=5Fattribute=5F2 caps=5Fcurr=5Fpowerreadin=
g[] =3D {
> ++      SENSOR=5FATTR=5F2(caps=5Fcurr=5Fpowerreading, S=5FIRUGO, show=5Fo=
cc=5Fcaps,
NULL, 1, 1),
> ++};
> ++static struct sensor=5Fdevice=5Fattribute=5F2 caps=5Fnorm=5Fpowercap[] =
=3D {
> ++      SENSOR=5FATTR=5F2(caps=5Fnorm=5Fpowercap, S=5FIRUGO, show=5Focc=
=5Fcaps, NULL,
2, 1),
> ++};
> ++static struct sensor=5Fdevice=5Fattribute=5F2 caps=5Fmax=5Fpowercap[] =
=3D {
> ++      SENSOR=5FATTR=5F2(caps=5Fmax=5Fpowercap, S=5FIRUGO, show=5Focc=5F=
caps, NULL, 3,
1),
> ++};
> ++static struct sensor=5Fdevice=5Fattribute=5F2 caps=5Fmin=5Fpowercap[] =
=3D {
> ++      SENSOR=5FATTR=5F2(caps=5Fmin=5Fpowercap, S=5FIRUGO, show=5Focc=5F=
caps, NULL, 4,
1),
> ++};
> ++static struct sensor=5Fdevice=5Fattribute=5F2 caps=5Fuser=5Fpowerlimit[=
] =3D {
> ++      SENSOR=5FATTR=5F2(caps=5Fuser=5Fpowerlimit, S=5FIRUGO, show=5Focc=
=5Fcaps, NULL,
5, 1),
> ++};
> ++#define CAPS=5FUNIT=5FATTRS(X)                      \
> ++{     &caps=5Fcurr=5Fpowercap[X].dev=5Fattr.attr,           \
> ++      &caps=5Fcurr=5Fpowerreading[X].dev=5Fattr.attr,           \
> ++      &caps=5Fnorm=5Fpowercap[X].dev=5Fattr.attr,           \
> ++      &caps=5Fmax=5Fpowercap[X].dev=5Fattr.attr,           \
> ++      &caps=5Fmin=5Fpowercap[X].dev=5Fattr.attr,           \
> ++      &caps=5Fuser=5Fpowerlimit[X].dev=5Fattr.attr,           \
> ++      NULL                                    \
> ++}
> ++
> ++/* 10-core CPU, occ has 1 caps sensors */
> ++static struct attribute *occ=5Fcaps=5Fattr[][7] =3D {
> ++      CAPS=5FUNIT=5FATTRS(0),
> ++};
> ++static const struct attribute=5Fgroup occ=5Fcaps=5Fattr=5Fgroup[] =3D {
> ++      { .attrs =3D occ=5Fcaps=5Fattr[0] },
> ++};
> ++
> ++static struct sensor=5Fdevice=5Fattribute power=5Finput[] =3D {
> ++      SENSOR=5FATTR(power1=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finp=
ut, NULL,
1),
> ++      SENSOR=5FATTR(power2=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finp=
ut, NULL,
2),
> ++      SENSOR=5FATTR(power3=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finp=
ut, NULL,
3),
> ++      SENSOR=5FATTR(power4=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finp=
ut, NULL,
4),
> ++      SENSOR=5FATTR(power5=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finp=
ut, NULL,
5),
> ++      SENSOR=5FATTR(power6=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finp=
ut, NULL,
6),
> ++      SENSOR=5FATTR(power7=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finp=
ut, NULL,
7),
> ++      SENSOR=5FATTR(power8=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finp=
ut, NULL,
8),
> ++      SENSOR=5FATTR(power9=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finp=
ut, NULL,
9),
> ++      SENSOR=5FATTR(power10=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Fin=
put, NULL,
10),
> ++      SENSOR=5FATTR(power11=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Fin=
put, NULL,
11),
> ++};
> ++
> ++static struct sensor=5Fdevice=5Fattribute power=5Flabel[] =3D {
> ++      SENSOR=5FATTR(power1=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flab=
el, NULL,
1),
> ++      SENSOR=5FATTR(power2=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flab=
el, NULL,
2),
> ++      SENSOR=5FATTR(power3=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flab=
el, NULL,
3),
> ++      SENSOR=5FATTR(power4=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flab=
el, NULL,
4),
> ++      SENSOR=5FATTR(power5=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flab=
el, NULL,
5),
> ++      SENSOR=5FATTR(power6=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flab=
el, NULL,
6),
> ++      SENSOR=5FATTR(power7=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flab=
el, NULL,
7),
> ++      SENSOR=5FATTR(power8=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flab=
el, NULL,
8),
> ++      SENSOR=5FATTR(power9=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flab=
el, NULL,
9),
> ++      SENSOR=5FATTR(power10=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Fla=
bel, NULL,
10),
> ++      SENSOR=5FATTR(power11=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Fla=
bel, NULL,
11),
> ++};
> ++
> ++#define POWER=5FUNIT=5FATTRS(X)                      \
> ++{     &power=5Finput[X].dev=5Fattr.attr,           \
> ++      &power=5Flabel[X].dev=5Fattr.attr,          \
> ++      NULL                                    \
> ++}
> ++
> ++/* 10-core CPU, occ has 11 power sensors, more socket, more sensors */
> ++static struct attribute *occ=5Fpower=5Fattr[][3] =3D {
> ++      POWER=5FUNIT=5FATTRS(0),
> ++      POWER=5FUNIT=5FATTRS(1),
> ++      POWER=5FUNIT=5FATTRS(2),
> ++      POWER=5FUNIT=5FATTRS(3),
> ++      POWER=5FUNIT=5FATTRS(4),
> ++      POWER=5FUNIT=5FATTRS(5),
> ++      POWER=5FUNIT=5FATTRS(6),
> ++      POWER=5FUNIT=5FATTRS(7),
> ++      POWER=5FUNIT=5FATTRS(8),
> ++      POWER=5FUNIT=5FATTRS(9),
> ++      POWER=5FUNIT=5FATTRS(10),
> ++};
> ++
> ++static const struct attribute=5Fgroup occ=5Fpower=5Fattr=5Fgroup[] =3D {
> ++      { .attrs =3D occ=5Fpower=5Fattr[0] },
> ++      { .attrs =3D occ=5Fpower=5Fattr[1] },
> ++      { .attrs =3D occ=5Fpower=5Fattr[2] },
> ++      { .attrs =3D occ=5Fpower=5Fattr[3] },
> ++      { .attrs =3D occ=5Fpower=5Fattr[4] },
> ++      { .attrs =3D occ=5Fpower=5Fattr[5] },
> ++      { .attrs =3D occ=5Fpower=5Fattr[6] },
> ++      { .attrs =3D occ=5Fpower=5Fattr[7] },
> ++      { .attrs =3D occ=5Fpower=5Fattr[8] },
> ++      { .attrs =3D occ=5Fpower=5Fattr[9] },
> ++      { .attrs =3D occ=5Fpower=5Fattr[10] },
> ++};
> ++
> ++static void occ=5Fremove=5Fsysfs=5Ffiles(struct device *dev)
> ++{
> ++      int i =3D 0;
> ++
> ++      for (i =3D 0; i < ARRAY=5FSIZE(occ=5Ftemp=5Fattr=5Fgroup); i++)
> ++              sysfs=5Fremove=5Fgroup(&dev->kobj, &occ=5Ftemp=5Fattr=5Fg=
roup[i]);
> ++
> ++      for (i =3D 0; i < ARRAY=5FSIZE(occ=5Ffreq=5Fattr=5Fgroup); i++)
> ++              sysfs=5Fremove=5Fgroup(&dev->kobj, &occ=5Ffreq=5Fattr=5Fg=
roup[i]);
> ++
> ++      for (i =3D 0; i < ARRAY=5FSIZE(occ=5Fpower=5Fattr=5Fgroup); i++)
> ++              sysfs=5Fremove=5Fgroup(&dev->kobj, &occ=5Fpower=5Fattr=5F=
group[i]);
> ++
> ++      for (i =3D 0; i < ARRAY=5FSIZE(occ=5Fcaps=5Fattr=5Fgroup); i++)
> ++              sysfs=5Fremove=5Fgroup(&dev->kobj, &occ=5Fcaps=5Fattr=5Fg=
roup[i]);
> ++}
> ++
> ++
> ++static int occ=5Fcreate=5Fsysfs=5Fattribute(struct device *dev)
> ++{
> ++      /* The sensor number varies for different
> ++       * platform depending on core number. We'd better
> ++       * create them dynamically  */
> ++      struct occ=5Fdrv=5Fdata *data =3D dev=5Fget=5Fdrvdata(dev);
> ++      int i =3D 0;
> ++      int num=5Fof=5Fsensors =3D 0;
> ++      int ret =3D 0;
> ++
> ++      /* get sensor number from occ. */
> ++      ret =3D occ=5Fupdate=5Fdevice(dev);
> ++      if (ret !=3D 0)
> ++      {
> ++              /* FIXME: to test fake data */
> ++              printk("ERROR: cannot get occ sensor data: %d\n", ret);
> ++              return ret;
> ++      }
> ++
> ++      if (data->occ=5Fresp.data.blocks =3D=3D NULL)
> ++              return -1;
> ++
> ++      /* temp sensors */
> ++      if (data->occ=5Fresp.temp=5Fblock=5Fid >=3D 0)
> ++      {
> ++              num=5Fof=5Fsensors =3D data->occ=5Fresp.data.blocks[data->
occ=5Fresp.temp=5Fblock=5Fid].num=5Fof=5Fsensors;
> ++              for (i =3D 0; i < num=5Fof=5Fsensors; i++)
> ++              {
> ++                      //printk("create temp group: %d\n", i);
> ++                      //ret =3D sysfs=5Fcreate=5Fgroup(&dev->kobj,
&occ=5Ftemp=5Fattr=5Fgroup[i]);
> ++                      ret =3D sysfs=5Fcreate=5Fgroup(&data->hwmon=5Fdev=
->kobj,
&occ=5Ftemp=5Fattr=5Fgroup[i]);
> ++                      if (ret)
> ++                      {
> ++                              dev=5Ferr(dev, "error create temp sysfs
entry\n");
> ++                              goto error;
> ++                      }
> ++              }
> ++      }
> ++
> ++      /* freq sensors */
> ++      if (data->occ=5Fresp.freq=5Fblock=5Fid >=3D 0)
> ++      {
> ++              num=5Fof=5Fsensors =3D data->occ=5Fresp.data.blocks[data->
occ=5Fresp.freq=5Fblock=5Fid].num=5Fof=5Fsensors;
> ++              for (i =3D 0; i < num=5Fof=5Fsensors; i++)
> ++              {
> ++                      //printk("create freq group: %d\n", i);
> ++                      //ret =3D sysfs=5Fcreate=5Fgroup(&dev->kobj,
&occ=5Ftemp=5Fattr=5Fgroup[i]);
> ++                      ret =3D sysfs=5Fcreate=5Fgroup(&data->hwmon=5Fdev=
->kobj,
&occ=5Ffreq=5Fattr=5Fgroup[i]);
> ++                      if (ret)
> ++                      {
> ++                              dev=5Ferr(dev, "error create freq sysfs
entry\n");
> ++                              goto error;
> ++                      }
> ++              }
> ++      }
> ++
> ++      /* power sensors */
> ++      //printk("power=5Fblock=5Fid: %d\n", data->occ=5Fresp.power=5Fblo=
ck=5Fid);
> ++      if (data->occ=5Fresp.power=5Fblock=5Fid >=3D 0)
> ++      {
> ++              num=5Fof=5Fsensors =3D data->occ=5Fresp.data.blocks[data->
occ=5Fresp.power=5Fblock=5Fid].num=5Fof=5Fsensors;
> ++              for (i =3D 0; i < num=5Fof=5Fsensors; i++)
> ++              {
> ++                      //printk("create power group: %d\n", i);
> ++                      //ret =3D sysfs=5Fcreate=5Fgroup(&dev->kobj,
&occ=5Ftemp=5Fattr=5Fgroup[i]);
> ++                      ret =3D sysfs=5Fcreate=5Fgroup(&data->hwmon=5Fdev=
->kobj,
&occ=5Fpower=5Fattr=5Fgroup[i]);
> ++                      if (ret)
> ++                      {
> ++                              dev=5Ferr(dev, "error create power sysfs
entry\n");
> ++                              goto error;
> ++                      }
> ++              }
> ++      }
> ++
> ++      /* caps sensors */
> ++      //printk("caps=5Fblock=5Fid: %d\n", data->occ=5Fresp.caps=5Fblock=
=5Fid);
> ++      if (data->occ=5Fresp.caps=5Fblock=5Fid >=3D 0)
> ++      {
> ++              num=5Fof=5Fsensors =3D data->occ=5Fresp.data.blocks[data->
occ=5Fresp.caps=5Fblock=5Fid].num=5Fof=5Fsensors;
> ++              for (i =3D 0; i < num=5Fof=5Fsensors; i++)
> ++              {
> ++                      //printk("create caps group: %d\n", i);
> ++                      //ret =3D sysfs=5Fcreate=5Fgroup(&dev->kobj,
&occ=5Ftemp=5Fattr=5Fgroup[i]);
> ++                      ret =3D sysfs=5Fcreate=5Fgroup(&data->hwmon=5Fdev=
->kobj,
&occ=5Fcaps=5Fattr=5Fgroup[i]);
> ++                      if (ret)
> ++                      {
> ++                              dev=5Ferr(dev, "error create caps sysfs
entry\n");
> ++                              goto error;
> ++                      }
> ++              }
> ++      }
> ++
> ++      return 0;
> ++error:
> ++      occ=5Fremove=5Fsysfs=5Ffiles(data->hwmon=5Fdev);
> ++      return ret;
> ++}
> ++
> +
+/*-----------------------------------------------------------------------*/

> ++/* device probe and removal */
> ++
> ++#define OCC=5FI2C=5FADDR 0x50
> ++#define OCC=5FI2C=5FNAME "occ-i2c"
> ++
> ++enum occ=5Ftype {
> ++      occ=5Fid,
> ++};
> ++
> ++static int occ=5Fprobe(struct i2c=5Fclient *client, const struct
i2c=5Fdevice=5Fid *id)
> ++{
> ++      struct device *dev =3D &client->dev;
> ++      struct occ=5Fdrv=5Fdata *data;
> ++      unsigned long funcs;
> ++      struct device=5Fnode *np =3D dev->of=5Fnode;
> ++      //u32 pval =3D 0;
> ++      int ret =3D 0;
> ++
> ++      data =3D devm=5Fkzalloc(dev, sizeof(struct occ=5Fdrv=5Fdata),
GFP=5FKERNEL);
> ++      if (!data)
> ++              return -ENOMEM;
> ++
> ++      data->client =3D client;
> ++      i2c=5Fset=5Fclientdata(client, data);
> ++      mutex=5Finit(&data->update=5Flock);
> ++      data->sample=5Ftime =3D HZ;
> ++
> ++      /* Yi: i2c-core should assign address to
> ++       * client when detection - but it does not work  FIXME  */
> ++      //client->addr =3D OCC=5FI2C=5FADDR;
> ++
> ++      /* Yi: read address from device table */
> ++      //if (of=5Fproperty=5Fread=5Fu32(np, "reg", &pval)) {
> ++      //      dev=5Ferr(&client->dev, "invalid reg\n");
> ++      //}
> ++      //client->addr =3D pval;
> ++
> ++      /* configure the driver */
> ++      //dev=5Fdbg(dev, "occ register hwmon @0x%x\n", client->addr);
> ++      //data->hwmon=5Fdev =3D hwmon=5Fdevice=5Fregister=5Fwith=5Fgroups=
(dev, "occ",
> ++      //                                                  data,
occ=5Fgroups);
> ++
> ++      /* Yi: try to create sysfs attributes dynamically */
> ++      data->hwmon=5Fdev =3D hwmon=5Fdevice=5Fregister(dev);
> ++      if (IS=5FERR(data->hwmon=5Fdev))
> ++              return PTR=5FERR(data->hwmon=5Fdev);
> ++
> ++      ret =3D occ=5Fcreate=5Fsysfs=5Fattribute(dev);
> ++      if (ret)
> ++      {
> ++              hwmon=5Fdevice=5Funregister(data->hwmon=5Fdev);
> ++              return ret;
> ++      }
> ++
> ++      data->hwmon=5Fdev->parent =3D dev;
> ++
> ++      //dev=5Fdbg(dev, "%s: sensor '%s'\n",
> ++      //       dev=5Fname(data->hwmon=5Fdev), client->name);
> ++
> ++      funcs =3D i2c=5Fget=5Ffunctionality(client->adapter);
> ++      //dev=5Finfo(dev, "i2c adaptor supports function: 0x%lx\n", funcs=
);
> ++
> ++      /* Yi: seems always error? disable for now */
> ++      //occ=5Fcheck=5Fi2c=5Ferrors(client);
> ++
> ++      //dev=5Finfo(dev, "occ i2c driver ready: i2c addr@0x%x\n", client=
->
addr);
> ++      printk("occ i2c driver ready: i2c addr@0x%x\n", client->addr);
> ++
> ++      return 0;
> ++}
> ++
> ++static int occ=5Fremove(struct i2c=5Fclient *client)
> ++{
> ++      struct occ=5Fdrv=5Fdata *data =3D i2c=5Fget=5Fclientdata(client);
> ++
> ++      /* free allocated sensor memory */
> ++      deinit=5Focc=5Fresp=5Fbuf(&data->occ=5Fresp);
> ++
> ++      //occ=5Fremove=5Fsysfs=5Ffiles(&client->dev);
> ++      occ=5Fremove=5Fsysfs=5Ffiles(data->hwmon=5Fdev);
> ++      hwmon=5Fdevice=5Funregister(data->hwmon=5Fdev);
> ++      return 0;
> ++}
> ++
> ++/* used for old-style board info */
> ++static const struct i2c=5Fdevice=5Fid occ=5Fids[] =3D {
> ++      { OCC=5FI2C=5FNAME, occ=5Fid, },
> ++      { /* LIST END */ }
> ++};
> ++MODULE=5FDEVICE=5FTABLE(i2c, occ=5Fids);
> ++
> ++static const struct of=5Fdevice=5Fid i2c=5Focc=5Fof=5Fmatch[] =3D {
> ++      {.compatible =3D "ibm,occ-i2c"},
> ++      {},
> ++};
> ++
> ++MODULE=5FDEVICE=5FTABLE(of, i2c=5Focc=5Fof=5Fmatch);
> ++
> ++#ifdef CONFIG=5FPM
> ++static int occ=5Fsuspend(struct device *dev)
> ++{
> ++      //struct i2c=5Fclient *client =3D to=5Fi2c=5Fclient(dev);
> ++      /* TODO */
> ++      return 0;
> ++}
> ++
> ++static int occ=5Fresume(struct device *dev)
> ++{
> ++      //struct i2c=5Fclient *client =3D to=5Fi2c=5Fclient(dev);
> ++      /* TODO */
> ++      return 0;
> ++}
> ++
> ++static const struct dev=5Fpm=5Fops occ=5Fdev=5Fpm=5Fops =3D {
> ++      .suspend        =3D occ=5Fsuspend,
> ++      .resume         =3D occ=5Fresume,
> ++};
> ++#define OCC=5FDEV=5FPM=5FOPS (&occ=5Fdev=5Fpm=5Fops)
> ++#else
> ++#define OCC=5FDEV=5FPM=5FOPS NULL
> ++#endif /* CONFIG=5FPM */
> ++
> ++/* Yi: i2c-core uses i2c-detect() to detect device in bellow address
list.
> ++   If exists, address will be assigned to client.
> ++ * It is also possible to read address from device table. */
> ++static const unsigned short normal=5Fi2c[] =3D {0x50, 0x51,
I2C=5FCLIENT=5FEND };
> ++
> ++/* Return 0 if detection is successful, -ENODEV otherwise */
> ++static int occ=5Fdetect(struct i2c=5Fclient *new=5Fclient,
> ++                     struct i2c=5Fboard=5Finfo *info)
> ++{
> ++      /* i2c-core need this function to create new device */
> ++      strncpy(info->type, OCC=5FI2C=5FNAME, sizeof(OCC=5FI2C=5FNAME));
> ++      return 0;
> ++}
> ++
> ++static struct i2c=5Fdriver occ=5Fdriver =3D {
> ++      .class          =3D I2C=5FCLASS=5FHWMON,
> ++      .driver =3D {
> ++              .name   =3D OCC=5FI2C=5FNAME,
> ++              .pm     =3D OCC=5FDEV=5FPM=5FOPS,
> ++              .of=5Fmatch=5Ftable =3D i2c=5Focc=5Fof=5Fmatch,
> ++      },
> ++      .probe          =3D occ=5Fprobe,
> ++      .remove         =3D occ=5Fremove,
> ++      .id=5Ftable       =3D occ=5Fids,
> ++      .address=5Flist   =3D normal=5Fi2c,
> ++      .detect         =3D occ=5Fdetect,
> ++};
> ++
> ++module=5Fi2c=5Fdriver(occ=5Fdriver);
> ++
> ++#if 0
> ++/* Create new i2c device */
> ++static struct i2c=5Fboard=5Finfo my=5Fdev=5Finfo[] =5F=5Finitdata =3D {
> ++      {
> ++              I2C=5FBOARD=5FINFO(OCC=5FI2C=5FNAME, 0x50),
> ++      },
> ++};
> ++
> ++static struct i2c=5Fclient *my=5Fclient;
> ++
> ++static int occ=5Finit(void)
> ++{
> ++      static int sys=5Fadap=5Fbus=5Fnum =3D 3;
> ++      struct i2c=5Fadapter* adap =3D i2c=5Fget=5Fadapter(sys=5Fadap=5Fb=
us=5Fnum);
> ++
> ++      if(adap=3D=3DNULL) {
> ++              printk("[OCC-DEBUG] i2c=5Fget=5Fadapter fail!\n");
> ++              return -1;
> ++      }
> ++
> ++      my=5Fclient =3D i2c=5Fnew=5Fdevice(adap, &my=5Fdev=5Finfo[0]);
> ++      if( my=5Fclient=3D=3DNULL ){
> ++              printk("[OCC-DEBUG] i2c=5Fnew=5Fdevice fail!\n");
> ++              return -1;
> ++      }
> ++      i2c=5Fput=5Fadapter(adap);
> ++      return i2c=5Fadd=5Fdriver(&occ=5Fdriver);
> ++}
> ++
> ++static void =5F=5Fexit occ=5Fexit(void)
> ++{
> ++      i2c=5Funregister=5Fdevice(my=5Fclient);
> ++      i2c=5Fdel=5Fdriver(&occ=5Fdriver);
> ++}
> ++
> ++module=5Finit(occ=5Finit);
> ++module=5Fexit(occ=5Fexit);
> ++
> ++#endif
> ++
> ++MODULE=5FAUTHOR("Li Yi <shliyi@cn.ibm.com>");
> ++MODULE=5FDESCRIPTION("BMC OCC monitor driver");
> ++MODULE=5FLICENSE("GPL");
> diff --git
a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc=5F%.bbappend

b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc=5F%.bbappend

> index b106e5a..1099689 100644
> ---
a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc=5F%.bbappend

> +++
b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipe=
s-kernel/linux/linux-obmc=5F%.bbappend

> @@ -1 +1,3 @@
>  FILESEXTRAPATHS=5Fprepend :=3D "${THISDIR}/linux-obmc:"
> +SRC=5FURI +=3D "file://barreleye.cfg"
> +SRC=5FURI +=3D "file://occ=5Fhwmon.patch"
> --
> 2.6.3
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



--1__=8FBBF59BDFC5AC088f9e8a93df938690918c8FBBF59BDFC5AC08
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

<html><body><p>Hi Stanley,<br><br>Thanks for your detailed comments. I will=
 made changes based on your suggestions.<br><br>Yi Li (Adam)<br>OpenPower C=
hina Application Engineer Team<br>021-60928951<br>13524695440<br><br><br><i=
mg width=3D"16" height=3D"16" src=3D"cid:3=5F=5F=3D8FBBF59BDFC5AC088f9e8a93=
df938690918c8FB@" border=3D"0" alt=3D"Inactive hide details for Joel Stanle=
y ---11/25/2015 07:35:17 AM---From: Joel Stanley &lt;joel@jms.id.au&gt; To:=
 OpenBMC Patches &lt;ope"><font color=3D"#424282">Joel Stanley ---11/25/201=
5 07:35:17 AM---From: Joel Stanley &lt;joel@jms.id.au&gt; To: OpenBMC Patch=
es &lt;openbmc-patches@stwcx.xyz&gt;</font><br><br><font size=3D"2" color=
=3D"#5F5F5F">From:        </font><font size=3D"2">Joel Stanley &lt;joel@jms=
.id.au&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">To:        </font><=
font size=3D"2">OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt;</font><br=
><font size=3D"2" color=3D"#5F5F5F">Cc:        </font><font size=3D"2">adam=
liyi &lt;adamliyi@msn.com&gt;, OpenBMC Maillist &lt;openbmc@lists.ozlabs.or=
g&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">Date:        </font><fon=
t size=3D"2">11/25/2015 07:35 AM</font><br><font size=3D"2" color=3D"#5F5F5=
F">Subject:        </font><font size=3D"2">Re: [PATCH openbmc] add occ hwmo=
n driver as kernel patch</font><br><font size=3D"2" color=3D"#5F5F5F">Sent =
by:        </font><font size=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+=
shliyi=3Dcn.ibm.com@lists.ozlabs.org&gt;</font><br><hr width=3D"100%" size=
=3D"2" align=3D"left" noshade style=3D"color:#8091A5; "><br><br><br><tt>Hel=
lo Adam,<br><br>Thanks for posting your code.<br><br>I've had a quick look =
and pointed out some style related changes that<br>you can make. This is im=
portant in getting upstream to accept your<br>patch, but also to make the c=
ode clear.<br><br>Once you've made the fixes I suggest, try running your pa=
tch through<br>scripts/checkpatch.pl in the Linux source tree. This will po=
int out<br>lines that do not confirm to the coding standards the kernel use=
s. Try<br>to fix all of these warnings, and send an updated version of the<=
br>patch.<br><br>Next time you send the patch, send it as a PR to the kerne=
l tree at<br></tt><tt><a href=3D"https://github.com/openbmc/linux">https://=
github.com/openbmc/linux</a></tt><tt>. This is easier than reading a<br>pat=
ch-against-patch, and it's good practice for submitting the patch<br>upstre=
am.<br><br>Please jump on the IRC channel at #openbmc on irc.freenode.net i=
f you<br>want do discuss any changes, or have any questions.<br><br>Once yo=
u've fixed up the style issues, we will see what changes need<br>to be made=
 to the structure of the driver.<br><br>Cheers,<br><br>Joel<br><br>On Wed, =
Nov 25, 2015 at 3:10 AM, OpenBMC Patches<br>&lt;openbmc-patches@stwcx.xyz&g=
t; wrote:<br>&gt; +--- a/drivers/hwmon/Kconfig<br>&gt; ++++ b/drivers/hwmon=
/Kconfig<br>&gt; +@@ -1167,6 +1167,13 @@ config SENSORS=5FNCT7904<br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp; This driver can also be built as a module. &nb=
sp;If so, the module<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; will be called n=
ct7904.<br>&gt; +<br>&gt; ++config SENSORS=5FOCC<br>&gt; ++ &nbsp; &nbsp; &=
nbsp;tristate &quot;OCC sensor driver for IBM Power CPU&quot;<br>&gt; ++ &n=
bsp; &nbsp; &nbsp;depends on I2C<br>&gt; ++ &nbsp; &nbsp; &nbsp;help<br>&gt=
; ++ &nbsp; &nbsp; &nbsp; &nbsp;If you say yes here you get support for dri=
ver to read sensors in<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;IBM Power CPU =
On-Chip-Controller. module will be called occ.<br><br>Is this a driver for =
BMCs, or for the Power8 host? This should be made clear.<br><br>&gt; ++<br>=
&gt; + config SENSORS=5FPCF8591<br>&gt; + &nbsp; &nbsp; &nbsp; tristate &qu=
ot;Philips PCF8591 ADC/DAC&quot;<br>&gt; + &nbsp; &nbsp; &nbsp; depends on =
I2C<br>&gt; +diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile<b=
r>&gt; +index 9e0f3dd..53dc3b3 100644<br>&gt; +--- a/drivers/hwmon/Makefile=
<br>&gt; ++++ b/drivers/hwmon/Makefile<br>&gt; +@@ -123,6 +123,7 @@ obj-$(C=
ONFIG=5FSENSORS=5FNCT6775) &nbsp; &nbsp; &nbsp;+=3D nct6775.o<br>&gt; + obj=
-$(CONFIG=5FSENSORS=5FNCT7802) +=3D nct7802.o<br>&gt; + obj-$(CONFIG=5FSENS=
ORS=5FNCT7904) +=3D nct7904.o<br>&gt; + obj-$(CONFIG=5FSENSORS=5FNTC=5FTHER=
MISTOR) &nbsp;+=3D ntc=5Fthermistor.o<br>&gt; ++obj-$(CONFIG=5FSENSORS=5FOC=
C) &nbsp; &nbsp; +=3D occ.o<br>&gt; + obj-$(CONFIG=5FSENSORS=5FPC87360) +=
=3D pc87360.o<br>&gt; + obj-$(CONFIG=5FSENSORS=5FPC87427) +=3D pc87427.o<br=
>&gt; + obj-$(CONFIG=5FSENSORS=5FPCF8591) +=3D pcf8591.o<br>&gt; +diff --gi=
t a/drivers/hwmon/occ.c b/drivers/hwmon/occ.c<br>&gt; +new file mode 100644=
<br>&gt; +index 0000000..f265ff3<br>&gt; +--- /dev/null<br>&gt; ++++ b/driv=
ers/hwmon/occ.c<br>&gt; +@@ -0,0 +1,1529 @@<br>&gt; ++/*<br>&gt; ++ * Open =
BMC OCC HWMON driver - read Power8 OCC (On Chip Controller) sensor data via=
 i2c.<br>&gt; ++ *<br>&gt; ++ * Copyright (c) 2015 IBM (Alvin Wang, Li Yi)<=
br>&gt; ++ *<br>&gt; ++ * This program is free software; you can redistribu=
te it and/or modify<br>&gt; ++ * it under the terms of the GNU General Publ=
ic License as published by<br>&gt; ++ * the Free Software Foundation; eithe=
r version 2 of the License, or<br>&gt; ++ * (at your option) any later vers=
ion.<br>&gt; ++ *<br>&gt; ++ * This program is distributed in the hope that=
 it will be useful,<br>&gt; ++ * but WITHOUT ANY WARRANTY; without even the=
 implied warranty of<br>&gt; ++ * MERCHANTABILITY or FITNESS FOR A PARTICUL=
AR PURPOSE. &nbsp;See the<br>&gt; ++ * GNU General Public License for more =
details.<br>&gt; ++ *<br>&gt; ++ * You should have received a copy of the G=
NU General Public License<br>&gt; ++ * along with this program; if not, wri=
te to the Free Software<br>&gt; ++ * Foundation, Inc., 675 Mass Ave, Cambri=
dge, MA 02139, USA.<br>&gt; ++ */<br>&gt; ++<br>&gt; ++#include &lt;linux/m=
odule.h&gt;<br>&gt; ++#include &lt;linux/init.h&gt;<br>&gt; ++#include &lt;=
linux/slab.h&gt;<br>&gt; ++#include &lt;linux/jiffies.h&gt;<br>&gt; ++#incl=
ude &lt;linux/i2c.h&gt;<br>&gt; ++#include &lt;linux/hwmon.h&gt;<br>&gt; ++=
#include &lt;linux/hwmon-sysfs.h&gt;<br>&gt; ++#include &lt;linux/err.h&gt;=
<br>&gt; ++#include &lt;linux/mutex.h&gt;<br>&gt; ++#include &lt;linux/of.h=
&gt;<br>&gt; ++#include &lt;linux/delay.h&gt;<br>&gt; ++<br>&gt; ++//#defin=
e DEBUG &nbsp; &nbsp;1<br><br>No C++ comments please.<br><br>&gt; ++<br>&gt=
; ++/* ------------------------------------------------------------*/<br><b=
r>Drop the ASCII art.<br><br>&gt; ++/* OCC sensor data format */<br>&gt; ++=
typedef struct {<br>&gt; ++ &nbsp; &nbsp; &nbsp;uint16=5Ft sensor=5Fid;<br>=
&gt; ++ &nbsp; &nbsp; &nbsp;uint16=5Ft value;<br>&gt; ++} occ=5Fsensor;<br>=
&gt; ++<br><br>In the kernel we tend not to typedef our structures. So this=
 would be<br>&quot;struct occ=5Fsensor { ...&quot;<br><br>The same comment =
applies to all of your structures.<br><br>&gt; ++typedef struct {<br>&gt; +=
+ &nbsp; &nbsp; &nbsp;uint16=5Ft sensor=5Fid;<br>&gt; ++ &nbsp; &nbsp; &nbs=
p;uint32=5Ft update=5Ftag;<br>&gt; ++ &nbsp; &nbsp; &nbsp;uint32=5Ft accumu=
lator;<br>&gt; ++ &nbsp; &nbsp; &nbsp;uint16=5Ft value;<br>&gt; ++} powr=5F=
sensor;<br><br>I'll buy you a vowel. Call this &quot;struct power=5Fsensor&=
quot;.<br><br>&gt; ++<br>&gt; ++typedef struct {<br>&gt; ++ &nbsp; &nbsp; &=
nbsp;uint16=5Ft curr=5Fpowercap;<br>&gt; ++ &nbsp; &nbsp; &nbsp;uint16=5Ft =
curr=5Fpowerreading;<br>&gt; ++ &nbsp; &nbsp; &nbsp;uint16=5Ft norm=5Fpower=
cap;<br>&gt; ++ &nbsp; &nbsp; &nbsp;uint16=5Ft max=5Fpowercap;<br>&gt; ++ &=
nbsp; &nbsp; &nbsp;uint16=5Ft min=5Fpowercap;<br>&gt; ++ &nbsp; &nbsp; &nbs=
p;uint16=5Ft user=5Fpowerlimit;<br>&gt; ++} caps=5Fsensor;<br><br>typedef<b=
r><br>&gt; ++<br>&gt; ++typedef struct {<br>&gt; ++ &nbsp; &nbsp; &nbsp;cha=
r sensor=5Ftype[5];<br><br>uint8=5Ft instead of a char?<br><br>&gt; ++ &nbs=
p; &nbsp; &nbsp;uint8=5Ft reserved0;<br>&gt; ++ &nbsp; &nbsp; &nbsp;uint8=
=5Ft sensor=5Fformat;<br>&gt; ++ &nbsp; &nbsp; &nbsp;uint8=5Ft sensor=5Flen=
gth;<br>&gt; ++ &nbsp; &nbsp; &nbsp;uint8=5Ft num=5Fof=5Fsensors;<br>&gt; +=
+ &nbsp; &nbsp; &nbsp;occ=5Fsensor *sensor;<br>&gt; ++ &nbsp; &nbsp; &nbsp;=
powr=5Fsensor *powr;<br>&gt; ++ &nbsp; &nbsp; &nbsp;caps=5Fsensor *caps;<br=
>&gt; ++} sensor=5Fdata=5Fblock;<br><br>typedef<br><br>&gt; ++<br>&gt; ++ty=
pedef struct {<br>&gt; ++ &nbsp; &nbsp; &nbsp;uint8=5Ft status;<br>&gt; ++ =
&nbsp; &nbsp; &nbsp;uint8=5Ft ext=5Fstatus;<br>&gt; ++ &nbsp; &nbsp; &nbsp;=
uint8=5Ft occs=5Fpresent;<br>&gt; ++ &nbsp; &nbsp; &nbsp;uint8=5Ft config;<=
br>&gt; ++ &nbsp; &nbsp; &nbsp;uint8=5Ft occ=5Fstate;<br>&gt; ++ &nbsp; &nb=
sp; &nbsp;uint8=5Ft reserved0;<br>&gt; ++ &nbsp; &nbsp; &nbsp;uint8=5Ft res=
erved1;<br>&gt; ++ &nbsp; &nbsp; &nbsp;uint8=5Ft error=5Flog=5Fid;<br>&gt; =
++ &nbsp; &nbsp; &nbsp;uint32=5Ft error=5Flog=5Faddr=5Fstart;<br>&gt; ++ &n=
bsp; &nbsp; &nbsp;uint16=5Ft error=5Flog=5Flength;<br>&gt; ++ &nbsp; &nbsp;=
 &nbsp;uint8=5Ft reserved2;<br>&gt; ++ &nbsp; &nbsp; &nbsp;uint8=5Ft reserv=
ed3;<br>&gt; ++ &nbsp; &nbsp; &nbsp;char occ=5Fcode=5Flevel[17];<br><br>Cod=
e level is an IBM term. Perhaps call this version=5Fstring?<br><br>&gt; ++ =
&nbsp; &nbsp; &nbsp;char sensor=5Feye=5Fcatcher[7];<br>&gt; ++ &nbsp; &nbsp=
; &nbsp;uint8=5Ft num=5Fof=5Fsensor=5Fblocks;<br>&gt; ++ &nbsp; &nbsp; &nbs=
p;uint8=5Ft sensor=5Fdata=5Fversion;<br>&gt; ++ &nbsp; &nbsp; &nbsp;sensor=
=5Fdata=5Fblock* blocks;<br>&gt; ++} occ=5Fpoll=5Fdata;<br><br>typedef<br><=
br>&gt; ++<br>&gt; ++typedef struct {<br>&gt; ++ &nbsp; &nbsp; &nbsp;uint8=
=5Ft sequence=5Fnum;<br>&gt; ++ &nbsp; &nbsp; &nbsp;uint8=5Ft cmd=5Ftype;<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp;uint8=5Ft rtn=5Fstatus;<br>&gt; ++ &nbsp; &nb=
sp; &nbsp;uint16=5Ft data=5Flength;<br>&gt; ++ &nbsp; &nbsp; &nbsp;occ=5Fpo=
ll=5Fdata data;<br>&gt; ++ &nbsp; &nbsp; &nbsp;uint16=5Ft chk=5Fsum;<br>&gt=
; ++ &nbsp; &nbsp; &nbsp;int temp=5Fblock=5Fid;<br>&gt; ++ &nbsp; &nbsp; &n=
bsp;int freq=5Fblock=5Fid;<br>&gt; ++ &nbsp; &nbsp; &nbsp;int power=5Fblock=
=5Fid;<br>&gt; ++ &nbsp; &nbsp; &nbsp;int caps=5Fblock=5Fid;<br>&gt; ++} oc=
c=5Fresponse=5Ft;<br><br>typedef<br><br>&gt; ++<br>&gt; ++//static occ=5Fre=
sponse=5Ft occ=5Fresp;<br><br>C++ comments.<br><br>&gt; ++/* Each client ha=
s this additional data */<br><br>I don't understand this comment.<br><br>&g=
t; ++struct occ=5Fdrv=5Fdata {<br>&gt; ++ &nbsp; &nbsp; &nbsp;struct i2c=5F=
client &nbsp; &nbsp; &nbsp; *client;<br>&gt; ++ &nbsp; &nbsp; &nbsp;struct =
device &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *hwmon=5Fdev;<br>&gt; ++ &nbsp; &=
nbsp; &nbsp;struct mutex &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;update=5F=
lock;<br>&gt; ++ &nbsp; &nbsp; &nbsp;char &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;valid; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;/* !=3D0 if sensor data are valid */<br><br>make this a bool, and you can=
 drop the comment.<br><br>&gt; ++ &nbsp; &nbsp; &nbsp;unsigned long &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; last=5Fupdated; &nbsp; /* In jiffies */<br>&gt;=
 ++ &nbsp; &nbsp; &nbsp;unsigned long &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sa=
mple=5Ftime; &nbsp; &nbsp;/* Mininum timer interval for sampling In jiffies=
 */<br><br>Minimum.<br><br>&gt; ++ &nbsp; &nbsp; &nbsp;occ=5Fresponse=5Ft &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;occ=5Fresp;<br>&gt; ++};<br>&gt; ++<br>&gt=
; ++/*---------------------------------------------------------------------=
--*/<br><br>Drop this.<br><br>&gt; ++/* i2c read and write occ sensors */<b=
r>&gt; ++<br>&gt; ++#define OCC=5FDATA=5FMAX 4096 /* 4KB at most */<br>&gt;=
 ++#define I2C=5FSTATUS=5FREG 0x000d0001<br>&gt; ++#define I2C=5FERROR=5FRE=
G &nbsp;0x000d0002<br>&gt; ++#define I2C=5FREAD=5FERROR 1<br>&gt; ++#define=
 I2C=5FWRITE=5FERROR 2<br>&gt; ++#define I2C=5FDATABUFFER=5FSIZE=5FERROR 3<=
br>&gt; ++<br>&gt; ++/*<br><br>Why is this commented out?<br><br>&gt; ++#de=
fine SCOM=5FOCC=5FSRAM=5FWOX &nbsp;0x0006B013<br>&gt; ++#define SCOM=5FOCC=
=5FSRAM=5FWAND 0x0006B012<br>&gt; ++#define SCOM=5FOCC=5FSRAM=5FADDR 0x0006=
B010<br>&gt; ++#define SCOM=5FOCC=5FSRAM=5FDATA 0x0006B015<br>&gt; ++*/<br>=
&gt; ++<br>&gt; ++// To generate attn to OCC<br><br>Use C commenting style.=
<br><br>&gt; ++#define ATTN=5FDATA &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;0x0006B035<br>&gt; ++<br>&gt; ++// For BMC to read/write SRA=
M<br><br>Use C commenting style.<br><br>&gt; ++#define OCB=5FADDRESS &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0x0006B070<br>&gt; ++#define OCB=
=5FDATA &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0x0006B075<=
br>&gt; ++#define OCB=5FSTATUS=5FCONTROL=5FAND &nbsp; 0x0006B072<br>&gt; ++=
#define OCB=5FSTATUS=5FCONTROL=5FOR &nbsp; &nbsp;0x0006B073<br>&gt; ++<br>&=
gt; ++#define OCC=5FCOMMAND=5FADDR 0xFFFF6000<br>&gt; ++#define OCC=5FRESPO=
NSE=5FADDR 0xFFFF7000<br>&gt; ++<br>&gt; ++static int deinit=5Focc=5Fresp=
=5Fbuf(occ=5Fresponse=5Ft *p)<br>&gt; ++{<br>&gt; ++ &nbsp; &nbsp; &nbsp;in=
t b;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;if (p =3D=3D NULL)<br><br>Yo=
u can check for null by just doing if (p).<br><br>&gt; ++ &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;return 0;<br><br>We normally return a negati=
ve number when there is an error.<br><br>This function only returns 0, whic=
h is not useful for the callee.<br><br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nb=
sp;if (p-&gt;data.blocks =3D=3D NULL)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;return 0;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;f=
or(b =3D 0; b &lt; p-&gt;data.num=5Fof=5Fsensor=5Fblocks; b++) {<br>&gt; ++=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!p-&gt;data.blocks[b].=
sensor)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;kfree(p-&gt;data.blocks[b].sensor);<br>&gt; ++ &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!p-&gt;data.blocks[b].powr)<br>=
&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;kfree(p-&gt;data.blocks[b].powr);<br>&gt; ++ &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;if (!p-&gt;data.blocks[b].caps)<br>&gt; ++ &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;kfre=
e(p-&gt;data.blocks[b].caps);<br>&gt; ++ &nbsp; &nbsp; &nbsp;}<br>&gt; ++<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp;kfree(p-&gt;data.blocks);<br>&gt; ++<br>&gt; =
++ &nbsp; &nbsp; &nbsp;memset(p, 0, sizeof(*p));<br>&gt; ++<br>&gt; ++<br>&=
gt; ++ &nbsp; &nbsp; &nbsp;return 0;<br>&gt; ++}<br>&gt; ++<br>&gt; ++stati=
c ssize=5Ft occ=5Fi2c=5Fread(struct i2c=5Fclient *client, char *buf, size=
=5Ft count)<br>&gt; ++{<br>&gt; ++ &nbsp; &nbsp; &nbsp;int ret =3D 0;<br>&g=
t; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;if (count &gt; 8192)<br>&gt; ++ &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;count =3D 8192;<br><br>This shoul=
d at least log an informative message.<br><br>&gt; ++<br>&gt; ++ &nbsp; &nb=
sp; &nbsp;//printk(&quot;i2c=5Fread: reading %zu bytes @0x%x.\n&quot;, coun=
t, client-&gt;addr);<br><br>Delete it, or use dev=5Fdbg() to make your debu=
gging info dynamically<br>configurable.<br><br>&gt; ++ &nbsp; &nbsp; &nbsp;=
ret =3D i2c=5Fmaster=5Frecv(client, buf, count);<br>&gt; ++ &nbsp; &nbsp; &=
nbsp;return ret;<br><br>This can be one line.<br><br>&gt; ++}<br>&gt; ++<br=
>&gt; ++static ssize=5Ft occ=5Fi2c=5Fwrite(struct i2c=5Fclient *client, con=
st char *buf, size=5Ft count)<br>&gt; ++{<br>&gt; ++ &nbsp; &nbsp; &nbsp;in=
t ret =3D 0;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;if (count &gt; 8192)=
<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;count =3D 8192;=
<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;//printk(&quot;i2c=5Fwrite: writ=
ing %zu bytes @0x%x.\n&quot;, count, client-&gt;addr);<br>&gt; ++ &nbsp; &n=
bsp; &nbsp;ret =3D i2c=5Fmaster=5Fsend(client, buf, count);<br>&gt; ++ &nbs=
p; &nbsp; &nbsp;return ret;<br><br>Similar comments to the occ=5Fi2c=5Fread=
.<br><br>&gt; ++}<br>&gt; ++<br>&gt; ++/* read two 4-byte value */<br>&gt; =
++static int occ=5Fgetscom(struct i2c=5Fclient *client, uint32=5Ft address,=
 uint32=5Ft *value0, uint32=5Ft *value1)<br>&gt; ++{<br>&gt; ++ &nbsp; &nbs=
p; &nbsp;uint32=5Ft ret =3D 0;<br>&gt; ++ &nbsp; &nbsp; &nbsp;char buf[8];<=
br>&gt; ++ &nbsp; &nbsp; &nbsp;const char* address=5Fbuf =3D (const char*)&=
amp;address;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;//P8 i2c slave requi=
res address to be shifted by 1<br><br>C++ comments.<br><br>&gt; ++ &nbsp; &=
nbsp; &nbsp;address =3D address &lt;&lt; 1;<br>&gt; ++<br>&gt; ++ &nbsp; &n=
bsp; &nbsp;ret =3D occ=5Fi2c=5Fwrite(client, address=5Fbuf, sizeof(address)=
);<br>&gt; ++ &nbsp; &nbsp; &nbsp;/* FIXME: ast i2c driver does not read co=
rret value */<br>&gt; ++ &nbsp; &nbsp; &nbsp;//if (ret !=3D sizeof(address)=
)<br>&gt; ++ &nbsp; &nbsp; &nbsp;// &nbsp; &nbsp; &nbsp;return -I2C=5FWRITE=
=5FERROR;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;ret =3D occ=5Fi2c=5Frea=
d(client, buf, sizeof(buf));<br>&gt; ++ &nbsp; &nbsp; &nbsp;//if (ret !=3D =
sizeof(buf))<br>&gt; ++ &nbsp; &nbsp; &nbsp;// &nbsp; &nbsp; &nbsp;return -=
I2C=5FREAD=5FERROR;<br><br>You've commented out the error handling here. Di=
d you get to the<br>bottom of why you're not getting the return value you'r=
e expecting?<br><br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;memcpy(value1, &=
amp;buf[0], sizeof(*value1));<br>&gt; ++ &nbsp; &nbsp; &nbsp;memcpy(value0,=
 &amp;buf[4], sizeof(*value0));<br><br>*value1 =3D buf[0]?<br><br>&gt; ++<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp;return 0;<br>&gt; ++}<br>&gt; ++<br>&gt; ++/*=
 read 8-byte value and put into data[offset] */<br>&gt; ++static int occ=5F=
getscomb(struct i2c=5Fclient *client, uint32=5Ft address, char* data, int o=
ffset)<br>&gt; ++{<br><br>data is bytes, just make it u8.<br><br>&gt; ++ &n=
bsp; &nbsp; &nbsp;uint32=5Ft ret =3D 0;<br>&gt; ++ &nbsp; &nbsp; &nbsp;cons=
t char* address=5Fbuf =3D (const char*)&amp;address;<br>&gt; ++ &nbsp; &nbs=
p; &nbsp;char buf[8];<br>&gt; ++ &nbsp; &nbsp; &nbsp;int b =3D 0;<br><br>Co=
nvention is to use i for counters.<br><br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; =
&nbsp;//P8 i2c slave requires address to be shifted by 1<br>&gt; ++ &nbsp; =
&nbsp; &nbsp;address =3D address &lt;&lt; 1;<br>&gt; ++<br>&gt; ++ &nbsp; &=
nbsp; &nbsp;ret =3D occ=5Fi2c=5Fwrite(client, address=5Fbuf, sizeof(address=
));<br>&gt; ++ &nbsp; &nbsp; &nbsp;//if (ret !=3D sizeof(address))<br>&gt; =
++ &nbsp; &nbsp; &nbsp;// &nbsp; &nbsp; &nbsp;return -I2C=5FWRITE=5FERROR;<=
br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;ret =3D occ=5Fi2c=5Fread(client, =
buf, sizeof(buf));<br>&gt; ++ &nbsp; &nbsp; &nbsp;//if (ret !=3D sizeof(buf=
))<br>&gt; ++ &nbsp; &nbsp; &nbsp;// &nbsp; &nbsp; &nbsp;return -I2C=5FREAD=
=5FERROR;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;for (b =3D 0; b &lt; 8;=
 b++) {<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;data[off=
set + b] =3D buf[7 - b];<br>&gt; ++ &nbsp; &nbsp; &nbsp;}<br>&gt; ++<br>&gt=
; ++ &nbsp; &nbsp; &nbsp;return 0;<br>&gt; ++}<br>&gt; ++<br>&gt; ++static =
int occ=5Fputscom(struct i2c=5Fclient *client, uint32=5Ft address, uint32=
=5Ft data0, uint32=5Ft data1)<br>&gt; ++{<br>&gt; ++ &nbsp; &nbsp; &nbsp;co=
nst char* address=5Fbuf =3D (const char*)&amp;address;<br>&gt; ++ &nbsp; &n=
bsp; &nbsp;const char* d0 =3D (const char*)&amp;data0;<br>&gt; ++ &nbsp; &n=
bsp; &nbsp;const char* d1 =3D (const char*)&amp;data1;<br><br>This messing =
about with types is unnecessary.<br><br>&gt; ++ &nbsp; &nbsp; &nbsp;char bu=
f[12];<br>&gt; ++ &nbsp; &nbsp; &nbsp;uint32=5Ft ret =3D 0;<br>&gt; ++<br>&=
gt; ++ &nbsp; &nbsp; &nbsp;//P8 i2c slave requires address to be shifted by=
 1<br>&gt; ++ &nbsp; &nbsp; &nbsp;address =3D address &lt;&lt; 1;<br>&gt; +=
+<br>&gt; ++ &nbsp; &nbsp; &nbsp;memcpy(&amp;buf[0], address=5Fbuf, sizeof(=
address));<br>&gt; ++ &nbsp; &nbsp; &nbsp;memcpy(&amp;buf[4], d1, sizeof(da=
ta1));<br>&gt; ++ &nbsp; &nbsp; &nbsp;memcpy(&amp;buf[8], d0, sizeof(data0)=
);<br><br>I think there's a better way to create your buffer. This is not e=
ndian<br>safe, and it's hard to read.<br><br>&gt; ++<br>&gt; ++ &nbsp; &nbs=
p; &nbsp;ret =3D occ=5Fi2c=5Fwrite(client, buf, sizeof(buf));<br>&gt; ++ &n=
bsp; &nbsp; &nbsp;//if (ret !=3D sizeof(buf))<br>&gt; ++ &nbsp; &nbsp; &nbs=
p;// &nbsp; &nbsp; &nbsp;return I2C=5FWRITE=5FERROR;<br>&gt; ++<br>&gt; ++ =
&nbsp; &nbsp; &nbsp;return 0;<br>&gt; ++}<br>&gt; ++<br>&gt; ++static int o=
cc=5Fcheck=5Fi2c=5Ferrors(struct i2c=5Fclient *client)<br>&gt; ++{<br>&gt; =
++ &nbsp; &nbsp; &nbsp;uint32=5Ft v0;<br>&gt; ++ &nbsp; &nbsp; &nbsp;uint32=
=5Ft v1;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;occ=5Fgetscom(client, I2=
C=5FSTATUS=5FREG, &amp;v0, &amp;v1);<br>&gt; ++ &nbsp; &nbsp; &nbsp;if (v0 =
!=3D 0x80000000) {<br><br>Create #defines for your magic number.<br><br>&gt=
; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;printk(&quot;ERROR pre=
sent in P8 I2C Slave. &nbsp;Clearing...\n&quot;);<br>&gt; ++ &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;occ=5Fputscom(client, I2C=5FERROR=5FREG, =
0x00000000, 0x00000000);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;occ=5Fputscom(client, I2C=5FSTATUS=5FREG, 0x00000000, 0x00000000);=
<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&=
gt; ++ &nbsp; &nbsp; &nbsp;}<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;retu=
rn 0;<br>&gt; ++}<br>&gt; ++<br>&gt; ++<br>&gt; ++static inline uint16=5Ft =
get=5Foccdata=5Flength(char* d)<br><br>u8 instead of char.<br><br>&gt; ++{<=
br>&gt; ++ &nbsp; &nbsp; &nbsp;uint16=5Ft data=5Flength =3D 0;<br>&gt; ++<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp;data=5Flength =3D d[3] &lt;&lt; 8;<br>&gt; ++=
 &nbsp; &nbsp; &nbsp;data=5Flength =3D data=5Flength | d[4];<br>&gt; ++ &nb=
sp; &nbsp; &nbsp;return data=5Flength;<br>&gt; ++}<br>&gt; ++<br>&gt; ++<br=
>&gt; ++static int parse=5Focc=5Fresponse(char* d, occ=5Fresponse=5Ft* o)<b=
r>&gt; ++{<br>&gt; ++ &nbsp; &nbsp; &nbsp;int b =3D 0;<br>&gt; ++ &nbsp; &n=
bsp; &nbsp;int s =3D 0;<br>&gt; ++ &nbsp; &nbsp; &nbsp;int ret =3D 0;<br>&g=
t; ++ &nbsp; &nbsp; &nbsp;int dnum =3D 45;<br>&gt; ++<br>&gt; ++ &nbsp; &nb=
sp; &nbsp;o-&gt;sequence=5Fnum =3D d[0];<br>&gt; ++ &nbsp; &nbsp; &nbsp;o-&=
gt;cmd=5Ftype =3D d[1];<br>&gt; ++ &nbsp; &nbsp; &nbsp;o-&gt;rtn=5Fstatus =
=3D d[2];<br>&gt; ++ &nbsp; &nbsp; &nbsp;o-&gt;data=5Flength =3D d[3] &lt;&=
lt; 8;<br>&gt; ++ &nbsp; &nbsp; &nbsp;o-&gt;data=5Flength =3D o-&gt;data=5F=
length | d[4];<br>&gt; ++ &nbsp; &nbsp; &nbsp;o-&gt;data.status =3D d[5];<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp;o-&gt;data.ext=5Fstatus =3D d[6];<br>&gt; ++ =
&nbsp; &nbsp; &nbsp;o-&gt;data.occs=5Fpresent =3D d[7];<br>&gt; ++ &nbsp; &=
nbsp; &nbsp;o-&gt;data.config =3D d[8];<br>&gt; ++ &nbsp; &nbsp; &nbsp;o-&g=
t;data.occ=5Fstate =3D d[9];<br>&gt; ++ &nbsp; &nbsp; &nbsp;o-&gt;data.rese=
rved0 =3D d[10];<br>&gt; ++ &nbsp; &nbsp; &nbsp;o-&gt;data.reserved1 =3D d[=
11];<br>&gt; ++ &nbsp; &nbsp; &nbsp;o-&gt;data.error=5Flog=5Fid =3D d[12];<=
br>&gt; ++ &nbsp; &nbsp; &nbsp;o-&gt;data.error=5Flog=5Faddr=5Fstart =3D d[=
13] &lt;&lt; 24;<br>&gt; ++ &nbsp; &nbsp; &nbsp;o-&gt;data.error=5Flog=5Fad=
dr=5Fstart =3D o-&gt;data.error=5Flog=5Faddr=5Fstart | d[14] &lt;&lt; 16;<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp;o-&gt;data.error=5Flog=5Faddr=5Fstart =3D o-&=
gt;data.error=5Flog=5Faddr=5Fstart | d[15] &lt;&lt; 8;<br>&gt; ++ &nbsp; &n=
bsp; &nbsp;o-&gt;data.error=5Flog=5Faddr=5Fstart =3D o-&gt;data.error=5Flog=
=5Faddr=5Fstart | d[16];<br>&gt; ++ &nbsp; &nbsp; &nbsp;o-&gt;data.error=5F=
log=5Flength =3D d[17] &lt;&lt; 8;<br>&gt; ++ &nbsp; &nbsp; &nbsp;o-&gt;dat=
a.error=5Flog=5Flength =3D o-&gt;data.error=5Flog=5Flength | d[18];<br>&gt;=
 ++ &nbsp; &nbsp; &nbsp;o-&gt;data.reserved2 =3D d[19];<br>&gt; ++ &nbsp; &=
nbsp; &nbsp;o-&gt;data.reserved3 =3D d[20];<br>&gt; ++ &nbsp; &nbsp; &nbsp;=
strncpy(&amp;o-&gt;data.occ=5Fcode=5Flevel[0], (const char*)&amp;d[21], 16)=
;<br><br>You shouldn't need to play games with the types:<br><br> strncpy(o=
-&gt;data.occ=5Fcode=5Flevel, d[21], 16)<br><br>&gt; ++ &nbsp; &nbsp; &nbsp=
;strncpy(&amp;o-&gt;data.sensor=5Feye=5Fcatcher[0], (const char*)&amp;d[37]=
, 6);<br>&gt; ++ &nbsp; &nbsp; &nbsp;o-&gt;data.sensor=5Feye=5Fcatcher[6]=
=3D'\0';<br><br>use strscpy which provdies the null termination for you.<br=
><br>&gt; ++ &nbsp; &nbsp; &nbsp;o-&gt;data.num=5Fof=5Fsensor=5Fblocks=3Dd[=
43];<br>&gt; ++ &nbsp; &nbsp; &nbsp;o-&gt;data.sensor=5Fdata=5Fversion =3D =
d[44];<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;if (strcmp(o-&gt;data.sens=
or=5Feye=5Fcatcher, &quot;SENSOR&quot;) !=3D 0) {<br>&gt; ++ &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;printk(&quot;ERROR: SENSOR not found at b=
yte 37 (%s)\n&quot;,o-&gt;data.sensor=5Feye=5Fcatcher);<br>&gt; ++ &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; ++ &nbsp; &nbsp;=
 &nbsp;}<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;if (o-&gt;data.num=5Fof=
=5Fsensor=5Fblocks =3D=3D 0) {<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;printk(&quot;ERROR: SENSOR block num is 0\n&quot;);<br>&gt; =
++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; ++ &n=
bsp; &nbsp; &nbsp;}<br><br>Should these checks be before you parse the data=
?<br><br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;o-&gt;data.blocks =3D kzall=
oc(sizeof(sensor=5Fdata=5Fblock) * o-&gt;data.num=5Fof=5Fsensor=5Fblocks, G=
FP=5FKERNEL);<br>&gt; ++ &nbsp; &nbsp; &nbsp;if (o-&gt;data.blocks =3D=3D N=
ULL)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -ENO=
MEM;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;//printk(&quot;Reading %d se=
nsor blocks\n&quot;, o-&gt;data.num=5Fof=5Fsensor=5Fblocks);<br><br>use dev=
=5Fdbg<br><br>&gt; ++ &nbsp; &nbsp; &nbsp;o-&gt;temp=5Fblock=5Fid =3D -1;<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp;o-&gt;freq=5Fblock=5Fid =3D -1;<br>&gt; ++ &n=
bsp; &nbsp; &nbsp;o-&gt;power=5Fblock=5Fid =3D -1;<br>&gt; ++ &nbsp; &nbsp;=
 &nbsp;o-&gt;caps=5Fblock=5Fid =3D -1;<br>&gt; ++ &nbsp; &nbsp; &nbsp;for(b=
 =3D 0; b &lt; o-&gt;data.num=5Fof=5Fsensor=5Fblocks; b++) {<br>&gt; ++ &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* 8-byte sensor block head */=
<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;strncpy(&amp;o-=
&gt;data.blocks[b].sensor=5Ftype[0], (const char*)&amp;d[dnum], 4);<br>&gt;=
 ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b].re=
served0 =3D d[dnum+4];<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;o-&gt;data.blocks[b].sensor=5Fformat =3D d[dnum+5];<br>&gt; ++ &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b].sensor=5Fle=
ngth =3D d[dnum+6];<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;o-&gt;data.blocks[b].num=5Fof=5Fsensors =3D d[dnum+7];<br>&gt; ++ &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dnum =3D dnum + 8;<br>&gt; ++<br=
>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//printk(&quot;sen=
sor block[%d]: type: %s, num=5Fof=5Fsensors: %d, sensor=5Flength: %u\n&quot=
;,<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;//b, o-&gt;data.blocks[b].sensor=5Ftype, o-&gt;data.blocks[b=
].num=5Fof=5Fsensors,<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//o-&gt;data.blocks[b].sensor=5Flength);<=
br><br>dev=5Fdbg<br><br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;/* empty sensor block */<br>&gt; ++ &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;if (o-&gt;data.blocks[b].num=5Fof=5Fsensors &lt;=
=3D 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;continue;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;if (o-&gt;data.blocks[b].sensor=5Flength =3D=3D 0)<br>&gt; ++ =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;continue;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;if (strcmp(o-&gt;data.blocks[b].sensor=5Ftype, &quot;FREQ&quot;) =3D=
=3D 0) {<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b].sensor =3D<br>&gt; ++ &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;kzalloc(sizeof(occ=5Fsensor) * o-&gt;data.blocks[b].num=
=5Fof=5Fsensors, GFP=5FKERNEL);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (o-&gt;data.block=
s[b].sensor =3D=3D NULL) {<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret =3D =
-ENOMEM;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto abort;<br><br>More co=
mmonly used is &quot;out&quot; or &quot;error&quot;, but abort is fine if y=
ou want.<br><br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;}<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;freq=5Fblock=5Fid =3D b;<br>&g=
t; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;for (s =3D 0; s &lt; o-&gt;data.blocks[b].num=5Fof=5Fsensors; s++) {=
<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b].sensor[s].sen=
sor=5Fid =3D d[dnum] &lt;&lt; 8;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-=
&gt;data.blocks[b].sensor[s].sensor=5Fid =3D<br>&gt; ++ &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b].sensor[s].sensor=
=5Fid | d[dnum+1];<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;data.block=
s[b].sensor[s].value =3D d[dnum+2] &lt;&lt; 8;<br>&gt; ++ &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;o-&gt;data.blocks[b].sensor[s].value =3D o-&gt;data.blocks[b].s=
ensor[s].value | d[dnum+3];<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//print=
k(&quot;sensor[%d]-[%d]: id: %u, value: %u\n&quot;,<br>&gt; ++ &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;// &nbsp; &nbsp; &nbsp;b, s, o-&gt;data.blocks[b].sensor[s=
].sensor=5Fid, o-&gt;data.blocks[b].sensor[s].value);<br><br>dev=5Fdbg<br><=
br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dnum =3D dnum + o-&gt;data.blocks[b=
].sensor=5Flength;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;}<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;else if (strcmp(o-&gt;data.blocks[b].sensor=5Ftype, &quot;TEMP&quot;) =
=3D=3D 0) {<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b].sensor =3D<br>&gt; =
++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;kzalloc(sizeof(occ=5Fsensor) * o-&gt;data.b=
locks[b].num=5Fof=5Fsensors, GFP=5FKERNEL);<br>&gt; ++<br>&gt; ++ &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (o-&g=
t;data.blocks[b].sensor =3D=3D NULL) {<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;ret =3D -ENOMEM;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto abort;<br=
>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;}<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;temp=5Fblock=5Fid =3D b;<br>&gt; +=
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;for (s =3D 0; s &lt; o-&gt;data.blocks[b].num=5Fof=5Fsensors; s++) {<br>=
&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b].sensor[s].sensor=
=5Fid =3D d[dnum] &lt;&lt; 8;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt=
;data.blocks[b].sensor[s].sensor=5Fid =3D<br>&gt; ++ &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b].sensor[s].sensor=5F=
id | d[dnum+1];<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b=
].sensor[s].value =3D d[dnum+2] &lt;&lt; 8;<br>&gt; ++ &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;o-&gt;data.blocks[b].sensor[s].value =3D o-&gt;data.blocks[b].sens=
or[s].value | d[dnum+3];</tt><br><tt>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/=
/printk(&quot;sensor[%d]-[%d]: id: %u, value: %u\n&quot;,<br>&gt; ++ &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;// &nbsp; &nbsp; &nbsp;b, s, o-&gt;data.blocks[b].se=
nsor[s].sensor=5Fid, o-&gt;data.blocks[b].sensor[s].value);<br>&gt; ++ &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;dnum =3D dnum + o-&gt;data.blocks[b].sensor=5Fleng=
th;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;}<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;}<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;else if (str=
cmp(o-&gt;data.blocks[b].sensor=5Ftype, &quot;POWR&quot;) =3D=3D 0) {<br>&g=
t; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;o-&gt;data.blocks[b].powr =3D<br>&gt; ++ &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;kzalloc(sizeof(powr=5Fsensor) * o-&gt;data.blocks[b].num=5Fof=
=5Fsensors, GFP=5FKERNEL);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (o-&gt;data.blocks[b].=
powr =3D=3D NULL) {<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret =3D -ENOMEM=
;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto abort;<br>&gt; ++ &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt;=
 ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;o-&gt;power=5Fblock=5Fid =3D b;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for (s =3D 0; s &lt; o-&gt=
;data.blocks[b].num=5Fof=5Fsensors; s++) {<br>&gt; ++ &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;o-&gt;data.blocks[b].powr[s].sensor=5Fid =3D d[dnum] &lt;&lt; 8;<br=
>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b].powr[s].sensor=
=5Fid =3D o-&gt;data.blocks[b].powr[s].sensor=5Fid | d[dnum+1];<br>&gt; ++ =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b].powr[s].update=5Ftag =3D =
d[dnum+2] &lt;&lt; 24;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;data.b=
locks[b].powr[s].update=5Ftag =3D o-&gt;data.blocks[b].powr[s].update=5Ftag=
 | d[dnum+3] &lt;&lt; 16;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;dat=
a.blocks[b].powr[s].update=5Ftag =3D o-&gt;data.blocks[b].powr[s].update=5F=
tag | d[dnum+4] &lt;&lt; 8;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;d=
ata.blocks[b].powr[s].update=5Ftag =3D o-&gt;data.blocks[b].powr[s].update=
=5Ftag | d[dnum+5];<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;data.bloc=
ks[b].powr[s].accumulator =3D d[dnum+6] &lt;&lt; 24;<br>&gt; ++ &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;o-&gt;data.blocks[b].powr[s].accumulator =3D o-&gt;data.b=
locks[b].powr[s].accumulator | d[dnum+7] &lt;&lt; 16;<br>&gt; ++ &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b].powr[s].accumulator =3D o-&gt;data.=
blocks[b].powr[s].accumulator | d[dnum+8] &lt;&lt; 8;<br>&gt; ++ &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b].powr[s].accumulator =3D o-&gt;data.=
blocks[b].powr[s].accumulator | d[dnum+9];<br>&gt; ++ &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;o-&gt;data.blocks[b].powr[s].value =3D d[dnum+10] &lt;&lt; 8;<br>&g=
t; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b].powr[s].value =3D o=
-&gt;data.blocks[b].powr[s].value | d[dnum+11];<br>&gt; ++<br>&gt; ++ &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;//printk(&quot;sensor[%d]-[%d]: id: %u, value: %u\n=
&quot;,<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// &nbsp; &nbsp; &nbsp;b, s=
, o-&gt;data.blocks[b].powr[s].sensor=5Fid, o-&gt;data.blocks[b].powr[s].va=
lue);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dnum =3D dnum + o-=
&gt;data.blocks[b].sensor=5Flength;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; ++ &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;else if (strcmp(o-&gt;data.blocks[b].sensor=5Ftype, &qu=
ot;CAPS&quot;) =3D=3D 0) {<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b].caps=
 =3D<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;kzalloc(sizeof(caps=5Fsensor) =
* o-&gt;data.blocks[b].num=5Fof=5Fsensors, GFP=5FKERNEL);<br>&gt; ++<br>&gt=
; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;if (o-&gt;data.blocks[b].caps =3D=3D NULL) {<br>&gt; ++ &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;ret =3D -ENOMEM;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;go=
to abort;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;}<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;caps=5Fblock=5Fid =3D b;<br>&gt; =
++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;for (s =3D 0; s &lt; o-&gt;data.blocks[b].num=5Fof=5Fsensors; s++) {<br=
>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b].caps[s].curr=5Fp=
owercap =3D d[dnum] &lt;&lt; 8;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&=
gt;data.blocks[b].caps[s].curr=5Fpowercap =3D o-&gt;data.blocks[b].caps[s].=
curr=5Fpowercap | d[dnum+1];<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;=
data.blocks[b].caps[s].curr=5Fpowerreading =3D d[dnum+2] &lt;&lt; 8;<br>&gt=
; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b].caps[s].curr=5Fpower=
reading =3D o-&gt;data.blocks[b].caps[s].curr=5Fpowerreading | d[dnum+3];<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b].caps[s].norm=5F=
powercap =3D d[dnum+4] &lt;&lt; 8;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
o-&gt;data.blocks[b].caps[s].norm=5Fpowercap =3D o-&gt;data.blocks[b].caps[=
s].norm=5Fpowercap | d[dnum+5];<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&=
gt;data.blocks[b].caps[s].max=5Fpowercap =3D d[dnum+6] &lt;&lt; 8;<br>&gt; =
++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b].caps[s].max=5Fpowercap=
 =3D o-&gt;data.blocks[b].caps[s].max=5Fpowercap| d[dnum+7];<br>&gt; ++ &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b].caps[s].min=5Fpowercap =3D d=
[dnum+8] &lt;&lt; 8;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;data.blo=
cks[b].caps[s].min=5Fpowercap =3D o-&gt;data.blocks[b].caps[s].min=5Fpowerc=
ap| d[dnum+9];<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b]=
.caps[s].user=5Fpowerlimit =3D d[dnum+10] &lt;&lt; 8;<br>&gt; ++ &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;o-&gt;data.blocks[b].caps[s].user=5Fpowerlimit =3D o-&gt=
;data.blocks[b].caps[s].user=5Fpowerlimit| d[dnum+11];<br>&gt; ++<br>&gt; +=
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;dnum =3D dnum + o-&gt;data.blocks[b].sensor=
=5Flength;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//printk(&quot;CAPS sens=
or #%d:\n&quot;, s);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//printk(&quot=
;curr=5Fpowercap is %x \n&quot;, o-&gt;data.blocks[b].caps[s].curr=5Fpowerc=
ap);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//printk(&quot;curr=5Fpowerrea=
ding is %x \n&quot;, o-&gt;data.blocks[b].caps[s].curr=5Fpowerreading);<br>=
&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//printk(&quot;norm=5Fpowercap is %x \=
n&quot;, o-&gt;data.blocks[b].caps[s].norm=5Fpowercap);<br>&gt; ++ &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;//printk(&quot;max=5Fpowercap is %x \n&quot;, o-&gt;da=
ta.blocks[b].caps[s].max=5Fpowercap);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;//printk(&quot;min=5Fpowercap is %x \n&quot;, o-&gt;data.blocks[b].caps[=
s].min=5Fpowercap);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//printk(&quot;=
user=5Fpowerlimit is %x \n&quot;, o-&gt;data.blocks[b].caps[s].user=5Fpower=
limit);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;}<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;}<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;else {<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;printk(&quot;ERROR: sensor type %s not supported\n&qu=
ot;, o-&gt;data.blocks[b].sensor=5Ftype);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret =3D -1;<br>&gt; +=
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;goto abort;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}=
<br>&gt; ++ &nbsp; &nbsp; &nbsp;}<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp=
;return 0;<br>&gt; ++abort:<br>&gt; ++ &nbsp; &nbsp; &nbsp;deinit=5Focc=5Fr=
esp=5Fbuf(o);<br>&gt; ++ &nbsp; &nbsp; &nbsp;return ret;<br>&gt; ++}<br>&gt=
; ++<br>&gt; ++/* us
ed for testing */<br>&gt; ++char fake=5Focc=5Frsp[OCC=5FDATA=5FMAX] =3D {<b=
r>&gt; ++0x69, 0x00, 0x00, 0x00, 0xa4, 0xc3, 0x00, 0x03, 0x00, 0x01, 0x00, =
0x00, 0x00, 0x00, 0x00, 0x00,<br>&gt; ++0x00, 0x00, 0x00, 0x00, 0x00, 0x6f,=
 0x70, 0x5f, 0x6f, 0x63, 0x63, 0x5f, 0x31, 0x35, 0x30, 0x37,<br>&gt; ++0x31=
, 0x36, 0x61, 0x00, 0x00, 0x53, 0x45, 0x4e, 0x53, 0x4f, 0x52, 0x04, 0x01, 0=
x54, 0x45, 0x4d,<br>&gt; ++0x50, 0x00, 0x01, 0x04, 0x0a, 0x00 ,0x6a, 0x00, =
0x00, 0x00, 0x6c, 0x00, 0x00, 0x00, 0x6d, 0x00,<br>&gt; ++0x00,0x00,0x6e,0x=
00, 0x00,0x00,0x6f,0x00, 0x00,0x00,0x70,0x00, 0x00,0x00,0x71,0x00,<br>&gt; =
++0x00,0x00,0x73,0x00, 0x00,0x00,0x74,0x00, 0x00,0x00,0x75,0x00, 0x00,0x46,=
0x52,0x45,<br>&gt; ++0x51,0x00,0x01,0x04, 0x0a,0x00,0x76,0x00, 0x00,0x00,0x=
78,0x00, 0x00,0x00,0x79,0x00,<br>&gt; ++0x00,0x00,0x7a,0x00, 0x00,0x00,0x7b=
,0x00, 0x00,0x00,0x7c,0x00, 0x00,0x00,0x7d,0x00,<br>&gt; ++0x00,0x00,0x7f,0=
x00, 0x00,0x00,0x80,0x00, 0x00,0x00,0x81,0x00, 0x00,0x50,0x4f,0x57,<br>&gt;=
 ++0x52,0x00,0x01,0x0c, 0x00,0x43,0x41,0x50, 0x53,0x00,0x01,0x0c, 0x01,0x00=
,0x00,0x00,<br>&gt; ++0x00,0x04,0xb0,0x09, 0x60,0x04,0x4c,0x00, 0x00,0x17,0=
xc5,};<br>&gt; ++<br>&gt; ++//#define DUMP=5FRAW 1<br>&gt; ++<br>&gt; ++sta=
tic int occ=5Fget=5Fall(struct i2c=5Fclient *client, occ=5Fresponse=5Ft *oc=
c=5Fresp)<br>&gt; ++{<br>&gt; ++ &nbsp; &nbsp; &nbsp;char occ=5Fdata[OCC=5F=
DATA=5FMAX];<br>&gt; ++ &nbsp; &nbsp; &nbsp;uint16=5Ft num=5Fbytes =3D 0;<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp;int b =3D 0;<br>&gt; ++ &nbsp; &nbsp; &nbsp;i=
nt ret =3D 0;<br>&gt; ++/*<br>&gt; ++ &nbsp; &nbsp; &nbsp;//Procedure to ac=
cess SRAM where OCC data is located<br>&gt; ++ &nbsp; &nbsp; &nbsp;occ=5Fpu=
tscom(client, SCOM=5FOCC=5FSRAM=5FWOX, 0x08000000, 0x00000000);<br>&gt; ++ =
&nbsp; &nbsp; &nbsp;occ=5Fputscom(client, SCOM=5FOCC=5FSRAM=5FWAND, 0xFBFFF=
FFF, 0xFFFFFFFF);<br>&gt; ++ &nbsp; &nbsp; &nbsp;occ=5Fputscom(client, SCOM=
=5FOCC=5FSRAM=5FADDR, OCC=5FRESPONSE=5FADDR, 0x00000000);<br>&gt; ++ &nbsp;=
 &nbsp; &nbsp;occ=5Fputscom(client, SCOM=5FOCC=5FSRAM=5FADDR, OCC=5FRESPONS=
E=5FADDR, 0x00000000);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;occ=5Fgets=
comb(client, SCOM=5FOCC=5FSRAM=5FDATA, occ=5Fdata, 0);<br>&gt; ++<br>&gt; +=
+*/<br><br>Remove commented out code.<br><br>&gt; ++<br>&gt; ++ &nbsp; &nbs=
p; &nbsp;// Init OCB<br>&gt; ++ &nbsp; &nbsp; &nbsp;occ=5Fputscom(client, O=
CB=5FSTATUS=5FCONTROL=5FOR, &nbsp;0x08000000, 0x00000000);<br>&gt; ++ &nbsp=
; &nbsp; &nbsp;occ=5Fputscom(client, OCB=5FSTATUS=5FCONTROL=5FAND, 0xFBFFFF=
FF, 0xFFFFFFFF);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;// Send poll com=
mand to OCC<br>&gt; ++ &nbsp; &nbsp; &nbsp;occ=5Fputscom(client, OCB=5FADDR=
ESS, OCC=5FCOMMAND=5FADDR, 0x00000000);<br>&gt; ++ &nbsp; &nbsp; &nbsp;occ=
=5Fputscom(client, OCB=5FADDRESS, OCC=5FCOMMAND=5FADDR, 0x00000000);<br>&gt=
; ++ &nbsp; &nbsp; &nbsp;occ=5Fputscom(client, OCB=5FDATA, 0x00000001, 0x10=
001100);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;// Trigger ATTN<br>&gt; =
++ &nbsp; &nbsp; &nbsp;occ=5Fputscom(client, ATTN=5FDATA, 0x01010000, 0x000=
00000);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;// TODO: check command st=
atus Refere to<br>&gt; ++ &nbsp; &nbsp; &nbsp;// &quot;1.6.2 OCC Command/Re=
sponse Sequence&quot; in OCC=5FOpenPwr=5FFW=5FInterfaces1.2.pdf<br><br>Use =
C style comments.<br><br>This needs more information as to why you're sleep=
ing for so long.<br><br>&gt; ++ &nbsp; &nbsp; &nbsp;// Use sleep as workaro=
und<br>&gt; ++ &nbsp; &nbsp; &nbsp;//msleep(2000);<br>&gt; ++<br>&gt; ++ &n=
bsp; &nbsp; &nbsp;// Get response data<br>&gt; ++ &nbsp; &nbsp; &nbsp;occ=
=5Fputscom(client, OCB=5FADDRESS, OCC=5FRESPONSE=5FADDR, 0x00000000);<br>&g=
t; ++ &nbsp; &nbsp; &nbsp;occ=5Fgetscomb(client, OCB=5FDATA, occ=5Fdata, 0)=
;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;/* FIXME: use fake data to test=
 driver without hw */<br>&gt; ++ &nbsp; &nbsp; &nbsp;//printk(&quot;i2c-occ=
: using FAKE occ data\n&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp;//memcpy(&am=
p;occ=5Fdata[0], &amp;fake=5Focc=5Frsp[0], sizeof(occ=5Fdata));<br><br>Maki=
ng your code testable is a good idea. We can't have commented out<br>code, =
but perhaps we could use debugfs to pass the driver fake data<br>from users=
pace?<br><br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;num=5Fbytes =3D get=5Fo=
ccdata=5Flength(occ=5Fdata);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;//pr=
intk(&quot;OCC data length: %d\n&quot;, num=5Fbytes);<br>&gt; ++<br>&gt; ++=
#ifdef DUMP=5FRAW<br>&gt; ++ &nbsp; &nbsp; &nbsp;int i =3D 0;<br>&gt; ++ &n=
bsp; &nbsp; &nbsp;printk(&quot;\nRAW data\n=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D\n&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp;for (i =
=3D 0; i &lt; 8; i++) {<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;if(i =3D=3D 4) printk(&quot; &nbsp;&quot;);<br>&gt; ++ &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;printk(&quot;%02x&quot;, occ=5Fdata[i])=
;<br>&gt; ++ &nbsp; &nbsp; &nbsp;}<br>&gt; ++ &nbsp; &nbsp; &nbsp;printk(&q=
uot;\n&quot;);<br>&gt; ++#endif<br><br>Use something that can be run-time &=
nbsp;enabled to dump this out. A sysfs file?<br><br>&gt; ++<br>&gt; ++ &nbs=
p; &nbsp; &nbsp;if (num=5Fbytes &gt; OCC=5FDATA=5FMAX) {<br>&gt; ++ &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;printk(&quot;ERROR: OCC data lengt=
h must be &lt; 4KB\n&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;return -1;<br>&gt; ++ &nbsp; &nbsp; &nbsp;}<br>&gt; ++<br>&gt;=
 ++ &nbsp; &nbsp; &nbsp;if (num=5Fbytes &lt;=3D 0) {<br>&gt; ++ &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;printk(&quot;ERROR: OCC data length is=
 zero\n&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
return -1;<br>&gt; ++ &nbsp; &nbsp; &nbsp;}<br>&gt; ++<br>&gt; ++ &nbsp; &n=
bsp; &nbsp;for (b =3D 8; b &lt; num=5Fbytes + 8; b =3D b + 8) {<br>&gt; ++ =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//occ=5Fgetscomb(client, SC=
OM=5FOCC=5FSRAM=5FDATA, occ=5Fdata, b);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;occ=5Fgetscomb(client, OCB=5FDATA, occ=5Fdata, b);<=
br>&gt; ++#ifdef DUMP=5FRAW<br>&gt; ++ &nbsp; &nbsp; &nbsp;for (i =3D 0; i =
&lt; 8; i++) {<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i=
f(i =3D=3D 4) printk(&quot; &nbsp;&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;printk(&quot;%02x&quot;, occ=5Fdata[b+i]);<br>&g=
t; ++ &nbsp; &nbsp; &nbsp;}<br>&gt; ++ &nbsp; &nbsp; &nbsp;printk(&quot;\n&=
quot;);<br>&gt; ++#endif<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;}<br>&gt=
; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;/* FIXME: use fake data to test driver =
without hw */<br>&gt; ++ &nbsp; &nbsp; &nbsp;//memcpy(&amp;occ=5Fdata[0], &=
amp;fake=5Focc=5Frsp[0], sizeof(occ=5Fdata));<br>&gt; ++<br>&gt; ++ &nbsp; =
&nbsp; &nbsp;ret =3D parse=5Focc=5Fresponse(occ=5Fdata, occ=5Fresp);<br>&gt=
; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;return ret;<br>&gt; ++}<br>&gt; ++<br>&=
gt; ++<br>&gt; ++static int occ=5Fupdate=5Fdevice(struct device *dev)<br>&g=
t; ++{<br>&gt; ++ &nbsp; &nbsp; &nbsp;struct occ=5Fdrv=5Fdata *data =3D dev=
=5Fget=5Fdrvdata(dev);<br>&gt; ++ &nbsp; &nbsp; &nbsp;struct i2c=5Fclient *=
client =3D data-&gt;client;<br>&gt; ++ &nbsp; &nbsp; &nbsp;int ret =3D 0;<b=
r>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;mutex=5Flock(&amp;data-&gt;update=
=5Flock);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;if (time=5Fafter(jiffie=
s, data-&gt;last=5Fupdated + data-&gt;sample=5Ftime)<br>&gt; ++ &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;|| !data-&gt;valid) {<br>&gt; ++ &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;deinit=5Focc=5Fresp=5Fbuf(&amp;data-&gt;occ=5F=
resp);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;ret =3D occ=5Fget=5Fall(client, &amp;data-&gt;occ=5Fresp);<br>&gt; ++<br>=
&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;data-&gt;last=5Fupd=
ated =3D jiffies;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;data-&gt;valid =3D 1;<br>&gt; ++ &nbsp; &nbsp; &nbsp;}<br>&gt; ++ &nbsp; =
&nbsp; &nbsp;mutex=5Funlock(&amp;data-&gt;update=5Flock);<br>&gt; ++<br>&gt=
; ++ &nbsp; &nbsp; &nbsp;return ret;<br>&gt; ++}<br>&gt; ++<br>&gt; ++/* --=
--------------------------------------------------------------------*/<br>&=
gt; ++/* sysfs attributes for hwmon */<br>&gt; ++<br>&gt; ++static ssize=5F=
t show=5Focc=5Ftemp=5Finput(struct device *hwmon=5Fdev, struct device=5Fatt=
ribute *da, char *buf)<br>&gt; ++{<br>&gt; ++ &nbsp; &nbsp; &nbsp;struct se=
nsor=5Fdevice=5Fattribute *attr =3D to=5Fsensor=5Fdev=5Fattr(da);<br>&gt; +=
+ &nbsp; &nbsp; &nbsp;int n =3D attr-&gt;index;<br>&gt; ++ &nbsp; &nbsp; &n=
bsp;struct device * dev =3D hwmon=5Fdev-&gt;parent;<br>&gt; ++ &nbsp; &nbsp=
; &nbsp;struct occ=5Fdrv=5Fdata *data =3D dev=5Fget=5Fdrvdata(dev);<br>&gt;=
 ++ &nbsp; &nbsp; &nbsp;int ret =3D 0;<br>&gt; ++ &nbsp; &nbsp; &nbsp;occ=
=5Fsensor *sensor;<br>&gt; ++ &nbsp; &nbsp; &nbsp;int val =3D 0;<br>&gt; ++=
<br>&gt; ++ &nbsp; &nbsp; &nbsp;ret =3D occ=5Fupdate=5Fdevice(dev);<br>&gt;=
 ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;if (ret !=3D 0)<br>&gt; ++ &nbsp; &nbsp;=
 &nbsp;{<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* FIXM=
E: to test fake data */<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;printk(&quot;ERROR: cannot get occ sensor data: %d\n&quot;, ret);<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return ret;<br>&g=
t; ++ &nbsp; &nbsp; &nbsp;}<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;if (d=
ata-&gt;occ=5Fresp.data.blocks =3D=3D NULL ||<br>&gt; ++ &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;data-&gt;occ=5Fresp.data.blocks[data-&gt;occ=
=5Fresp.temp=5Fblock=5Fid].sensor =3D=3D NULL)<br>&gt; ++ &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; ++<br>&gt; ++ &nbsp; &nbs=
p; &nbsp;//printk(&quot;block=5Fid: %d, sensor: %d\n&quot;, data-&gt;occ=5F=
resp.temp=5Fblock=5Fid, n -1);<br>&gt; ++ &nbsp; &nbsp; &nbsp;sensor =3D &a=
mp;data-&gt;occ=5Fresp.data.blocks[data-&gt;occ=5Fresp.temp=5Fblock=5Fid].s=
ensor[n - 1];<br>&gt; ++ &nbsp; &nbsp; &nbsp;/* in millidegree Celsius */<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp;val =3D sensor-&gt;value * 1000;<br>&gt; ++ &=
nbsp; &nbsp; &nbsp;//printk(&quot;temp%d sensor value: %d\n&quot;, n, val);=
<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;//printk(&quot;------------- abo=
ve are debug message, bellow is real output------------\n&quot;);<br>&gt; +=
+ &nbsp; &nbsp; &nbsp;return sprintf(buf, &quot;%d\n&quot;, val);<br>&gt; +=
+}<br>&gt; ++<br>&gt; ++static ssize=5Ft show=5Focc=5Ftemp=5Flabel(struct d=
evice *hwmon=5Fdev, struct device=5Fattribute *da, char *buf)<br>&gt; ++{<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp;struct sensor=5Fdevice=5Fattribute *attr =3D =
to=5Fsensor=5Fdev=5Fattr(da);<br>&gt; ++ &nbsp; &nbsp; &nbsp;int n =3D attr=
-&gt;index;<br>&gt; ++ &nbsp; &nbsp; &nbsp;struct device *dev =3D hwmon=5Fd=
ev-&gt;parent;<br>&gt; ++ &nbsp; &nbsp; &nbsp;struct occ=5Fdrv=5Fdata *data=
 =3D dev=5Fget=5Fdrvdata(dev);<br>&gt; ++ &nbsp; &nbsp; &nbsp;int ret =3D 0=
;<br>&gt; ++ &nbsp; &nbsp; &nbsp;occ=5Fsensor *sensor;<br>&gt; ++ &nbsp; &n=
bsp; &nbsp;int val =3D 0;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;ret =3D=
 occ=5Fupdate=5Fdevice(dev);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;if (=
ret !=3D 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp;{<br>&gt; ++ &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: to test fake data */<br>&gt; ++ &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;printk(&quot;ERROR: cannot get =
occ sensor data: %d\n&quot;, ret);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;return ret;<br>&gt; ++ &nbsp; &nbsp; &nbsp;}<br>&gt; ++<=
br>&gt; ++ &nbsp; &nbsp; &nbsp;if (data-&gt;occ=5Fresp.data.blocks =3D=3D N=
ULL ||<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;data-&gt;=
occ=5Fresp.data.blocks[data-&gt;occ=5Fresp.temp=5Fblock=5Fid].sensor =3D=3D=
 NULL)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1=
;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;//printk(&quot;temp=5Fblock=5Fi=
d: %d, sensor: %d\n&quot;, data-&gt;occ=5Fresp.temp=5Fblock=5Fid, n -1);<br=
>&gt; ++ &nbsp; &nbsp; &nbsp;sensor =3D &amp;data-&gt;occ=5Fresp.data.block=
s[data-&gt;occ=5Fresp.temp=5Fblock=5Fid].sensor[n - 1];<br>&gt; ++ &nbsp; &=
nbsp; &nbsp;val =3D sensor-&gt;sensor=5Fid;<br>&gt; ++ &nbsp; &nbsp; &nbsp;=
//printk(&quot;temp%d sensor id: %d\n&quot;, n, val);<br>&gt; ++<br>&gt; ++=
 &nbsp; &nbsp; &nbsp;//printk(&quot;------------- above are debug message, =
bellow is real output------------\n&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp;=
return sprintf(buf, &quot;%d\n&quot;, val);<br>&gt; ++}<br>&gt; ++<br>&gt; =
++static ssize=5Ft show=5Focc=5Fpower=5Flabel(struct device *hwmon=5Fdev, s=
truct device=5Fattribute *da, char *buf)<br>&gt; ++{<br>&gt; ++ &nbsp; &nbs=
p; &nbsp;struct sensor=5Fdevice=5Fattribute *attr =3D to=5Fsensor=5Fdev=5Fa=
ttr(da);<br>&gt; ++ &nbsp; &nbsp; &nbsp;int n =3D attr-&gt;index;<br>&gt; +=
+ &nbsp; &nbsp; &nbsp;struct device *dev =3D hwmon=5Fdev-&gt;parent;<br>&gt=
; ++ &nbsp; &nbsp; &nbsp;struct occ=5Fdrv=5Fdata *data =3D dev=5Fget=5Fdrvd=
ata(dev);<br>&gt; ++ &nbsp; &nbsp; &nbsp;int ret =3D 0;<br>&gt; ++ &nbsp; &=
nbsp; &nbsp;powr=5Fsensor *sensor;<br>&gt; ++ &nbsp; &nbsp; &nbsp;int val =
=3D 0;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;ret =3D occ=5Fupdate=5Fdev=
ice(dev);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;if (ret !=3D 0)<br>&gt;=
 ++ &nbsp; &nbsp; &nbsp;{<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;/* FIXME: to test fake data */<br>&gt; ++ &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;printk(&quot;ERROR: cannot get occ sensor data: %d=
\n&quot;, ret);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
return ret;<br>&gt; ++ &nbsp; &nbsp; &nbsp;}<br>&gt; ++<br>&gt; ++ &nbsp; &=
nbsp; &nbsp;//printk(&quot;power=5Fblock=5Fid: %d, sensor: %d\n&quot;, data=
-&gt;occ=5Fresp.power=5Fblock=5Fid, n -1);<br>&gt; ++<br>&gt; ++ &nbsp; &nb=
sp; &nbsp;if (data-&gt;occ=5Fresp.data.blocks =3D=3D NULL ||<br>&gt; ++ &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;data-&gt;occ=5Fresp.data.block=
s[data-&gt;occ=5Fresp.power=5Fblock=5Fid].powr =3D=3D NULL)<br>&gt; ++ &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; ++<br>&gt; +=
+ &nbsp; &nbsp; &nbsp;sensor =3D &amp;data-&gt;occ=5Fresp.data.blocks[data-=
&gt;occ=5Fresp.power=5Fblock=5Fid].powr[n - 1];<br>&gt; ++ &nbsp; &nbsp; &n=
bsp;val =3D sensor-&gt;sensor=5Fid;<br>&gt; ++ &nbsp; &nbsp; &nbsp;//printk=
(&quot;power%d sensor id: %d\n&quot;, n, val);<br>&gt; ++<br>&gt; ++ &nbsp;=
 &nbsp; &nbsp;//printk(&quot;------------- above are debug message, bellow =
is real output------------\n&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp;return =
sprintf(buf, &quot;%d\n&quot;, val);<br>&gt; ++}<br>&gt; ++<br>&gt; ++<br>&=
gt; ++static ssize=5Ft show=5Focc=5Fpower=5Finput(struct device *hwmon=5Fde=
v, struct device=5Fattribute *da, char *buf)<br>&gt; ++{<br>&gt; ++ &nbsp; =
&nbsp; &nbsp;struct sensor=5Fdevice=5Fattribute *attr =3D to=5Fsensor=5Fdev=
=5Fattr(da);<br>&gt; ++ &nbsp; &nbsp; &nbsp;int n =3D attr-&gt;index;<br>&g=
t; ++ &nbsp; &nbsp; &nbsp;struct device *dev =3D hwmon=5Fdev-&gt;parent;<br=
>&gt; ++ &nbsp; &nbsp; &nbsp;struct occ=5Fdrv=5Fdata *data =3D dev=5Fget=5F=
drvdata(dev);<br>&gt; ++ &nbsp; &nbsp; &nbsp;int ret =3D 0;<br>&gt; ++ &nbs=
p; &nbsp; &nbsp;powr=5Fsensor *sensor;<br>&gt; ++ &nbsp; &nbsp; &nbsp;int v=
al =3D 0;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;ret =3D occ=5Fupdate=5F=
device(dev);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;if (ret !=3D 0)<br>&=
gt; ++ &nbsp; &nbsp; &nbsp;{<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;/* FIXME: to test fake data */<br>&gt; ++ &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;printk(&quot;ERROR: cannot get occ sensor data:=
 %d\n&quot;, ret);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;return ret;<br>&gt; ++ &nbsp; &nbsp; &nbsp;}<br>&gt; ++<br>&gt; ++ &nbsp=
; &nbsp; &nbsp;//printk(&quot;power block=5Fid: %d, sensor: %d\n&quot;, dat=
a-&gt;occ=5Fresp.power=5Fblock=5Fid, n -1);<br>&gt; ++<br>&gt; ++ &nbsp; &n=
bsp; &nbsp;if (data-&gt;occ=5Fresp.data.blocks =3D=3D NULL ||<br>&gt; ++ &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;data-&gt;occ=5Fresp.data.bloc=
ks[data-&gt;occ=5Fresp.power=5Fblock=5Fid].powr =3D=3D NULL)<br>&gt; ++ &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; ++<br>&gt; =
++<br>&gt; ++ &nbsp; &nbsp; &nbsp;sensor =3D &amp;data-&gt;occ=5Fresp.data.=
blocks[data-&gt;occ=5Fresp.power=5Fblock=5Fid].powr[n - 1];<br>&gt; ++ &nbs=
p; &nbsp; &nbsp;val =3D sensor-&gt;value;<br>&gt; ++ &nbsp; &nbsp; &nbsp;//=
printk(&quot;power%d sensor value: %d\n&quot;, n, val);<br>&gt; ++<br>&gt; =
++ &nbsp; &nbsp; &nbsp;//printk(&quot;------------- above are debug message=
, bellow is real output------------\n&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbs=
p;return sprintf(buf, &quot;%d\n&quot;, val);<br>&gt; ++}<br>&gt; ++<br>&gt=
; ++<br>&gt; ++static ssize=5Ft show=5Focc=5Ffreq=5Flabel(struct device *hw=
mon=5Fdev, struct device=5Fattribute *da, char *buf)<br>&gt; ++{<br>&gt; ++=
 &nbsp; &nbsp; &nbsp;struct sensor=5Fdevice=5Fattribute *attr =3D to=5Fsens=
or=5Fdev=5Fattr(da);<br>&gt; ++ &nbsp; &nbsp; &nbsp;int n =3D attr-&gt;inde=
x;<br>&gt; ++ &nbsp; &nbsp; &nbsp;struct device *dev =3D hwmon=5Fdev-&gt;pa=
rent;<br>&gt; ++ &nbsp; &nbsp; &nbsp;struct occ=5Fdrv=5Fdata *data =3D dev=
=5Fget=5Fdrvdata(dev);<br>&gt; ++ &nbsp; &nbsp; &nbsp;int ret =3D 0;<br>&gt=
; ++ &nbsp; &nbsp; &nbsp;occ=5Fsensor *sensor;<br>&gt; ++ &nbsp; &nbsp; &nb=
sp;int val =3D 0;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;ret =3D occ=5Fu=
pdate=5Fdevice(dev);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;if (ret !=3D=
 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp;{<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;/* FIXME: to test fake data */<br>&gt; ++ &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;printk(&quot;ERROR: cannot get occ sens=
or data: %d\n&quot;, ret);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;return ret;<br>&gt; ++ &nbsp; &nbsp; &nbsp;}<br>&gt; ++<br>&gt; =
++ &nbsp; &nbsp; &nbsp;if (data-&gt;occ=5Fresp.data.blocks =3D=3D NULL ||<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;data-&gt;occ=5Fre=
sp.data.blocks[data-&gt;occ=5Fresp.freq=5Fblock=5Fid].sensor =3D=3D NULL)<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt=
; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;//printk(&quot;freq=5Fblock=5Fid: %d, s=
ensor: %d\n&quot;, data-&gt;occ=5Fresp.freq=5Fblock=5Fid, n -1);<br>&gt; ++=
 &nbsp; &nbsp; &nbsp;sensor =3D &amp;data-&gt;occ=5Fresp.data.blocks[data-&=
gt;occ=5Fresp.freq=5Fblock=5Fid].sensor[n - 1];<br>&gt; ++ &nbsp; &nbsp; &n=
bsp;val =3D sensor-&gt;sensor=5Fid;<br>&gt; ++ &nbsp; &nbsp; &nbsp;//printk=
(&quot;freq%d sensor id: %d\n&quot;, n, val);<br>&gt; ++<br>&gt; ++ &nbsp; =
&nbsp; &nbsp;//printk(&quot;------------- above are debug message, bellow i=
s real output------------\n&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp;return s=
printf(buf, &quot;%d\n&quot;, val);<br>&gt; ++}<br>&gt; ++<br>&gt; ++<br>&g=
t; ++static ssize=5Ft show=5Focc=5Ffreq=5Finput(struct device *hwmon=5Fdev,=
 struct device=5Fattribute *da, char *buf)<br>&gt; ++{<br>&gt; ++ &nbsp; &n=
bsp; &nbsp;struct sensor=5Fdevice=5Fattribute *attr =3D to=5Fsensor=5Fdev=
=5Fattr(da);<br>&gt; ++ &nbsp; &nbsp; &nbsp;int n =3D attr-&gt;index;<br>&g=
t; ++ &nbsp; &nbsp; &nbsp;struct device *dev =3D hwmon=5Fdev-&gt;parent;<br=
>&gt; ++ &nbsp; &nbsp; &nbsp;struct occ=5Fdrv=5Fdata *data =3D dev=5Fget=5F=
drvdata(dev);<br>&gt; ++ &nbsp; &nbsp; &nbsp;int ret =3D 0;<br>&gt; ++ &nbs=
p; &nbsp; &nbsp;occ=5Fsensor *sensor;<br>&gt; ++ &nbsp; &nbsp; &nbsp;int va=
l =3D 0;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;ret =3D occ=5Fupdate=5Fd=
evice(dev);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;if (ret !=3D 0)<br>&g=
t; ++ &nbsp; &nbsp; &nbsp;{<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;/* FIXME: to test fake data */<br>&gt; ++ &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;printk(&quot;ERROR: cannot get occ sensor data: =
%d\n&quot;, ret);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;return ret;<br>&gt; ++ &nbsp; &nbsp; &nbsp;}<br>&gt; ++<br>&gt; ++ &nbsp;=
 &nbsp; &nbsp;if (data-&gt;occ=5Fresp.data.blocks =3D=3D NULL ||<br>&gt; ++=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;data-&gt;occ=5Fresp.data.b=
locks[data-&gt;occ=5Fresp.freq=5Fblock=5Fid].sensor =3D=3D NULL)<br>&gt; ++=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; ++<br>&=
gt; ++ &nbsp; &nbsp; &nbsp;//printk(&quot;block=5Fid: %d, sensor: %d\n&quot=
;, data-&gt;occ=5Fresp.freq=5Fblock=5Fid, n -1);<br>&gt; ++ &nbsp; &nbsp; &=
nbsp;sensor =3D &amp;data-&gt;occ=5Fresp.data.blocks[data-&gt;occ=5Fresp.fr=
eq=5Fblock=5Fid].sensor[n - 1];<br>&gt; ++ &nbsp; &nbsp; &nbsp;val =3D sens=
or-&gt;value;<br>&gt; ++ &nbsp; &nbsp; &nbsp;//printk(&quot;freq%d sensor v=
alue: %d\n&quot;, n, val);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;//prin=
tk(&quot;------------- above are debug message, bellow is real output------=
------\n&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp;return sprintf(buf, &quot;%=
d\n&quot;, val);<br>&gt; ++}<br>&gt; ++<br>&gt; ++static ssize=5Ft show=5Fo=
cc=5Fcaps(struct device *hwmon=5Fdev, struct device=5Fattribute *da, char *=
buf)<br>&gt; ++{<br>&gt; ++ &nbsp; &nbsp; &nbsp;struct sensor=5Fdevice=5Fat=
tribute=5F2 *attr =3D to=5Fsensor=5Fdev=5Fattr=5F2(da);<br>&gt; ++ &nbsp; &=
nbsp; &nbsp;int nr =3D attr-&gt;nr;<br>&gt; ++ &nbsp; &nbsp; &nbsp;int n =
=3D attr-&gt;index;<br>&gt; ++ &nbsp; &nbsp; &nbsp;struct device *dev =3D h=
wmon=5Fdev-&gt;parent;<br>&gt; ++ &nbsp; &nbsp; &nbsp;struct occ=5Fdrv=5Fda=
ta *data =3D dev=5Fget=5Fdrvdata(dev);<br>&gt; ++ &nbsp; &nbsp; &nbsp;int r=
et =3D 0;<br>&gt; ++ &nbsp; &nbsp; &nbsp;caps=5Fsensor *sensor;<br>&gt; ++ =
&nbsp; &nbsp; &nbsp;int val =3D 0;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbs=
p;ret =3D occ=5Fupdate=5Fdevice(dev);<br>&gt; ++ &nbsp; &nbsp; &nbsp;if (re=
t !=3D 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp;{<br>&gt; ++ &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: to test fake data */<br>&gt; ++ &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;printk(&quot;ERROR: cannot get oc=
c sensor data: %d\n&quot;, ret);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;return ret;<br>&gt; ++ &nbsp; &nbsp; &nbsp;}<br>&gt; ++<br=
>&gt; ++ &nbsp; &nbsp; &nbsp;//printk(&quot;block=5Fid: %d, sensor: %d, nr:=
 %d\n&quot;, data-&gt;occ=5Fresp.caps=5Fblock=5Fid, n - 1, nr);<br>&gt; ++ =
&nbsp; &nbsp; &nbsp;if (data-&gt;occ=5Fresp.data.blocks =3D=3D NULL ||<br>&=
gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;data-&gt;occ=5Fresp.=
data.blocks[data-&gt;occ=5Fresp.caps=5Fblock=5Fid].caps =3D=3D NULL)<br>&gt=
; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; ++<=
br>&gt; ++ &nbsp; &nbsp; &nbsp;sensor =3D &amp;data-&gt;occ=5Fresp.data.blo=
cks[data-&gt;occ=5Fresp.caps=5Fblock=5Fid].caps[n - 1];<br>&gt; ++<br>&gt; =
++ &nbsp; &nbsp; &nbsp;switch (nr) {<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;case 0:<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D sensor-&gt;curr=5Fpowercap=
;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;break;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;case 1:<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;val =3D sensor-&gt;curr=5Fpowerreading;<br>&gt; ++=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;break;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 2:=
<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;val =3D sensor-&gt;norm=5Fpowercap;<br>&gt; ++ &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>&gt;=
 ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 3:<br>&gt; ++ &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val=
 =3D sensor-&gt;max=5Fpowercap;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>&gt; ++ &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 4:<br>&gt; ++ &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D sensor-&gt;m=
in=5Fpowercap;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;break;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;case 5:<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D sensor-&gt;user=5Fpowerlimit;=
<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;break;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;default:<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;val =3D 0;<br>&gt; ++ &nbsp; &nbsp; &nbsp;}<br>&gt=
; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;//printk(&quot;caps%d sensor value: %d,=
 nr: %d\n&quot;, n, val, nr);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;//p=
rintk(&quot;------------- above are debug message, bellow is real output---=
---------\n&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp;return sprintf(buf, &quo=
t;%d\n&quot;, val);<br>&gt; ++}<br>&gt; ++<br>&gt; ++#if 0<br>&gt; ++static=
 SENSOR=5FDEVICE=5FATTR(temp1=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput=
, NULL, 1);<br>&gt; ++static SENSOR=5FDEVICE=5FATTR(temp2=5Finput, S=5FIRUG=
O, show=5Focc=5Ftemp=5Finput, NULL, 2);<br>&gt; ++static SENSOR=5FDEVICE=5F=
ATTR(temp3=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 3);<br>&gt;=
 ++static SENSOR=5FDEVICE=5FATTR(temp4=5Finput, S=5FIRUGO, show=5Focc=5Ftem=
p=5Finput, NULL, 4);<br>&gt; ++static SENSOR=5FDEVICE=5FATTR(temp5=5Finput,=
 S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 5);<br>&gt; ++static SENSOR=5F=
DEVICE=5FATTR(temp6=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 6)=
;<br>&gt; ++static SENSOR=5FDEVICE=5FATTR(temp7=5Finput, S=5FIRUGO, show=5F=
occ=5Ftemp=5Finput, NULL, 7);<br>&gt; ++static SENSOR=5FDEVICE=5FATTR(temp8=
=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 8);<br>&gt; ++static =
SENSOR=5FDEVICE=5FATTR(temp9=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput,=
 NULL, 9);<br>&gt; ++static SENSOR=5FDEVICE=5FATTR(temp1=5Flabel, S=5FIRUGO=
, show=5Focc=5Ftemp=5Flabel, NULL, 1);<br>&gt; ++static SENSOR=5FDEVICE=5FA=
TTR(temp2=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 2);<br>&gt; =
++static SENSOR=5FDEVICE=5FATTR(temp3=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=
=5Flabel, NULL, 3);<br>&gt; ++static SENSOR=5FDEVICE=5FATTR(temp4=5Flabel, =
S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 4);<br>&gt; ++static SENSOR=5FD=
EVICE=5FATTR(temp5=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 5);=
<br>&gt; ++static SENSOR=5FDEVICE=5FATTR(temp6=5Flabel, S=5FIRUGO, show=5Fo=
cc=5Ftemp=5Flabel, NULL, 6);<br>&gt; ++static SENSOR=5FDEVICE=5FATTR(temp7=
=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 7);<br>&gt; ++static =
SENSOR=5FDEVICE=5FATTR(temp8=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel,=
 NULL, 8);<br>&gt; ++static SENSOR=5FDEVICE=5FATTR(temp9=5Flabel, S=5FIRUGO=
, show=5Focc=5Ftemp=5Flabel, NULL, 9);<br>&gt; ++<br>&gt; ++static SENSOR=
=5FDEVICE=5FATTR(power1=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finput, NUL=
L, 1);<br>&gt; ++static SENSOR=5FDEVICE=5FATTR(power1=5Flabel, S=5FIRUGO, s=
how=5Focc=5Fpower=5Flabel, NULL, 1);<br>&gt; ++static SENSOR=5FDEVICE=5FATT=
R(power2=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finput, NULL, 2);<br>&gt; =
++static SENSOR=5FDEVICE=5FATTR(power2=5Flabel, S=5FIRUGO, show=5Focc=5Fpow=
er=5Flabel, NULL, 2);<br>&gt; ++static SENSOR=5FDEVICE=5FATTR(power3=5Finpu=
t, S=5FIRUGO, show=5Focc=5Fpower=5Finput, NULL, 3);<br>&gt; ++static SENSOR=
=5FDEVICE=5FATTR(power3=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flabel, NUL=
L, 3);<br>&gt; ++static SENSOR=5FDEVICE=5FATTR(power4=5Finput, S=5FIRUGO, s=
how=5Focc=5Fpower=5Finput, NULL, 4);<br>&gt; ++static SENSOR=5FDEVICE=5FATT=
R(power4=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flabel, NULL, 4);<br>&gt; =
++<br>&gt; ++static SENSOR=5FDEVICE=5FATTR(freq1=5Finput, S=5FIRUGO, show=
=5Focc=5Ffreq=5Finput, NULL, 1);<br>&gt; ++static SENSOR=5FDEVICE=5FATTR(fr=
eq1=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel, NULL, 1);<br>&gt; ++stat=
ic SENSOR=5FDEVICE=5FATTR(freq2=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finp=
ut, NULL, 2);<br>&gt; ++static SENSOR=5FDEVICE=5FATTR(freq2=5Flabel, S=5FIR=
UGO, show=5Focc=5Ffreq=5Flabel, NULL, 2);<br>&gt; ++static SENSOR=5FDEVICE=
=5FATTR(freq3=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput, NULL, 3);<br>&=
gt; ++static SENSOR=5FDEVICE=5FATTR(freq3=5Flabel, S=5FIRUGO, show=5Focc=5F=
freq=5Flabel, NULL, 3);<br>&gt; ++static SENSOR=5FDEVICE=5FATTR(freq4=5Finp=
ut, S=5FIRUGO, show=5Focc=5Ffreq=5Finput, NULL, 4);<br>&gt; ++static SENSOR=
=5FDEVICE=5FATTR(freq4=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel, NULL,=
 4);<br>&gt; ++<br>&gt; ++static struct attribute *occ=5Fattrs[] =3D {<br>&=
gt; ++ &nbsp; &nbsp; &nbsp;&amp;sensor=5Fdev=5Fattr=5Ftemp1=5Finput.dev=5Fa=
ttr.attr,<br>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;sensor=5Fdev=5Fattr=5Ftemp2=
=5Finput.dev=5Fattr.attr,<br>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;sensor=5Fdev=
=5Fattr=5Ftemp3=5Finput.dev=5Fattr.attr,<br>&gt; ++ &nbsp; &nbsp; &nbsp;&am=
p;sensor=5Fdev=5Fattr=5Ftemp4=5Finput.dev=5Fattr.attr,<br>&gt; ++ &nbsp; &n=
bsp; &nbsp;&amp;sensor=5Fdev=5Fattr=5Ftemp5=5Finput.dev=5Fattr.attr,<br>&gt=
; ++ &nbsp; &nbsp; &nbsp;&amp;sensor=5Fdev=5Fattr=5Ftemp6=5Finput.dev=5Fatt=
r.attr,<br>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;sensor=5Fdev=5Fattr=5Ftemp7=5Fi=
nput.dev=5Fattr.attr,<br>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;sensor=5Fdev=5Fat=
tr=5Ftemp8=5Finput.dev=5Fattr.attr,<br>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;sen=
sor=5Fdev=5Fattr=5Ftemp9=5Finput.dev=5Fattr.attr,<br>&gt; ++ &nbsp; &nbsp; =
&nbsp;&amp;sensor=5Fdev=5Fattr=5Ftemp1=5Flabel.dev=5Fattr.attr,<br>&gt; ++ =
&nbsp; &nbsp; &nbsp;&amp;sensor=5Fdev=5Fattr=5Ftemp2=5Flabel.dev=5Fattr.att=
r,<br>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;sensor=5Fdev=5Fattr=5Ftemp3=5Flabel.=
dev=5Fattr.attr,<br>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;sensor=5Fdev=5Fattr=5F=
temp4=5Flabel.dev=5Fattr.attr,<br>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;sensor=
=5Fdev=5Fattr=5Ftemp5=5Flabel.dev=5Fattr.attr,<br>&gt; ++ &nbsp; &nbsp; &nb=
sp;&amp;sensor=5Fdev=5Fattr=5Ftemp6=5Flabel.dev=5Fattr.attr,<br>&gt; ++ &nb=
sp; &nbsp; &nbsp;&amp;sensor=5Fdev=5Fattr=5Ftemp7=5Flabel.dev=5Fattr.attr,<=
br>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;sensor=5Fdev=5Fattr=5Ftemp8=5Flabel.dev=
=5Fattr.attr,<br>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;sensor=5Fdev=5Fattr=5Ftem=
p9=5Flabel.dev=5Fattr.attr,<br>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;sensor=5Fde=
v=5Fattr=5Fpower1=5Finput.dev=5Fattr.attr,<br>&gt; ++ &nbsp; &nbsp; &nbsp;&=
amp;sensor=5Fdev=5Fattr=5Fpower2=5Finput.dev=5Fattr.attr,<br>&gt; ++ &nbsp;=
 &nbsp; &nbsp;&amp;sensor=5Fdev=5Fattr=5Fpower3=5Finput.dev=5Fattr.attr,<br=
>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;sensor=5Fdev=5Fattr=5Fpower4=5Finput.dev=
=5Fattr.attr,<br>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;sensor=5Fdev=5Fattr=5Fpow=
er1=5Flabel.dev=5Fattr.attr,<br>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;sensor=5Fd=
ev=5Fattr=5Fpower2=5Flabel.dev=5Fattr.attr,<br>&gt; ++ &nbsp; &nbsp; &nbsp;=
&amp;sensor=5Fdev=5Fattr=5Fpower3=5Flabel.dev=5Fattr.attr,<br>&gt; ++ &nbsp=
; &nbsp; &nbsp;&amp;sensor=5Fdev=5Fattr=5Fpower4=5Flabel.dev=5Fattr.attr,<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;sensor=5Fdev=5Fattr=5Ffreq1=5Finput.dev=
=5Fattr.attr,<br>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;sensor=5Fdev=5Fattr=5Ffre=
q2=5Finput.dev=5Fattr.attr,<br>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;sensor=5Fde=
v=5Fattr=5Ffreq3=5Finput.dev=5Fattr.attr,<br>&gt; ++ &nbsp; &nbsp; &nbsp;&a=
mp;sensor=5Fdev=5Fattr=5Ffreq4=5Finput.dev=5Fattr.attr,<br>&gt; ++ &nbsp; &=
nbsp; &nbsp;&amp;sensor=5Fdev=5Fattr=5Ffreq1=5Flabel.dev=5Fattr.attr,<br>&g=
t; ++ &nbsp; &nbsp; &nbsp;&amp;sensor=5Fdev=5Fattr=5Ffreq2=5Flabel.dev=5Fat=
tr.attr,<br>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;sensor=5Fdev=5Fattr=5Ffreq3=5F=
label.dev=5Fattr.attr,<br>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;sensor=5Fdev=5Fa=
ttr=5Ffreq4=5Flabel.dev=5Fattr.attr,<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &n=
bsp;NULL<br>&gt; ++};<br>&gt; ++ATTRIBUTE=5FGROUPS(occ);<br>&gt; ++<br>&gt;=
 ++#endif<br>&gt; ++<br>&gt; ++static struct sensor=5Fdevice=5Fattribute te=
mp=5Finput[] =3D {<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(temp1=5Finp=
ut, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 1),<br>&gt; ++ &nbsp; &nbsp=
; &nbsp;SENSOR=5FATTR(temp2=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, =
NULL, 2),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(temp3=5Finput, S=5FI=
RUGO, show=5Focc=5Ftemp=5Finput, NULL, 3),<br>&gt; ++ &nbsp; &nbsp; &nbsp;S=
ENSOR=5FATTR(temp4=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 4),=
<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(temp5=5Finput, S=5FIRUGO, sho=
w=5Focc=5Ftemp=5Finput, NULL, 5),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FA=
TTR(temp6=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 6),<br>&gt; =
++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(temp7=5Finput, S=5FIRUGO, show=5Focc=
=5Ftemp=5Finput, NULL, 7),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(tem=
p8=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 8),<br>&gt; ++ &nbs=
p; &nbsp; &nbsp;SENSOR=5FATTR(temp9=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=
=5Finput, NULL, 9),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(temp10=5Fi=
nput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 10),<br>&gt; ++ &nbsp; &n=
bsp; &nbsp;SENSOR=5FATTR(temp11=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finp=
ut, NULL, 11),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(temp12=5Finput,=
 S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 12),<br>&gt; ++ &nbsp; &nbsp; =
&nbsp;SENSOR=5FATTR(temp13=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, N=
ULL, 13),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(temp14=5Finput, S=5F=
IRUGO, show=5Focc=5Ftemp=5Finput, NULL, 14),<br>&gt; ++ &nbsp; &nbsp; &nbsp=
;SENSOR=5FATTR(temp15=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, =
15),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(temp16=5Finput, S=5FIRUGO=
, show=5Focc=5Ftemp=5Finput, NULL, 16),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENS=
OR=5FATTR(temp17=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 17),<=
br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(temp18=5Finput, S=5FIRUGO, sho=
w=5Focc=5Ftemp=5Finput, NULL, 18),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5F=
ATTR(temp19=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 19),<br>&g=
t; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(temp20=5Finput, S=5FIRUGO, show=5Fo=
cc=5Ftemp=5Finput, NULL, 20),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(=
temp21=5Finput, S=5FIRUGO, show=5Focc=5Ftemp=5Finput, NULL, 21),<br>&gt; ++=
 &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(temp22=5Finput, S=5FIRUGO, show=5Focc=5F=
temp=5Finput, NULL, 22),<br>&gt; ++};<br>&gt; ++<br>&gt; ++static struct se=
nsor=5Fdevice=5Fattribute temp=5Flabel[] =3D {<br>&gt; ++ &nbsp; &nbsp; &nb=
sp;SENSOR=5FATTR(temp1=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL,=
 1),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(temp2=5Flabel, S=5FIRUGO,=
 show=5Focc=5Ftemp=5Flabel, NULL, 2),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=
=5FATTR(temp3=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 3),<br>&=
gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(temp4=5Flabel, S=5FIRUGO, show=5Fo=
cc=5Ftemp=5Flabel, NULL, 4),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(t=
emp5=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 5),<br>&gt; ++ &n=
bsp; &nbsp; &nbsp;SENSOR=5FATTR(temp6=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=
=5Flabel, NULL, 6),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(temp7=5Fla=
bel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 7),<br>&gt; ++ &nbsp; &nbs=
p; &nbsp;SENSOR=5FATTR(temp8=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel,=
 NULL, 8),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(temp9=5Flabel, S=5F=
IRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 9),<br>&gt; ++ &nbsp; &nbsp; &nbsp;=
SENSOR=5FATTR(temp10=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 1=
0),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(temp11=5Flabel, S=5FIRUGO,=
 show=5Focc=5Ftemp=5Flabel, NULL, 11),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSO=
R=5FATTR(temp12=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 12),</=
tt><br><tt>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(temp13=5Flabel, S=5FIR=
UGO, show=5Focc=5Ftemp=5Flabel, NULL, 13),<br>&gt; ++ &nbsp; &nbsp; &nbsp;S=
ENSOR=5FATTR(temp14=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 14=
),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(temp15=5Flabel, S=5FIRUGO, =
show=5Focc=5Ftemp=5Flabel, NULL, 15),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=
=5FATTR(temp16=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 16),<br=
>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(temp17=5Flabel, S=5FIRUGO, show=
=5Focc=5Ftemp=5Flabel, NULL, 17),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FA=
TTR(temp18=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 18),<br>&gt=
; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(temp19=5Flabel, S=5FIRUGO, show=5Foc=
c=5Ftemp=5Flabel, NULL, 19),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(t=
emp20=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 20),<br>&gt; ++ =
&nbsp; &nbsp; &nbsp;SENSOR=5FATTR(temp21=5Flabel, S=5FIRUGO, show=5Focc=5Ft=
emp=5Flabel, NULL, 21),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(temp22=
=5Flabel, S=5FIRUGO, show=5Focc=5Ftemp=5Flabel, NULL, 22),<br>&gt; ++<br>&g=
t; ++};<br>&gt; ++<br>&gt; ++#define TEMP=5FUNIT=5FATTRS(X) &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>&gt; ++{ =
&nbsp; &nbsp; &amp;temp=5Finput[X].dev=5Fattr.attr, &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; \<br>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;temp=5Flabel[X].dev=5Fatt=
r.attr, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>&gt; ++ &nbsp; &nbsp; &nbsp;=
NULL &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>&gt; ++}<br>&gt=
; ++<br>&gt; ++/* 10-core CPU, occ has 22 temp sensors, more socket, more s=
ensors */<br>&gt; ++static struct attribute *occ=5Ftemp=5Fattr[][3] =3D {<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp;TEMP=5FUNIT=5FATTRS(0),<br>&gt; ++ &nbsp; &nb=
sp; &nbsp;TEMP=5FUNIT=5FATTRS(1),<br>&gt; ++ &nbsp; &nbsp; &nbsp;TEMP=5FUNI=
T=5FATTRS(2),<br>&gt; ++ &nbsp; &nbsp; &nbsp;TEMP=5FUNIT=5FATTRS(3),<br>&gt=
; ++ &nbsp; &nbsp; &nbsp;TEMP=5FUNIT=5FATTRS(4),<br>&gt; ++ &nbsp; &nbsp; &=
nbsp;TEMP=5FUNIT=5FATTRS(5),<br>&gt; ++ &nbsp; &nbsp; &nbsp;TEMP=5FUNIT=5FA=
TTRS(6),<br>&gt; ++ &nbsp; &nbsp; &nbsp;TEMP=5FUNIT=5FATTRS(7),<br>&gt; ++ =
&nbsp; &nbsp; &nbsp;TEMP=5FUNIT=5FATTRS(8),<br>&gt; ++ &nbsp; &nbsp; &nbsp;=
TEMP=5FUNIT=5FATTRS(9),<br>&gt; ++ &nbsp; &nbsp; &nbsp;TEMP=5FUNIT=5FATTRS(=
10),<br>&gt; ++ &nbsp; &nbsp; &nbsp;TEMP=5FUNIT=5FATTRS(11),<br>&gt; ++ &nb=
sp; &nbsp; &nbsp;TEMP=5FUNIT=5FATTRS(12),<br>&gt; ++ &nbsp; &nbsp; &nbsp;TE=
MP=5FUNIT=5FATTRS(13),<br>&gt; ++ &nbsp; &nbsp; &nbsp;TEMP=5FUNIT=5FATTRS(1=
4),<br>&gt; ++ &nbsp; &nbsp; &nbsp;TEMP=5FUNIT=5FATTRS(15),<br>&gt; ++ &nbs=
p; &nbsp; &nbsp;TEMP=5FUNIT=5FATTRS(16),<br>&gt; ++ &nbsp; &nbsp; &nbsp;TEM=
P=5FUNIT=5FATTRS(17),<br>&gt; ++ &nbsp; &nbsp; &nbsp;TEMP=5FUNIT=5FATTRS(18=
),<br>&gt; ++ &nbsp; &nbsp; &nbsp;TEMP=5FUNIT=5FATTRS(19),<br>&gt; ++ &nbsp=
; &nbsp; &nbsp;TEMP=5FUNIT=5FATTRS(20),<br>&gt; ++ &nbsp; &nbsp; &nbsp;TEMP=
=5FUNIT=5FATTRS(21),<br>&gt; ++};<br>&gt; ++<br>&gt; ++static const struct =
attribute=5Fgroup occ=5Ftemp=5Fattr=5Fgroup[] =3D {<br>&gt; ++ &nbsp; &nbsp=
; &nbsp;{ .attrs =3D occ=5Ftemp=5Fattr[0] },<br>&gt; ++ &nbsp; &nbsp; &nbsp=
;{ .attrs =3D occ=5Ftemp=5Fattr[1] },<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .att=
rs =3D occ=5Ftemp=5Fattr[2] },<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D =
occ=5Ftemp=5Fattr[3] },<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5Ft=
emp=5Fattr[4] },<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5Ftemp=5Fa=
ttr[5] },<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5Ftemp=5Fattr[6] =
},<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5Ftemp=5Fattr[7] },<br>&=
gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5Ftemp=5Fattr[8] },<br>&gt; ++ =
&nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5Ftemp=5Fattr[9] },<br>&gt; ++ &nbsp; =
&nbsp; &nbsp;{ .attrs =3D occ=5Ftemp=5Fattr[10] },<br>&gt; ++ &nbsp; &nbsp;=
 &nbsp;{ .attrs =3D occ=5Ftemp=5Fattr[11] },<br>&gt; ++ &nbsp; &nbsp; &nbsp=
;{ .attrs =3D occ=5Ftemp=5Fattr[12] },<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .at=
trs =3D occ=5Ftemp=5Fattr[13] },<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =
=3D occ=5Ftemp=5Fattr[14] },<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D oc=
c=5Ftemp=5Fattr[15] },<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5Fte=
mp=5Fattr[16] },<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5Ftemp=5Fa=
ttr[17] },<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5Ftemp=5Fattr[18=
] },<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5Ftemp=5Fattr[19] },<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5Ftemp=5Fattr[20] },<br>&gt;=
 ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5Ftemp=5Fattr[21] },<br>&gt; ++};<=
br>&gt; ++<br>&gt; ++<br>&gt; ++static struct sensor=5Fdevice=5Fattribute f=
req=5Finput[] =3D {<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(freq1=5Fin=
put, S=5FIRUGO, show=5Focc=5Ffreq=5Finput, NULL, 1),<br>&gt; ++ &nbsp; &nbs=
p; &nbsp;SENSOR=5FATTR(freq2=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput,=
 NULL, 2),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(freq3=5Finput, S=5F=
IRUGO, show=5Focc=5Ffreq=5Finput, NULL, 3),<br>&gt; ++ &nbsp; &nbsp; &nbsp;=
SENSOR=5FATTR(freq4=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput, NULL, 4)=
,<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(freq5=5Finput, S=5FIRUGO, sh=
ow=5Focc=5Ffreq=5Finput, NULL, 5),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5F=
ATTR(freq6=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput, NULL, 6),<br>&gt;=
 ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(freq7=5Finput, S=5FIRUGO, show=5Focc=
=5Ffreq=5Finput, NULL, 7),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(fre=
q8=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput, NULL, 8),<br>&gt; ++ &nbs=
p; &nbsp; &nbsp;SENSOR=5FATTR(freq9=5Finput, S=5FIRUGO, show=5Focc=5Ffreq=
=5Finput, NULL, 9),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(freq10=5Fi=
nput, S=5FIRUGO, show=5Focc=5Ffreq=5Finput, NULL, 10),<br>&gt; ++};<br>&gt;=
 ++<br>&gt; ++static struct sensor=5Fdevice=5Fattribute freq=5Flabel[] =3D =
{<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(freq1=5Flabel, S=5FIRUGO, sh=
ow=5Focc=5Ffreq=5Flabel, NULL, 1),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5F=
ATTR(freq2=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel, NULL, 2),<br>&gt;=
 ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(freq3=5Flabel, S=5FIRUGO, show=5Focc=
=5Ffreq=5Flabel, NULL, 3),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(fre=
q4=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel, NULL, 4),<br>&gt; ++ &nbs=
p; &nbsp; &nbsp;SENSOR=5FATTR(freq5=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=
=5Flabel, NULL, 5),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(freq6=5Fla=
bel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel, NULL, 6),<br>&gt; ++ &nbsp; &nbs=
p; &nbsp;SENSOR=5FATTR(freq7=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel,=
 NULL, 7),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(freq8=5Flabel, S=5F=
IRUGO, show=5Focc=5Ffreq=5Flabel, NULL, 8),<br>&gt; ++ &nbsp; &nbsp; &nbsp;=
SENSOR=5FATTR(freq9=5Flabel, S=5FIRUGO, show=5Focc=5Ffreq=5Flabel, NULL, 9)=
,<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(freq10=5Flabel, S=5FIRUGO, s=
how=5Focc=5Ffreq=5Flabel, NULL, 10),<br>&gt; ++<br>&gt; ++};<br>&gt; ++<br>=
&gt; ++#define FREQ=5FUNIT=5FATTRS(X) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>&gt; ++{ &nbsp; &nbsp; &amp;fre=
q=5Finput[X].dev=5Fattr.attr, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \<br>&gt; =
++ &nbsp; &nbsp; &nbsp;&amp;freq=5Flabel[X].dev=5Fattr.attr, &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;\<br>&gt; ++ &nbsp; &nbsp; &nbsp;NULL &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>&gt; ++}<br>&gt; ++<br>&gt; ++/* 10-c=
ore CPU, occ has 22 freq sensors, more socket, more sensors */<br>&gt; ++st=
atic struct attribute *occ=5Ffreq=5Fattr[][3] =3D {<br>&gt; ++ &nbsp; &nbsp=
; &nbsp;FREQ=5FUNIT=5FATTRS(0),<br>&gt; ++ &nbsp; &nbsp; &nbsp;FREQ=5FUNIT=
=5FATTRS(1),<br>&gt; ++ &nbsp; &nbsp; &nbsp;FREQ=5FUNIT=5FATTRS(2),<br>&gt;=
 ++ &nbsp; &nbsp; &nbsp;FREQ=5FUNIT=5FATTRS(3),<br>&gt; ++ &nbsp; &nbsp; &n=
bsp;FREQ=5FUNIT=5FATTRS(4),<br>&gt; ++ &nbsp; &nbsp; &nbsp;FREQ=5FUNIT=5FAT=
TRS(5),<br>&gt; ++ &nbsp; &nbsp; &nbsp;FREQ=5FUNIT=5FATTRS(6),<br>&gt; ++ &=
nbsp; &nbsp; &nbsp;FREQ=5FUNIT=5FATTRS(7),<br>&gt; ++ &nbsp; &nbsp; &nbsp;F=
REQ=5FUNIT=5FATTRS(8),<br>&gt; ++ &nbsp; &nbsp; &nbsp;FREQ=5FUNIT=5FATTRS(9=
),<br>&gt; ++};<br>&gt; ++<br>&gt; ++static const struct attribute=5Fgroup =
occ=5Ffreq=5Fattr=5Fgroup[] =3D {<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =
=3D occ=5Ffreq=5Fattr[0] },<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=
=5Ffreq=5Fattr[1] },<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5Ffreq=
=5Fattr[2] },<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5Ffreq=5Fattr=
[3] },<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5Ffreq=5Fattr[4] },<=
br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5Ffreq=5Fattr[5] },<br>&gt;=
 ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5Ffreq=5Fattr[6] },<br>&gt; ++ &nb=
sp; &nbsp; &nbsp;{ .attrs =3D occ=5Ffreq=5Fattr[7] },<br>&gt; ++ &nbsp; &nb=
sp; &nbsp;{ .attrs =3D occ=5Ffreq=5Fattr[8] },<br>&gt; ++ &nbsp; &nbsp; &nb=
sp;{ .attrs =3D occ=5Ffreq=5Fattr[9] },<br>&gt; ++};<br>&gt; ++<br>&gt; ++s=
tatic struct sensor=5Fdevice=5Fattribute=5F2 caps=5Fcurr=5Fpowercap[] =3D {=
<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR=5F2(caps=5Fcurr=5Fpowercap, S=
=5FIRUGO, show=5Focc=5Fcaps, NULL, 0, 1),<br>&gt; ++};<br>&gt; ++static str=
uct sensor=5Fdevice=5Fattribute=5F2 caps=5Fcurr=5Fpowerreading[] =3D {<br>&=
gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR=5F2(caps=5Fcurr=5Fpowerreading, S=
=5FIRUGO, show=5Focc=5Fcaps, NULL, 1, 1),<br>&gt; ++};<br>&gt; ++static str=
uct sensor=5Fdevice=5Fattribute=5F2 caps=5Fnorm=5Fpowercap[] =3D {<br>&gt; =
++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR=5F2(caps=5Fnorm=5Fpowercap, S=5FIRUGO,=
 show=5Focc=5Fcaps, NULL, 2, 1),<br>&gt; ++};<br>&gt; ++static struct senso=
r=5Fdevice=5Fattribute=5F2 caps=5Fmax=5Fpowercap[] =3D {<br>&gt; ++ &nbsp; =
&nbsp; &nbsp;SENSOR=5FATTR=5F2(caps=5Fmax=5Fpowercap, S=5FIRUGO, show=5Focc=
=5Fcaps, NULL, 3, 1),<br>&gt; ++};<br>&gt; ++static struct sensor=5Fdevice=
=5Fattribute=5F2 caps=5Fmin=5Fpowercap[] =3D {<br>&gt; ++ &nbsp; &nbsp; &nb=
sp;SENSOR=5FATTR=5F2(caps=5Fmin=5Fpowercap, S=5FIRUGO, show=5Focc=5Fcaps, N=
ULL, 4, 1),<br>&gt; ++};<br>&gt;
 ++static struct sensor=5Fdevice=5Fattribute=5F2 caps=5Fuser=5Fpowerlimit[]=
 =3D {<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR=5F2(caps=5Fuser=5Fpower=
limit, S=5FIRUGO, show=5Focc=5Fcaps, NULL, 5, 1),<br>&gt; ++};<br>&gt; ++#d=
efine CAPS=5FUNIT=5FATTRS(X) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;\<br>&gt; ++{ &nbsp; &nbsp; &amp;caps=5Fcurr=
=5Fpowercap[X].dev=5Fattr.attr, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \<br>&gt=
; ++ &nbsp; &nbsp; &nbsp;&amp;caps=5Fcurr=5Fpowerreading[X].dev=5Fattr.attr=
, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \<br>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;=
caps=5Fnorm=5Fpowercap[X].dev=5Fattr.attr, &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; \<br>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;caps=5Fmax=5Fpowercap[X].dev=5Fatt=
r.attr, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \<br>&gt; ++ &nbsp; &nbsp; &nbsp=
;&amp;caps=5Fmin=5Fpowercap[X].dev=5Fattr.attr, &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; \<br>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;caps=5Fuser=5Fpowerlimit[X].d=
ev=5Fattr.attr, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \<br>&gt; ++ &nbsp; &nbs=
p; &nbsp;NULL &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>&gt; +=
+}<br>&gt; ++<br>&gt; ++/* 10-core CPU, occ has 1 caps sensors */<br>&gt; +=
+static struct attribute *occ=5Fcaps=5Fattr[][7] =3D {<br>&gt; ++ &nbsp; &n=
bsp; &nbsp;CAPS=5FUNIT=5FATTRS(0),<br>&gt; ++};<br>&gt; ++static const stru=
ct attribute=5Fgroup occ=5Fcaps=5Fattr=5Fgroup[] =3D {<br>&gt; ++ &nbsp; &n=
bsp; &nbsp;{ .attrs =3D occ=5Fcaps=5Fattr[0] },<br>&gt; ++};<br>&gt; ++<br>=
&gt; ++static struct sensor=5Fdevice=5Fattribute power=5Finput[] =3D {<br>&=
gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(power1=5Finput, S=5FIRUGO, show=5F=
occ=5Fpower=5Finput, NULL, 1),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR=
(power2=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finput, NULL, 2),<br>&gt; +=
+ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(power3=5Finput, S=5FIRUGO, show=5Focc=
=5Fpower=5Finput, NULL, 3),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(po=
wer4=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finput, NULL, 4),<br>&gt; ++ &=
nbsp; &nbsp; &nbsp;SENSOR=5FATTR(power5=5Finput, S=5FIRUGO, show=5Focc=5Fpo=
wer=5Finput, NULL, 5),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(power6=
=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finput, NULL, 6),<br>&gt; ++ &nbsp=
; &nbsp; &nbsp;SENSOR=5FATTR(power7=5Finput, S=5FIRUGO, show=5Focc=5Fpower=
=5Finput, NULL, 7),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(power8=5Fi=
nput, S=5FIRUGO, show=5Focc=5Fpower=5Finput, NULL, 8),<br>&gt; ++ &nbsp; &n=
bsp; &nbsp;SENSOR=5FATTR(power9=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Fin=
put, NULL, 9),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(power10=5Finput=
, S=5FIRUGO, show=5Focc=5Fpower=5Finput, NULL, 10),<br>&gt; ++ &nbsp; &nbsp=
; &nbsp;SENSOR=5FATTR(power11=5Finput, S=5FIRUGO, show=5Focc=5Fpower=5Finpu=
t, NULL, 11),<br>&gt; ++};<br>&gt; ++<br>&gt; ++static struct sensor=5Fdevi=
ce=5Fattribute power=5Flabel[] =3D {<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=
=5FATTR(power1=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flabel, NULL, 1),<br=
>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(power2=5Flabel, S=5FIRUGO, show=
=5Focc=5Fpower=5Flabel, NULL, 2),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FA=
TTR(power3=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flabel, NULL, 3),<br>&gt=
; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(power4=5Flabel, S=5FIRUGO, show=5Foc=
c=5Fpower=5Flabel, NULL, 4),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(p=
ower5=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flabel, NULL, 5),<br>&gt; ++ =
&nbsp; &nbsp; &nbsp;SENSOR=5FATTR(power6=5Flabel, S=5FIRUGO, show=5Focc=5Fp=
ower=5Flabel, NULL, 6),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(power7=
=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Flabel, NULL, 7),<br>&gt; ++ &nbsp=
; &nbsp; &nbsp;SENSOR=5FATTR(power8=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=
=5Flabel, NULL, 8),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(power9=5Fl=
abel, S=5FIRUGO, show=5Focc=5Fpower=5Flabel, NULL, 9),<br>&gt; ++ &nbsp; &n=
bsp; &nbsp;SENSOR=5FATTR(power10=5Flabel, S=5FIRUGO, show=5Focc=5Fpower=5Fl=
abel, NULL, 10),<br>&gt; ++ &nbsp; &nbsp; &nbsp;SENSOR=5FATTR(power11=5Flab=
el, S=5FIRUGO, show=5Focc=5Fpower=5Flabel, NULL, 11),<br>&gt; ++};<br>&gt; =
++<br>&gt; ++#define POWER=5FUNIT=5FATTRS(X) &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>&gt; ++{ &nbsp; &nbsp; &=
amp;power=5Finput[X].dev=5Fattr.attr, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \<=
br>&gt; ++ &nbsp; &nbsp; &nbsp;&amp;power=5Flabel[X].dev=5Fattr.attr, &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;\<br>&gt; ++ &nbsp; &nbsp; &nbsp;NULL &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>&gt; ++}<br>&gt; ++<br>&gt; =
++/* 10-core CPU, occ has 11 power sensors, more socket, more sensors */<br=
>&gt; ++static struct attribute *occ=5Fpower=5Fattr[][3] =3D {<br>&gt; ++ &=
nbsp; &nbsp; &nbsp;POWER=5FUNIT=5FATTRS(0),<br>&gt; ++ &nbsp; &nbsp; &nbsp;=
POWER=5FUNIT=5FATTRS(1),<br>&gt; ++ &nbsp; &nbsp; &nbsp;POWER=5FUNIT=5FATTR=
S(2),<br>&gt; ++ &nbsp; &nbsp; &nbsp;POWER=5FUNIT=5FATTRS(3),<br>&gt; ++ &n=
bsp; &nbsp; &nbsp;POWER=5FUNIT=5FATTRS(4),<br>&gt; ++ &nbsp; &nbsp; &nbsp;P=
OWER=5FUNIT=5FATTRS(5),<br>&gt; ++ &nbsp; &nbsp; &nbsp;POWER=5FUNIT=5FATTRS=
(6),<br>&gt; ++ &nbsp; &nbsp; &nbsp;POWER=5FUNIT=5FATTRS(7),<br>&gt; ++ &nb=
sp; &nbsp; &nbsp;POWER=5FUNIT=5FATTRS(8),<br>&gt; ++ &nbsp; &nbsp; &nbsp;PO=
WER=5FUNIT=5FATTRS(9),<br>&gt; ++ &nbsp; &nbsp; &nbsp;POWER=5FUNIT=5FATTRS(=
10),<br>&gt; ++};<br>&gt; ++<br>&gt; ++static const struct attribute=5Fgrou=
p occ=5Fpower=5Fattr=5Fgroup[] =3D {<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attr=
s =3D occ=5Fpower=5Fattr[0] },<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D =
occ=5Fpower=5Fattr[1] },<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5F=
power=5Fattr[2] },<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5Fpower=
=5Fattr[3] },<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5Fpower=5Fatt=
r[4] },<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5Fpower=5Fattr[5] }=
,<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5Fpower=5Fattr[6] },<br>&=
gt; ++ &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5Fpower=5Fattr[7] },<br>&gt; ++=
 &nbsp; &nbsp; &nbsp;{ .attrs =3D occ=5Fpower=5Fattr[8] },<br>&gt; ++ &nbsp=
; &nbsp; &nbsp;{ .attrs =3D occ=5Fpower=5Fattr[9] },<br>&gt; ++ &nbsp; &nbs=
p; &nbsp;{ .attrs =3D occ=5Fpower=5Fattr[10] },<br>&gt; ++};<br>&gt; ++<br>=
&gt; ++static void occ=5Fremove=5Fsysfs=5Ffiles(struct device *dev)<br>&gt;=
 ++{<br>&gt; ++ &nbsp; &nbsp; &nbsp;int i =3D 0;<br>&gt; ++<br>&gt; ++ &nbs=
p; &nbsp; &nbsp;for (i =3D 0; i &lt; ARRAY=5FSIZE(occ=5Ftemp=5Fattr=5Fgroup=
); i++)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sysfs=5F=
remove=5Fgroup(&amp;dev-&gt;kobj, &amp;occ=5Ftemp=5Fattr=5Fgroup[i]);<br>&g=
t; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;for (i =3D 0; i &lt; ARRAY=5FSIZE(occ=
=5Ffreq=5Fattr=5Fgroup); i++)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;sysfs=5Fremove=5Fgroup(&amp;dev-&gt;kobj, &amp;occ=5Ffreq=5Fa=
ttr=5Fgroup[i]);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;for (i =3D 0; i =
&lt; ARRAY=5FSIZE(occ=5Fpower=5Fattr=5Fgroup); i++)<br>&gt; ++ &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sysfs=5Fremove=5Fgroup(&amp;dev-&gt;kob=
j, &amp;occ=5Fpower=5Fattr=5Fgroup[i]);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;=
 &nbsp;for (i =3D 0; i &lt; ARRAY=5FSIZE(occ=5Fcaps=5Fattr=5Fgroup); i++)<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sysfs=5Fremove=5F=
group(&amp;dev-&gt;kobj, &amp;occ=5Fcaps=5Fattr=5Fgroup[i]);<br>&gt; ++}<br=
>&gt; ++<br>&gt; ++<br>&gt; ++static int occ=5Fcreate=5Fsysfs=5Fattribute(s=
truct device *dev)<br>&gt; ++{<br>&gt; ++ &nbsp; &nbsp; &nbsp;/* The sensor=
 number varies for different<br>&gt; ++ &nbsp; &nbsp; &nbsp; * platform dep=
ending on core number. We'd better<br>&gt; ++ &nbsp; &nbsp; &nbsp; * create=
 them dynamically &nbsp;*/<br>&gt; ++ &nbsp; &nbsp; &nbsp;struct occ=5Fdrv=
=5Fdata *data =3D dev=5Fget=5Fdrvdata(dev);<br>&gt; ++ &nbsp; &nbsp; &nbsp;=
int i =3D 0;<br>&gt; ++ &nbsp; &nbsp; &nbsp;int num=5Fof=5Fsensors =3D 0;<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp;int ret =3D 0;<br>&gt; ++<br>&gt; ++ &nbsp; &=
nbsp; &nbsp;/* get sensor number from occ. */<br>&gt; ++ &nbsp; &nbsp; &nbs=
p;ret =3D occ=5Fupdate=5Fdevice(dev);<br>&gt; ++ &nbsp; &nbsp; &nbsp;if (re=
t !=3D 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp;{<br>&gt; ++ &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: to test fake data */<br>&gt; ++ &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;printk(&quot;ERROR: cannot get oc=
c sensor data: %d\n&quot;, ret);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;return ret;<br>&gt; ++ &nbsp; &nbsp; &nbsp;}<br>&gt; ++<br=
>&gt; ++ &nbsp; &nbsp; &nbsp;if (data-&gt;occ=5Fresp.data.blocks =3D=3D NUL=
L)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br=
>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;/* temp sensors */<br>&gt; ++ &nbsp=
; &nbsp; &nbsp;if (data-&gt;occ=5Fresp.temp=5Fblock=5Fid &gt;=3D 0)<br>&gt;=
 ++ &nbsp; &nbsp; &nbsp;{<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;num=5Fof=5Fsensors =3D data-&gt;occ=5Fresp.data.blocks[data-&gt;o=
cc=5Fresp.temp=5Fblock=5Fid].num=5Fof=5Fsensors;<br>&gt; ++ &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for (i =3D 0; i &lt; num=5Fof=5Fsensors; i=
++)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; ++=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;//printk(&quot;create temp group: %d\n&quot;, i);<br>&gt; ++ &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//ret =3D s=
ysfs=5Fcreate=5Fgroup(&amp;dev-&gt;kobj, &amp;occ=5Ftemp=5Fattr=5Fgroup[i])=
;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;ret =3D sysfs=5Fcreate=5Fgroup(&amp;data-&gt;hwmon=5Fdev-&gt;=
kobj, &amp;occ=5Ftemp=5Fattr=5Fgroup[i]);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (ret)<br>&gt; ++ &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
{<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dev=5Ferr(dev, &quot;error create=
 temp sysfs entry\n&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto er=
ror;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;}<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;}<br>&gt; ++ &nbsp; &nbsp; &nbsp;}<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &=
nbsp;/* freq sensors */<br>&gt; ++ &nbsp; &nbsp; &nbsp;if (data-&gt;occ=5Fr=
esp.freq=5Fblock=5Fid &gt;=3D 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp;{<br>&gt; +=
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;num=5Fof=5Fsensors =3D da=
ta-&gt;occ=5Fresp.data.blocks[data-&gt;occ=5Fresp.freq=5Fblock=5Fid].num=5F=
of=5Fsensors;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fo=
r (i =3D 0; i &lt; num=5Fof=5Fsensors; i++)<br>&gt; ++ &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//printk(&quot;create freq group:=
 %d\n&quot;, i);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;//ret =3D sysfs=5Fcreate=5Fgroup(&amp;dev-&gt;=
kobj, &amp;occ=5Ftemp=5Fattr=5Fgroup[i]);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret =3D sysfs=5Fcreat=
e=5Fgroup(&amp;data-&gt;hwmon=5Fdev-&gt;kobj, &amp;occ=5Ffreq=5Fattr=5Fgrou=
p[i]);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;if (ret)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; ++ &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;dev=5Ferr(dev, &quot;error create freq sysfs entry\n&quot;);<br>&gt;=
 ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto error;<br>&gt; ++ &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; ++ &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; ++ &nbsp; &nbsp; &nbsp=
;}<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;/* power sensors */<br>&gt; ++=
 &nbsp; &nbsp; &nbsp;//printk(&quot;power=5Fblock=5Fid: %d\n&quot;, data-&g=
t;occ=5Fresp.power=5Fblock=5Fid);<br>&gt; ++ &nbsp; &nbsp; &nbsp;if (data-&=
gt;occ=5Fresp.power=5Fblock=5Fid &gt;=3D 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp;=
{<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;num=5Fof=5Fsen=
sors =3D data-&gt;occ=5Fresp.data.blocks[data-&gt;occ=5Fresp.power=5Fblock=
=5Fid].num=5Fof=5Fsensors;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;for (i =3D 0; i &lt; num=5Fof=5Fsensors; i++)<br>&gt; ++ &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; ++ &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//printk(&quot;creat=
e power group: %d\n&quot;, i);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//ret =3D sysfs=5Fcreate=5Fgroup=
(&amp;dev-&gt;kobj, &amp;occ=5Ftemp=5Fattr=5Fgroup[i]);<br>&gt; ++ &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret =3D=
 sysfs=5Fcreate=5Fgroup(&amp;data-&gt;hwmon=5Fdev-&gt;kobj, &amp;occ=5Fpowe=
r=5Fattr=5Fgroup[i]);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (ret)<br>&gt; ++ &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; ++ &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;dev=5Ferr(dev, &quot;error create power sysfs entry\n=
&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto error;<br>&gt; ++ &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<=
br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; ++ &nb=
sp; &nbsp; &nbsp;}<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;/* caps sensor=
s */<br>&gt; ++ &nbsp; &nbsp; &nbsp;//printk(&quot;caps=5Fblock=5Fid: %d\n&=
quot;, data-&gt;occ=5Fresp.caps=5Fblock=5Fid);<br>&gt; ++ &nbsp; &nbsp; &nb=
sp;if (data-&gt;occ=5Fresp.caps=5Fblock=5Fid &gt;=3D 0)<br>&gt; ++ &nbsp; &=
nbsp; &nbsp;{<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;nu=
m=5Fof=5Fsensors =3D data-&gt;occ=5Fresp.data.blocks[data-&gt;occ=5Fresp.ca=
ps=5Fblock=5Fid].num=5Fof=5Fsensors;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;for (i =3D 0; i &lt; num=5Fof=5Fsensors; i++)<br>&gt; =
++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; ++ &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//printk(&=
quot;create caps group: %d\n&quot;, i);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//ret =3D sysfs=5Fcreat=
e=5Fgroup(&amp;dev-&gt;kobj, &amp;occ=5Ftemp=5Fattr=5Fgroup[i]);<br>&gt; ++=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;ret =3D sysfs=5Fcreate=5Fgroup(&amp;data-&gt;hwmon=5Fdev-&gt;kobj, &amp;o=
cc=5Fcaps=5Fattr=5Fgroup[i]);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (ret)<br>&gt; ++ &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; ++=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;dev=5Ferr(dev, &quot;error create caps sysfs =
entry\n&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto error;<br>&gt;=
 ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;}<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt;=
 ++ &nbsp; &nbsp; &nbsp;}<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;return =
0;<br>&gt; ++error:<br>&gt; ++ &nbsp; &nbsp; &nbsp;occ=5Fremove=5Fsysfs=5Ff=
iles(data-&gt;hwmon=5Fdev);<br>&gt; ++ &nbsp; &nbsp; &nbsp;return ret;<br>&=
gt; ++}<br>&gt; ++<br>&gt; ++/*--------------------------------------------=
---------------------------*/<br>&gt; ++/* device probe and removal */<br>&=
gt; ++<br>&gt; ++#define OCC=5FI2C=5FADDR 0x50<br>&gt; ++#define OCC=5FI2C=
=5FNAME &quot;occ-i2c&quot;<br>&gt; ++<br>&gt; ++enum occ=5Ftype {<br>&gt; =
++ &nbsp; &nbsp; &nbsp;occ=5Fid,<br>&gt; ++};<br>&gt; ++<br>&gt; ++static i=
nt occ=5Fprobe(struct i2c=5Fclient *client, const struct i2c=5Fdevice=5Fid =
*id)<br>&gt; ++{<br>&gt; ++ &nbsp; &nbsp; &nbsp;struct device *dev =3D &amp=
;client-&gt;dev;<br>&gt; ++ &nbsp; &nbsp; &nbsp;struct occ=5Fdrv=5Fdata *da=
ta;<br>&gt; ++ &nbsp; &nbsp; &nbsp;unsigned long funcs;<br>&gt; ++ &nbsp; &=
nbsp; &nbsp;struct device=5Fnode *np =3D dev-&gt;of=5Fnode;<br>&gt; ++ &nbs=
p; &nbsp; &nbsp;//u32 pval =3D 0;<br>&gt; ++ &nbsp; &nbsp; &nbsp;int ret =
=3D 0;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;data =3D devm=5Fkzalloc(de=
v, sizeof(struct occ=5Fdrv=5Fdata), GFP=5FKERNEL);<br>&gt; ++ &nbsp; &nbsp;=
 &nbsp;if (!data)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;return -ENOMEM;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;data-&gt;client=
 =3D client;<br>&gt; ++ &nbsp; &nbsp; &nbsp;i2c=5Fset=5Fclientdata(client, =
data);<br>&gt; ++ &nbsp; &nbsp; &nbsp;mutex=5Finit(&amp;data-&gt;update=5Fl=
ock);<br>&gt; ++ &nbsp; &nbsp; &nbsp;data-&gt;sample=5Ftime =3D HZ;<br>&gt;=
 ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;/* Yi: i2c-core should assign address to=
<br>&gt; ++ &nbsp; &nbsp; &nbsp; * client when detection - but it does not =
work &nbsp;FIXME &nbsp;*/<br>&gt; ++ &nbsp; &nbsp; &nbsp;//client-&gt;addr =
=3D OCC=5FI2C=5FADDR;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;/* Yi: read=
 address from device table */<br>&gt; ++ &nbsp; &nbsp; &nbsp;//if (of=5Fpro=
perty=5Fread=5Fu32(np, &quot;reg&quot;, &amp;pval)) {<br>&gt; ++ &nbsp; &nb=
sp; &nbsp;// &nbsp; &nbsp; &nbsp;dev=5Ferr(&amp;client-&gt;dev, &quot;inval=
id reg\n&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp;//}<br>&gt; ++ &nbsp; &nbsp=
; &nbsp;//client-&gt;addr =3D pval;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nb=
sp;/* configure the driver */<br>&gt; ++ &nbsp; &nbsp; &nbsp;//dev=5Fdbg(de=
v, &quot;occ register hwmon @0x%x\n&quot;, client-&gt;addr);<br>&gt; ++ &nb=
sp; &nbsp; &nbsp;//data-&gt;hwmon=5Fdev =3D hwmon=5Fdevice=5Fregister=5Fwit=
h=5Fgroups(dev, &quot;occ&quot;,<br>&gt; ++ &nbsp; &nbsp; &nbsp;// &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;data, occ=5Fgroups);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &n=
bsp;/* Yi: try to create sysfs attributes dynamically */<br>&gt; ++ &nbsp; =
&nbsp; &nbsp;data-&gt;hwmon=5Fdev =3D hwmon=5Fdevice=5Fregister(dev);<br>&g=
t; ++ &nbsp; &nbsp; &nbsp;if (IS=5FERR(data-&gt;hwmon=5Fdev))<br>&gt; ++ &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return PTR=5FERR(data-&gt;hwm=
on=5Fdev);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;ret =3D occ=5Fcreate=
=5Fsysfs=5Fattribute(dev);<br>&gt; ++ &nbsp; &nbsp; &nbsp;if (ret)<br>&gt; =
++ &nbsp; &nbsp; &nbsp;{<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;hwmon=5Fdevice=5Funregister(data-&gt;hwmon=5Fdev);<br>&gt; ++ &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return ret;<br>&gt; ++ &nbsp; &=
nbsp; &nbsp;}<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;data-&gt;hwmon=5Fde=
v-&gt;parent =3D dev;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;//dev=5Fdbg=
(dev, &quot;%s: sensor '%s'\n&quot;,<br>&gt; ++ &nbsp; &nbsp; &nbsp;// &nbs=
p; &nbsp; &nbsp; dev=5Fname(data-&gt;hwmon=5Fdev), client-&gt;name);<br>&gt=
; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;funcs =3D i2c=5Fget=5Ffunctionality(cli=
ent-&gt;adapter);<br>&gt; ++ &nbsp; &nbsp; &nbsp;//dev=5Finfo(dev, &quot;i2=
c adaptor supports function: 0x%lx\n&quot;, funcs);<br>&gt; ++<br>&gt; ++ &=
nbsp; &nbsp; &nbsp;/* Yi: seems always error? disable for now */<br>&gt; ++=
 &nbsp; &nbsp; &nbsp;//occ=5Fcheck=5Fi2c=5Ferrors(client);<br>&gt; ++<br>&g=
t; ++ &nbsp; &nbsp; &nbsp;//dev=5Finfo(dev, &quot;occ i2c driver ready: i2c=
 addr@0x%x\n&quot;, client-&gt;addr);<br>&gt; ++ &nbsp; &nbsp; &nbsp;printk=
(&quot;occ i2c driver ready: i2c addr@0x%x\n&quot;, client-&gt;addr);<br>&g=
t; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;return 0;<br>&gt; ++}<br>&gt; ++<br>&g=
t; ++static int occ=5Fremove(struct i2c=5Fclient *client)<br>&gt; ++{<br>&g=
t; ++ &nbsp; &nbsp; &nbsp;struct occ=5Fdrv=5Fdata *data =3D i2c=5Fget=5Fcli=
entdata(client);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;/* free allocate=
d sensor memory */<br>&gt; ++ &nbsp; &nbsp; &nbsp;deinit=5Focc=5Fresp=5Fbuf=
(&amp;data-&gt;occ=5Fresp);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp;//occ=
=5Fremove=5Fsysfs=5Ffiles(&amp;client-&gt;dev);<br>&gt; ++ &nbsp; &nbsp; &n=
bsp;occ=5Fremove=5Fsysfs=5Ffiles(data-&gt;hwmon=5Fdev);<br>&gt; ++ &nbsp; &=
nbsp; &nbsp;hwmon=5Fdevice=5Funregister(data-&gt;hwmon=5Fdev);<br>&gt; ++ &=
nbsp; &nbsp; &nbsp;return 0;<br>&gt; ++}<br>&gt; ++<br>&gt; ++/* used for o=
ld-style board info */<br>&gt; ++static const struct i2c=5Fdevice=5Fid occ=
=5Fids[] =3D {<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ OCC=5FI2C=5FNAME, occ=5Fid,=
 },<br>&gt; ++ &nbsp; &nbsp; &nbsp;{ /* LIST END */ }<br>&gt; ++};<br>&gt; =
++MODULE=5FDEVICE=5FTABLE(i2c, occ=5Fids);<br>&gt; ++<br>&gt; ++static cons=
t struct of=5Fdevice=5Fid i2c=5Focc=5Fof=5Fmatch[] =3D {<br>&gt; ++ &nbsp; =
&nbsp; &nbsp;{.compatible =3D &quot;ibm,occ-i2c&quot;},<br>&gt; ++ &nbsp; &=
nbsp; &nbsp;{},<br>&gt; ++};<br>&gt; ++<br>&gt; ++MODULE=5FDEVICE=5FTABLE(o=
f, i2c=5Focc=5Fof=5Fmatch);<br>&gt; ++<br>&gt; ++#ifdef CONFIG=5FPM<br>&gt;=
 ++static int occ=5Fsuspend(struct device *dev)<br>&gt; ++{<br>&gt; ++ &nbs=
p; &nbsp; &nbsp;//struct i2c=5Fclient *client =3D to=5Fi2c=5Fclient(dev);<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp;/* TODO */<br>&gt; ++ &nbsp; &nbsp; &nbsp;ret=
urn 0;<br>&gt; ++}<br>&gt; ++<br>&gt; ++static int occ=5Fresume(struct devi=
ce *dev)<br>&gt; ++{<br>&gt; ++ &nbsp; &nbsp; &nbsp;//struct i2c=5Fclient *=
client =3D to=5Fi2c=5Fclient(dev);<br>&gt; ++ &nbsp; &nbsp; &nbsp;/* TODO *=
/<br>&gt; ++ &nbsp; &nbsp; &nbsp;return 0;<br>&gt; ++}<br>&gt; ++<br>&gt; +=
+static const struct dev=5Fpm=5Fops occ=5Fdev=5Fpm=5Fops =3D {<br>&gt; ++ &=
nbsp; &nbsp; &nbsp;.suspend &nbsp; &nbsp; &nbsp; &nbsp;=3D occ=5Fsuspend,<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp;.resume &nbsp; &nbsp; &nbsp; &nbsp; =3D occ=
=5Fresume,<br>&gt; ++};<br>&gt; ++#define OCC=5FDEV=5FPM=5FOPS (&amp;occ=5F=
dev=5Fpm=5Fops)<br>&gt; ++#else<br>&gt; ++#define OCC=5FDEV=5FPM=5FOPS NULL=
<br>&gt; ++#endif /* CONFIG=5FPM */<br>&gt; ++<br>&gt; ++/* Yi: i2c-core us=
es i2c-detect() to detect device in bellow address list.<br>&gt; ++ &nbsp; =
If exists, address will be assigned to client.<br>&gt; ++ * It is also poss=
ible to read address from device table. */<br>&gt; ++static const unsigned =
short normal=5Fi2c[] =3D {0x50, 0x51, I2C=5FCLIENT=5FEND };<br>&gt; ++<br>&=
gt; ++/* Return 0 if detection is successful, -ENODEV otherwise */<br>&gt; =
++static int occ=5Fdetect(struct i2c=5Fclient *new=5Fclient,<br>&gt; ++ &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct i=
2c=5Fboard=5Finfo *info)<br>&gt; ++{<br>&gt; ++ &nbsp; &nbsp; &nbsp;/* i2c-=
core need this function to create new device */<br>&gt; ++ &nbsp; &nbsp; &n=
bsp;strncpy(info-&gt;type, OCC=5FI2C=5FNAME, sizeof(OCC=5FI2C=5FNAME));<br>=
&gt; ++ &nbsp; &nbsp; &nbsp;return 0;<br>&gt; ++}<br>&gt; ++<br>&gt; ++stat=
ic struct i2c=5Fdriver occ=5Fdriver =3D {<br>&gt; ++ &nbsp; &nbsp; &nbsp;.c=
lass &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D I2C=5FCLASS=5FHWMON,<br>&gt; ++ =
&nbsp; &nbsp; &nbsp;.driver =3D {<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;.name &nbsp; =3D OCC=5FI2C=5FNAME,<br>&gt; ++ &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.pm &nbsp; &nbsp; =3D OCC=5FDEV=5FPM=
=5FOPS,<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.of=5Fma=
tch=5Ftable =3D i2c=5Focc=5Fof=5Fmatch,<br>&gt; ++ &nbsp; &nbsp; &nbsp;},<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp;.probe &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D =
occ=5Fprobe,<br>&gt; ++ &nbsp; &nbsp; &nbsp;.remove &nbsp; &nbsp; &nbsp; &n=
bsp; =3D occ=5Fremove,<br>&gt; ++ &nbsp; &nbsp; &nbsp;.id=5Ftable &nbsp; &n=
bsp; &nbsp; =3D occ=5Fids,<br>&gt; ++ &nbsp; &nbsp; &nbsp;.address=5Flist &=
nbsp; =3D normal=5Fi2c,<br>&gt; ++ &nbsp; &nbsp; &nbsp;.detect &nbsp; &nbsp=
; &nbsp; &nbsp; =3D occ=5Fdetect,<br>&gt; ++};<br>&gt; ++<br>&gt; ++module=
=5Fi2c=5Fdriver(occ=5Fdriver);<br>&gt; ++<br>&gt; ++#if 0<br>&gt; ++/* Crea=
te new i2c device */<br>&gt; ++static struct i2c=5Fboard=5Finfo my=5Fdev=5F=
info[] =5F=5Finitdata =3D {<br>&gt; ++ &nbsp; &nbsp; &nbsp;{<br>&gt; ++ &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;I2C=5FBOARD=5FINFO(OCC=5FI2C=
=5FNAME, 0x50),<br>&gt; ++ &nbsp; &nbsp; &nbsp;},<br>&gt; ++};<br>&gt; ++<b=
r>&gt; ++static struct i2c=5Fclient *my=5Fclient;<br>&gt; ++<br>&gt; ++stat=
ic int occ=5Finit(void)<br>&gt; ++{<br>&gt; ++ &nbsp; &nbsp; &nbsp;static i=
nt sys=5Fadap=5Fbus=5Fnum =3D 3;<br>&gt; ++ &nbsp; &nbsp; &nbsp;struct i2c=
=5Fadapter* adap =3D i2c=5Fget=5Fadapter(sys=5Fadap=5Fbus=5Fnum);<br>&gt; +=
+<br>&gt; ++ &nbsp; &nbsp; &nbsp;if(adap=3D=3DNULL) {<br>&gt; ++ &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;printk(&quot;[OCC-DEBUG] i2c=5Fget=5F=
adapter fail!\n&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;return -1;<br>&gt; ++ &nbsp; &nbsp; &nbsp;}<br>&gt; ++<br>&gt; ++ &=
nbsp; &nbsp; &nbsp;my=5Fclient =3D i2c=5Fnew=5Fdevice(adap, &amp;my=5Fdev=
=5Finfo[0]);<br>&gt; ++ &nbsp; &nbsp; &nbsp;if( my=5Fclient=3D=3DNULL ){<br=
>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;printk(&quot;[OCC-=
DEBUG] i2c=5Fnew=5Fdevice fail!\n&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; ++ &nbsp; &nbsp; &nbsp;}<br>&g=
t; ++ &nbsp; &nbsp; &nbsp;i2c=5Fput=5Fadapter(adap);<br>&gt; ++ &nbsp; &nbs=
p; &nbsp;return i2c=5Fadd=5Fdriver(&amp;occ=5Fdriver);<br>&gt; ++}<br>&gt; =
++<br>&gt; ++static void =5F=5Fexit occ=5Fexit(void)<br>&gt; ++{<br>&gt; ++=
 &nbsp; &nbsp; &nbsp;i2c=5Funregister=5Fdevice(my=5Fclient);<br>&gt; ++ &nb=
sp; &nbsp; &nbsp;i2c=5Fdel=5Fdriver(&amp;occ=5Fdriver);<br>&gt; ++}<br>&gt;=
 ++<br>&gt; ++module=5Finit(occ=5Finit);<br>&gt; ++module=5Fexit(occ=5Fexit=
);<br>&gt; ++<br>&gt; ++#endif<br>&gt; ++<br>&gt; ++MODULE=5FAUTHOR(&quot;L=
i Yi &lt;shliyi@cn.ibm.com&gt;&quot;);<br>&gt; ++MODULE=5FDESCRIPTION(&quot=
;BMC OCC monitor driver&quot;);<br>&gt; ++MODULE=5FLICENSE(&quot;GPL&quot;)=
;<br>&gt; diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/=
meta-barreleye/recipes-kernel/linux/linux-obmc=5F%.bbappend b/meta-openbmc-=
machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/=
linux-obmc=5F%.bbappend<br>&gt; index b106e5a..1099689 100644<br>&gt; --- a=
/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes=
-kernel/linux/linux-obmc=5F%.bbappend<br>&gt; +++ b/meta-openbmc-machines/m=
eta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc=
=5F%.bbappend<br>&gt; @@ -1 +1,3 @@<br>&gt; &nbsp;FILESEXTRAPATHS=5Fprepend=
 :=3D &quot;${THISDIR}/linux-obmc:&quot;<br>&gt; +SRC=5FURI +=3D &quot;</tt=
><tt><a href=3D"file://barreleye.cfg">file://barreleye.cfg</a></tt><tt>&quo=
t;<br>&gt; +SRC=5FURI +=3D &quot;</tt><tt><a href=3D"file://occ=5Fhwmon.pat=
ch">file://occ=5Fhwmon.patch</a></tt><tt>&quot;<br>&gt; --<br>&gt; 2.6.3<br=
>&gt;<br>&gt;<br>&gt; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F<br>&gt; openbmc mailing list<br>&gt; openbmc@lists.ozlabs.o=
rg<br>&gt; </tt><tt><a href=3D"https://lists.ozlabs.org/listinfo/openbmc">h=
ttps://lists.ozlabs.org/listinfo/openbmc</a></tt><tt><br>=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br=
>openbmc@lists.ozlabs.org<br></tt><tt><a href=3D"https://lists.ozlabs.org/l=
istinfo/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a></tt><tt><br>=
</tt><br><BR>
</body></html>

--1__=8FBBF59BDFC5AC088f9e8a93df938690918c8FBBF59BDFC5AC08--


--0__=8FBBF59BDFC5AC088f9e8a93df938690918c8FBBF59BDFC5AC08
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <3__=8FBBF59BDFC5AC088f9e8a93df938690918c8FB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=8FBBF59BDFC5AC088f9e8a93df938690918c8FBBF59BDFC5AC08--
