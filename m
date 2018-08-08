Return-Path: <andrewrj@au1.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=au1.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=andrewrj@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lcfQ1KWmzDqgw
 for <openbmc@lists.ozlabs.org>; Wed,  8 Aug 2018 13:42:47 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w783cijV005474
 for <openbmc@lists.ozlabs.org>; Tue, 7 Aug 2018 23:42:45 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.104])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2kqq1wud8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 07 Aug 2018 23:42:44 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <andrewrj@au1.ibm.com>;
 Wed, 8 Aug 2018 03:42:43 -0000
Received: from us1b3-smtp03.a3dr.sjc01.isc4sb.com (10.122.7.173)
 by smtp.notes.na.collabserv.com (10.122.47.44) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 8 Aug 2018 03:42:37 -0000
Received: from us1b3-mail156.a3dr.sjc03.isc4sb.com ([10.160.174.110])
 by us1b3-smtp03.a3dr.sjc01.isc4sb.com
 with ESMTP id 2018080803423702-9042 ; Wed, 8 Aug 2018 03:42:37 +0000 
In-Reply-To: <c67f4ad53054761e0ae51eb85bd32e880c614288.camel@kernel.crashing.org>
Subject: Re: [PATCH v3] fsi: sbefifo: Bump max command length
From: "Andrew Jeffery" <andrewrj@au1.ibm.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.vnet.ibm.com>, Joel
 Stanley <joel@jms.id.au>
Date: Wed, 8 Aug 2018 03:42:37 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <c67f4ad53054761e0ae51eb85bd32e880c614288.camel@kernel.crashing.org>,
 <cc45d5fe697afda6b77be859c163852aecefcbd4.camel@kernel.crashing.org>
X-Mailer: IBM iNotes ($HaikuForm 1011.1) | IBM Domino Build
 SCN1812108_20180501T0841 May 01, 2018 at 08:41
X-KeepSent: 8FAE73B9:5C2CEF9E-002582E3:0014619F;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 46767
X-TNEFEvaluated: 1
X-LLNXfer: False
x-cbid: 18080803-7301-0000-0000-000004A2C9C1
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.415104; ST=0; TS=0; UL=0; ISC=; MB=0.124921
X-IBM-SpamModules-Versions: BY=3.00009504; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01070835; UDB=6.00551239; IPR=6.00850293; 
 BA=6.00006069; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00022575; XFM=3.00000015;
 UTC=2018-08-08 03:42:41
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-08-07 17:23:16 - 6.00008802
x-cbparentid: 18080803-7302-0000-0000-00003550CFFB
Message-Id: <OF8FAE73B9.5C2CEF9E-ON002582E3.0014619F-002582E3.001461A6@notes.na.collabserv.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-08_01:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Fri, 10 Aug 2018 10:59:07 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2018 03:42:54 -0000


-----Benjamin Herrenschmidt <benh@kernel.crashing.org> wrote: -----

> To: openbmc@lists.ozlabs.org
> From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Date: 2018/08/08 13:01
> Cc: Eddie James <eajames@linux.vnet.ibm.com>, Andrew Jeffery
> <andrewrj@au1.ibm.com>, Joel Stanley <joel@jms.id.au>
> Subject: [PATCH v3] fsi: sbefifo: Bump max command length
>=20
> Otherwise cronus putmem fails istep and BML fails to upload skiboot
>=20
> To do that, we still use our one-page command buffer for small commands
> for speed, and for anything bigger, with a limit of 1MB plus a page,
> we vmalloc a temporary buffer.
>=20
> The limit was chosen because Cronus will break up any data transfer
> into 1M chunks (the extra page is for the command header).
>=20
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  v3. Factor the buffer cleanup code into a helper function
>=20
>  v2. Reduce max to 1MB + PAGE=5FSIZE which is enough for Cronus as
>      it will break up transfers in 1MB chunks and we can make
>      sure pdbg does the same.
>=20
>  drivers/fsi/fsi-sbefifo.c | 39 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 32 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index f97ec3e4ddea..9e778aac9ae7 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -30,6 +30,7 @@
>  #include <linux/delay.h>
>  #include <linux/uio.h>
>  #include <linux/vmalloc.h>
> +#include <linux/mm.h>
> =20
>  /*
>   * The SBEFIFO is a pipe-like FSI device for communicating with
> @@ -110,7 +111,7 @@ enum sbe=5Fstate
>  #define SBEFIFO=5FTIMEOUT=5FIN=5FRSP		1000
> =20
>  /* Other constants */
> -#define SBEFIFO=5FMAX=5FCMD=5FLEN		PAGE=5FSIZE
> +#define SBEFIFO=5FMAX=5FUSER=5FCMD=5FLEN	(0x100000 + PAGE=5FSIZE)
>  #define SBEFIFO=5FRESET=5FMAGIC		0x52534554 /* "RSET" */
>  #define SBEFIFO=5FBENCH=5FMAGIC		0x424E4348 /* "BNCH" */
> =20
> @@ -129,6 +130,7 @@ struct sbefifo {
>  struct sbefifo=5Fuser {
>  	struct sbefifo		*sbefifo;
>  	struct mutex		file=5Flock;
> +	void			*cmd=5Fpage;
>  	void			*pending=5Fcmd;
>  	size=5Ft			pending=5Flen;
>  };
> @@ -724,7 +726,7 @@ int sbefifo=5Fsubmit(struct device *dev, const =5F=5F=
be32
> *command, size=5Ft cmd=5Flen,
>  		return -ENODEV;
>  	if (WARN=5FON=5FONCE(sbefifo->magic !=3D SBEFIFO=5FMAGIC))
>  		return -ENODEV;
> -	if (!resp=5Flen || !command || !response || cmd=5Flen > SBEFIFO=5FMAX=
=5FCMD=5FLEN)
> +	if (!resp=5Flen || !command || !response)
>  		return -EINVAL;
> =20
>  	/* Prepare iov iterator */
> @@ -749,6 +751,15 @@ EXPORT=5FSYMBOL=5FGPL(sbefifo=5Fsubmit);
>  /*
>   * Char device interface
>   */
> +
> +static void sbefifo=5Frelease=5Fcommand(struct sbefifo=5Fuser *user)
> +{
> +	if (is=5Fvmalloc=5Faddr(user->pending=5Fcmd))
> +		vfree(user->pending=5Fcmd);
> +	user->pending=5Fcmd =3D NULL;
> +	user->pending=5Flen =3D 0;
> +}
> +
>  static int sbefifo=5Fuser=5Fopen(struct inode *inode, struct file *file)
>  {
>  	struct sbefifo *sbefifo =3D container=5Fof(inode->i=5Fcdev, struct sbef=
ifo, cdev);
> @@ -760,8 +771,8 @@ static int sbefifo=5Fuser=5Fopen(struct inode *inode,=
 struct
> file *file)
> =20
>  	file->private=5Fdata =3D user;
>  	user->sbefifo =3D sbefifo;
> -	user->pending=5Fcmd =3D (void *)=5F=5Fget=5Ffree=5Fpage(GFP=5FKERNEL);
> -	if (!user->pending=5Fcmd) {
> +	user->cmd=5Fpage =3D (void *)=5F=5Fget=5Ffree=5Fpage(GFP=5FKERNEL);
> +	if (!user->cmd=5Fpage) {
>  		kfree(user);
>  		return -ENOMEM;
>  	}
> @@ -814,7 +825,7 @@ static ssize=5Ft sbefifo=5Fuser=5Fread(struct file *f=
ile, char
> =5F=5Fuser *buf,
>  	/* Extract the response length */
>  	rc =3D len - iov=5Fiter=5Fcount(&resp=5Fiter);
>   bail:
> -	user->pending=5Flen =3D 0;
> +	sbefifo=5Frelease=5Fcommand(user);
>  	mutex=5Funlock(&user->file=5Flock);
>  	return rc;
>  }
> @@ -859,13 +870,23 @@ static ssize=5Ft sbefifo=5Fuser=5Fwrite(struct file=
 *file,
> const char =5F=5Fuser *buf,
>  	if (!user)
>  		return -EINVAL;
>  	sbefifo =3D user->sbefifo;
> -	if (len > SBEFIFO=5FMAX=5FCMD=5FLEN)
> +	if (len > SBEFIFO=5FMAX=5FUSER=5FCMD=5FLEN)
>  		return -EINVAL;
>  	if (len & 3)
>  		return -EINVAL;
> =20
>  	mutex=5Flock(&user->file=5Flock);
> =20
> +	/* Can we use the pre-allocate buffer ? If not, allocate */
> +	if (len <=3D PAGE=5FSIZE)
> +		user->pending=5Fcmd =3D user->cmd=5Fpage;
> +	else
> +		user->pending=5Fcmd =3D vmalloc(len);
> +	if (!user->pending=5Fcmd) {
> +		rc =3D -ENOMEM;
> +		goto bail;
> +	}
> +
>  	/* Copy the command into the staging buffer */
>  	if (copy=5Ffrom=5Fuser(user->pending=5Fcmd, buf, len)) {
>  		rc =3D -EFAULT;
> @@ -906,6 +927,9 @@ static ssize=5Ft sbefifo=5Fuser=5Fwrite(struct file *=
file, const
> char =5F=5Fuser *buf,
>  	/* Update the staging buffer size */
>  	user->pending=5Flen =3D len;
>   bail:
> +	if (!user->pending=5Flen)
> +		sbefifo=5Frelease=5Fcommand(user);
> +
>  	mutex=5Funlock(&user->file=5Flock);
> =20
>  	/* And that's it, we'll issue the command on a read */
> @@ -919,7 +943,8 @@ static int sbefifo=5Fuser=5Frelease(struct inode *ino=
de,
> struct file *file)
>  	if (!user)
>  		return -EINVAL;
> =20
> -	free=5Fpage((unsigned long)user->pending=5Fcmd);
> +	sbefifo=5Frelease=5Fcommand(user);
> +	free=5Fpage((unsigned long)user->cmd=5Fpage);
>  	kfree(user);
> =20
>  	return 0;
>=20
>=20
>=20
