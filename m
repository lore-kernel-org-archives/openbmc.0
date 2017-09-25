Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="WZY8G3HO"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ODt+K6Zp"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y0sJh2Br7zDr4N
 for <openbmc@lists.ozlabs.org>; Mon, 25 Sep 2017 14:57:23 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8EBAD20DBD;
 Mon, 25 Sep 2017 00:57:20 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 25 Sep 2017 00:57:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=1/q7Mtr/LY8I44oDTyFSp2V19Z8Fx8YvpTGs3gI0X
 No=; b=WZY8G3HOoTRq1IM/tBPWdekpJyZ90ZIEnsEZI9C5LkDKnUjWVca1218C6
 oXgvmzcwpwi8O2U61omnxBI25GA8kUMMjrzUdR8pE0u1gpDtQAjMUeofSs7nCLsp
 /LaoVBcoqo+eKkG22aEebGZM2dHlksIPSdnxjOPQHtmadoRTsecIrbnDAXQzxii0
 8prKADKIGEJVj+IUp/PKG6Tsc072WQNvm+efxA4qNqUR4byXRaKJpT3oqSTpQl/S
 JyWjUpibl8I/agz1NPWo3DPbRGX9FblkHZ4v0XJYM5HU4UWsaxUdgWh/4kpjfQKO
 ikifSbURf6wYF936GhFJvCvTOVcMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=1/q7Mtr/LY8I44oDTy
 FSp2V19Z8Fx8YvpTGs3gI0XNo=; b=ODt+K6ZpaN8gdVh5Qhd8646bANgaOXUxv2
 lrWqMIjIFHUiHrCCtWSm49Jj4MsbC3l4drHOPdI56OPM8jxwsguY7Fm9YIMnZc4G
 HB8jvKiBN3elqBxoReT8DtV5N0/X+5QohJzPQSGljErZfOxp8NwKN+yVJMCGNDks
 n6OOkXAZLxEDdbPhGxrywTLncPBq4Dl04YvxybMa8yZXS3LZ4my3GdOEgnvbAh47
 besrUhvFNTQxgop7yqJcneAbV0wBebtlFQaAgNvDQOmRKRxnUQNEE6rFqAlYziV2
 XCtZCd4bDMbjYDYctOWaUuHDhMfnwlmaUBzypNJMljdsqvh8roKQ==
X-ME-Sender: <xms:sIzIWXwJZIfGAOfc-OwQKn-cWOagc1qxtz5YBpXZdtEMpjAc2Al5VQ>
X-Sasl-enc: zZIu2zmXjB///HXB/X9vMfUVk/m89mgiaPdx67rR/fwJ 1506315439
Received: from keelia16 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 865847F955;
 Mon, 25 Sep 2017 00:57:18 -0400 (EDT)
Message-ID: <1506315435.30138.17.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 1/3] drivers/fsi/sbefifo: refactor to
 upstream list state
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Mon, 25 Sep 2017 14:27:15 +0930
In-Reply-To: <1506033838-2078-2-git-send-email-eajames@linux.vnet.ibm.com>
References: <1506033838-2078-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1506033838-2078-2-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-JlP3dEvGs2yh95Rrf4iH"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Sep 2017 04:57:27 -0000


--=-JlP3dEvGs2yh95Rrf4iH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-21 at 17:43 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Includes various fixes:
> =C2=A0- check for complete while waiting for data in read()
> =C2=A0- fix probe if probe fails
> =C2=A0- general cleanup
> =C2=A0- slightly safer (earlier) get_client()
> =C2=A0- reorder some of the remove() operations for safety

The fact that you can create a commit message that describes the patch in
terms of bullet points indicates to me that these bullet points should all =
be
separate patches. Squashing conceptually different changes like this makes =
the
patch much harder to review, as it's hard to tease apart how and why a chan=
ge
fixes any one of the deficient behaviours.

Please split them out in a follow-up if there is one. My personal preferenc=
e is
you do a v2 regardless just so you can split the patches out.

>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/fsi/fsi-sbefifo.c=C2=A0=C2=A0=C2=A0| 329 ++++++++++++++++++=
++++++--------------------
> =C2=A0include/linux/fsi-sbefifo.h |=C2=A0=C2=A0=C2=A06 +-
> =C2=A02 files changed, 180 insertions(+), 155 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index 1c37ff7..5d25ade 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -11,20 +11,27 @@
> =C2=A0 * GNU General Public License for more details.
> =C2=A0 */
> =C2=A0
> -#include <linux/delay.h>
> +#include <linux/device.h>
> =C2=A0#include <linux/errno.h>
> -#include <linux/idr.h>
> +#include <linux/fs.h>
> =C2=A0#include <linux/fsi.h>
> +#include <linux/fsi-sbefifo.h>
> +#include <linux/idr.h>
> +#include <linux/kernel.h>
> +#include <linux/kref.h>
> =C2=A0#include <linux/list.h>
> =C2=A0#include <linux/miscdevice.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/of.h>
> +#include <linux/of_device.h>
> =C2=A0#include <linux/of_platform.h>
> =C2=A0#include <linux/poll.h>
> =C2=A0#include <linux/sched.h>
> =C2=A0#include <linux/slab.h>
> +#include <linux/spinlock.h>
> =C2=A0#include <linux/timer.h>
> =C2=A0#include <linux/uaccess.h>
> +#include <linux/wait.h>
> =C2=A0
> =C2=A0/*
> =C2=A0 * The SBEFIFO is a pipe-like FSI device for communicating with
> @@ -44,14 +51,15 @@
> =C2=A0#define=C2=A0=C2=A0=C2=A0SBEFIFO_EOT_MAGIC		0xffffffff
> =C2=A0#define SBEFIFO_EOT_ACK		0x14
> =C2=A0
> +#define SBEFIFO_RESCHEDULE	msecs_to_jiffies(500)
> +
> =C2=A0struct sbefifo {
> =C2=A0	struct timer_list poll_timer;
> -	struct fsi_device *fsi_dev;
> -	struct miscdevice mdev;
> +	struct fsi_device *fsi_dev;	/* parent fsi device */

Not convinced the comment is helpful.

> +	struct miscdevice mdev;		/* /dev/ entry */

Not necesarily the intent of this patch, but I think it would be a good thi=
ng
to split out the SBEFIFO core from the chardev interface.

> =C2=A0	wait_queue_head_t wait;
> -	struct list_head link;
> =C2=A0	struct list_head xfrs;
> -	struct kref kref;
> +	struct kref kref;		/* reference counter */

Not convinced the comment is helpful.

> =C2=A0	spinlock_t lock;
> =C2=A0	char name[32];
> =C2=A0	int idx;
> @@ -87,14 +95,12 @@ struct sbefifo_client {
> =C2=A0	unsigned long f_flags;
> =C2=A0};
> =C2=A0
> -static struct list_head sbefifo_fifos;
> -

It's not clear to me why this is being removed. Which one of the bullets in=
 the
commit message accounts for this?

> =C2=A0static DEFINE_IDA(sbefifo_ida);
> =C2=A0
> =C2=A0static int sbefifo_inw(struct sbefifo *sbefifo, int reg, u32 *word)
> =C2=A0{
> =C2=A0	int rc;
> -	u32 raw_word;
> +	__be32 raw_word;
> =C2=A0
> =C2=A0	rc =3D fsi_device_read(sbefifo->fsi_dev, reg, &raw_word,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sizeof(raw_word));
> @@ -102,17 +108,19 @@ static int sbefifo_inw(struct sbefifo *sbefifo, int=
 reg, u32 *word)
> =C2=A0		return rc;
> =C2=A0
> =C2=A0	*word =3D be32_to_cpu(raw_word);
> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int sbefifo_outw(struct sbefifo *sbefifo, int reg, u32 word)
> =C2=A0{
> -	u32 raw_word =3D cpu_to_be32(word);
> +	__be32 raw_word =3D cpu_to_be32(word);
> =C2=A0
> =C2=A0	return fsi_device_write(sbefifo->fsi_dev, reg, &raw_word,
> =C2=A0				sizeof(raw_word));
> =C2=A0}
> =C2=A0
> +/* Don't flip endianness of data to/from FIFO, just pass through. */
> =C2=A0static int sbefifo_readw(struct sbefifo *sbefifo, u32 *word)
> =C2=A0{
> =C2=A0	return fsi_device_read(sbefifo->fsi_dev, SBEFIFO_DWN, word,
> @@ -136,7 +144,7 @@ static int sbefifo_ack_eot(struct sbefifo *sbefifo)
> =C2=A0		return ret;
> =C2=A0
> =C2=A0	return sbefifo_outw(sbefifo, SBEFIFO_DWN | SBEFIFO_EOT_ACK,
> -			SBEFIFO_EOT_MAGIC);
> +			=C2=A0=C2=A0=C2=A0=C2=A0SBEFIFO_EOT_MAGIC);
> =C2=A0}
> =C2=A0
> =C2=A0static size_t sbefifo_dev_nwreadable(u32 sts)
> @@ -210,6 +218,7 @@ static bool sbefifo_buf_readnb(struct sbefifo_buf *bu=
f, size_t n)
> =C2=A0		rpos =3D buf->buf;
> =C2=A0
> =C2=A0	WRITE_ONCE(buf->rpos, rpos);
> +
> =C2=A0	return rpos =3D=3D wpos;
> =C2=A0}
> =C2=A0
> @@ -229,14 +238,14 @@ static bool sbefifo_buf_wrotenb(struct sbefifo_buf =
*buf, size_t n)
> =C2=A0		set_bit(SBEFIFO_BUF_FULL, &buf->flags);
> =C2=A0
> =C2=A0	WRITE_ONCE(buf->wpos, wpos);
> +
> =C2=A0	return rpos =3D=3D wpos;
> =C2=A0}
> =C2=A0
> =C2=A0static void sbefifo_free(struct kref *kref)
> =C2=A0{
> -	struct sbefifo *sbefifo;
> +	struct sbefifo *sbefifo =3D container_of(kref, struct sbefifo, kref);
> =C2=A0
> -	sbefifo =3D container_of(kref, struct sbefifo, kref);
> =C2=A0	kfree(sbefifo);
> =C2=A0}
> =C2=A0
> @@ -255,9 +264,12 @@ static struct sbefifo_xfr *sbefifo_enq_xfr(struct sb=
efifo_client *client)
> =C2=A0	struct sbefifo *sbefifo =3D client->dev;
> =C2=A0	struct sbefifo_xfr *xfr;
> =C2=A0
> +	if (READ_ONCE(sbefifo->rc))

What semantics are we trying to enforce with READ_ONCE()?

> +		return ERR_PTR(sbefifo->rc);

This will possibly read sbefifo->rc again?

> +
> =C2=A0	xfr =3D kzalloc(sizeof(*xfr), GFP_KERNEL);
> =C2=A0	if (!xfr)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
> =C2=A0
> =C2=A0	xfr->rbuf =3D &client->rbuf;
> =C2=A0	xfr->wbuf =3D &client->wbuf;
> @@ -267,21 +279,12 @@ static struct sbefifo_xfr *sbefifo_enq_xfr(struct s=
befifo_client *client)
> =C2=A0	return xfr;
> =C2=A0}
> =C2=A0
> -static struct sbefifo_xfr *sbefifo_client_next_xfr(
> -		struct sbefifo_client *client)
> -{
> -	if (list_empty(&client->xfrs))
> -		return NULL;
> -
> -	return container_of(client->xfrs.next, struct sbefifo_xfr,
> -			client);
> -}
> -
> =C2=A0static bool sbefifo_xfr_rsp_pending(struct sbefifo_client *client)
> =C2=A0{
> -	struct sbefifo_xfr *xfr;
> +	struct sbefifo_xfr *xfr =3D list_first_entry_or_null(&client->xfrs,
> +							=C2=A0=C2=A0=C2=A0struct sbefifo_xfr,
> +							=C2=A0=C2=A0=C2=A0client);
> =C2=A0
> -	xfr =3D sbefifo_client_next_xfr(client);
> =C2=A0	if (xfr && test_bit(SBEFIFO_XFR_RESP_PENDING, &xfr->flags))
> =C2=A0		return true;
> =C2=A0
> @@ -309,10 +312,11 @@ static struct sbefifo_client *sbefifo_new_client(st=
ruct sbefifo *sbefifo)
> =C2=A0
> =C2=A0static void sbefifo_client_release(struct kref *kref)
> =C2=A0{
> -	struct sbefifo_client *client;
> =C2=A0	struct sbefifo_xfr *xfr;
> +	struct sbefifo_client *client =3D container_of(kref,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sbefifo_client,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kref);
> =C2=A0
> -	client =3D container_of(kref, struct sbefifo_client, kref);

Why did we move to assigning this in the declaration? It looks better this =
way,
and it's not as if the pointer itself is const.

> =C2=A0	list_for_each_entry(xfr, &client->xfrs, client) {
> =C2=A0		/*
> =C2=A0		=C2=A0* The client left with pending or running xfrs.
> @@ -349,6 +353,7 @@ static struct sbefifo_xfr *sbefifo_next_xfr(struct sb=
efifo *sbefifo)
> =C2=A0			kfree(xfr);
> =C2=A0			continue;
> =C2=A0		}
> +
> =C2=A0		return xfr;
> =C2=A0	}
> =C2=A0
> @@ -370,7 +375,7 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0
> =C2=A0	spin_lock(&sbefifo->lock);
> =C2=A0	xfr =3D list_first_entry_or_null(&sbefifo->xfrs, struct sbefifo_xf=
r,
> -			xfrs);
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0xfrs);
> =C2=A0	if (!xfr)
> =C2=A0		goto out_unlock;
> =C2=A0
> @@ -388,8 +393,7 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0
> =C2=A0	=C2=A0/* Drain the write buffer. */
> =C2=A0	while ((bufn =3D sbefifo_buf_nbreadable(wbuf))) {
> -		ret =3D sbefifo_inw(sbefifo, SBEFIFO_UP | SBEFIFO_STS,
> -				&sts);
> +		ret =3D sbefifo_inw(sbefifo, SBEFIFO_UP | SBEFIFO_STS, &sts);
> =C2=A0		if (ret)
> =C2=A0			goto out;
> =C2=A0
> @@ -397,7 +401,7 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0		if (devn =3D=3D 0) {
> =C2=A0			/* No open slot for write.=C2=A0=C2=A0Reschedule. */
> =C2=A0			sbefifo->poll_timer.expires =3D jiffies +
> -				msecs_to_jiffies(500);
> +				SBEFIFO_RESCHEDULE;
> =C2=A0			add_timer(&sbefifo->poll_timer);

Not really a comment relevant for the patch and I don't know much about the
operations of the SBEFIFO, but using a timer for slot management feels odd.

However, I think this is covered by the comment in probe about the silicon
lacking interrupts. Ugh.

> =C2=A0			goto out_unlock;
> =C2=A0		}
> @@ -414,9 +418,8 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0
> =C2=A0	=C2=A0/* Send EOT if the writer is finished. */
> =C2=A0	if (test_and_clear_bit(SBEFIFO_XFR_WRITE_DONE, &xfr->flags)) {
> -		ret =3D sbefifo_outw(sbefifo,
> -				SBEFIFO_UP | SBEFIFO_EOT_RAISE,
> -				SBEFIFO_EOT_MAGIC);
> +		ret =3D sbefifo_outw(sbefifo, SBEFIFO_UP | SBEFIFO_EOT_RAISE,
> +				=C2=A0=C2=A0=C2=A0SBEFIFO_EOT_MAGIC);
> =C2=A0		if (ret)
> =C2=A0			goto out;
> =C2=A0
> @@ -438,7 +441,7 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0		if (devn =3D=3D 0) {
> =C2=A0			/* No data yet.=C2=A0=C2=A0Reschedule. */
> =C2=A0			sbefifo->poll_timer.expires =3D jiffies +
> -				msecs_to_jiffies(500);
> +				SBEFIFO_RESCHEDULE;
> =C2=A0			add_timer(&sbefifo->poll_timer);
> =C2=A0			goto out_unlock;
> =C2=A0		}
> @@ -466,7 +469,7 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0			set_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags);
> =C2=A0			list_del(&xfr->xfrs);
> =C2=A0			if (unlikely(test_bit(SBEFIFO_XFR_CANCEL,
> -							&xfr->flags)))
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&xfr->flags)))
> =C2=A0				kfree(xfr);
> =C2=A0			break;
> =C2=A0		}
> @@ -476,7 +479,7 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0	if (unlikely(ret)) {
> =C2=A0		sbefifo->rc =3D ret;
> =C2=A0		dev_err(&sbefifo->fsi_dev->dev,
> -				"Fatal bus access failure: %d\n", ret);
> +			"Fatal bus access failure: %d\n", ret);
> =C2=A0		list_for_each_entry(xfr, &sbefifo->xfrs, xfrs)
> =C2=A0			kfree(xfr);
> =C2=A0		INIT_LIST_HEAD(&sbefifo->xfrs);
> @@ -497,7 +500,7 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0static int sbefifo_open(struct inode *inode, struct file *file)
> =C2=A0{
> =C2=A0	struct sbefifo *sbefifo =3D container_of(file->private_data,
> -			struct sbefifo, mdev);
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sbefifo, mdev);
> =C2=A0	struct sbefifo_client *client;
> =C2=A0	int ret;
> =C2=A0
> @@ -535,6 +538,19 @@ static unsigned int sbefifo_poll(struct file *file, =
poll_table *wait)
> =C2=A0	return mask;
> =C2=A0}
> =C2=A0
> +static bool sbefifo_read_ready(struct sbefifo *sbefifo,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sbefifo_client *clie=
nt, size_t *n)
> +{
> +	struct sbefifo_xfr *xfr =3D list_first_entry_or_null(&client->xfrs,
> +							=C2=A0=C2=A0=C2=A0struct sbefifo_xfr,
> +							=C2=A0=C2=A0=C2=A0client);
> +
> +	*n =3D sbefifo_buf_nbreadable(&client->rbuf);
> +
> +	return READ_ONCE(sbefifo->rc) || *n ||
> +		(xfr && test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags));
> +}
> +
> =C2=A0static ssize_t sbefifo_read_common(struct sbefifo_client *client,
> =C2=A0				=C2=A0=C2=A0=C2=A0char __user *ubuf, char *kbuf, size_t len)
> =C2=A0{
> @@ -551,30 +567,38 @@ static ssize_t sbefifo_read_common(struct sbefifo_c=
lient *client,
> =C2=A0
> =C2=A0	sbefifo_get_client(client);
> =C2=A0	if (wait_event_interruptible(sbefifo->wait,
> -				(ret =3D READ_ONCE(sbefifo->rc)) ||
> -				(n =3D sbefifo_buf_nbreadable(
> -						&client->rbuf)))) {
> -		sbefifo_put_client(client);
> -		return -ERESTARTSYS;
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sbefifo_read_ready(sbefifo, client,
> +							&n))) {
> +		ret =3D -ERESTARTSYS;
> +		goto out;
> =C2=A0	}
> +
> +	ret =3D READ_ONCE(sbefifo->rc);
> =C2=A0	if (ret) {
> =C2=A0		INIT_LIST_HEAD(&client->xfrs);
> -		sbefifo_put_client(client);
> -		return ret;
> +		goto out;
> =C2=A0	}
> =C2=A0
> =C2=A0	n =3D min_t(size_t, n, len);
> =C2=A0
> =C2=A0	if (ubuf) {
> =C2=A0		if (copy_to_user(ubuf, READ_ONCE(client->rbuf.rpos), n)) {
> -			sbefifo_put_client(client);
> -			return -EFAULT;
> +			ret =3D -EFAULT;
> +			goto out;
> =C2=A0		}
> -	} else
> +	} else {
> =C2=A0		memcpy(kbuf, READ_ONCE(client->rbuf.rpos), n);
> +	}
> =C2=A0
> =C2=A0	if (sbefifo_buf_readnb(&client->rbuf, n)) {
> -		xfr =3D sbefifo_client_next_xfr(client);
> +		xfr =3D list_first_entry_or_null(&client->xfrs,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sbefifo_xfr, clien=
t);
> +		if (!xfr) {
> +			/* should be impossible to not have an xfr here */

Maybe you want a `if (WARN_ON(!xfr)) {` here?

> +			wake_up(&sbefifo->wait);
> +			goto out;
> +		}
> +
> =C2=A0		if (!test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags)) {
> =C2=A0			/*
> =C2=A0			=C2=A0* Fill the read buffer back up.
> @@ -589,22 +613,31 @@ static ssize_t sbefifo_read_common(struct sbefifo_c=
lient *client,
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	sbefifo_put_client(client);
> +	ret =3D n;
> =C2=A0
> -	return n;
> +out:
> +	sbefifo_put_client(client);
> +	return ret;
> =C2=A0}
> =C2=A0
> -static ssize_t sbefifo_read(struct file *file, char __user *buf,
> -		size_t len, loff_t *offset)
> +static ssize_t sbefifo_read(struct file *file, char __user *buf, size_t =
len,
> +			=C2=A0=C2=A0=C2=A0=C2=A0loff_t *offset)
> =C2=A0{
> =C2=A0	struct sbefifo_client *client =3D file->private_data;
> =C2=A0
> -	WARN_ON(*offset);
> +	return sbefifo_read_common(client, buf, NULL, len);
> +}
> =C2=A0
> -	if (!access_ok(VERIFY_WRITE, buf, len))
> -		return -EFAULT;
> +static bool sbefifo_write_ready(struct sbefifo *sbefifo,
> +				struct sbefifo_xfr *xfr,
> +				struct sbefifo_client *client, size_t *n)
> +{
> +	struct sbefifo_xfr *next =3D list_first_entry_or_null(&client->xfrs,
> +							=C2=A0=C2=A0=C2=A0=C2=A0struct sbefifo_xfr,
> +							=C2=A0=C2=A0=C2=A0=C2=A0client);
> =C2=A0
> -	return sbefifo_read_common(client, buf, NULL, len);
> +	*n =3D sbefifo_buf_nbwriteable(&client->wbuf);
> +	return READ_ONCE(sbefifo->rc) || (next =3D=3D xfr && *n);
> =C2=A0}
> =C2=A0
> =C2=A0static ssize_t sbefifo_write_common(struct sbefifo_client *client,
> @@ -612,6 +645,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_cl=
ient *client,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0size_t len)
> =C2=A0{
> =C2=A0	struct sbefifo *sbefifo =3D client->dev;
> +	struct sbefifo_buf *wbuf =3D &client->wbuf;
> =C2=A0	struct sbefifo_xfr *xfr;
> =C2=A0	ssize_t ret =3D 0;
> =C2=A0	size_t n;
> @@ -622,24 +656,26 @@ static ssize_t sbefifo_write_common(struct sbefifo_=
client *client,
> =C2=A0	if (!len)
> =C2=A0		return 0;
> =C2=A0
> -	n =3D sbefifo_buf_nbwriteable(&client->wbuf);
> +	sbefifo_get_client(client);
> +	n =3D sbefifo_buf_nbwriteable(wbuf);
> =C2=A0
> =C2=A0	spin_lock_irq(&sbefifo->lock);
> -	xfr =3D sbefifo_next_xfr(sbefifo);
> =C2=A0
> +	xfr =3D sbefifo_next_xfr(sbefifo);	/* next xfr to be executed */
> =C2=A0	if ((client->f_flags & O_NONBLOCK) && xfr && n < len) {
> =C2=A0		spin_unlock_irq(&sbefifo->lock);
> -		return -EAGAIN;
> +		ret =3D -EAGAIN;
> +		goto out;
> =C2=A0	}
> =C2=A0
> -	xfr =3D sbefifo_enq_xfr(client);
> -	if (!xfr) {
> +	xfr =3D sbefifo_enq_xfr(client);		/* this xfr queued up */
> +	if (IS_ERR(xfr)) {
> =C2=A0		spin_unlock_irq(&sbefifo->lock);
> -		return -ENOMEM;
> +		ret =3D PTR_ERR(xfr);
> +		goto out;
> =C2=A0	}
> -	spin_unlock_irq(&sbefifo->lock);
> =C2=A0
> -	sbefifo_get_client(client);
> +	spin_unlock_irq(&sbefifo->lock);
> =C2=A0
> =C2=A0	/*
> =C2=A0	=C2=A0* Partial writes are not really allowed in that EOT is sent =
exactly
> @@ -647,49 +683,47 @@ static ssize_t sbefifo_write_common(struct sbefifo_=
client *client,
> =C2=A0	=C2=A0*/
> =C2=A0	while (len) {
> =C2=A0		if (wait_event_interruptible(sbefifo->wait,
> -				READ_ONCE(sbefifo->rc) ||
> -					(sbefifo_client_next_xfr(client) =3D=3D xfr &&
> -					=C2=A0(n =3D sbefifo_buf_nbwriteable(
> -							&client->wbuf))))) {
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sbefifo_write_ready(sbefifo, xfr,
> +								=C2=A0client,
> +								=C2=A0&n))) {
> =C2=A0			set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
> =C2=A0			sbefifo_get(sbefifo);
> =C2=A0			if (mod_timer(&sbefifo->poll_timer, jiffies))
> =C2=A0				sbefifo_put(sbefifo);
> -
> -			sbefifo_put_client(client);
> -			return -ERESTARTSYS;
> +			ret =3D -ERESTARTSYS;
> +			goto out;
> =C2=A0		}
> -		if (sbefifo->rc) {
> +
> +		ret =3D READ_ONCE(sbefifo->rc);
> +		if (ret) {
> =C2=A0			INIT_LIST_HEAD(&client->xfrs);
> -			sbefifo_put_client(client);
> -			return sbefifo->rc;
> +			goto out;
> =C2=A0		}
> =C2=A0
> =C2=A0		n =3D min_t(size_t, n, len);
> =C2=A0
> =C2=A0		if (ubuf) {
> -			if (copy_from_user(READ_ONCE(client->wbuf.wpos), ubuf,
> -			=C2=A0=C2=A0=C2=A0=C2=A0n)) {
> +			if (copy_from_user(READ_ONCE(wbuf->wpos), ubuf, n)) {
> =C2=A0				set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
> =C2=A0				sbefifo_get(sbefifo);
> =C2=A0				if (mod_timer(&sbefifo->poll_timer, jiffies))
> =C2=A0					sbefifo_put(sbefifo);
> -				sbefifo_put_client(client);
> -				return -EFAULT;
> +				ret =3D -EFAULT;
> +				goto out;
> =C2=A0			}
> =C2=A0
> =C2=A0			ubuf +=3D n;
> =C2=A0		} else {
> -			memcpy(READ_ONCE(client->wbuf.wpos), kbuf, n);
> +			memcpy(READ_ONCE(wbuf->wpos), kbuf, n);
> =C2=A0			kbuf +=3D n;
> =C2=A0		}
> =C2=A0
> -		sbefifo_buf_wrotenb(&client->wbuf, n);
> +		sbefifo_buf_wrotenb(wbuf, n);
> =C2=A0		len -=3D n;
> =C2=A0		ret +=3D n;
> =C2=A0
> -		/* set flag before starting the worker, as it may run through
> -		=C2=A0* and check the flag before we exit this loop!
> +		/* Set this before starting timer to avoid race condition on
> +		=C2=A0* this flag with the timer function writer.
> =C2=A0		=C2=A0*/
> =C2=A0		if (!len)
> =C2=A0			set_bit(SBEFIFO_XFR_WRITE_DONE, &xfr->flags);
> @@ -702,21 +736,16 @@ static ssize_t sbefifo_write_common(struct sbefifo_=
client *client,
> =C2=A0			sbefifo_put(sbefifo);
> =C2=A0	}
> =C2=A0
> +out:
> =C2=A0	sbefifo_put_client(client);
> -
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> =C2=A0static ssize_t sbefifo_write(struct file *file, const char __user *=
buf,
> -		size_t len, loff_t *offset)
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0size_t len, loff_t *offset)
> =C2=A0{
> =C2=A0	struct sbefifo_client *client =3D file->private_data;
> =C2=A0
> -	WARN_ON(*offset);
> -
> -	if (!access_ok(VERIFY_READ, buf, len))
> -		return -EFAULT;
> -
> =C2=A0	return sbefifo_write_common(client, buf, NULL, len);
> =C2=A0}
> =C2=A0
> @@ -742,18 +771,15 @@ static int sbefifo_release(struct inode *inode, str=
uct file *file)
> =C2=A0struct sbefifo_client *sbefifo_drv_open(struct device *dev,
> =C2=A0					unsigned long flags)
> =C2=A0{
> -	struct sbefifo_client *client =3D NULL;
> -	struct sbefifo *sbefifo;
> -	struct fsi_device *fsi_dev =3D to_fsi_dev(dev);
> +	struct sbefifo_client *client;
> +	struct sbefifo *sbefifo =3D dev_get_drvdata(dev);
> =C2=A0
> -	list_for_each_entry(sbefifo, &sbefifo_fifos, link) {
> -		if (sbefifo->fsi_dev !=3D fsi_dev)
> -			continue;
> +	if (!sbefifo)
> +		return NULL;
> =C2=A0
> -		client =3D sbefifo_new_client(sbefifo);
> -		if (client)
> -			client->f_flags =3D flags;
> -	}
> +	client =3D sbefifo_new_client(sbefifo);
> +	if (client)
> +		client->f_flags =3D flags;
> =C2=A0
> =C2=A0	return client;
> =C2=A0}
> @@ -802,95 +828,92 @@ static int sbefifo_probe(struct device *dev)
> =C2=A0	u32 sts;
> =C2=A0	int ret, child_idx =3D 0;
> =C2=A0
> -	dev_dbg(dev, "Found sbefifo device\n");
> =C2=A0	sbefifo =3D kzalloc(sizeof(*sbefifo), GFP_KERNEL);
> =C2=A0	if (!sbefifo)
> =C2=A0		return -ENOMEM;
> =C2=A0
> =C2=A0	sbefifo->fsi_dev =3D fsi_dev;
> =C2=A0
> -	ret =3D sbefifo_inw(sbefifo,
> -			SBEFIFO_UP | SBEFIFO_STS, &sts);
> +	ret =3D sbefifo_inw(sbefifo, SBEFIFO_UP | SBEFIFO_STS, &sts);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> +
> =C2=A0	if (!(sts & SBEFIFO_EMPTY)) {
> -		dev_err(&sbefifo->fsi_dev->dev,
> -				"Found data in upstream fifo\n");
> +		dev_err(dev, "Found data in upstream fifo\n");
> =C2=A0		return -EIO;
> =C2=A0	}
> =C2=A0
> =C2=A0	ret =3D sbefifo_inw(sbefifo, SBEFIFO_DWN | SBEFIFO_STS, &sts);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> +
> =C2=A0	if (!(sts & SBEFIFO_EMPTY)) {
> -		dev_err(&sbefifo->fsi_dev->dev,
> -				"Found data in downstream fifo\n");
> +		dev_err(dev, "found data in downstream fifo\n");
> =C2=A0		return -EIO;
> =C2=A0	}
> =C2=A0
> -	sbefifo->mdev.minor =3D MISC_DYNAMIC_MINOR;
> -	sbefifo->mdev.fops =3D &sbefifo_fops;
> -	sbefifo->mdev.name =3D sbefifo->name;
> -	sbefifo->mdev.parent =3D dev;
> =C2=A0	spin_lock_init(&sbefifo->lock);
> =C2=A0	kref_init(&sbefifo->kref);
> +	init_waitqueue_head(&sbefifo->wait);
> +	INIT_LIST_HEAD(&sbefifo->xfrs);
> =C2=A0
> =C2=A0	sbefifo->idx =3D ida_simple_get(&sbefifo_ida, 1, INT_MAX, GFP_KERN=
EL);
> =C2=A0	snprintf(sbefifo->name, sizeof(sbefifo->name), "sbefifo%d",
> -			sbefifo->idx);
> -	init_waitqueue_head(&sbefifo->wait);
> -	INIT_LIST_HEAD(&sbefifo->xfrs);
> +		=C2=A0sbefifo->idx);
> =C2=A0
> =C2=A0	/* This bit of silicon doesn't offer any interrupts... */
> =C2=A0	setup_timer(&sbefifo->poll_timer, sbefifo_poll_timer,
> -			(unsigned long)sbefifo);
> -
> -	if (dev->of_node) {
> -		/* create platform devs for dts child nodes (occ, etc) */
> -		for_each_child_of_node(dev->of_node, np) {
> -			snprintf(child_name, sizeof(child_name), "%s-dev%d",
> -				=C2=A0sbefifo->name, child_idx++);
> -			child =3D of_platform_device_create(np, child_name, dev);
> -			if (!child)
> -				dev_warn(&sbefifo->fsi_dev->dev,
> -					=C2=A0"failed to create child node dev\n");
> -		}
> +		=C2=A0=C2=A0=C2=A0=C2=A0(unsigned long)sbefifo);
> +
> +	sbefifo->mdev.minor =3D MISC_DYNAMIC_MINOR;
> +	sbefifo->mdev.fops =3D &sbefifo_fops;
> +	sbefifo->mdev.name =3D sbefifo->name;
> +	sbefifo->mdev.parent =3D dev;
> +	ret =3D misc_register(&sbefifo->mdev);
> +	if (ret) {
> +		dev_err(dev, "failed to register miscdevice: %d\n", ret);
> +		ida_simple_remove(&sbefifo_ida, sbefifo->idx);
> +		sbefifo_put(sbefifo);
> +		return ret;
> +	}
> +
> +	/* create platform devs for dts child nodes (occ, etc) */
> +	for_each_available_child_of_node(dev->of_node, np) {
> +		snprintf(child_name, sizeof(child_name), "%s-dev%d",
> +			=C2=A0sbefifo->name, child_idx++);
> +		child =3D of_platform_device_create(np, child_name, dev);
> +		if (!child)
> +			dev_warn(dev, "failed to create child %s dev\n",
> +				=C2=A0child_name);
> =C2=A0	}
> =C2=A0
> -	list_add(&sbefifo->link, &sbefifo_fifos);
> -=09
> -	return misc_register(&sbefifo->mdev);
> +	dev_set_drvdata(dev, sbefifo);
> +
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int sbefifo_remove(struct device *dev)
> =C2=A0{
> -	struct fsi_device *fsi_dev =3D to_fsi_dev(dev);
> -	struct sbefifo *sbefifo, *sbefifo_tmp;
> +	struct sbefifo *sbefifo =3D dev_get_drvdata(dev);
> =C2=A0	struct sbefifo_xfr *xfr;
> =C2=A0
> -	list_for_each_entry_safe(sbefifo, sbefifo_tmp, &sbefifo_fifos, link) {
> -		if (sbefifo->fsi_dev !=3D fsi_dev)
> -			continue;
> -
> -		device_for_each_child(dev, NULL, sbefifo_unregister_child);
> +	WRITE_ONCE(sbefifo->rc, -ENODEV);
> +	wake_up(&sbefifo->wait);
> =C2=A0
> -		misc_deregister(&sbefifo->mdev);
> -		list_del(&sbefifo->link);
> -		ida_simple_remove(&sbefifo_ida, sbefifo->idx);
> +	misc_deregister(&sbefifo->mdev);
> +	device_for_each_child(dev, NULL, sbefifo_unregister_child);
> =C2=A0
> -		if (del_timer_sync(&sbefifo->poll_timer))
> -			sbefifo_put(sbefifo);
> +	ida_simple_remove(&sbefifo_ida, sbefifo->idx);
> =C2=A0
> -		spin_lock(&sbefifo->lock);
> -		list_for_each_entry(xfr, &sbefifo->xfrs, xfrs)
> -			kfree(xfr);
> -		spin_unlock(&sbefifo->lock);
> +	if (del_timer_sync(&sbefifo->poll_timer))
> +		sbefifo_put(sbefifo);
> =C2=A0
> -		WRITE_ONCE(sbefifo->rc, -ENODEV);
> +	spin_lock(&sbefifo->lock);
> +	list_for_each_entry(xfr, &sbefifo->xfrs, xfrs)
> +		kfree(xfr);
> +	spin_unlock(&sbefifo->lock);

Do we actually need to lock on this? Shouldn't we have torn down anything t=
hat
might be concurrently accessing ->xfrs?

> =C2=A0
> -		wake_up(&sbefifo->wait);
> -		sbefifo_put(sbefifo);
> -	}
> +	sbefifo_put(sbefifo);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -915,17 +938,19 @@ static int sbefifo_remove(struct device *dev)
> =C2=A0
> =C2=A0static int sbefifo_init(void)
> =C2=A0{
> -	INIT_LIST_HEAD(&sbefifo_fifos);
> =C2=A0	return fsi_driver_register(&sbefifo_drv);
> =C2=A0}
> =C2=A0
> =C2=A0static void sbefifo_exit(void)
> =C2=A0{
> =C2=A0	fsi_driver_unregister(&sbefifo_drv);
> +
> +	ida_destroy(&sbefifo_ida);
> =C2=A0}
> =C2=A0
> =C2=A0module_init(sbefifo_init);
> =C2=A0module_exit(sbefifo_exit);
> =C2=A0MODULE_LICENSE("GPL");
> =C2=A0MODULE_AUTHOR("Brad Bishop <bradleyb@fuzziesquirrel.com>");
> -MODULE_DESCRIPTION("Linux device interface to the POWER self boot engine=
");
> +MODULE_AUTHOR("Eddie James <eajames@linux.vnet.ibm.com>");
> +MODULE_DESCRIPTION("Linux device interface to the POWER Self Boot Engine=
");
> diff --git a/include/linux/fsi-sbefifo.h b/include/linux/fsi-sbefifo.h
> index 1b46c63..8e55891 100644
> --- a/include/linux/fsi-sbefifo.h
> +++ b/include/linux/fsi-sbefifo.h
> @@ -13,8 +13,8 @@
> =C2=A0 * GNU General Public License for more details.
> =C2=A0 */
> =C2=A0
> -#ifndef __FSI_SBEFIFO_H__
> -#define __FSI_SBEFIFO_H__
> +#ifndef LINUX_FSI_SBEFIFO_H
> +#define LINUX_FSI_SBEFIFO_H
> =C2=A0
> =C2=A0struct device;
> =C2=A0struct sbefifo_client;
> @@ -27,4 +27,4 @@ extern int sbefifo_drv_write(struct sbefifo_client *cli=
ent, const char *buf,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0size_t len);
> =C2=A0extern void sbefifo_drv_release(struct sbefifo_client *client);
> =C2=A0
> -#endif /* __FSI_SBEFIFO_H__ */
> +#endif /* LINUX_FSI_SBEFIFO_H */

Cheers,

Andrew
--=-JlP3dEvGs2yh95Rrf4iH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZyIyrAAoJEJ0dnzgO5LT5EYoP+QFtetdR7DN3NBK5oxC0oYDk
Ahv6xhzW/pMZHtCEG+guWtvDRCO1VoKNNCY6jzWozS4nMuVQa/aW27IsfZJRNIqw
jEtFJF3Hs3coeuzirANzmOWhKyJWXPL9er2hcOZN/FoGd3Z0FAAKw+/5rqNxrXX4
RvxS8Gq0sC1qO2X/uVV/3gWPZgmwPJTgnEI/rVqAZChroKdk7lhy52zpmgvjBkKI
KDra7h9efd1pusfNiBu2bT7HiPHAs/cJHWgSdHIhS97xjb7eqRQDdrREyVavf5jp
EkKOWzqx1Sx4Ldd6cQ4WXqOALrnv0/wEwfAnaAFHzP+/n2qSoSBsdDEDg66D61gr
PN1ZHxXmm4wM/lhCyENKiwIFQXjhrZrIekx7aA1gstFEEt7eNRfnsGn+MaCyIFMC
6vRXv6hPQv8KG19NMU6Lp1XuE76axixBilQbtG9xhcixB3zWcPwE83y+cKZff63k
h+2IN4uHSurFJGhpo19Ug+7TcJr4Yzd/KXwX8y2qkp6ct479L0GpYPNHZRLX3HaQ
vNKZGwn5OuSZyHrBGhQTTrT474Cyqq4mBh5Tcr/ChY0Lb16K5SnikuGYrO9BkJ7h
ff2Vd10wRJuCaqyK52wDkk+Lvs+Dj5pdg76NNAGaJ0kElwxcKj04hwFQ6NFx2Znn
G+n5wwwsllpgNBoBCnt0
=b8yC
-----END PGP SIGNATURE-----

--=-JlP3dEvGs2yh95Rrf4iH--
