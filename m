Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="G9IesTNe"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Zfo3un+l"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y6v4p1gbHzDqqN
 for <openbmc@lists.ozlabs.org>; Thu,  5 Oct 2017 11:38:02 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3222420BC6;
 Wed,  4 Oct 2017 20:38:00 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 04 Oct 2017 20:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=HiokIF1ZpBCOiSpKl06JpPc2We2OxOOKkriH8vcKK
 m0=; b=G9IesTNe+6YlDTUO5E1ZUHNg1z4AKmx/qLL8IB94FR8mFCc9XoKJp8DBz
 D5h/xoYXTE+hF627oOF4+vrVNNzMyDlW6BI0cWuFoXsO/ZmP2W0yjNtPiu3Kr/mA
 sF1mGg1K3R3ZrRe7Y6PNGAMxuZpeMNs7dLzq66nnB8oILx7jK92b3nT84ytAefL4
 59m4BGpSE2pwyd/cylzcN+bdAro6o3AvWlOV0/FG6hUhJN1tP84tYJO1dFVz8y+H
 EOg6L0QyxPU+Vu/eENJDnVB80Wp5K98cPUQ8JKxKDCRPreuLB5wmC4wJovO8C788
 ib2XgVJdQl0WZqz8ef7Leedp0hSBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=HiokIF1ZpBCOiSpKl0
 6JpPc2We2OxOOKkriH8vcKKm0=; b=Zfo3un+lNKiT+oLt1YGauPR0xQzXkW9hgT
 XP7r+ejPWPdhEnT5I+aIHaWRKfzgY60Ox96KgymzQmc/AOfwDNuloiQ2jAbczYcP
 l8SImMWKi2WpMtBhjLCRIi1F14IVrAd1OBye5doDCH/zkT4FpJKnb/EN2RFCY1LH
 +OfUBJ3uAlVA0nDjhKpvwUcsc1WF14+nqLCY66zugihH0abhCnLqkT132r4WuMOd
 kkXA1aq9NAgSZmfMhtKDwB0QwyLPE1AOxQxv164v5YFSzWUgvu3MQGcvWqlhGwsQ
 TuoEhIJMKUE6WTo6Hf+XKGT6rxL55i6mho/Lib2gEbHiXO8+hYLg==
X-ME-Sender: <xms:6H7VWTn8pMqB7ewrCcd7LaYccUzxNLos0EvYOx6zP-irXPgowH3W0g>
X-Sasl-enc: iNFdQ/Ee6JV5HcFs/w+atT272UzJFeyk8nmTuY6QYsAn 1507163879
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3251324772;
 Wed,  4 Oct 2017 20:37:57 -0400 (EDT)
Message-ID: <1507163874.5452.45.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v2 4/9] drivers: fsi: occ: General clean-up
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Thu, 05 Oct 2017 11:07:54 +1030
In-Reply-To: <1506724868-13010-5-git-send-email-eajames@linux.vnet.ibm.com>
References: <1506724868-13010-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1506724868-13010-5-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-fNJNopdJ7UxoastPbrB1"
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
X-List-Received-Date: Thu, 05 Oct 2017 00:38:02 -0000


--=-fNJNopdJ7UxoastPbrB1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-09-29 at 17:41 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Fix include files. Cleanup formatting and add some comments. Fix an
> errant kfree in an error case. Fix some errnos. Add OCC response
> definitions to the header file.

Unlike the SBEFIFO patch I haven't studied the diff here, but I also don't
intend on ack'ing this as it stands. There's just too much going on to judg=
e
that it's reasonable.

Andrew

>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/fsi/occ.c=C2=A0=C2=A0=C2=A0| 145 ++++++++++++++++++++++++++=
++------------------------
> =C2=A0include/linux/occ.h |=C2=A0=C2=A020 ++++++--
> =C2=A02 files changed, 96 insertions(+), 69 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index 621fbf0..3313e35 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -10,16 +10,21 @@
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
> =C2=A0#include <linux/slab.h>
> +#include <linux/spinlock.h>
> =C2=A0#include <linux/uaccess.h>
> =C2=A0#include <linux/wait.h>
> =C2=A0#include <linux/workqueue.h>
> @@ -34,43 +39,35 @@ struct occ {
> =C2=A0	int idx;
> =C2=A0	struct miscdevice mdev;
> =C2=A0	struct list_head xfrs;
> -	spinlock_t list_lock;
> -	struct mutex occ_lock;
> +	spinlock_t list_lock;		/* lock access to the xfrs list */
> +	struct mutex occ_lock;		/* lock access to the hardware */
> =C2=A0	struct work_struct work;
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
> @@ -92,9 +89,9 @@ struct occ_xfr {
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
> @@ -104,7 +101,7 @@ enum {
> =C2=A0struct occ_client {
> =C2=A0	struct occ *occ;
> =C2=A0	struct occ_xfr xfr;
> -	spinlock_t lock;
> +	spinlock_t lock;		/* lock access to the client state */
> =C2=A0	wait_queue_head_t wait;
> =C2=A0	size_t read_offset;
> =C2=A0	unsigned long flags;
> @@ -135,9 +132,8 @@ static void occ_enqueue_xfr(struct occ_xfr *xfr)
> =C2=A0
> =C2=A0static struct occ_client *occ_open_common(struct occ *occ, unsigned=
 long flags)
> =C2=A0{
> -	struct occ_client *client;
> +	struct occ_client *client =3D kzalloc(sizeof(*client), GFP_KERNEL);
> =C2=A0
> -	client =3D kzalloc(sizeof(*client), GFP_KERNEL);
> =C2=A0	if (!client)
> =C2=A0		return NULL;
> =C2=A0
> @@ -183,8 +179,9 @@ static ssize_t occ_read_common(struct occ_client *cli=
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
> @@ -200,8 +197,10 @@ static ssize_t occ_read_common(struct occ_client *cl=
ient, char __user *ubuf,
> =C2=A0		spin_unlock_irq(&client->lock);
> =C2=A0
> =C2=A0		rc =3D wait_event_interruptible(client->wait,
> -			test_bit(XFR_COMPLETE, &xfr->flags) ||
> -			test_bit(XFR_CANCELED, &xfr->flags));
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0test_bit(XFR_COMPLETE,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&xfr->flags) ||
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0test_bit(XFR_CANCELED,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&xfr->flags));
> =C2=A0
> =C2=A0		spin_lock_irq(&client->lock);
> =C2=A0
> @@ -225,12 +224,14 @@ static ssize_t occ_read_common(struct occ_client *c=
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
> @@ -250,12 +251,6 @@ static ssize_t occ_read(struct file *file, char __us=
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
> @@ -272,28 +267,31 @@ static ssize_t occ_write_common(struct occ_client *=
client,
> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	spin_lock_irq(&client->lock);
> +
> =C2=A0	if (test_and_set_bit(CLIENT_XFR_PENDING, &client->flags)) {
> =C2=A0		rc =3D -EBUSY;
> =C2=A0		goto done;
> =C2=A0	}
> =C2=A0
> -	/* clear out the transfer */
> -	memset(xfr, 0, sizeof(*xfr));
> -
> -	xfr->buf[0] =3D 1;
> +	memset(xfr, 0, sizeof(*xfr));	/* clear out the transfer */
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
> =C2=A0	if (data_length > OCC_CMD_DATA_BYTES) {
> -		kfree(xfr);
> =C2=A0		rc =3D -EINVAL;
> =C2=A0		goto done;
> =C2=A0	}
> @@ -321,12 +319,6 @@ static ssize_t occ_write(struct file *file, const ch=
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
> @@ -366,7 +358,7 @@ static int occ_release_common(struct occ_client *clie=
nt)
> =C2=A0		return 0;
> =C2=A0	}
> =C2=A0
> -	/* operation is in progress; let worker clean up*/
> +	/* operation is in progress; let worker clean up */
> =C2=A0	spin_unlock_irq(&occ->list_lock);
> =C2=A0	spin_unlock_irq(&client->lock);
> =C2=A0	return 0;
> @@ -403,7 +395,7 @@ static int occ_write_sbefifo(struct sbefifo_client *c=
lient, const char *buf,
> =C2=A0		total +=3D rc;
> =C2=A0	} while (total < len);
> =C2=A0
> -	return (total =3D=3D len) ? 0 : -EMSGSIZE;
> +	return (total =3D=3D len) ? 0 : -ENOSPC;
> =C2=A0}
> =C2=A0
> =C2=A0static int occ_read_sbefifo(struct sbefifo_client *client, char *bu=
f,
> @@ -422,7 +414,7 @@ static int occ_read_sbefifo(struct sbefifo_client *cl=
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
> @@ -430,10 +422,13 @@ static int occ_getsram(struct device *sbefifo, u32 =
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
> =C2=A0	buf[0] =3D cpu_to_be32(0x5);
> =C2=A0	buf[1] =3D cpu_to_be32(0xa403);
> =C2=A0	buf[2] =3D cpu_to_be32(1);
> @@ -447,7 +442,7 @@ static int occ_getsram(struct device *sbefifo, u32 ad=
dress, u8 *data,
> =C2=A0	rc =3D occ_write_sbefifo(client, (const char *)buf, sizeof(buf));
> =C2=A0	if (rc)
> =C2=A0		goto done;
> -=09
> +
> =C2=A0	resp =3D kzalloc(data_len, GFP_KERNEL);
> =C2=A0	if (!resp) {
> =C2=A0		rc =3D -ENOMEM;
> @@ -467,7 +462,7 @@ static int occ_getsram(struct device *sbefifo, u32 ad=
dress, u8 *data,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0(be32_to_cpu(buf[1]) =3D=3D 0xC0DEA403))
> =C2=A0		memcpy(data, resp, len);
> =C2=A0	else
> -		rc =3D -EFAULT;
> +		rc =3D -EBADMSG;
> =C2=A0
> =C2=A0free:
> =C2=A0	kfree(resp);
> @@ -481,8 +476,8 @@ static int occ_putsram(struct device *sbefifo, u32 ad=
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
> @@ -490,6 +485,9 @@ static int occ_putsram(struct device *sbefifo, u32 ad=
dress, u8 *data,
> =C2=A0	if (!buf)
> =C2=A0		return -ENOMEM;
> =C2=A0
> +	/* Magic sequence to do SBE putsram command. SBE will transfer
> +	=C2=A0* data to specified SRAM address.
> +	=C2=A0*/
> =C2=A0	buf[0] =3D cpu_to_be32(0x5 + (data_len / 4));
> =C2=A0	buf[1] =3D cpu_to_be32(0xa404);
> =C2=A0	buf[2] =3D cpu_to_be32(1);
> @@ -515,7 +513,7 @@ static int occ_putsram(struct device *sbefifo, u32 ad=
dress, u8 *data,
> =C2=A0	/* check for good response */
> =C2=A0	if ((be32_to_cpu(buf[0]) !=3D data_len) ||
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0(be32_to_cpu(buf[1]) !=3D 0xC0DEA404))
> -		rc =3D -EFAULT;
> +		rc =3D -EBADMSG;
> =C2=A0
> =C2=A0done:
> =C2=A0	sbefifo_drv_release(client);
> @@ -527,14 +525,17 @@ static int occ_putsram(struct device *sbefifo, u32 =
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
> =C2=A0	buf[0] =3D cpu_to_be32(0x6);
> =C2=A0	buf[1] =3D cpu_to_be32(0xa202);
> =C2=A0	buf[2] =3D 0;
> =C2=A0	buf[3] =3D cpu_to_be32(0x6D035);
> -	buf[4] =3D cpu_to_be32(0x20010000);
> +	buf[4] =3D cpu_to_be32(0x20010000);	/* trigger occ attention */
> =C2=A0	buf[5] =3D 0;
> =C2=A0
> =C2=A0	client =3D sbefifo_drv_open(sbefifo, 0);
> @@ -552,7 +553,7 @@ static int occ_trigger_attn(struct device *sbefifo)
> =C2=A0	/* check for good response */
> =C2=A0	if ((be32_to_cpu(buf[0]) !=3D 0xC0DEA202) ||
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0(be32_to_cpu(buf[1]) & 0x0FFFFFFF))
> -		rc =3D -EFAULT;
> +		rc =3D -EBADMSG;
> =C2=A0
> =C2=A0done:
> =C2=A0	sbefifo_drv_release(client);
> @@ -565,6 +566,7 @@ static void occ_worker(struct work_struct *work)
> =C2=A0	int rc =3D 0, empty, waiting, canceled;
> =C2=A0	u16 resp_data_length;
> =C2=A0	struct occ_xfr *xfr;
> +	struct occ_response *resp;
> =C2=A0	struct occ_client *client;
> =C2=A0	struct occ *occ =3D container_of(work, struct occ, work);
> =C2=A0	struct device *sbefifo =3D occ->sbefifo;
> @@ -578,11 +580,13 @@ static void occ_worker(struct work_struct *work)
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> +	resp =3D (struct occ_response *)xfr->buf;
> =C2=A0	set_bit(XFR_IN_PROGRESS, &xfr->flags);
> =C2=A0
> =C2=A0	spin_unlock_irq(&occ->list_lock);
> =C2=A0	mutex_lock(&occ->occ_lock);
> =C2=A0
> +	/* write occ command */
> =C2=A0	rc =3D occ_putsram(sbefifo, 0xFFFBE000, xfr->buf,
> =C2=A0			=C2=A0xfr->cmd_data_length);
> =C2=A0	if (rc)
> @@ -592,13 +596,14 @@ static void occ_worker(struct work_struct *work)
> =C2=A0	if (rc)
> =C2=A0		goto done;
> =C2=A0
> +	/* read occ response */
> =C2=A0	rc =3D occ_getsram(sbefifo, 0xFFFBF000, xfr->buf, 8);
> =C2=A0	if (rc)
> =C2=A0		goto done;
> =C2=A0
> -	resp_data_length =3D (xfr->buf[3] << 8) + xfr->buf[4];
> +	resp_data_length =3D get_unaligned_be16(&resp->data_length);
> =C2=A0	if (resp_data_length > OCC_RESP_DATA_BYTES) {
> -		rc =3D -EDOM;
> +		rc =3D -EMSGSIZE;
> =C2=A0		goto done;
> =C2=A0	}
> =C2=A0
> @@ -657,18 +662,27 @@ struct occ_client *occ_drv_open(struct device *dev,=
 unsigned long flags)
> =C2=A0
> =C2=A0int occ_drv_read(struct occ_client *client, char *buf, size_t len)
> =C2=A0{
> +	if (!client)
> +		return -ENODEV;
> +
> =C2=A0	return occ_read_common(client, NULL, buf, len);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(occ_drv_read);
> =C2=A0
> =C2=A0int occ_drv_write(struct occ_client *client, const char *buf, size_=
t len)
> =C2=A0{
> +	if (!client)
> +		return -ENODEV;
> +
> =C2=A0	return occ_write_common(client, NULL, buf, len);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(occ_drv_write);
> =C2=A0
> =C2=A0void occ_drv_release(struct occ_client *client)
> =C2=A0{
> +	if (!client)
> +		return;
> +
> =C2=A0	occ_release_common(client);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(occ_drv_release);
> @@ -704,9 +718,6 @@ static int occ_probe(struct platform_device *pdev)
> =C2=A0	mutex_init(&occ->occ_lock);
> =C2=A0	INIT_WORK(&occ->work, occ_worker);
> =C2=A0
> -	/* ensure NULL before we probe children, so they don't hang FSI */
> -	platform_set_drvdata(pdev, NULL);
> -
> =C2=A0	if (dev->of_node) {
> =C2=A0		rc =3D of_property_read_u32(dev->of_node, "reg", &reg);
> =C2=A0		if (!rc) {
> @@ -789,6 +800,8 @@ static void occ_exit(void)
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
--=-fNJNopdJ7UxoastPbrB1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1X7iAAoJEJ0dnzgO5LT5nHYP/iUakOZVyXlHtiAcyafQy6v/
sMGlb1wx9sYw+mjeYCU6IX5ZX03XaOkBfg0n1STgGduK+iUfAqmxek307afOyDab
oEedZH60hzBmeEfENoqtpEW9sONaGbIHYkkSLG3Bd7P5ACGWJ0VqPBhrzsVSv60A
jkB/Rubw8FyezYX3Xb9DPa//goIz4rung/y+JEdVkruooIhian0rSNXABk5OSWS6
jTNCzpuUvTz7HC3KdYgru7Cs0KXq89loqJ1iAVG7ukC6usPXGvMDJh1xSkr9Fp7a
GNlCXFAKcgfT8WftjCjW4ot1yHXgcP9jATs8tpzu004lJFM0slFX5rOOAkKFryVI
QftG0GDKGRFMmrs0+fdwwhvbgKGyykIdQZOHqHFp4CmQtO4SuondyuY3Fzpw/Swf
uQJBi/V4RQvueX2tnh7u8XlVl0pLpXWgHlsCexdPpQsyOna0uHUR24qmzrHfk0bQ
6RGnh7oNTAQBztromaHLlmecKLAdP61NjwAkCTTB260gjwuRfuYOU1fls9lQZPHm
I7wbf1URSULwQ0I5pEFuo2Rz+p9vGxHpcSm2hL6g4120pgRaQL0SY1AqS2Gr3n+d
avsBtwzGW/0gOkxThUURHdab0xGppUGhoEN0SKGDFHYcANv2i30bc+qcy6irMxLX
iv6BrZv62UZf/qZXBNmY
=rR2P
-----END PGP SIGNATURE-----

--=-fNJNopdJ7UxoastPbrB1--
