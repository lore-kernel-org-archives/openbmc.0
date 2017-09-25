Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="NugFZ+td"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="m3nEc9n/"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y0vCG625yzDr4N
 for <openbmc@lists.ozlabs.org>; Mon, 25 Sep 2017 16:22:50 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A80A320DE3;
 Mon, 25 Sep 2017 02:22:48 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 25 Sep 2017 02:22:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=OEs5Yl/a8EqE/P9FDOaEZQ449/m0Q5mCYLHSRsdqm
 hE=; b=NugFZ+tdt+ANEAi1k8Aqm7Hb/Hs+e+EllnD3moXWpc3WUudFgJcrFUwuO
 06wWGWGXja4sJjoH8A/4wzxeIl2rvzTpATFsz+Xhe/vAU/UNTXbvp1ykaH4aE0je
 eBSgSjqIpl/SPiHZx9WD8WT2HZpvqpWkUBGo72ZA8D8DWWCX9dzZ0R/6Y36Cn+gV
 5M5MsPVkhbeXLKfeRTjZEC+ilozWc11Gle13VjnclSN7skTIYv6+fthF7fTe5yKy
 CqT6h2/kv7L6y0GWvAhifT6CDDKBhj/C/jxOejc/itEwS9Q3GOkLZGYoIHa5CgeQ
 KUKBDfn6+vmdD8IC4GFNW45PsckNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=OEs5Yl/a8EqE/P9FDO
 aEZQ449/m0Q5mCYLHSRsdqmhE=; b=m3nEc9n/MYcymZEq5cpKJWvsm79EAYJ67X
 MaKVgknDQ3UYzAFkjRDvr29NuzakMfn83JIXgkW3ns+bKMc6gFs3dXNUN24igVzT
 FW3Fy7p1GPDmRFXnCeylqPnuNQ0lHS/+YJnRhNJ1sFMchxupcWPxiTbMBacJR/G0
 kJGzy31UzwnybUTAbCxb2eQWfZPRoE2cOjRAkcPZqsmfO9QBDS275jMx3aQ0mi9S
 hqR3aaoNPLPLznObVqNy/nbL33sMNvzimnHTH5s1NkaqYhPYtXsGl6Db1dWhQFnC
 voV/P27zaClf6uyjrg9+yix5iJFe12DlwJSwwa3FKWj4rotkqhiQ==
X-ME-Sender: <xms:uKDIWSRZf2-9i1KPqbQSFxsd2BUjJmjRd0DjubaD0ChGoVrh8s8C1A>
X-Sasl-enc: SnkLMY5IGP3eJwwtOg/KiAgsGobrxg/+o9s4ZdgCbPh0 1506320567
Received: from keelia16 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 84CB024335;
 Mon, 25 Sep 2017 02:22:46 -0400 (EDT)
Message-ID: <1506320562.30138.24.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 2/3] drivers/fsi/occ: refactor to
 upstream list state
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Mon, 25 Sep 2017 15:52:42 +0930
In-Reply-To: <1506033838-2078-3-git-send-email-eajames@linux.vnet.ibm.com>
References: <1506033838-2078-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1506033838-2078-3-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-L0nG2BAT09d4i0AM4UdG"
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
X-List-Received-Date: Mon, 25 Sep 2017 06:22:51 -0000


--=-L0nG2BAT09d4i0AM4UdG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-21 at 17:43 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Includes various fixes:
> =C2=A0- Fix probe failure scenario
> =C2=A0- General cleanup
> =C2=A0- Reorder remove() operations for safety
> =C2=A0- Add cancel boolean to prevent further xfrs when we're removing

See comment on previous patch about these bullet points.

>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/fsi/occ.c=C2=A0=C2=A0=C2=A0| 227 ++++++++++++++++++++++++++=
++++++--------------------
> =C2=A0include/linux/occ.h |=C2=A0=C2=A020 ++++-
> =C2=A02 files changed, 155 insertions(+), 92 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index 621fbf0..4dd5048 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -10,16 +10,22 @@
> =C2=A0#include <asm/unaligned.h>
> =C2=A0#include <linux/device.h>
> =C2=A0#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/fs.h>
> =C2=A0#include <linux/fsi-sbefifo.h>
> -#include <linux/init.h>
> +#include <linux/idr.h>
> =C2=A0#include <linux/kernel.h>
> +#include <linux/list.h>
> =C2=A0#include <linux/miscdevice.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/mutex.h>
> +#include <linux/occ.h>
> =C2=A0#include <linux/of.h>
> =C2=A0#include <linux/of_platform.h>
> =C2=A0#include <linux/platform_device.h>
> +#include <linux/sched.h>
> =C2=A0#include <linux/slab.h>
> +#include <linux/spinlock.h>
> =C2=A0#include <linux/uaccess.h>
> =C2=A0#include <linux/wait.h>
> =C2=A0#include <linux/workqueue.h>
> @@ -28,49 +34,45 @@
> =C2=A0#define OCC_CMD_DATA_BYTES	4090
> =C2=A0#define OCC_RESP_DATA_BYTES	4089
> =C2=A0
> +#define OCC_TIMEOUT_MS		1000
> +#define OCC_CMD_IN_PRG_WAIT_MS	50
> +
> =C2=A0struct occ {
> =C2=A0	struct device *sbefifo;
> =C2=A0	char name[32];
> =C2=A0	int idx;
> =C2=A0	struct miscdevice mdev;
> =C2=A0	struct list_head xfrs;
> -	spinlock_t list_lock;
> -	struct mutex occ_lock;
> +	spinlock_t list_lock;		/* lock access to the xfrs list */
> +	struct mutex occ_lock;		/* lock access to the hardware */
> =C2=A0	struct work_struct work;
> +	bool cancel;

Should this be atomic?

> =C2=A0};
> =C2=A0
> =C2=A0#define to_occ(x)	container_of((x), struct occ, mdev)
> =C2=A0
> -struct occ_command {
> -	u8 seq_no;
> -	u8 cmd_type;
> -	u16 data_length;
> -	u8 data[OCC_CMD_DATA_BYTES];
> -	u16 checksum;
> -} __packed;
> -
> =C2=A0struct occ_response {
> =C2=A0	u8 seq_no;
> =C2=A0	u8 cmd_type;
> =C2=A0	u8 return_status;
> -	u16 data_length;
> +	__be16 data_length;
> =C2=A0	u8 data[OCC_RESP_DATA_BYTES];
> -	u16 checksum;
> +	__be16 checksum;
> =C2=A0} __packed;
> =C2=A0
> =C2=A0/*
> =C2=A0 * transfer flags are NOT mutually exclusive
> - *=C2=A0
> + *
> =C2=A0 * Initial flags are none; transfer is created and queued from writ=
e(). All
> - *=C2=A0	flags are cleared when the transfer is completed by closing the=
 file or
> - *=C2=A0	reading all of the available response data.
> + *=C2=A0=C2=A0flags are cleared when the transfer is completed by closin=
g the file or
> + *=C2=A0=C2=A0reading all of the available response data.
> =C2=A0 * XFR_IN_PROGRESS is set when a transfer is started from occ_worke=
r_putsram,
> - *=C2=A0	and cleared if the transfer fails or occ_worker_getsram complet=
es.
> + *=C2=A0=C2=A0and cleared if the transfer fails or occ_worker_getsram co=
mpletes.
> =C2=A0 * XFR_COMPLETE is set when a transfer fails or finishes occ_worker=
_getsram.
> =C2=A0 * XFR_CANCELED is set when the transfer's client is released.
> =C2=A0 * XFR_WAITING is set from read() if the transfer isn't complete an=
d
> - *=C2=A0	NONBLOCKING wasn't specified. Cleared in read() when transfer c=
ompletes
> - *=C2=A0	or fails.
> + *=C2=A0=C2=A0O_NONBLOCK wasn't specified. Cleared in read() when transf=
er completes or
> + *=C2=A0=C2=A0fails.
> =C2=A0 */
> =C2=A0enum {
> =C2=A0	XFR_IN_PROGRESS,
> @@ -92,9 +94,9 @@ struct occ_xfr {
> =C2=A0 * client flags
> =C2=A0 *
> =C2=A0 * CLIENT_NONBLOCKING is set during open() if the file was opened w=
ith the
> - *=C2=A0	O_NONBLOCKING flag.
> + *=C2=A0=C2=A0O_NONBLOCK flag.
> =C2=A0 * CLIENT_XFR_PENDING is set during write() and cleared when all da=
ta has been
> - *=C2=A0	read.
> + *=C2=A0=C2=A0read.
> =C2=A0 */
> =C2=A0enum {
> =C2=A0	CLIENT_NONBLOCKING,
> @@ -104,7 +106,7 @@ enum {
> =C2=A0struct occ_client {
> =C2=A0	struct occ *occ;
> =C2=A0	struct occ_xfr xfr;
> -	spinlock_t lock;
> +	spinlock_t lock;		/* lock access to the client state */
> =C2=A0	wait_queue_head_t wait;
> =C2=A0	size_t read_offset;
> =C2=A0	unsigned long flags;
> @@ -116,12 +118,15 @@ struct occ_client {
> =C2=A0
> =C2=A0static DEFINE_IDA(occ_ida);
> =C2=A0
> -static void occ_enqueue_xfr(struct occ_xfr *xfr)
> +static int occ_enqueue_xfr(struct occ_xfr *xfr)
> =C2=A0{
> =C2=A0	int empty;
> =C2=A0	struct occ_client *client =3D to_client(xfr);
> =C2=A0	struct occ *occ =3D client->occ;
> =C2=A0
> +	if (occ->cancel)
> +		return -ECANCELED;
> +
> =C2=A0	spin_lock_irq(&occ->list_lock);
> =C2=A0
> =C2=A0	empty =3D list_empty(&occ->xfrs);
> @@ -131,14 +136,15 @@ static void occ_enqueue_xfr(struct occ_xfr *xfr)
> =C2=A0
> =C2=A0	if (empty)
> =C2=A0		queue_work(occ_wq, &occ->work);
> +
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static struct occ_client *occ_open_common(struct occ *occ, unsigned=
 long flags)
> =C2=A0{
> -	struct occ_client *client;
> +	struct occ_client *client =3D kzalloc(sizeof(*client), GFP_KERNEL);
> =C2=A0
> -	client =3D kzalloc(sizeof(*client), GFP_KERNEL);
> -	if (!client)
> +	if (!client || occ->cancel)
> =C2=A0		return NULL;
> =C2=A0
> =C2=A0	client->occ =3D occ;
> @@ -172,6 +178,7 @@ static ssize_t occ_read_common(struct occ_client *cli=
ent, char __user *ubuf,
> =C2=A0	int rc;
> =C2=A0	size_t bytes;
> =C2=A0	struct occ_xfr *xfr =3D &client->xfr;
> +	struct occ *occ =3D client->occ;
> =C2=A0
> =C2=A0	if (len > OCC_SRAM_BYTES)
> =C2=A0		return -EINVAL;
> @@ -183,8 +190,9 @@ static ssize_t occ_read_common(struct occ_client *cli=
ent, char __user *ubuf,
> =C2=A0		if (client->read_offset) {
> =C2=A0			rc =3D 0;
> =C2=A0			client->read_offset =3D 0;
> -		} else
> +		} else {
> =C2=A0			rc =3D -ENOMSG;
> +		}
> =C2=A0
> =C2=A0		goto done;
> =C2=A0	}
> @@ -200,8 +208,11 @@ static ssize_t occ_read_common(struct occ_client *cl=
ient, char __user *ubuf,
> =C2=A0		spin_unlock_irq(&client->lock);
> =C2=A0
> =C2=A0		rc =3D wait_event_interruptible(client->wait,
> -			test_bit(XFR_COMPLETE, &xfr->flags) ||
> -			test_bit(XFR_CANCELED, &xfr->flags));
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0test_bit(XFR_COMPLETE,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&xfr->flags) ||
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0test_bit(XFR_CANCELED,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&xfr->flags) ||
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0occ->cancel);
> =C2=A0
> =C2=A0		spin_lock_irq(&client->lock);
> =C2=A0
> @@ -225,12 +236,14 @@ static ssize_t occ_read_common(struct occ_client *c=
lient, char __user *ubuf,
> =C2=A0
> =C2=A0	bytes =3D min(len, xfr->resp_data_length - client->read_offset);
> =C2=A0	if (ubuf) {
> -		if (copy_to_user(ubuf, &xfr->buf[client->read_offset], bytes)) {
> +		if (copy_to_user(ubuf, &xfr->buf[client->read_offset],
> +				=C2=A0bytes)) {
> =C2=A0			rc =3D -EFAULT;
> =C2=A0			goto done;
> =C2=A0		}
> -	} else
> +	} else {
> =C2=A0		memcpy(kbuf, &xfr->buf[client->read_offset], bytes);
> +	}
> =C2=A0
> =C2=A0	client->read_offset +=3D bytes;
> =C2=A0
> @@ -250,12 +263,6 @@ static ssize_t occ_read(struct file *file, char __us=
er *buf, size_t len,
> =C2=A0{
> =C2=A0	struct occ_client *client =3D file->private_data;
> =C2=A0
> -	/* check this ahead of time so we don't go changing the xfr state
> -	=C2=A0* needlessly
> -	=C2=A0*/
> -	if (!access_ok(VERIFY_WRITE, buf, len))
> -		return -EFAULT;
> -
> =C2=A0	return occ_read_common(client, buf, NULL, len);
> =C2=A0}
> =C2=A0
> @@ -272,28 +279,31 @@ static ssize_t occ_write_common(struct occ_client *=
client,
> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	spin_lock_irq(&client->lock);
> -	if (test_and_set_bit(CLIENT_XFR_PENDING, &client->flags)) {
> +
> +	if (test_bit(CLIENT_XFR_PENDING, &client->flags)) {
> =C2=A0		rc =3D -EBUSY;
> =C2=A0		goto done;
> =C2=A0	}
> =C2=A0
> -	/* clear out the transfer */
> -	memset(xfr, 0, sizeof(*xfr));
> -
> -	xfr->buf[0] =3D 1;
> +	memset(xfr, 0, sizeof(*xfr));	/* clear out the transfer */

What about the transfer buffer?

> +	xfr->buf[0] =3D 1;		/* occ sequence number */
> =C2=A0
> +	/* Assume user data follows the occ command format.
> +	=C2=A0* byte 0: command type
> +	=C2=A0* bytes 1-2: data length (msb first)
> +	=C2=A0* bytes 3-n: data
> +	=C2=A0*/
> =C2=A0	if (ubuf) {
> =C2=A0		if (copy_from_user(&xfr->buf[1], ubuf, len)) {
> -			kfree(xfr);
> =C2=A0			rc =3D -EFAULT;
> =C2=A0			goto done;
> =C2=A0		}
> -	} else
> +	} else {
> =C2=A0		memcpy(&xfr->buf[1], kbuf, len);
> +	}
> =C2=A0
> =C2=A0	data_length =3D (xfr->buf[2] << 8) + xfr->buf[3];

Shouldn't data_length be proportional to len? Like, somewhere in the
neighbourhood of len - 3? Should we check that? What if I just send down 3
bytes, some kind of command and two others representing the value 4090? Won=
't
we submit a bunch of "junk" (overlapping, previously submitted data) to the
FIFO?

If the client is shared between higher-level command submitters then you co=
uld
potentially resubmit the previous command.

> =C2=A0	if (data_length > OCC_CMD_DATA_BYTES) {
> -		kfree(xfr);
> =C2=A0		rc =3D -EINVAL;
> =C2=A0		goto done;
> =C2=A0	}
> @@ -306,9 +316,11 @@ static ssize_t occ_write_common(struct occ_client *c=
lient,
> =C2=A0
> =C2=A0	xfr->cmd_data_length =3D data_length + 6;
> =C2=A0	client->read_offset =3D 0;
> +	rc =3D occ_enqueue_xfr(xfr);
> +	if (rc)
> +		goto done;
> =C2=A0
> -	occ_enqueue_xfr(xfr);
> -
> +	set_bit(CLIENT_XFR_PENDING, &client->flags);
> =C2=A0	rc =3D len;
> =C2=A0
> =C2=A0done:
> @@ -321,12 +333,6 @@ static ssize_t occ_write(struct file *file, const ch=
ar __user *buf,
> =C2=A0{
> =C2=A0	struct occ_client *client =3D file->private_data;
> =C2=A0
> -	/* check this ahead of time so we don't go changing the xfr state
> -	=C2=A0* needlessly
> -	=C2=A0*/
> -	if (!access_ok(VERIFY_READ, buf, len))
> -		return -EFAULT;
> -
> =C2=A0	return occ_write_common(client, buf, NULL, len);
> =C2=A0}
> =C2=A0
> @@ -366,7 +372,7 @@ static int occ_release_common(struct occ_client *clie=
nt)
> =C2=A0		return 0;
> =C2=A0	}
> =C2=A0
> -	/* operation is in progress; let worker clean up*/
> +	/* operation is in progress; let worker clean up */
> =C2=A0	spin_unlock_irq(&occ->list_lock);
> =C2=A0	spin_unlock_irq(&client->lock);
> =C2=A0	return 0;
> @@ -403,7 +409,7 @@ static int occ_write_sbefifo(struct sbefifo_client *c=
lient, const char *buf,
> =C2=A0		total +=3D rc;
> =C2=A0	} while (total < len);
> =C2=A0
> -	return (total =3D=3D len) ? 0 : -EMSGSIZE;
> +	return (total =3D=3D len) ? 0 : -ENODATA;

This doesn't seem right for a write, maybe -ENOSPC?
> =C2=A0}
> =C2=A0
> =C2=A0static int occ_read_sbefifo(struct sbefifo_client *client, char *bu=
f,
> @@ -422,7 +428,7 @@ static int occ_read_sbefifo(struct sbefifo_client *cl=
ient, char *buf,
> =C2=A0		total +=3D rc;
> =C2=A0	} while (total < len);
> =C2=A0
> -	return (total =3D=3D len) ? 0 : -EMSGSIZE;
> +	return (total =3D=3D len) ? 0 : -ENODATA;
> =C2=A0}
> =C2=A0
> =C2=A0static int occ_getsram(struct device *sbefifo, u32 address, u8 *dat=
a,
> @@ -430,10 +436,13 @@ static int occ_getsram(struct device *sbefifo, u32 =
address, u8 *data,
> =C2=A0{
> =C2=A0	int rc;
> =C2=A0	u8 *resp;
> -	u32 buf[5];
> -	u32 data_len =3D ((len + 7) / 8) * 8;
> +	__be32 buf[5];
> +	u32 data_len =3D ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
> =C2=A0	struct sbefifo_client *client;
> =C2=A0
> +	/* Magic sequence to do SBE getsram command. SBE will fetch data from
> +	=C2=A0* specified SRAM address.
> +	=C2=A0*/

Do the individual values of the sequence actually mean anything? Or are the=
y
truly magic? If possible it would be good to indicate what each does rather
than just make some vague claim about them.

> =C2=A0	buf[0] =3D cpu_to_be32(0x5);
> =C2=A0	buf[1] =3D cpu_to_be32(0xa403);
> =C2=A0	buf[2] =3D cpu_to_be32(1);
> @@ -447,7 +456,7 @@ static int occ_getsram(struct device *sbefifo, u32 ad=
dress, u8 *data,
> =C2=A0	rc =3D occ_write_sbefifo(client, (const char *)buf, sizeof(buf));
> =C2=A0	if (rc)
> =C2=A0		goto done;
> -=09
> +
> =C2=A0	resp =3D kzalloc(data_len, GFP_KERNEL);
> =C2=A0	if (!resp) {
> =C2=A0		rc =3D -ENOMEM;
> @@ -467,7 +476,7 @@ static int occ_getsram(struct device *sbefifo, u32 ad=
dress, u8 *data,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0(be32_to_cpu(buf[1]) =3D=3D 0xC0DEA403))
> =C2=A0		memcpy(data, resp, len);
> =C2=A0	else
> -		rc =3D -EFAULT;
> +		rc =3D -EBADMSG;
> =C2=A0
> =C2=A0free:
> =C2=A0	kfree(resp);
> @@ -481,8 +490,8 @@ static int occ_putsram(struct device *sbefifo, u32 ad=
dress, u8 *data,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ssize_t len)
> =C2=A0{
> =C2=A0	int rc;
> -	u32 *buf;
> -	u32 data_len =3D ((len + 7) / 8) * 8;
> +	__be32 *buf;
> +	u32 data_len =3D ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
> =C2=A0	size_t cmd_len =3D data_len + 20;
> =C2=A0	struct sbefifo_client *client;
> =C2=A0
> @@ -490,6 +499,9 @@ static int occ_putsram(struct device *sbefifo, u32 ad=
dress, u8 *data,
> =C2=A0	if (!buf)
> =C2=A0		return -ENOMEM;
> =C2=A0
> +	/* Magic sequence to do SBE putsram command. SBE will transfer
> +	=C2=A0* data to specified SRAM address.
> +	=C2=A0*/

See above.

> =C2=A0	buf[0] =3D cpu_to_be32(0x5 + (data_len / 4));
> =C2=A0	buf[1] =3D cpu_to_be32(0xa404);
> =C2=A0	buf[2] =3D cpu_to_be32(1);
> @@ -515,7 +527,7 @@ static int occ_putsram(struct device *sbefifo, u32 ad=
dress, u8 *data,
> =C2=A0	/* check for good response */
> =C2=A0	if ((be32_to_cpu(buf[0]) !=3D data_len) ||
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0(be32_to_cpu(buf[1]) !=3D 0xC0DEA404))
> -		rc =3D -EFAULT;
> +		rc =3D -EBADMSG;
> =C2=A0
> =C2=A0done:
> =C2=A0	sbefifo_drv_release(client);
> @@ -527,14 +539,17 @@ static int occ_putsram(struct device *sbefifo, u32 =
address, u8 *data,
> =C2=A0static int occ_trigger_attn(struct device *sbefifo)
> =C2=A0{
> =C2=A0	int rc;
> -	u32 buf[6];
> +	__be32 buf[6];
> =C2=A0	struct sbefifo_client *client;
> =C2=A0
> +	/* Magic sequence to do SBE putscom command. SBE will write 8 bytes to
> +	=C2=A0* specified SCOM address.
> +	=C2=A0*/

See above.

> =C2=A0	buf[0] =3D cpu_to_be32(0x6);
> =C2=A0	buf[1] =3D cpu_to_be32(0xa202);
> =C2=A0	buf[2] =3D 0;
> =C2=A0	buf[3] =3D cpu_to_be32(0x6D035);
> -	buf[4] =3D cpu_to_be32(0x20010000);
> +	buf[4] =3D cpu_to_be32(0x20010000);	/* trigger occ attention */

This kind of comment is what I'm interested in.

> =C2=A0	buf[5] =3D 0;
> =C2=A0
> =C2=A0	client =3D sbefifo_drv_open(sbefifo, 0);
> @@ -552,7 +567,7 @@ static int occ_trigger_attn(struct device *sbefifo)
> =C2=A0	/* check for good response */
> =C2=A0	if ((be32_to_cpu(buf[0]) !=3D 0xC0DEA202) ||
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0(be32_to_cpu(buf[1]) & 0x0FFFFFFF))
> -		rc =3D -EFAULT;
> +		rc =3D -EBADMSG;
> =C2=A0
> =C2=A0done:
> =C2=A0	sbefifo_drv_release(client);
> @@ -564,12 +579,19 @@ static void occ_worker(struct work_struct *work)
> =C2=A0{
> =C2=A0	int rc =3D 0, empty, waiting, canceled;
> =C2=A0	u16 resp_data_length;
> +	unsigned long start;
> +	const unsigned long timeout =3D msecs_to_jiffies(OCC_TIMEOUT_MS);
> +	const long int wait_time =3D msecs_to_jiffies(OCC_CMD_IN_PRG_WAIT_MS);
> =C2=A0	struct occ_xfr *xfr;
> +	struct occ_response *resp;
> =C2=A0	struct occ_client *client;
> =C2=A0	struct occ *occ =3D container_of(work, struct occ, work);
> =C2=A0	struct device *sbefifo =3D occ->sbefifo;
> =C2=A0
> =C2=A0again:
> +	if (occ->cancel)
> +		return;
> +
> =C2=A0	spin_lock_irq(&occ->list_lock);
> =C2=A0
> =C2=A0	xfr =3D list_first_entry_or_null(&occ->xfrs, struct occ_xfr, link)=
;
> @@ -578,11 +600,14 @@ static void occ_worker(struct work_struct *work)
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> +	resp =3D (struct occ_response *)xfr->buf;

Are the members all aligned as necessary?

> =C2=A0	set_bit(XFR_IN_PROGRESS, &xfr->flags);
> =C2=A0
> =C2=A0	spin_unlock_irq(&occ->list_lock);
> =C2=A0	mutex_lock(&occ->occ_lock);
> =C2=A0
> +	/* write occ command */
> +	start =3D jiffies;
> =C2=A0	rc =3D occ_putsram(sbefifo, 0xFFFBE000, xfr->buf,
> =C2=A0			=C2=A0xfr->cmd_data_length);
> =C2=A0	if (rc)
> @@ -592,13 +617,26 @@ static void occ_worker(struct work_struct *work)
> =C2=A0	if (rc)
> =C2=A0		goto done;
> =C2=A0
> -	rc =3D occ_getsram(sbefifo, 0xFFFBF000, xfr->buf, 8);
> -	if (rc)
> -		goto done;
> +	/* read occ response */
> +	do {
> +		rc =3D occ_getsram(sbefifo, 0xFFFBF000, xfr->buf, 8);
> +		if (rc)
> +			goto done;
> +
> +		if (resp->return_status =3D=3D OCC_RESP_CMD_IN_PRG) {
> +			rc =3D -EALREADY;
> +
> +			if (time_after(jiffies, start + timeout))
> +				break;
> =C2=A0
> -	resp_data_length =3D (xfr->buf[3] << 8) + xfr->buf[4];
> +			set_current_state(TASK_INTERRUPTIBLE);
> +			schedule_timeout(wait_time);
> +		}
> +	} while (rc);
> +
> +	resp_data_length =3D get_unaligned_be16(&resp->data_length);
> =C2=A0	if (resp_data_length > OCC_RESP_DATA_BYTES) {
> -		rc =3D -EDOM;
> +		rc =3D -EMSGSIZE;
> =C2=A0		goto done;
> =C2=A0	}
> =C2=A0
> @@ -704,9 +742,6 @@ static int occ_probe(struct platform_device *pdev)
> =C2=A0	mutex_init(&occ->occ_lock);
> =C2=A0	INIT_WORK(&occ->work, occ_worker);
> =C2=A0
> -	/* ensure NULL before we probe children, so they don't hang FSI */
> -	platform_set_drvdata(pdev, NULL);
> -
> =C2=A0	if (dev->of_node) {
> =C2=A0		rc =3D of_property_read_u32(dev->of_node, "reg", &reg);
> =C2=A0		if (!rc) {
> @@ -716,23 +751,13 @@ static int occ_probe(struct platform_device *pdev)
> =C2=A0			if (occ->idx < 0)
> =C2=A0				occ->idx =3D ida_simple_get(&occ_ida, 1, INT_MAX,
> =C2=A0							=C2=A0=C2=A0GFP_KERNEL);
> -		} else
> +		} else {
> =C2=A0			occ->idx =3D ida_simple_get(&occ_ida, 1, INT_MAX,
> =C2=A0						=C2=A0=C2=A0GFP_KERNEL);
> -
> -		/* create platform devs for dts child nodes (hwmon, etc) */
> -		for_each_child_of_node(dev->of_node, np) {
> -			snprintf(child_name, sizeof(child_name), "occ%d-dev%d",
> -				=C2=A0occ->idx, child_idx++);
> -			child =3D of_platform_device_create(np, child_name, dev);
> -			if (!child)
> -				dev_warn(dev,
> -					=C2=A0"failed to create child node dev\n");
> =C2=A0		}
> -	} else
> +	} else {
> =C2=A0		occ->idx =3D ida_simple_get(&occ_ida, 1, INT_MAX, GFP_KERNEL);
> -
> -	platform_set_drvdata(pdev, occ);
> +	}
> =C2=A0
> =C2=A0	snprintf(occ->name, sizeof(occ->name), "occ%d", occ->idx);
> =C2=A0	occ->mdev.fops =3D &occ_fops;
> @@ -742,20 +767,42 @@ static int occ_probe(struct platform_device *pdev)
> =C2=A0
> =C2=A0	rc =3D misc_register(&occ->mdev);
> =C2=A0	if (rc) {
> -		dev_err(dev, "failed to register miscdevice\n");
> +		dev_err(dev, "failed to register miscdevice: %d\n", rc);
> +		ida_simple_remove(&occ_ida, occ->idx);
> =C2=A0		return rc;
> =C2=A0	}
> =C2=A0
> +	/* create platform devs for dts child nodes (hwmon, etc) */
> +	for_each_available_child_of_node(dev->of_node, np) {
> +		snprintf(child_name, sizeof(child_name), "occ%d-dev%d",
> +			=C2=A0occ->idx, child_idx++);
> +		child =3D of_platform_device_create(np, child_name, dev);
> +		if (!child)
> +			dev_warn(dev, "failed to create child node dev\n");
> +	}
> +
> +	platform_set_drvdata(pdev, occ);
> +

Similar to the SBEFIFO, it would be nice to separate out the miscdev from t=
he
core.

> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int occ_remove(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct occ *occ =3D platform_get_drvdata(pdev);
> +	struct occ_xfr *xfr;
> +	struct occ_client *client;
> +
> +	occ->cancel =3D true;
> +	list_for_each_entry(xfr, &occ->xfrs, link) {
> +		client =3D to_client(xfr);
> +		wake_up_interruptible(&client->wait);
> +	}
> =C2=A0
> -	flush_work(&occ->work);
> =C2=A0	misc_deregister(&occ->mdev);
> =C2=A0	device_for_each_child(&pdev->dev, NULL, occ_unregister_child);
> +
> +	flush_work(&occ->work);

This should be okay now that we have the -ENODEV in the SBEFIFO, right (if
that's all nice and race-free)? That is, sbefifo_read_ready() and
sbefifo_write_ready() should trigger and the associated
sbefifo_{read,write}_common() pulls -ENODEV out of sbefifo->rc?

> +
> =C2=A0	ida_simple_remove(&occ_ida, occ->idx);
> =C2=A0
> =C2=A0	return 0;
> @@ -789,6 +836,8 @@ static void occ_exit(void)
> =C2=A0	destroy_workqueue(occ_wq);
> =C2=A0
> =C2=A0	platform_driver_unregister(&occ_driver);
> +
> +	ida_destroy(&occ_ida);
> =C2=A0}
> =C2=A0
> =C2=A0module_init(occ_init);
> diff --git a/include/linux/occ.h b/include/linux/occ.h
> index d78332c..0a4a54a 100644
> --- a/include/linux/occ.h
> +++ b/include/linux/occ.h
> @@ -11,12 +11,26 @@
> =C2=A0 * GNU General Public License for more details.
> =C2=A0 */
> =C2=A0
> -#ifndef __OCC_H__
> -#define __OCC_H__
> +#ifndef LINUX_FSI_OCC_H
> +#define LINUX_FSI_OCC_H
> =C2=A0
> =C2=A0struct device;
> =C2=A0struct occ_client;
> =C2=A0
> +#define OCC_RESP_CMD_IN_PRG		0xFF
> +#define OCC_RESP_SUCCESS		0
> +#define OCC_RESP_CMD_INVAL		0x11
> +#define OCC_RESP_CMD_LEN_INVAL		0x12
> +#define OCC_RESP_DATA_INVAL		0x13
> +#define OCC_RESP_CHKSUM_ERR		0x14
> +#define OCC_RESP_INT_ERR		0x15
> +#define OCC_RESP_BAD_STATE		0x16
> +#define OCC_RESP_CRIT_EXCEPT		0xE0
> +#define OCC_RESP_CRIT_INIT		0xE1
> +#define OCC_RESP_CRIT_WATCHDOG		0xE2
> +#define OCC_RESP_CRIT_OCB		0xE3
> +#define OCC_RESP_CRIT_HW		0xE4
> +
> =C2=A0extern struct occ_client *occ_drv_open(struct device *dev,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long flags);
> =C2=A0extern int occ_drv_read(struct occ_client *client, char *buf, size_=
t len);
> @@ -24,4 +38,4 @@ extern int occ_drv_write(struct occ_client *client, con=
st char *buf,
> =C2=A0			=C2=A0size_t len);
> =C2=A0extern void occ_drv_release(struct occ_client *client);
> =C2=A0
> -#endif /* __OCC_H__ */
> +#endif /* LINUX_FSI_OCC_H */
--=-L0nG2BAT09d4i0AM4UdG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZyKCzAAoJEJ0dnzgO5LT5vSkQAKTFR9a0tibV6WQ2zl+oNzuF
z7IXQAbmwXt6Nmr/7Wy0GfHZCeRiyHfaa8eUxhho8MyFeGDeQTOS+MvkgvHGW3f6
uwmyZfDq+c6aO7a7nEUVLKstmB2iWgOqrJNwmKsQ8ERldoBCJ7mLKjKCHdYiEjuL
jB/KOPF0iM9iEZ7PyJMY9OcuN1+Gn1YupTgCqQTO5Bq/Q3ZV5UxsdFrJeD4Vj/8Y
84tvD1OLNICUbXK5KrXQcrH7dm9kZxAT9j22pbLPmk1gK86Mes0831s94azIVJD8
/Zfuw3d95PlhNzZlmLKi+VQuiwcQzqv7Wyvg4PEBCCopaU9HD992OqHrJplDeNNr
bEy1wfK8bakNRFKw1p8nr/h8ls7Q9ZY/NbpuV2jTuHYY0tOAvdRTBX+v5RbyO02O
tAUv9X8h7dgOn9dRCAD1lb6IQic9I/guyCSFBoYcNWdPgytiCfpAEmTxVuJQQmkB
j1U6e5x0QREKnvRLDxlU5dH113QDgooHhtvcWyly6EYhBfJUQWz0v+wh9PfcaKGE
idj9Kns0jwn2h9L2TuWD3umuLZZnh7KWhlgDj+3ir9NJ8xKUUp4X6rI9YASXdD4O
VYBwB7r4gK+QwHyyIzIUZBmFkQCaMtgw/FxFOY4pRhRABG65R3RQI7yZIacfHsKw
RRnNTNvBWymF508uhdGQ
=2SbD
-----END PGP SIGNATURE-----

--=-L0nG2BAT09d4i0AM4UdG--
