Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="UpKYvzGl"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Y2TgwNSF"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y6tDN0S6RzDr01
 for <openbmc@lists.ozlabs.org>; Thu,  5 Oct 2017 10:59:31 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5B66420C21;
 Wed,  4 Oct 2017 19:59:29 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 04 Oct 2017 19:59:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=urkLYnJydqUcDMqWzKjBg2Tdk74Oeo96e6bDe4fpR
 wI=; b=UpKYvzGlAB79RZhp5IVUpdFiIGc7IsN0Q4C8be7vQo/xvz9TinmROMW3A
 GcJkF/zeOzf0KKISol5mXNZq3px6vLndcLHZWCB5uK4m4prEnaHcx1u8sxPC+PrX
 Ezud5aG1EUAw9M7CVHPyjrw2+L54DMrlPVFGwUm2N0UKQYyMr6f4RlN2UhONSwQs
 bFFd5IM/yd754AYMRYMWvryrCVAhT6k59y41T+rIoM4of0491b8JYMNdKfwGVzz2
 HJRx8w0NgeOs7789nHsKAwA2zhCYkJ6aiICVRbBe3mjTw5Eyk2Ys662Q8p4XbtcT
 3iiXpjm9TJGkB8NpoRN8frEeIDuJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=urkLYnJydqUcDMqWzK
 jBg2Tdk74Oeo96e6bDe4fpRwI=; b=Y2TgwNSF23VyhXyp4UbG8Ukt6u1K5Ij5MU
 MIZdj7G17KwFex5+FW1swOpMrOkB2J/af5vfx/bkKMIXQnQFeibvHH5H0HIbSVQT
 dSMUw/QhiCghCVkgmegXqhClAheCTBmMmtj68sy7TvAh51k9x4o+IeBquk4VZw8O
 rmJqkc/CS/EcFZc6D7tWxdeZQ58suBlZ6ZrBjEF7lz6nn5WyJ0CVAfeBruXfyXOW
 3vIzpaPp6KWd9C0XfGFtxsXLLkVKWTWsV/22ZAw9w1TvNkGza7t7zznXXIqHDBQM
 Zbti6roY20uIWJ9Fy5uIzU0ek8eS8VBOmHLBWj9M31jWTIoqKUtA==
X-ME-Sender: <xms:4XXVWWAJYuiMzbSY_3u3t6fmx124DxpT0jEsC5gL4o0hQ8ghmQnmDg>
X-Sasl-enc: gN5eW7pTs3S4mrrGmrcKuNQ6t8+RZfTQ2Fpj4Btap10J 1507161568
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4ED2024870;
 Wed,  4 Oct 2017 19:59:26 -0400 (EDT)
Message-ID: <1507161563.5452.39.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v2 1/9] drivers: fsi: SBEFIFO: General
 clean-up
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Thu, 05 Oct 2017 10:29:23 +1030
In-Reply-To: <1506724868-13010-2-git-send-email-eajames@linux.vnet.ibm.com>
References: <1506724868-13010-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1506724868-13010-2-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-8zjAFH3cZ7t0axF7AwTD"
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
X-List-Received-Date: Wed, 04 Oct 2017 23:59:32 -0000


--=-8zjAFH3cZ7t0axF7AwTD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-09-29 at 17:41 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Correct formatting and improve the flow a bit. Remove warnings for
> offset in read/write functions, and remove the user pointer verification
> since the copy_from/to_user will do that anyway. Correct the include
> guards in the header file.

This is similar to what I complained about last time, just without bullet
points in the description.

I tried to read the diff but really struggled to make sense of it. Keeping
track of the added/removed/changed functions - amongst formatting and contr=
ol
flow changes - to decide whether they were appropriate is just *really*
difficult, and I can't say with confidence that as a whole this patch is ok=
ay.

So, apologies, but I don't plan on acking this as it stands, and I don't th=
ink
it should be submitted unless several people are ready to weld Tested-by ta=
gs
to it.

Andrew

>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/fsi/fsi-sbefifo.c=C2=A0=C2=A0=C2=A0| 207 ++++++++++++++++++=
+++++++-------------------
> =C2=A0include/linux/fsi-sbefifo.h |=C2=A0=C2=A0=C2=A06 +-
> =C2=A02 files changed, 119 insertions(+), 94 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index 1c37ff7..a4cd353 100644
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
> @@ -44,6 +51,8 @@
> =C2=A0#define=C2=A0=C2=A0=C2=A0SBEFIFO_EOT_MAGIC		0xffffffff
> =C2=A0#define SBEFIFO_EOT_ACK		0x14
> =C2=A0
> +#define SBEFIFO_RESCHEDULE	msecs_to_jiffies(500)
> +
> =C2=A0struct sbefifo {
> =C2=A0	struct timer_list poll_timer;
> =C2=A0	struct fsi_device *fsi_dev;
> @@ -94,7 +103,7 @@ struct sbefifo_client {
> =C2=A0static int sbefifo_inw(struct sbefifo *sbefifo, int reg, u32 *word)
> =C2=A0{
> =C2=A0	int rc;
> -	u32 raw_word;
> +	__be32 raw_word;
> =C2=A0
> =C2=A0	rc =3D fsi_device_read(sbefifo->fsi_dev, reg, &raw_word,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sizeof(raw_word));
> @@ -102,17 +111,19 @@ static int sbefifo_inw(struct sbefifo *sbefifo, int=
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
> @@ -136,7 +147,7 @@ static int sbefifo_ack_eot(struct sbefifo *sbefifo)
> =C2=A0		return ret;
> =C2=A0
> =C2=A0	return sbefifo_outw(sbefifo, SBEFIFO_DWN | SBEFIFO_EOT_ACK,
> -			SBEFIFO_EOT_MAGIC);
> +			=C2=A0=C2=A0=C2=A0=C2=A0SBEFIFO_EOT_MAGIC);
> =C2=A0}
> =C2=A0
> =C2=A0static size_t sbefifo_dev_nwreadable(u32 sts)
> @@ -210,6 +221,7 @@ static bool sbefifo_buf_readnb(struct sbefifo_buf *bu=
f, size_t n)
> =C2=A0		rpos =3D buf->buf;
> =C2=A0
> =C2=A0	WRITE_ONCE(buf->rpos, rpos);
> +
> =C2=A0	return rpos =3D=3D wpos;
> =C2=A0}
> =C2=A0
> @@ -229,14 +241,14 @@ static bool sbefifo_buf_wrotenb(struct sbefifo_buf =
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
> @@ -349,6 +352,7 @@ static struct sbefifo_xfr *sbefifo_next_xfr(struct sb=
efifo *sbefifo)
> =C2=A0			kfree(xfr);
> =C2=A0			continue;
> =C2=A0		}
> +
> =C2=A0		return xfr;
> =C2=A0	}
> =C2=A0
> @@ -370,7 +374,7 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0
> =C2=A0	spin_lock(&sbefifo->lock);
> =C2=A0	xfr =3D list_first_entry_or_null(&sbefifo->xfrs, struct sbefifo_xf=
r,
> -			xfrs);
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0xfrs);
> =C2=A0	if (!xfr)
> =C2=A0		goto out_unlock;
> =C2=A0
> @@ -388,8 +392,7 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0
> =C2=A0	=C2=A0/* Drain the write buffer. */
> =C2=A0	while ((bufn =3D sbefifo_buf_nbreadable(wbuf))) {
> -		ret =3D sbefifo_inw(sbefifo, SBEFIFO_UP | SBEFIFO_STS,
> -				&sts);
> +		ret =3D sbefifo_inw(sbefifo, SBEFIFO_UP | SBEFIFO_STS, &sts);
> =C2=A0		if (ret)
> =C2=A0			goto out;
> =C2=A0
> @@ -397,7 +400,7 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0		if (devn =3D=3D 0) {
> =C2=A0			/* No open slot for write.=C2=A0=C2=A0Reschedule. */
> =C2=A0			sbefifo->poll_timer.expires =3D jiffies +
> -				msecs_to_jiffies(500);
> +				SBEFIFO_RESCHEDULE;
> =C2=A0			add_timer(&sbefifo->poll_timer);
> =C2=A0			goto out_unlock;
> =C2=A0		}
> @@ -414,9 +417,8 @@ static void sbefifo_poll_timer(unsigned long data)
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
> @@ -438,7 +440,7 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0		if (devn =3D=3D 0) {
> =C2=A0			/* No data yet.=C2=A0=C2=A0Reschedule. */
> =C2=A0			sbefifo->poll_timer.expires =3D jiffies +
> -				msecs_to_jiffies(500);
> +				SBEFIFO_RESCHEDULE;
> =C2=A0			add_timer(&sbefifo->poll_timer);
> =C2=A0			goto out_unlock;
> =C2=A0		}
> @@ -466,7 +468,7 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0			set_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags);
> =C2=A0			list_del(&xfr->xfrs);
> =C2=A0			if (unlikely(test_bit(SBEFIFO_XFR_CANCEL,
> -							&xfr->flags)))
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&xfr->flags)))
> =C2=A0				kfree(xfr);
> =C2=A0			break;
> =C2=A0		}
> @@ -476,7 +478,7 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0	if (unlikely(ret)) {
> =C2=A0		sbefifo->rc =3D ret;
> =C2=A0		dev_err(&sbefifo->fsi_dev->dev,
> -				"Fatal bus access failure: %d\n", ret);
> +			"Fatal bus access failure: %d\n", ret);
> =C2=A0		list_for_each_entry(xfr, &sbefifo->xfrs, xfrs)
> =C2=A0			kfree(xfr);
> =C2=A0		INIT_LIST_HEAD(&sbefifo->xfrs);
> @@ -497,7 +499,7 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0static int sbefifo_open(struct inode *inode, struct file *file)
> =C2=A0{
> =C2=A0	struct sbefifo *sbefifo =3D container_of(file->private_data,
> -			struct sbefifo, mdev);
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sbefifo, mdev);
> =C2=A0	struct sbefifo_client *client;
> =C2=A0	int ret;
> =C2=A0
> @@ -535,6 +537,16 @@ static unsigned int sbefifo_poll(struct file *file, =
poll_table *wait)
> =C2=A0	return mask;
> =C2=A0}
> =C2=A0
> +static bool sbefifo_read_ready(struct sbefifo *sbefifo,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sbefifo_client *clie=
nt, size_t *n,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0size_t *ret)
> +{
> +	*n =3D sbefifo_buf_nbreadable(&client->rbuf);
> +	*ret =3D READ_ONCE(sbefifo->rc);
> +
> +	return *ret || *n;
> +}
> +
> =C2=A0static ssize_t sbefifo_read_common(struct sbefifo_client *client,
> =C2=A0				=C2=A0=C2=A0=C2=A0char __user *ubuf, char *kbuf, size_t len)
> =C2=A0{
> @@ -551,30 +563,37 @@ static ssize_t sbefifo_read_common(struct sbefifo_c=
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
> +							&n, &ret))) {
> +		ret =3D -ERESTARTSYS;
> +		goto out;
> =C2=A0	}
> +
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
> +			WARN_ONCE(1, "no xfr in queue");
> +			goto out;
> +		}
> +
> =C2=A0		if (!test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags)) {
> =C2=A0			/*
> =C2=A0			=C2=A0* Fill the read buffer back up.
> @@ -589,22 +608,31 @@ static ssize_t sbefifo_read_common(struct sbefifo_c=
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
> @@ -612,6 +640,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_cl=
ient *client,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0size_t len)
> =C2=A0{
> =C2=A0	struct sbefifo *sbefifo =3D client->dev;
> +	struct sbefifo_buf *wbuf =3D &client->wbuf;
> =C2=A0	struct sbefifo_xfr *xfr;
> =C2=A0	ssize_t ret =3D 0;
> =C2=A0	size_t n;
> @@ -622,24 +651,26 @@ static ssize_t sbefifo_write_common(struct sbefifo_=
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
> +	xfr =3D sbefifo_enq_xfr(client);		/* this xfr queued up */
> =C2=A0	if (!xfr) {
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
> @@ -647,49 +678,47 @@ static ssize_t sbefifo_write_common(struct sbefifo_=
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
> +
> =C2=A0		if (sbefifo->rc) {
> =C2=A0			INIT_LIST_HEAD(&client->xfrs);
> -			sbefifo_put_client(client);
> -			return sbefifo->rc;
> +			ret =3D sbefifo->rc;
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
> @@ -702,21 +731,16 @@ static ssize_t sbefifo_write_common(struct sbefifo_=
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
> @@ -802,29 +826,27 @@ static int sbefifo_probe(struct device *dev)
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
> @@ -837,13 +859,13 @@ static int sbefifo_probe(struct device *dev)
> =C2=A0
> =C2=A0	sbefifo->idx =3D ida_simple_get(&sbefifo_ida, 1, INT_MAX, GFP_KERN=
EL);
> =C2=A0	snprintf(sbefifo->name, sizeof(sbefifo->name), "sbefifo%d",
> -			sbefifo->idx);
> +		=C2=A0sbefifo->idx);
> =C2=A0	init_waitqueue_head(&sbefifo->wait);
> =C2=A0	INIT_LIST_HEAD(&sbefifo->xfrs);
> =C2=A0
> =C2=A0	/* This bit of silicon doesn't offer any interrupts... */
> =C2=A0	setup_timer(&sbefifo->poll_timer, sbefifo_poll_timer,
> -			(unsigned long)sbefifo);
> +		=C2=A0=C2=A0=C2=A0=C2=A0(unsigned long)sbefifo);
> =C2=A0
> =C2=A0	if (dev->of_node) {
> =C2=A0		/* create platform devs for dts child nodes (occ, etc) */
> @@ -852,7 +874,7 @@ static int sbefifo_probe(struct device *dev)
> =C2=A0				=C2=A0sbefifo->name, child_idx++);
> =C2=A0			child =3D of_platform_device_create(np, child_name, dev);
> =C2=A0			if (!child)
> -				dev_warn(&sbefifo->fsi_dev->dev,
> +				dev_warn(dev,
> =C2=A0					=C2=A0"failed to create child node dev\n");
> =C2=A0		}
> =C2=A0	}
> @@ -922,10 +944,13 @@ static int sbefifo_init(void)
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
--=-8zjAFH3cZ7t0axF7AwTD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1XXbAAoJEJ0dnzgO5LT5QcUP/itr+FTArwC5tA/mf4Jz3gbk
gcKTT4UPLe7O6SHYIhxuflcpLJGnKCxfjHRdlcii8H8K9wn4GAg9Zmnv1RgLhJab
DRZjvpoeCm8zNeMb/YwaOJX+KGJsDfPWjiyWKiDdzaL4e/Kq0jiFB61pHoxTH4QS
VdfP5jeq3YS83vRLgSNDnrAEiSgXfTTQNFYdveJ3rU/m5JjXhDt0RV0wKQ8bhwF7
SGXdQePTR01o8Bu8nXj0aYkpN3xz3JHNGCFG/2yDpM0nFeLUlGCWlUSfPsQvbQTq
mekrNHXlEaaAt+SqUqH5ABujvZMRE2Ck4kKhoM7E4mZFkiIklwb75ipPuUxqUjZF
kDp3V2hZT/ve6hJEFWn7GK8L47XLq5ansuFXd1boOQ+2R6ZeQs2JpeL3RLpGuzOW
tkpvAxUEeyZdwKnBiJf9y5gMhWaYViYT90WArSjNAq5syGIUYS48NfveW0zDq8Ac
Z4HeUG+Lg3umvDgKq3Y8fJh9eUXh6UQkz4p1/iIjkkYpQKmYAbfjRoEobNQXv5X8
SeprWKpWLrotngq6jzen5rAD5kgHFrlsrQHTJtSRgRbDL+zXLnzKLsFpqWfdqckL
EzhdZvANJNS19RkD2+a8nS8F7HyXlm+nuyGAiFOO/IuXNC26X2wPQBa7B2TsM/Xl
cIYwxtYQhY6To2H9frcG
=CpdE
-----END PGP SIGNATURE-----

--=-8zjAFH3cZ7t0axF7AwTD--
