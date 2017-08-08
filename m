Return-Path: <austenc@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xRbys2d48zDqkp
 for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2017 00:15:32 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v78EFNVj051958
 for <openbmc@lists.ozlabs.org>; Tue, 8 Aug 2017 10:15:29 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.74])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c7eqnh28j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 08 Aug 2017 10:15:27 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 8 Aug 2017 14:15:08 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 8 Aug 2017 14:15:02 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2017080814150092-580522 ;
 Tue, 8 Aug 2017 14:15:00 +0000 
MIME-Version: 1.0
In-Reply-To: <20170808035301.1980-5-brendanhiggins@google.com>
Subject: Re: [RFC v1 4/4] ipmi_bmc: bt-aspeed: port driver to IPMI BMC
 framework
To: Brendan Higgins <brendanhiggins@google.com>
Cc: andrew@aj.id.au, benjaminfair@google.com, clg@kaod.org, joel@jms.id.au,
 linux-kernel@vger.kernel.org, minyard@acm.org, openbmc@lists.ozlabs.org,
 "openbmc"<openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>,
 openipmi-developer@lists.sourceforge.net
From: "Chris Austen" <austenc@us.ibm.com>
Date: Tue, 8 Aug 2017 09:14:59 -0500
References: <20170808035301.1980-1-brendanhiggins@google.com>
 <20170808035301.1980-5-brendanhiggins@google.com>
X-KeepSent: A19CF697:999ACB4E-86258176:004DEFD5;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF766 December 14, 2016
X-LLNOutbound: False
X-Disclaimed: 35103
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=09BB0BE5DFDE69458f9e8a93df938690918c09BB0BE5DFDE6945"
Content-Disposition: inline
x-cbid: 17080814-7581-0000-0000-000003AF6ECB
X-IBM-SpamModules-Scores: BY=0.265254; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.433748; ST=0; TS=0; UL=0; ISC=; MB=0.043315
X-IBM-SpamModules-Versions: BY=3.00007507; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000217; SDB=6.00899358; UDB=6.00450151; IPR=6.00679563; 
 BA=6.00005519; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016595; XFM=3.00000015;
 UTC=2017-08-08 14:15:06
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-08-08 10:49:13 - 6.00007148
x-cbparentid: 17080814-7582-0000-0000-00001832CEBF
Message-Id: <OFA19CF697.999ACB4E-ON86258176.004DEFD5-86258176.004E46E0@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-08_07:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Aug 2017 14:15:33 -0000


--0__=09BB0BE5DFDE69458f9e8a93df938690918c09BB0BE5DFDE6945
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


"openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org> wrote on
08/07/2017 10:53:01 PM:

> From: Brendan Higgins <brendanhiggins@google.com>
> To: minyard@acm.org, benjaminfair@google.com, clg@kaod.org,
> joel@jms.id.au, andrew@aj.id.au
> Cc: openipmi-developer@lists.sourceforge.net, Brendan Higgins
> <brendanhiggins@google.com>, openbmc@lists.ozlabs.org, linux-
> kernel@vger.kernel.org
> Date: 08/07/2017 10:55 PM
> Subject: [RFC v1 4/4] ipmi=5Fbmc: bt-aspeed: port driver to IPMI BMC
framework
> Sent by: "openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org>
>
> From: Benjamin Fair <benjaminfair@google.com>
>
> The driver was handling interaction with userspace on its own. This
> patch changes it to use the functionality of the ipmi=5Fbmc framework
> instead.
>
> Note that this removes the ability for the BMC to set SMS=5FATN by making
> an ioctl. If this functionality is required, it can be added back in
> with a later patch.


Isn't SMS=5FATN the way a BMC initiates an IPMI message to the OS?  Say for
instance a request to shutdown?


>
> Signed-off-by: Benjamin Fair <benjaminfair@google.com>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
>  drivers/char/ipmi=5Fbmc/ipmi=5Fbmc=5Fbt=5Faspeed.c | 258 ++++++++
> +--------------------
>  include/uapi/linux/bt-bmc.h                |  18 --
>  2 files changed, 74 insertions(+), 202 deletions(-)
>  delete mode 100644 include/uapi/linux/bt-bmc.h
>
> diff --git a/drivers/char/ipmi=5Fbmc/ipmi=5Fbmc=5Fbt=5Faspeed.c b/drivers/
> char/ipmi=5Fbmc/ipmi=5Fbmc=5Fbt=5Faspeed.c
> index 70d434bc1cbf..7c8082c511ee 100644
> --- a/drivers/char/ipmi=5Fbmc/ipmi=5Fbmc=5Fbt=5Faspeed.c
> +++ b/drivers/char/ipmi=5Fbmc/ipmi=5Fbmc=5Fbt=5Faspeed.c
> @@ -7,25 +7,19 @@
>   * 2 of the License, or (at your option) any later version.
>   */
>
> -#include <linux/atomic.h>
> -#include <linux/bt-bmc.h>
>  #include <linux/errno.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> +#include <linux/ipmi=5Fbmc.h>
>  #include <linux/mfd/syscon.h>
> -#include <linux/miscdevice.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform=5Fdevice.h>
> -#include <linux/poll.h>
>  #include <linux/regmap.h>
>  #include <linux/sched.h>
>  #include <linux/timer.h>
>
> -/*
> - * This is a BMC device used to communicate to the host
> - */
> -#define DEVICE=5FNAME   "ipmi-bt-host"
> +#define DEVICE=5FNAME "ipmi-bmc-bt-aspeed"
>
>  #define BT=5FIO=5FBASE   0xe4
>  #define BT=5FIRQ      10
> @@ -61,18 +55,17 @@
>  #define BT=5FBMC=5FBUFFER=5FSIZE 256
>
>  struct bt=5Fbmc {
> +   struct ipmi=5Fbmc=5Fbus   bus;
>     struct device      dev;
> -   struct miscdevice   miscdev;
> +   struct ipmi=5Fbmc=5Fctx   *bmc=5Fctx;
> +   struct bt=5Fmsg      request;
>     struct regmap      *map;
>     int         offset;
>     int         irq;
> -   wait=5Fqueue=5Fhead=5Ft   queue;
>     struct timer=5Flist   poll=5Ftimer;
> -   struct mutex      mutex;
> +   spinlock=5Ft      lock;
>  };
>
> -static atomic=5Ft open=5Fcount =3D ATOMIC=5FINIT(0);
> -
>  static const struct regmap=5Fconfig bt=5Fregmap=5Fcfg =3D {
>     .reg=5Fbits =3D 32,
>     .val=5Fbits =3D 32,
> @@ -158,27 +151,28 @@ static ssize=5Ft bt=5Fwriten(struct bt=5Fbmc
> *bt=5Fbmc, u8 *buf, size=5Ft n)
>     return n;
>  }
>
> +/* TODO(benjaminfair): support ioctl BT=5FBMC=5FIOCTL=5FSMS=5FATN */
>  static void set=5Fsms=5Fatn(struct bt=5Fbmc *bt=5Fbmc)
>  {
>     bt=5Foutb(bt=5Fbmc, BT=5FCTRL=5FSMS=5FATN, BT=5FCTRL);
>  }
>
> -static struct bt=5Fbmc *file=5Fbt=5Fbmc(struct file *file)
> +/* Called with bt=5Fbmc->lock held */
> +static bool =5F=5Fis=5Frequest=5Favail(struct bt=5Fbmc *bt=5Fbmc)
>  {
> -   return container=5Fof(file->private=5Fdata, struct bt=5Fbmc, miscdev);
> +   return bt=5Finb(bt=5Fbmc, BT=5FCTRL) & BT=5FCTRL=5FH2B=5FATN;
>  }
>
> -static int bt=5Fbmc=5Fopen(struct inode *inode, struct file *file)
> +static bool is=5Frequest=5Favail(struct bt=5Fbmc *bt=5Fbmc)
>  {
> -   struct bt=5Fbmc *bt=5Fbmc =3D file=5Fbt=5Fbmc(file);
> +   unsigned long flags;
> +   bool result;
>
> -   if (atomic=5Finc=5Freturn(&open=5Fcount) =3D=3D 1) {
> -      clr=5Fb=5Fbusy(bt=5Fbmc);
> -      return 0;
> -   }
> +   spin=5Flock=5Firqsave(&bt=5Fbmc->lock, flags);
> +   result =3D =5F=5Fis=5Frequest=5Favail(bt=5Fbmc);
> +   spin=5Funlock=5Firqrestore(&bt=5Fbmc->lock, flags);
>
> -   atomic=5Fdec(&open=5Fcount);
> -   return -EBUSY;
> +   return result;
>  }
>
>  /*
> @@ -194,67 +188,43 @@ static int bt=5Fbmc=5Fopen(struct inode *inode,
> struct file *file)
>   *    Length  NetFn/LUN  Seq     Cmd     Data
>   *
>   */
> -static ssize=5Ft bt=5Fbmc=5Fread(struct file *file, char =5F=5Fuser *buf,
> -            size=5Ft count, loff=5Ft *ppos)
> +static void get=5Frequest(struct bt=5Fbmc *bt=5Fbmc)
>  {
> -   struct bt=5Fbmc *bt=5Fbmc =3D file=5Fbt=5Fbmc(file);
> -   u8 len;
> -   int len=5Fbyte =3D 1;
> -   u8 kbuffer[BT=5FBMC=5FBUFFER=5FSIZE];
> -   ssize=5Ft ret =3D 0;
> -   ssize=5Ft nread;
> +   u8 *request=5Fbuf =3D (u8 *) &bt=5Fbmc->request;
> +   unsigned long flags;
>
> -   if (!access=5Fok(VERIFY=5FWRITE, buf, count))
> -      return -EFAULT;
> +   spin=5Flock=5Firqsave(&bt=5Fbmc->lock, flags);
>
> -   WARN=5FON(*ppos);
> -
> -   if (wait=5Fevent=5Finterruptible(bt=5Fbmc->queue,
> -                 bt=5Finb(bt=5Fbmc, BT=5FCTRL) & BT=5FCTRL=5FH2B=5FATN))
> -      return -ERESTARTSYS;
> -
> -   mutex=5Flock(&bt=5Fbmc->mutex);
> -
> -   if (unlikely(!(bt=5Finb(bt=5Fbmc, BT=5FCTRL) & BT=5FCTRL=5FH2B=5FATN)=
)) {
> -      ret =3D -EIO;
> -      goto out=5Funlock;
> +   if (!=5F=5Fis=5Frequest=5Favail(bt=5Fbmc)) {
> +      spin=5Funlock=5Firqrestore(&bt=5Fbmc->lock, flags);
> +      return;
>     }
>
>     set=5Fb=5Fbusy(bt=5Fbmc);
>     clr=5Fh2b=5Fatn(bt=5Fbmc);
>     clr=5Frd=5Fptr(bt=5Fbmc);
>
> -   /*
> -    * The BT frames start with the message length, which does not
> -    * include the length byte.
> -    */
> -   kbuffer[0] =3D bt=5Fread(bt=5Fbmc);
> -   len =3D kbuffer[0];
> -
> -   /* We pass the length back to userspace as well */
> -   if (len + 1 > count)
> -      len =3D count - 1;
> -
> -   while (len) {
> -      nread =3D min=5Ft(ssize=5Ft, len, sizeof(kbuffer) - len=5Fbyte);
> -
> -      bt=5Freadn(bt=5Fbmc, kbuffer + len=5Fbyte, nread);
> -
> -      if (copy=5Fto=5Fuser(buf, kbuffer, nread + len=5Fbyte)) {
> -         ret =3D -EFAULT;
> -         break;
> -      }
> -      len -=3D nread;
> -      buf +=3D nread + len=5Fbyte;
> -      ret +=3D nread + len=5Fbyte;
> -      len=5Fbyte =3D 0;
> -   }
> +   bt=5Fbmc->request.len =3D bt=5Fread(bt=5Fbmc);
> +   bt=5Freadn(bt=5Fbmc, request=5Fbuf + 1, bt=5Fbmc->request.len);
>
>     clr=5Fb=5Fbusy(bt=5Fbmc);
> +   ipmi=5Fbmc=5Fhandle=5Frequest(bt=5Fbmc->bmc=5Fctx, &bt=5Fbmc->request=
);
> +
> +   spin=5Funlock=5Firqrestore(&bt=5Fbmc->lock, flags);
> +}
> +
> +static bool bt=5Fbmc=5Fis=5Fresponse=5Fopen(struct ipmi=5Fbmc=5Fbus *bus)
> +{
> +   struct bt=5Fbmc *bt=5Fbmc =3D container=5Fof(bus, struct bt=5Fbmc, bu=
s);
> +   bool response=5Fin=5Fprogress;
> +   unsigned long flags;
> +
> +   spin=5Flock=5Firqsave(&bt=5Fbmc->lock, flags);
> +   response=5Fin=5Fprogress =3D bt=5Finb(bt=5Fbmc, BT=5FCTRL) & (BT=5FCT=
RL=5FH=5FBUSY |
> +                       BT=5FCTRL=5FB2H=5FATN);
> +   spin=5Funlock=5Firqrestore(&bt=5Fbmc->lock, flags);
>
> -out=5Funlock:
> -   mutex=5Funlock(&bt=5Fbmc->mutex);
> -   return ret;
> +   return !response=5Fin=5Fprogress;
>  }
>
>  /*
> @@ -263,122 +233,38 @@ static ssize=5Ft bt=5Fbmc=5Fread(struct file *file,
> char =5F=5Fuser *buf,
>   *    Byte 1  Byte 2     Byte 3  Byte 4  Byte 5  Byte 6:N
>   *    Length  NetFn/LUN  Seq     Cmd     Code    Data
>   */
> -static ssize=5Ft bt=5Fbmc=5Fwrite(struct file *file, const char =5F=5Fus=
er *buf,
> -             size=5Ft count, loff=5Ft *ppos)
> +static int bt=5Fbmc=5Fsend=5Fresponse(struct ipmi=5Fbmc=5Fbus *bus,
> +            struct bt=5Fmsg *bt=5Fresponse)
>  {
> -   struct bt=5Fbmc *bt=5Fbmc =3D file=5Fbt=5Fbmc(file);
> -   u8 kbuffer[BT=5FBMC=5FBUFFER=5FSIZE];
> -   ssize=5Ft ret =3D 0;
> -   ssize=5Ft nwritten;
> +   struct bt=5Fbmc *bt=5Fbmc =3D container=5Fof(bus, struct bt=5Fbmc, bu=
s);
> +   unsigned long flags;
>
> -   /*
> -    * send a minimum response size
> -    */
> -   if (count < 5)
> -      return -EINVAL;
> -
> -   if (!access=5Fok(VERIFY=5FREAD, buf, count))
> -      return -EFAULT;
> -
> -   WARN=5FON(*ppos);
> -
> -   /*
> -    * There's no interrupt for clearing bmc busy so we have to
> -    * poll
> -    */
> -   if (wait=5Fevent=5Finterruptible(bt=5Fbmc->queue,
> -                 !(bt=5Finb(bt=5Fbmc, BT=5FCTRL) &
> -                   (BT=5FCTRL=5FH=5FBUSY | BT=5FCTRL=5FB2H=5FATN))))
> -      return -ERESTARTSYS;
> -
> -   mutex=5Flock(&bt=5Fbmc->mutex);
> -
> -   if (unlikely(bt=5Finb(bt=5Fbmc, BT=5FCTRL) &
> -           (BT=5FCTRL=5FH=5FBUSY | BT=5FCTRL=5FB2H=5FATN))) {
> -      ret =3D -EIO;
> -      goto out=5Funlock;
> +   spin=5Flock=5Firqsave(&bt=5Fbmc->lock, flags);
> +   if (!bt=5Fbmc=5Fis=5Fresponse=5Fopen(bus)) {
> +      spin=5Funlock=5Firqrestore(&bt=5Fbmc->lock, flags);
> +      return -EAGAIN;
>     }
>
>     clr=5Fwr=5Fptr(bt=5Fbmc);
> -
> -   while (count) {
> -      nwritten =3D min=5Ft(ssize=5Ft, count, sizeof(kbuffer));
> -      if (copy=5Ffrom=5Fuser(&kbuffer, buf, nwritten)) {
> -         ret =3D -EFAULT;
> -         break;
> -      }
> -
> -      bt=5Fwriten(bt=5Fbmc, kbuffer, nwritten);
> -
> -      count -=3D nwritten;
> -      buf +=3D nwritten;
> -      ret +=3D nwritten;
> -   }
> -
> +   bt=5Fwriten(bt=5Fbmc, (u8 *) bt=5Fresponse, bt=5Fmsg=5Flen(bt=5Frespo=
nse));
>     set=5Fb2h=5Fatn(bt=5Fbmc);
>
> -out=5Funlock:
> -   mutex=5Funlock(&bt=5Fbmc->mutex);
> -   return ret;
> -}
> -
> -static long bt=5Fbmc=5Fioctl(struct file *file, unsigned int cmd,
> -          unsigned long param)
> -{
> -   struct bt=5Fbmc *bt=5Fbmc =3D file=5Fbt=5Fbmc(file);
> -
> -   switch (cmd) {
> -   case BT=5FBMC=5FIOCTL=5FSMS=5FATN:
> -      set=5Fsms=5Fatn(bt=5Fbmc);
> -      return 0;
> -   }
> -   return -EINVAL;
> -}
> -
> -static int bt=5Fbmc=5Frelease(struct inode *inode, struct file *file)
> -{
> -   struct bt=5Fbmc *bt=5Fbmc =3D file=5Fbt=5Fbmc(file);
> -
> -   atomic=5Fdec(&open=5Fcount);
> -   set=5Fb=5Fbusy(bt=5Fbmc);
> +   spin=5Funlock=5Firqrestore(&bt=5Fbmc->lock, flags);
>     return 0;
>  }
>
> -static unsigned int bt=5Fbmc=5Fpoll(struct file *file, poll=5Ftable *wai=
t)
> -{
> -   struct bt=5Fbmc *bt=5Fbmc =3D file=5Fbt=5Fbmc(file);
> -   unsigned int mask =3D 0;
> -   u8 ctrl;
> -
> -   poll=5Fwait(file, &bt=5Fbmc->queue, wait);
> -
> -   ctrl =3D bt=5Finb(bt=5Fbmc, BT=5FCTRL);
> -
> -   if (ctrl & BT=5FCTRL=5FH2B=5FATN)
> -      mask |=3D POLLIN;
> -
> -   if (!(ctrl & (BT=5FCTRL=5FH=5FBUSY | BT=5FCTRL=5FB2H=5FATN)))
> -      mask |=3D POLLOUT;
> -
> -   return mask;
> -}
> -
> -static const struct file=5Foperations bt=5Fbmc=5Ffops =3D {
> -   .owner      =3D THIS=5FMODULE,
> -   .open      =3D bt=5Fbmc=5Fopen,
> -   .read      =3D bt=5Fbmc=5Fread,
> -   .write      =3D bt=5Fbmc=5Fwrite,
> -   .release   =3D bt=5Fbmc=5Frelease,
> -   .poll      =3D bt=5Fbmc=5Fpoll,
> -   .unlocked=5Fioctl   =3D bt=5Fbmc=5Fioctl,
> -};
> -
>  static void poll=5Ftimer(unsigned long data)
>  {
>     struct bt=5Fbmc *bt=5Fbmc =3D (void *)data;
>
>     bt=5Fbmc->poll=5Ftimer.expires +=3D msecs=5Fto=5Fjiffies(500);
> -   wake=5Fup(&bt=5Fbmc->queue);
> +
> +   if (bt=5Fbmc=5Fis=5Fresponse=5Fopen(&bt=5Fbmc->bus))
> +      ipmi=5Fbmc=5Fsignal=5Fresponse=5Fopen(bt=5Fbmc->bmc=5Fctx);
> +
> +   if (is=5Frequest=5Favail(bt=5Fbmc))
> +      get=5Frequest(bt=5Fbmc);
> +
>     add=5Ftimer(&bt=5Fbmc->poll=5Ftimer);
>  }
>
> @@ -399,7 +285,12 @@ static irqreturn=5Ft bt=5Fbmc=5Firq(int irq, void *a=
rg)
>     /* ack pending IRQs */
>     regmap=5Fwrite(bt=5Fbmc->map, bt=5Fbmc->offset + BT=5FCR2, reg);
>
> -   wake=5Fup(&bt=5Fbmc->queue);
> +   if (bt=5Fbmc=5Fis=5Fresponse=5Fopen(&bt=5Fbmc->bus))
> +      ipmi=5Fbmc=5Fsignal=5Fresponse=5Fopen(bt=5Fbmc->bmc=5Fctx);
> +
> +   if (is=5Frequest=5Favail(bt=5Fbmc))
> +      get=5Frequest(bt=5Fbmc);
> +
>     return IRQ=5FHANDLED;
>  }
>
> @@ -474,16 +365,14 @@ static int bt=5Fbmc=5Fprobe(struct platform=5Fdevice
*pdev)
>           return rc;
>     }
>
> -   mutex=5Finit(&bt=5Fbmc->mutex);
> -   init=5Fwaitqueue=5Fhead(&bt=5Fbmc->queue);
> +   spin=5Flock=5Finit(&bt=5Fbmc->lock);
> +   bt=5Fbmc->bus.send=5Fresponse =3D bt=5Fbmc=5Fsend=5Fresponse;
> +   bt=5Fbmc->bus.is=5Fresponse=5Fopen =3D bt=5Fbmc=5Fis=5Fresponse=5Fope=
n;
> +   bt=5Fbmc->bmc=5Fctx =3D ipmi=5Fbmc=5Fget=5Fglobal=5Fctx();
>
> -   bt=5Fbmc->miscdev.minor   =3D MISC=5FDYNAMIC=5FMINOR,
> -      bt=5Fbmc->miscdev.name   =3D DEVICE=5FNAME,
> -      bt=5Fbmc->miscdev.fops   =3D &bt=5Fbmc=5Ffops,
> -      bt=5Fbmc->miscdev.parent =3D dev;
> -   rc =3D misc=5Fregister(&bt=5Fbmc->miscdev);
> +   rc =3D ipmi=5Fbmc=5Fregister=5Fbus(bt=5Fbmc->bmc=5Fctx, &bt=5Fbmc->bu=
s);
>     if (rc) {
> -      dev=5Ferr(dev, "Unable to register misc device\n");
> +      dev=5Ferr(dev, "Unable to register IPMI BMC bus\n");
>        return rc;
>     }
>
> @@ -514,11 +403,12 @@ static int bt=5Fbmc=5Fprobe(struct platform=5Fdevice
*pdev)
>  static int bt=5Fbmc=5Fremove(struct platform=5Fdevice *pdev)
>  {
>     struct bt=5Fbmc *bt=5Fbmc =3D dev=5Fget=5Fdrvdata(&pdev->dev);
> +   int rc;
>
> -   misc=5Fderegister(&bt=5Fbmc->miscdev);
> +   rc =3D ipmi=5Fbmc=5Funregister=5Fbus(bt=5Fbmc->bmc=5Fctx, &bt=5Fbmc->=
bus);
>     if (!bt=5Fbmc->irq)
>        del=5Ftimer=5Fsync(&bt=5Fbmc->poll=5Ftimer);
> -   return 0;
> +   return rc;
>  }
>
>  static const struct of=5Fdevice=5Fid bt=5Fbmc=5Fmatch[] =3D {
> diff --git a/include/uapi/linux/bt-bmc.h b/include/uapi/linux/bt-bmc.h
> deleted file mode 100644
> index d9ec766a63d0..000000000000
> --- a/include/uapi/linux/bt-bmc.h
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -/*
> - * Copyright (c) 2015-2016, IBM Corporation.
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU General Public License
> - * as published by the Free Software Foundation; either version
> - * 2 of the License, or (at your option) any later version.
> - */
> -
> -#ifndef =5FUAPI=5FLINUX=5FBT=5FBMC=5FH
> -#define =5FUAPI=5FLINUX=5FBT=5FBMC=5FH
> -
> -#include <linux/ioctl.h>
> -
> -#define =5F=5FBT=5FBMC=5FIOCTL=5FMAGIC   0xb1
> -#define BT=5FBMC=5FIOCTL=5FSMS=5FATN   =5FIO(=5F=5FBT=5FBMC=5FIOCTL=5FMA=
GIC, 0x00)
> -
> -#endif /* =5FUAPI=5FLINUX=5FBT=5FBMC=5FH */
> --
> 2.14.0.rc1.383.gd1ce394fe2-goog
>

--0__=09BB0BE5DFDE69458f9e8a93df938690918c09BB0BE5DFDE6945
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt><font size=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces=
+austenc=3Dus.ibm.com@lists.ozlabs.org&gt; wrote on 08/07/2017 10:53:01 PM:=
<br><br>&gt; From: Brendan Higgins &lt;brendanhiggins@google.com&gt;</font>=
</tt><br><tt><font size=3D"2">&gt; To: minyard@acm.org, benjaminfair@google=
.com, clg@kaod.org, <br>&gt; joel@jms.id.au, andrew@aj.id.au</font></tt><br=
><tt><font size=3D"2">&gt; Cc: openipmi-developer@lists.sourceforge.net, Br=
endan Higgins <br>&gt; &lt;brendanhiggins@google.com&gt;, openbmc@lists.ozl=
abs.org, linux-<br>&gt; kernel@vger.kernel.org</font></tt><br><tt><font siz=
e=3D"2">&gt; Date: 08/07/2017 10:55 PM</font></tt><br><tt><font size=3D"2">=
&gt; Subject: [RFC v1 4/4] ipmi=5Fbmc: bt-aspeed: port driver to IPMI BMC f=
ramework</font></tt><br><tt><font size=3D"2">&gt; Sent by: &quot;openbmc&qu=
ot; &lt;openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org&gt;</font></t=
t><br><tt><font size=3D"2">&gt; <br>&gt; From: Benjamin Fair &lt;benjaminfa=
ir@google.com&gt;<br>&gt; <br>&gt; The driver was handling interaction with=
 userspace on its own. This<br>&gt; patch changes it to use the functionali=
ty of the ipmi=5Fbmc framework<br>&gt; instead.<br>&gt; <br>&gt; Note that =
this removes the ability for the BMC to set SMS=5FATN by making<br>&gt; an =
ioctl. If this functionality is required, it can be added back in<br>&gt; w=
ith a later patch.</font></tt><br><br><br><tt><font size=3D"2">Isn't SMS=5F=
ATN the way a BMC initiates an IPMI message to the OS? &nbsp;Say for</font>=
</tt><br><tt><font size=3D"2">instance a request to shutdown?</font></tt><b=
r><br><tt><font size=3D"2"><br>&gt; <br>&gt; Signed-off-by: Benjamin Fair &=
lt;benjaminfair@google.com&gt;<br>&gt; Signed-off-by: Brendan Higgins &lt;b=
rendanhiggins@google.com&gt;<br>&gt; ---<br>&gt; &nbsp;drivers/char/ipmi=5F=
bmc/ipmi=5Fbmc=5Fbt=5Faspeed.c | 258 ++++++++<br>&gt; +--------------------=
<br>&gt; &nbsp;include/uapi/linux/bt-bmc.h &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;| &nbsp;18 --<br>&gt; &nbsp;2 files changed, 74 inse=
rtions(+), 202 deletions(-)<br>&gt; &nbsp;delete mode 100644 include/uapi/l=
inux/bt-bmc.h<br>&gt; <br>&gt; diff --git a/drivers/char/ipmi=5Fbmc/ipmi=5F=
bmc=5Fbt=5Faspeed.c b/drivers/<br>&gt; char/ipmi=5Fbmc/ipmi=5Fbmc=5Fbt=5Fas=
peed.c<br>&gt; index 70d434bc1cbf..7c8082c511ee 100644<br>&gt; --- a/driver=
s/char/ipmi=5Fbmc/ipmi=5Fbmc=5Fbt=5Faspeed.c<br>&gt; +++ b/drivers/char/ipm=
i=5Fbmc/ipmi=5Fbmc=5Fbt=5Faspeed.c<br>&gt; @@ -7,25 +7,19 @@<br>&gt; &nbsp;=
 * 2 of the License, or (at your option) any later version.<br>&gt; &nbsp; =
*/<br>&gt; &nbsp;<br>&gt; -#include &lt;linux/atomic.h&gt;<br>&gt; -#includ=
e &lt;linux/bt-bmc.h&gt;<br>&gt; &nbsp;#include &lt;linux/errno.h&gt;<br>&g=
t; &nbsp;#include &lt;linux/interrupt.h&gt;<br>&gt; &nbsp;#include &lt;linu=
x/io.h&gt;<br>&gt; +#include &lt;linux/ipmi=5Fbmc.h&gt;<br>&gt; &nbsp;#incl=
ude &lt;linux/mfd/syscon.h&gt;<br>&gt; -#include &lt;linux/miscdevice.h&gt;=
<br>&gt; &nbsp;#include &lt;linux/module.h&gt;<br>&gt; &nbsp;#include &lt;l=
inux/of.h&gt;<br>&gt; &nbsp;#include &lt;linux/platform=5Fdevice.h&gt;<br>&=
gt; -#include &lt;linux/poll.h&gt;<br>&gt; &nbsp;#include &lt;linux/regmap.=
h&gt;<br>&gt; &nbsp;#include &lt;linux/sched.h&gt;<br>&gt; &nbsp;#include &=
lt;linux/timer.h&gt;<br>&gt; &nbsp;<br>&gt; -/*<br>&gt; - * This is a BMC d=
evice used to communicate to the host<br>&gt; - */<br>&gt; -#define DEVICE=
=5FNAME &nbsp; &quot;ipmi-bt-host&quot;<br>&gt; +#define DEVICE=5FNAME &quo=
t;ipmi-bmc-bt-aspeed&quot;<br>&gt; &nbsp;<br>&gt; &nbsp;#define BT=5FIO=5FB=
ASE &nbsp; 0xe4<br>&gt; &nbsp;#define BT=5FIRQ &nbsp; &nbsp; &nbsp;10<br>&g=
t; @@ -61,18 +55,17 @@<br>&gt; &nbsp;#define BT=5FBMC=5FBUFFER=5FSIZE 256<b=
r>&gt; &nbsp;<br>&gt; &nbsp;struct bt=5Fbmc {<br>&gt; + &nbsp; struct ipmi=
=5Fbmc=5Fbus &nbsp; bus;<br>&gt; &nbsp; &nbsp; struct device &nbsp; &nbsp; =
&nbsp;dev;<br>&gt; - &nbsp; struct miscdevice &nbsp; miscdev;<br>&gt; + &nb=
sp; struct ipmi=5Fbmc=5Fctx &nbsp; *bmc=5Fctx;<br>&gt; + &nbsp; struct bt=
=5Fmsg &nbsp; &nbsp; &nbsp;request;<br>&gt; &nbsp; &nbsp; struct regmap &nb=
sp; &nbsp; &nbsp;*map;<br>&gt; &nbsp; &nbsp; int &nbsp; &nbsp; &nbsp; &nbsp=
; offset;<br>&gt; &nbsp; &nbsp; int &nbsp; &nbsp; &nbsp; &nbsp; irq;<br>&gt=
; - &nbsp; wait=5Fqueue=5Fhead=5Ft &nbsp; queue;<br>&gt; &nbsp; &nbsp; stru=
ct timer=5Flist &nbsp; poll=5Ftimer;<br>&gt; - &nbsp; struct mutex &nbsp; &=
nbsp; &nbsp;mutex;<br>&gt; + &nbsp; spinlock=5Ft &nbsp; &nbsp; &nbsp;lock;<=
br>&gt; &nbsp;};<br>&gt; &nbsp;<br>&gt; -static atomic=5Ft open=5Fcount =3D=
 ATOMIC=5FINIT(0);<br>&gt; -<br>&gt; &nbsp;static const struct regmap=5Fcon=
fig bt=5Fregmap=5Fcfg =3D {<br>&gt; &nbsp; &nbsp; .reg=5Fbits =3D 32,<br>&g=
t; &nbsp; &nbsp; .val=5Fbits =3D 32,<br>&gt; @@ -158,27 +151,28 @@ static s=
size=5Ft bt=5Fwriten(struct bt=5Fbmc <br>&gt; *bt=5Fbmc, u8 *buf, size=5Ft =
n)<br>&gt; &nbsp; &nbsp; return n;<br>&gt; &nbsp;}<br>&gt; &nbsp;<br>&gt; +=
/* TODO(benjaminfair): support ioctl BT=5FBMC=5FIOCTL=5FSMS=5FATN */<br>&gt=
; &nbsp;static void set=5Fsms=5Fatn(struct bt=5Fbmc *bt=5Fbmc)<br>&gt; &nbs=
p;{<br>&gt; &nbsp; &nbsp; bt=5Foutb(bt=5Fbmc, BT=5FCTRL=5FSMS=5FATN, BT=5FC=
TRL);<br>&gt; &nbsp;}<br>&gt; &nbsp;<br>&gt; -static struct bt=5Fbmc *file=
=5Fbt=5Fbmc(struct file *file)<br>&gt; +/* Called with bt=5Fbmc-&gt;lock he=
ld */<br>&gt; +static bool =5F=5Fis=5Frequest=5Favail(struct bt=5Fbmc *bt=
=5Fbmc)<br>&gt; &nbsp;{<br>&gt; - &nbsp; return container=5Fof(file-&gt;pri=
vate=5Fdata, struct bt=5Fbmc, miscdev);<br>&gt; + &nbsp; return bt=5Finb(bt=
=5Fbmc, BT=5FCTRL) &amp; BT=5FCTRL=5FH2B=5FATN;<br>&gt; &nbsp;}<br>&gt; &nb=
sp;<br>&gt; -static int bt=5Fbmc=5Fopen(struct inode *inode, struct file *f=
ile)<br>&gt; +static bool is=5Frequest=5Favail(struct bt=5Fbmc *bt=5Fbmc)<b=
r>&gt; &nbsp;{<br>&gt; - &nbsp; struct bt=5Fbmc *bt=5Fbmc =3D file=5Fbt=5Fb=
mc(file);<br>&gt; + &nbsp; unsigned long flags;<br>&gt; + &nbsp; bool resul=
t;<br>&gt; &nbsp;<br>&gt; - &nbsp; if (atomic=5Finc=5Freturn(&amp;open=5Fco=
unt) =3D=3D 1) {<br>&gt; - &nbsp; &nbsp; &nbsp;clr=5Fb=5Fbusy(bt=5Fbmc);<br=
>&gt; - &nbsp; &nbsp; &nbsp;return 0;<br>&gt; - &nbsp; }<br>&gt; + &nbsp; s=
pin=5Flock=5Firqsave(&amp;bt=5Fbmc-&gt;lock, flags);<br>&gt; + &nbsp; resul=
t =3D =5F=5Fis=5Frequest=5Favail(bt=5Fbmc);<br>&gt; + &nbsp; spin=5Funlock=
=5Firqrestore(&amp;bt=5Fbmc-&gt;lock, flags);<br>&gt; &nbsp;<br>&gt; - &nbs=
p; atomic=5Fdec(&amp;open=5Fcount);<br>&gt; - &nbsp; return -EBUSY;<br>&gt;=
 + &nbsp; return result;<br>&gt; &nbsp;}<br>&gt; &nbsp;<br>&gt; &nbsp;/*<br=
>&gt; @@ -194,67 +188,43 @@ static int bt=5Fbmc=5Fopen(struct inode *inode,=
 <br>&gt; struct file *file)<br>&gt; &nbsp; * &nbsp; &nbsp;Length &nbsp;Net=
Fn/LUN &nbsp;Seq &nbsp; &nbsp; Cmd &nbsp; &nbsp; Data<br>&gt; &nbsp; *<br>&=
gt; &nbsp; */<br>&gt; -static ssize=5Ft bt=5Fbmc=5Fread(struct file *file, =
char =5F=5Fuser *buf,<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;si=
ze=5Ft count, loff=5Ft *ppos)<br>&gt; +static void get=5Frequest(struct bt=
=5Fbmc *bt=5Fbmc)<br>&gt; &nbsp;{<br>&gt; - &nbsp; struct bt=5Fbmc *bt=5Fbm=
c =3D file=5Fbt=5Fbmc(file);<br>&gt; - &nbsp; u8 len;<br>&gt; - &nbsp; int =
len=5Fbyte =3D 1;<br>&gt; - &nbsp; u8 kbuffer[BT=5FBMC=5FBUFFER=5FSIZE];<br=
>&gt; - &nbsp; ssize=5Ft ret =3D 0;<br>&gt; - &nbsp; ssize=5Ft nread;<br>&g=
t; + &nbsp; u8 *request=5Fbuf =3D (u8 *) &amp;bt=5Fbmc-&gt;request;<br>&gt;=
 + &nbsp; unsigned long flags;<br>&gt; &nbsp;<br>&gt; - &nbsp; if (!access=
=5Fok(VERIFY=5FWRITE, buf, count))<br>&gt; - &nbsp; &nbsp; &nbsp;return -EF=
AULT;<br>&gt; + &nbsp; spin=5Flock=5Firqsave(&amp;bt=5Fbmc-&gt;lock, flags)=
;<br>&gt; &nbsp;<br>&gt; - &nbsp; WARN=5FON(*ppos);<br>&gt; -<br>&gt; - &nb=
sp; if (wait=5Fevent=5Finterruptible(bt=5Fbmc-&gt;queue,<br>&gt; - &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bt=5Finb(bt=5Fbmc, BT=5FCTR=
L) &amp; BT=5FCTRL=5FH2B=5FATN))<br>&gt; - &nbsp; &nbsp; &nbsp;return -ERES=
TARTSYS;<br>&gt; -<br>&gt; - &nbsp; mutex=5Flock(&amp;bt=5Fbmc-&gt;mutex);<=
br>&gt; -<br>&gt; - &nbsp; if (unlikely(!(bt=5Finb(bt=5Fbmc, BT=5FCTRL) &am=
p; BT=5FCTRL=5FH2B=5FATN))) {<br>&gt; - &nbsp; &nbsp; &nbsp;ret =3D -EIO;<b=
r>&gt; - &nbsp; &nbsp; &nbsp;goto out=5Funlock;<br>&gt; + &nbsp; if (!=5F=
=5Fis=5Frequest=5Favail(bt=5Fbmc)) {<br>&gt; + &nbsp; &nbsp; &nbsp;spin=5Fu=
nlock=5Firqrestore(&amp;bt=5Fbmc-&gt;lock, flags);<br>&gt; + &nbsp; &nbsp; =
&nbsp;return;<br>&gt; &nbsp; &nbsp; }<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; =
set=5Fb=5Fbusy(bt=5Fbmc);<br>&gt; &nbsp; &nbsp; clr=5Fh2b=5Fatn(bt=5Fbmc);<=
br>&gt; &nbsp; &nbsp; clr=5Frd=5Fptr(bt=5Fbmc);<br>&gt; &nbsp;<br>&gt; - &n=
bsp; /*<br>&gt; - &nbsp; &nbsp;* The BT frames start with the message lengt=
h, which does not<br>&gt; - &nbsp; &nbsp;* include the length byte.<br>&gt;=
 - &nbsp; &nbsp;*/<br>&gt; - &nbsp; kbuffer[0] =3D bt=5Fread(bt=5Fbmc);<br>=
&gt; - &nbsp; len =3D kbuffer[0];<br>&gt; -<br>&gt; - &nbsp; /* We pass the=
 length back to userspace as well */<br>&gt; - &nbsp; if (len + 1 &gt; coun=
t)<br>&gt; - &nbsp; &nbsp; &nbsp;len =3D count - 1;<br>&gt; -<br>&gt; - &nb=
sp; while (len) {<br>&gt; - &nbsp; &nbsp; &nbsp;nread =3D min=5Ft(ssize=5Ft=
, len, sizeof(kbuffer) - len=5Fbyte);<br>&gt; -<br>&gt; - &nbsp; &nbsp; &nb=
sp;bt=5Freadn(bt=5Fbmc, kbuffer + len=5Fbyte, nread);<br>&gt; -<br>&gt; - &=
nbsp; &nbsp; &nbsp;if (copy=5Fto=5Fuser(buf, kbuffer, nread + len=5Fbyte)) =
{<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; ret =3D -EFAULT;<br>&gt; - &nbsp; &=
nbsp; &nbsp; &nbsp; break;<br>&gt; - &nbsp; &nbsp; &nbsp;}<br>&gt; - &nbsp;=
 &nbsp; &nbsp;len -=3D nread;<br>&gt; - &nbsp; &nbsp; &nbsp;buf +=3D nread =
+ len=5Fbyte;<br>&gt; - &nbsp; &nbsp; &nbsp;ret +=3D nread + len=5Fbyte;<br=
>&gt; - &nbsp; &nbsp; &nbsp;len=5Fbyte =3D 0;<br>&gt; - &nbsp; }<br>&gt; + =
&nbsp; bt=5Fbmc-&gt;request.len =3D bt=5Fread(bt=5Fbmc);<br>&gt; + &nbsp; b=
t=5Freadn(bt=5Fbmc, request=5Fbuf + 1, bt=5Fbmc-&gt;request.len);<br>&gt; &=
nbsp;<br>&gt; &nbsp; &nbsp; clr=5Fb=5Fbusy(bt=5Fbmc);<br>&gt; + &nbsp; ipmi=
=5Fbmc=5Fhandle=5Frequest(bt=5Fbmc-&gt;bmc=5Fctx, &amp;bt=5Fbmc-&gt;request=
);<br>&gt; +<br>&gt; + &nbsp; spin=5Funlock=5Firqrestore(&amp;bt=5Fbmc-&gt;=
lock, flags);<br>&gt; +}<br>&gt; +<br>&gt; +static bool bt=5Fbmc=5Fis=5Fres=
ponse=5Fopen(struct ipmi=5Fbmc=5Fbus *bus)<br>&gt; +{<br>&gt; + &nbsp; stru=
ct bt=5Fbmc *bt=5Fbmc =3D container=5Fof(bus, struct bt=5Fbmc, bus);<br>&gt=
; + &nbsp; bool response=5Fin=5Fprogress;<br>&gt; + &nbsp; unsigned long fl=
ags;<br>&gt; +<br>&gt; + &nbsp; spin=5Flock=5Firqsave(&amp;bt=5Fbmc-&gt;loc=
k, flags);<br>&gt; + &nbsp; response=5Fin=5Fprogress =3D bt=5Finb(bt=5Fbmc,=
 BT=5FCTRL) &amp; (BT=5FCTRL=5FH=5FBUSY |<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; BT=5FCTRL=5FB2H=5FATN=
);<br>&gt; + &nbsp; spin=5Funlock=5Firqrestore(&amp;bt=5Fbmc-&gt;lock, flag=
s);<br>&gt; &nbsp;<br>&gt; -out=5Funlock:<br>&gt; - &nbsp; mutex=5Funlock(&=
amp;bt=5Fbmc-&gt;mutex);<br>&gt; - &nbsp; return ret;<br>&gt; + &nbsp; retu=
rn !response=5Fin=5Fprogress;<br>&gt; &nbsp;}<br>&gt; &nbsp;<br>&gt; &nbsp;=
/*<br>&gt; @@ -263,122 +233,38 @@ static ssize=5Ft bt=5Fbmc=5Fread(struct f=
ile *file,<br>&gt; char =5F=5Fuser *buf,<br>&gt; &nbsp; * &nbsp; &nbsp;Byte=
 1 &nbsp;Byte 2 &nbsp; &nbsp; Byte 3 &nbsp;Byte 4 &nbsp;Byte 5 &nbsp;Byte 6=
:N<br>&gt; &nbsp; * &nbsp; &nbsp;Length &nbsp;NetFn/LUN &nbsp;Seq &nbsp; &n=
bsp; Cmd &nbsp; &nbsp; Code &nbsp; &nbsp;Data<br>&gt; &nbsp; */<br>&gt; -st=
atic ssize=5Ft bt=5Fbmc=5Fwrite(struct file *file, const char =5F=5Fuser *b=
uf,<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size=5Ft count, lof=
f=5Ft *ppos)<br>&gt; +static int bt=5Fbmc=5Fsend=5Fresponse(struct ipmi=5Fb=
mc=5Fbus *bus,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct bt=
=5Fmsg *bt=5Fresponse)<br>&gt; &nbsp;{<br>&gt; - &nbsp; struct bt=5Fbmc *bt=
=5Fbmc =3D file=5Fbt=5Fbmc(file);<br>&gt; - &nbsp; u8 kbuffer[BT=5FBMC=5FBU=
FFER=5FSIZE];<br>&gt; - &nbsp; ssize=5Ft ret =3D 0;<br>&gt; - &nbsp; ssize=
=5Ft nwritten;<br>&gt; + &nbsp; struct bt=5Fbmc *bt=5Fbmc =3D container=5Fo=
f(bus, struct bt=5Fbmc, bus);<br>&gt; + &nbsp; unsigned long flags;<br>&gt;=
 &nbsp;<br>&gt; - &nbsp; /*<br>&gt; - &nbsp; &nbsp;* send a minimum respons=
e size<br>&gt; - &nbsp; &nbsp;*/<br>&gt; - &nbsp; if (count &lt; 5)<br>&gt;=
 - &nbsp; &nbsp; &nbsp;return -EINVAL;<br>&gt; -<br>&gt; - &nbsp; if (!acce=
ss=5Fok(VERIFY=5FREAD, buf, count))<br>&gt; - &nbsp; &nbsp; &nbsp;return -E=
FAULT;<br>&gt; -<br>&gt; - &nbsp; WARN=5FON(*ppos);<br>&gt; -<br>&gt; - &nb=
sp; /*<br>&gt; - &nbsp; &nbsp;* There's no interrupt for clearing bmc busy =
so we have to<br>&gt; - &nbsp; &nbsp;* poll<br>&gt; - &nbsp; &nbsp;*/<br>&g=
t; - &nbsp; if (wait=5Fevent=5Finterruptible(bt=5Fbmc-&gt;queue,<br>&gt; - =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; !(bt=5Finb(bt=5Fbmc=
, BT=5FCTRL) &amp;<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; (BT=5FCTRL=5FH=5FBUSY | BT=5FCTRL=5FB2H=5FATN))))<br>&gt; =
- &nbsp; &nbsp; &nbsp;return -ERESTARTSYS;<br>&gt; -<br>&gt; - &nbsp; mutex=
=5Flock(&amp;bt=5Fbmc-&gt;mutex);<br>&gt; -<br>&gt; - &nbsp; if (unlikely(b=
t=5Finb(bt=5Fbmc, BT=5FCTRL) &amp;<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; (BT=5FCTRL=5FH=5FBUSY | BT=5FCTRL=5FB2H=5FATN))) {<br>&gt; - &nbsp; &n=
bsp; &nbsp;ret =3D -EIO;<br>&gt; - &nbsp; &nbsp; &nbsp;goto out=5Funlock;<b=
r>&gt; + &nbsp; spin=5Flock=5Firqsave(&amp;bt=5Fbmc-&gt;lock, flags);<br>&g=
t; + &nbsp; if (!bt=5Fbmc=5Fis=5Fresponse=5Fopen(bus)) {<br>&gt; + &nbsp; &=
nbsp; &nbsp;spin=5Funlock=5Firqrestore(&amp;bt=5Fbmc-&gt;lock, flags);<br>&=
gt; + &nbsp; &nbsp; &nbsp;return -EAGAIN;<br>&gt; &nbsp; &nbsp; }<br>&gt; &=
nbsp;<br>&gt; &nbsp; &nbsp; clr=5Fwr=5Fptr(bt=5Fbmc);<br>&gt; -<br>&gt; - &=
nbsp; while (count) {<br>&gt; - &nbsp; &nbsp; &nbsp;nwritten =3D min=5Ft(ss=
ize=5Ft, count, sizeof(kbuffer));<br>&gt; - &nbsp; &nbsp; &nbsp;if (copy=5F=
from=5Fuser(&amp;kbuffer, buf, nwritten)) {<br>&gt; - &nbsp; &nbsp; &nbsp; =
&nbsp; ret =3D -EFAULT;<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; break;<br>&gt=
; - &nbsp; &nbsp; &nbsp;}<br>&gt; -<br>&gt; - &nbsp; &nbsp; &nbsp;bt=5Fwrit=
en(bt=5Fbmc, kbuffer, nwritten);<br>&gt; -<br>&gt; - &nbsp; &nbsp; &nbsp;co=
unt -=3D nwritten;<br>&gt; - &nbsp; &nbsp; &nbsp;buf +=3D nwritten;<br>&gt;=
 - &nbsp; &nbsp; &nbsp;ret +=3D nwritten;<br>&gt; - &nbsp; }<br>&gt; -<br>&=
gt; + &nbsp; bt=5Fwriten(bt=5Fbmc, (u8 *) bt=5Fresponse, bt=5Fmsg=5Flen(bt=
=5Fresponse));<br>&gt; &nbsp; &nbsp; set=5Fb2h=5Fatn(bt=5Fbmc);<br>&gt; &nb=
sp;<br>&gt; -out=5Funlock:<br>&gt; - &nbsp; mutex=5Funlock(&amp;bt=5Fbmc-&g=
t;mutex);<br>&gt; - &nbsp; return ret;<br>&gt; -}<br>&gt; -<br>&gt; -static=
 long bt=5Fbmc=5Fioctl(struct file *file, unsigned int cmd,<br>&gt; - &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;unsigned long param)<br>&gt; -{<br>&gt; - &nbs=
p; struct bt=5Fbmc *bt=5Fbmc =3D file=5Fbt=5Fbmc(file);<br>&gt; -<br>&gt; -=
 &nbsp; switch (cmd) {<br>&gt; - &nbsp; case BT=5FBMC=5FIOCTL=5FSMS=5FATN:<=
br>&gt; - &nbsp; &nbsp; &nbsp;set=5Fsms=5Fatn(bt=5Fbmc);<br>&gt; - &nbsp; &=
nbsp; &nbsp;return 0;<br>&gt; - &nbsp; }<br>&gt; - &nbsp; return -EINVAL;<b=
r>&gt; -}<br>&gt; -<br>&gt; -static int bt=5Fbmc=5Frelease(struct inode *in=
ode, struct file *file)<br>&gt; -{<br>&gt; - &nbsp; struct bt=5Fbmc *bt=5Fb=
mc =3D file=5Fbt=5Fbmc(file);<br>&gt; -<br>&gt; - &nbsp; atomic=5Fdec(&amp;=
open=5Fcount);<br>&gt; - &nbsp; set=5Fb=5Fbusy(bt=5Fbmc);<br>&gt; + &nbsp; =
spin=5Funlock=5Firqrestore(&amp;bt=5Fbmc-&gt;lock, flags);<br>&gt; &nbsp; &=
nbsp; return 0;<br>&gt; &nbsp;}<br>&gt; &nbsp;<br>&gt; -static unsigned int=
 bt=5Fbmc=5Fpoll(struct file *file, poll=5Ftable *wait)<br>&gt; -{<br>&gt; =
- &nbsp; struct bt=5Fbmc *bt=5Fbmc =3D file=5Fbt=5Fbmc(file);<br>&gt; - &nb=
sp; unsigned int mask =3D 0;<br>&gt; - &nbsp; u8 ctrl;<br>&gt; -<br>&gt; - =
&nbsp; poll=5Fwait(file, &amp;bt=5Fbmc-&gt;queue, wait);<br>&gt; -<br>&gt; =
- &nbsp; ctrl =3D bt=5Finb(bt=5Fbmc, BT=5FCTRL);<br>&gt; -<br>&gt; - &nbsp;=
 if (ctrl &amp; BT=5FCTRL=5FH2B=5FATN)<br>&gt; - &nbsp; &nbsp; &nbsp;mask |=
=3D POLLIN;<br>&gt; -<br>&gt; - &nbsp; if (!(ctrl &amp; (BT=5FCTRL=5FH=5FBU=
SY | BT=5FCTRL=5FB2H=5FATN)))<br>&gt; - &nbsp; &nbsp; &nbsp;mask |=3D POLLO=
UT;<br>&gt; -<br>&gt; - &nbsp; return mask;<br>&gt; -}<br>&gt; -<br>&gt; -s=
tatic const struct file=5Foperations bt=5Fbmc=5Ffops =3D {<br>&gt; - &nbsp;=
 .owner &nbsp; &nbsp; &nbsp;=3D THIS=5FMODULE,<br>&gt; - &nbsp; .open &nbsp=
; &nbsp; &nbsp;=3D bt=5Fbmc=5Fopen,<br>&gt; - &nbsp; .read &nbsp; &nbsp; &n=
bsp;=3D bt=5Fbmc=5Fread,<br>&gt; - &nbsp; .write &nbsp; &nbsp; &nbsp;=3D bt=
=5Fbmc=5Fwrite,<br>&gt; - &nbsp; .release &nbsp; =3D bt=5Fbmc=5Frelease,<br=
>&gt; - &nbsp; .poll &nbsp; &nbsp; &nbsp;=3D bt=5Fbmc=5Fpoll,<br>&gt; - &nb=
sp; .unlocked=5Fioctl &nbsp; =3D bt=5Fbmc=5Fioctl,<br>&gt; -};<br>&gt; -<br=
>&gt; &nbsp;static void poll=5Ftimer(unsigned long data)<br>&gt; &nbsp;{<br=
>&gt; &nbsp; &nbsp; struct bt=5Fbmc *bt=5Fbmc =3D (void *)data;<br>&gt; &nb=
sp;<br>&gt; &nbsp; &nbsp; bt=5Fbmc-&gt;poll=5Ftimer.expires +=3D msecs=5Fto=
=5Fjiffies(500);<br>&gt; - &nbsp; wake=5Fup(&amp;bt=5Fbmc-&gt;queue);<br>&g=
t; +<br>&gt; + &nbsp; if (bt=5Fbmc=5Fis=5Fresponse=5Fopen(&amp;bt=5Fbmc-&gt=
;bus))<br>&gt; + &nbsp; &nbsp; &nbsp;ipmi=5Fbmc=5Fsignal=5Fresponse=5Fopen(=
bt=5Fbmc-&gt;bmc=5Fctx);<br>&gt; +<br>&gt; + &nbsp; if (is=5Frequest=5Favai=
l(bt=5Fbmc))<br>&gt; + &nbsp; &nbsp; &nbsp;get=5Frequest(bt=5Fbmc);<br>&gt;=
 +<br>&gt; &nbsp; &nbsp; add=5Ftimer(&amp;bt=5Fbmc-&gt;poll=5Ftimer);<br>&g=
t; &nbsp;}<br>&gt; &nbsp;<br>&gt; @@ -399,7 +285,12 @@ static irqreturn=5Ft=
 bt=5Fbmc=5Firq(int irq, void *arg)<br>&gt; &nbsp; &nbsp; /* ack pending IR=
Qs */<br>&gt; &nbsp; &nbsp; regmap=5Fwrite(bt=5Fbmc-&gt;map, bt=5Fbmc-&gt;o=
ffset + BT=5FCR2, reg);<br>&gt; &nbsp;<br>&gt; - &nbsp; wake=5Fup(&amp;bt=
=5Fbmc-&gt;queue);<br>&gt; + &nbsp; if (bt=5Fbmc=5Fis=5Fresponse=5Fopen(&am=
p;bt=5Fbmc-&gt;bus))<br>&gt; + &nbsp; &nbsp; &nbsp;ipmi=5Fbmc=5Fsignal=5Fre=
sponse=5Fopen(bt=5Fbmc-&gt;bmc=5Fctx);<br>&gt; +<br>&gt; + &nbsp; if (is=5F=
request=5Favail(bt=5Fbmc))<br>&gt; + &nbsp; &nbsp; &nbsp;get=5Frequest(bt=
=5Fbmc);<br>&gt; +<br>&gt; &nbsp; &nbsp; return IRQ=5FHANDLED;<br>&gt; &nbs=
p;}<br>&gt; &nbsp;<br>&gt; @@ -474,16 +365,14 @@ static int bt=5Fbmc=5Fprob=
e(struct platform=5Fdevice *pdev)<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; return rc;<br>&gt; &nbsp; &nbsp; }<br>&gt; &nbsp;<br>&gt; - &nbsp; mutex=
=5Finit(&amp;bt=5Fbmc-&gt;mutex);<br>&gt; - &nbsp; init=5Fwaitqueue=5Fhead(=
&amp;bt=5Fbmc-&gt;queue);<br>&gt; + &nbsp; spin=5Flock=5Finit(&amp;bt=5Fbmc=
-&gt;lock);<br>&gt; + &nbsp; bt=5Fbmc-&gt;bus.send=5Fresponse =3D bt=5Fbmc=
=5Fsend=5Fresponse;<br>&gt; + &nbsp; bt=5Fbmc-&gt;bus.is=5Fresponse=5Fopen =
=3D bt=5Fbmc=5Fis=5Fresponse=5Fopen;<br>&gt; + &nbsp; bt=5Fbmc-&gt;bmc=5Fct=
x =3D ipmi=5Fbmc=5Fget=5Fglobal=5Fctx();<br>&gt; &nbsp;<br>&gt; - &nbsp; bt=
=5Fbmc-&gt;miscdev.minor &nbsp; =3D MISC=5FDYNAMIC=5FMINOR,<br>&gt; - &nbsp=
; &nbsp; &nbsp;bt=5Fbmc-&gt;miscdev.name &nbsp; =3D DEVICE=5FNAME,<br>&gt; =
- &nbsp; &nbsp; &nbsp;bt=5Fbmc-&gt;miscdev.fops &nbsp; =3D &amp;bt=5Fbmc=5F=
fops,<br>&gt; - &nbsp; &nbsp; &nbsp;bt=5Fbmc-&gt;miscdev.parent =3D dev;<br=
>&gt; - &nbsp; rc =3D misc=5Fregister(&amp;bt=5Fbmc-&gt;miscdev);<br>&gt; +=
 &nbsp; rc =3D ipmi=5Fbmc=5Fregister=5Fbus(bt=5Fbmc-&gt;bmc=5Fctx, &amp;bt=
=5Fbmc-&gt;bus);<br>&gt; &nbsp; &nbsp; if (rc) {<br>&gt; - &nbsp; &nbsp; &n=
bsp;dev=5Ferr(dev, &quot;Unable to register misc device\n&quot;);<br>&gt; +=
 &nbsp; &nbsp; &nbsp;dev=5Ferr(dev, &quot;Unable to register IPMI BMC bus\n=
&quot;);<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;return rc;<br>&gt; &nbsp; &nbsp=
; }<br>&gt; &nbsp;<br>&gt; @@ -514,11 +403,12 @@ static int bt=5Fbmc=5Fprob=
e(struct platform=5Fdevice *pdev)<br>&gt; &nbsp;static int bt=5Fbmc=5Fremov=
e(struct platform=5Fdevice *pdev)<br>&gt; &nbsp;{<br>&gt; &nbsp; &nbsp; str=
uct bt=5Fbmc *bt=5Fbmc =3D dev=5Fget=5Fdrvdata(&amp;pdev-&gt;dev);<br>&gt; =
+ &nbsp; int rc;<br>&gt; &nbsp;<br>&gt; - &nbsp; misc=5Fderegister(&amp;bt=
=5Fbmc-&gt;miscdev);<br>&gt; + &nbsp; rc =3D ipmi=5Fbmc=5Funregister=5Fbus(=
bt=5Fbmc-&gt;bmc=5Fctx, &amp;bt=5Fbmc-&gt;bus);<br>&gt; &nbsp; &nbsp; if (!=
bt=5Fbmc-&gt;irq)<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;del=5Ftimer=5Fsync(&am=
p;bt=5Fbmc-&gt;poll=5Ftimer);<br>&gt; - &nbsp; return 0;<br>&gt; + &nbsp; r=
eturn rc;<br>&gt; &nbsp;}<br>&gt; &nbsp;<br>&gt; &nbsp;static const struct =
of=5Fdevice=5Fid bt=5Fbmc=5Fmatch[] =3D {<br>&gt; diff --git a/include/uapi=
/linux/bt-bmc.h b/include/uapi/linux/bt-bmc.h<br>&gt; deleted file mode 100=
644<br>&gt; index d9ec766a63d0..000000000000<br>&gt; --- a/include/uapi/lin=
ux/bt-bmc.h<br>&gt; +++ /dev/null<br>&gt; @@ -1,18 +0,0 @@<br>&gt; -/*<br>&=
gt; - * Copyright (c) 2015-2016, IBM Corporation.<br>&gt; - *<br>&gt; - * T=
his program is free software; you can redistribute it and/or<br>&gt; - * mo=
dify it under the terms of the GNU General Public License<br>&gt; - * as pu=
blished by the Free Software Foundation; either version<br>&gt; - * 2 of th=
e License, or (at your option) any later version.<br>&gt; - */<br>&gt; -<br=
>&gt; -#ifndef =5FUAPI=5FLINUX=5FBT=5FBMC=5FH<br>&gt; -#define =5FUAPI=5FLI=
NUX=5FBT=5FBMC=5FH<br>&gt; -<br>&gt; -#include &lt;linux/ioctl.h&gt;<br>&gt=
; -<br>&gt; -#define =5F=5FBT=5FBMC=5FIOCTL=5FMAGIC &nbsp; 0xb1<br>&gt; -#d=
efine BT=5FBMC=5FIOCTL=5FSMS=5FATN &nbsp; =5FIO(=5F=5FBT=5FBMC=5FIOCTL=5FMA=
GIC, 0x00)<br>&gt; -<br>&gt; -#endif /* =5FUAPI=5FLINUX=5FBT=5FBMC=5FH */<b=
r>&gt; -- <br>&gt; 2.14.0.rc1.383.gd1ce394fe2-goog<br>&gt; <br></font></tt>=
<BR>
</body></html>

--0__=09BB0BE5DFDE69458f9e8a93df938690918c09BB0BE5DFDE6945--
