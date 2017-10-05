Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="R/Wdgvln"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="sQAvLNR4"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y6vrx5ml6zDqpD
 for <openbmc@lists.ozlabs.org>; Thu,  5 Oct 2017 12:12:49 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4CAE920D51;
 Wed,  4 Oct 2017 21:12:47 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 04 Oct 2017 21:12:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=fciPfjRyUCmOwu82u/DBwh7O6meaCqWP3bnJgzqCX
 Mc=; b=R/WdgvlnwsbFVlvdjg8LQRazBMUiOhCg2LOooGNn4uU3cA61SoGIS6xMq
 CCuvPhm1BPE4/xQ5eG4zLTbyBZkQ4Kyqp/RM0zvVy1HheF9hIFEb6hJoViQY1Wa0
 QKH5sWSjyyW0BzjXzo9q/dFEsSN6aZA0OX8+MhX1FU/d9q2WSR6FpvgAtiQqKF/e
 S54P7iNZAC+Ay7pAHTIo9vB/OEK4Ei+NWqEs6ymuew1fg8j5l+JQyb0QmNznhLV5
 yzbmzOhZPrGU9V+gD8SSjWT796eoO9WmmKJR7xdVvHUFVOFbk042nsaFKeKKG0Vw
 iyWeU9T4ztQUdacalvgMYPPWFbiow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=fciPfjRyUCmOwu82u/
 DBwh7O6meaCqWP3bnJgzqCXMc=; b=sQAvLNR4Wkx6sEmAhwJH/Yc9Uintb3oPSp
 X/6eyzsgrChxxcJ5AoXjqnU/V5srYuA5zvLPdxJ8mW5Q/f+/f7tvpWfHnl393+LG
 aXCT+wjJFGSgTFaHrCgmrT/G/dhnurRppY7Obj9r4nEJNUp80loJ47ZB93FsFdZt
 H4j5ILFptkv9gHstp8I5lxed1LmOTqyXfr8zEBpMcIZacI4tfEwjL8TeF8IExJy9
 jbDnbfg+btP4shR1Dciolvvjm4wqSFRYsoXV/EdI1PAW5ikWgs5f4W23PZQ4/1Hk
 ZbS0jF1AcGTObfovRymIj7kihszlaX2D8yRuLLI+FhCXatwP8JDg==
X-ME-Sender: <xms:D4fVWfJWlJaTOZx_oND4PQLytVi7-bFkSFhGx_9Akp--gqE3uPxhZg>
X-Sasl-enc: NUB7InUqHIIuXj4z8Zs4FUdwAix5nSYNS19OuyxP6XV5 1507165966
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 362BC2486C;
 Wed,  4 Oct 2017 21:12:44 -0400 (EDT)
Message-ID: <1507165961.5452.51.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v2 7/9] drivers: fsi: occ: Fix client
 memory management
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Thu, 05 Oct 2017 11:42:41 +1030
In-Reply-To: <1506724868-13010-8-git-send-email-eajames@linux.vnet.ibm.com>
References: <1506724868-13010-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1506724868-13010-8-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-ON8emnaZ0Mz7BX1xXABh"
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
X-List-Received-Date: Thu, 05 Oct 2017 01:12:50 -0000


--=-ON8emnaZ0Mz7BX1xXABh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-09-29 at 17:41 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Potential for bad memory access in the worker function. Now fixed by
> using reference counters.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/fsi/occ.c | 92 ++++++++++++++++++++++++++------------------=
-----------
> =C2=A01 file changed, 43 insertions(+), 49 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index 550ae11..c3d9976 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -70,15 +70,11 @@ struct occ_response {
> =C2=A0 *=C2=A0=C2=A0and cleared if the transfer fails or occ_worker_getsr=
am completes.
> =C2=A0 * XFR_COMPLETE is set when a transfer fails or finishes occ_worker=
_getsram.
> =C2=A0 * XFR_CANCELED is set when the transfer's client is released.
> - * XFR_WAITING is set from read() if the transfer isn't complete and
> - *=C2=A0=C2=A0O_NONBLOCK wasn't specified. Cleared in read() when transf=
er completes or
> - *=C2=A0=C2=A0fails.
> =C2=A0 */
> =C2=A0enum {
> =C2=A0	XFR_IN_PROGRESS,
> =C2=A0	XFR_COMPLETE,
> =C2=A0	XFR_CANCELED,
> -	XFR_WAITING,
> =C2=A0};
> =C2=A0
> =C2=A0struct occ_xfr {
> @@ -104,6 +100,7 @@ enum {
> =C2=A0};
> =C2=A0
> =C2=A0struct occ_client {
> +	struct kref kref;
> =C2=A0	struct occ *occ;
> =C2=A0	struct occ_xfr xfr;
> =C2=A0	spinlock_t lock;		/* lock access to the client state */
> @@ -140,6 +137,24 @@ static int occ_enqueue_xfr(struct occ_xfr *xfr)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static void occ_get_client(struct occ_client *client)
> +{
> +	kref_get(&client->kref);
> +}
> +
> +static void occ_client_release(struct kref *kref)
> +{
> +	struct occ_client *client =3D container_of(kref, struct occ_client,
> +						=C2=A0kref);
> +
> +	kfree(client);
> +}
> +
> +static void occ_put_client(struct occ_client *client)
> +{
> +	kref_put(&client->kref, occ_client_release);
> +}
> +
> =C2=A0static struct occ_client *occ_open_common(struct occ *occ, unsigned=
 long flags)
> =C2=A0{
> =C2=A0	struct occ_client *client;
> @@ -152,6 +167,7 @@ static struct occ_client *occ_open_common(struct occ =
*occ, unsigned long flags)
> =C2=A0		return ERR_PTR(-ENOMEM);
> =C2=A0
> =C2=A0	client->occ =3D occ;
> +	kref_init(&client->kref);
> =C2=A0	spin_lock_init(&client->lock);
> =C2=A0	init_waitqueue_head(&client->wait);
> =C2=A0
> @@ -187,6 +203,7 @@ static ssize_t occ_read_common(struct occ_client *cli=
ent, char __user *ubuf,
> =C2=A0	if (len > OCC_SRAM_BYTES)
> =C2=A0		return -EINVAL;
> =C2=A0
> +	occ_get_client(client);
> =C2=A0	spin_lock_irq(&client->lock);
> =C2=A0
> =C2=A0	if (!test_bit(CLIENT_XFR_PENDING, &client->flags)) {
> @@ -207,8 +224,6 @@ static ssize_t occ_read_common(struct occ_client *cli=
ent, char __user *ubuf,
> =C2=A0			goto done;
> =C2=A0		}
> =C2=A0
> -		set_bit(XFR_WAITING, &xfr->flags);
> -
> =C2=A0		spin_unlock_irq(&client->lock);
> =C2=A0
> =C2=A0		rc =3D wait_event_interruptible(client->wait,
> @@ -220,15 +235,12 @@ static ssize_t occ_read_common(struct occ_client *c=
lient, char __user *ubuf,
> =C2=A0
> =C2=A0		spin_lock_irq(&client->lock);
> =C2=A0
> -		if (test_bit(XFR_CANCELED, &xfr->flags)) {
> -			spin_unlock_irq(&client->lock);
> -			kfree(client);
> -			return -EBADFD;
> -		}
> -
> -		clear_bit(XFR_WAITING, &xfr->flags);
> =C2=A0		if (!test_bit(XFR_COMPLETE, &xfr->flags)) {
> -			rc =3D -EINTR;
> +			if (occ->cancel || test_bit(XFR_CANCELED, &xfr->flags))
> +				rc =3D -ECANCELED;
> +			else
> +				rc =3D -EINTR;
> +
> =C2=A0			goto done;
> =C2=A0		}
> =C2=A0	}
> @@ -259,6 +271,7 @@ static ssize_t occ_read_common(struct occ_client *cli=
ent, char __user *ubuf,
> =C2=A0
> =C2=A0done:
> =C2=A0	spin_unlock_irq(&client->lock);
> +	occ_put_client(client);
> =C2=A0	return rc;
> =C2=A0}
> =C2=A0
> @@ -282,6 +295,7 @@ static ssize_t occ_write_common(struct occ_client *cl=
ient,
> =C2=A0	if (len > (OCC_CMD_DATA_BYTES + 3) || len < 3)
> =C2=A0		return -EINVAL;
> =C2=A0
> +	occ_get_client(client);
> =C2=A0	spin_lock_irq(&client->lock);
> =C2=A0
> =C2=A0	if (test_bit(CLIENT_XFR_PENDING, &client->flags)) {
> @@ -330,6 +344,7 @@ static ssize_t occ_write_common(struct occ_client *cl=
ient,
> =C2=A0
> =C2=A0done:
> =C2=A0	spin_unlock_irq(&client->lock);
> +	occ_put_client(client);
> =C2=A0	return rc;
> =C2=A0}
> =C2=A0
> @@ -348,38 +363,26 @@ static int occ_release_common(struct occ_client *cl=
ient)
> =C2=A0
> =C2=A0	spin_lock_irq(&client->lock);
> =C2=A0
> -	if (!test_bit(CLIENT_XFR_PENDING, &client->flags)) {
> -		spin_unlock_irq(&client->lock);
> -		kfree(client);
> -		return 0;
> -	}
> +	set_bit(XFR_CANCELED, &xfr->flags);
> +	if (!test_bit(CLIENT_XFR_PENDING, &client->flags))
> +		goto done;
> =C2=A0
> =C2=A0	spin_lock_irq(&occ->list_lock);
> =C2=A0
> -	set_bit(XFR_CANCELED, &xfr->flags);
> =C2=A0	if (!test_bit(XFR_IN_PROGRESS, &xfr->flags)) {
> =C2=A0		/* already deleted from list if complete */
> =C2=A0		if (!test_bit(XFR_COMPLETE, &xfr->flags))
> =C2=A0			list_del(&xfr->link);
> -
> -		spin_unlock_irq(&occ->list_lock);
> -
> -		if (test_bit(XFR_WAITING, &xfr->flags)) {
> -			/* blocking read; let reader clean up */
> -			wake_up_interruptible(&client->wait);
> -			spin_unlock_irq(&client->lock);
> -			return 0;
> -		}
> -
> -		spin_unlock_irq(&client->lock);
> -
> -		kfree(client);
> -		return 0;
> =C2=A0	}
> =C2=A0
> -	/* operation is in progress; let worker clean up */
> =C2=A0	spin_unlock_irq(&occ->list_lock);
> +
> +	wake_up_interruptible(&client->wait);

I think we we want to be doing wake_up_all() here too?

Andrew

> +
> +done:
> =C2=A0	spin_unlock_irq(&client->lock);
> +
> +	occ_put_client(client);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> @@ -582,7 +585,7 @@ static int occ_trigger_attn(struct device *sbefifo)
> =C2=A0
> =C2=A0static void occ_worker(struct work_struct *work)
> =C2=A0{
> -	int rc =3D 0, empty, waiting, canceled;
> +	int rc =3D 0, empty;
> =C2=A0	u16 resp_data_length;
> =C2=A0	unsigned long start;
> =C2=A0	const unsigned long timeout =3D msecs_to_jiffies(OCC_TIMEOUT_MS);
> @@ -605,6 +608,8 @@ static void occ_worker(struct work_struct *work)
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> +	client =3D to_client(xfr);
> +	occ_get_client(client);
> =C2=A0	resp =3D (struct occ_response *)xfr->buf;
> =C2=A0	set_bit(XFR_IN_PROGRESS, &xfr->flags);
> =C2=A0
> @@ -660,29 +665,18 @@ static void occ_worker(struct work_struct *work)
> =C2=A0	mutex_unlock(&occ->occ_lock);
> =C2=A0
> =C2=A0	xfr->rc =3D rc;
> -	client =3D to_client(xfr);
> -
> -	/* lock client to prevent race with read() */
> -	spin_lock_irq(&client->lock);
> -
> =C2=A0	set_bit(XFR_COMPLETE, &xfr->flags);
> -	waiting =3D test_bit(XFR_WAITING, &xfr->flags);
> -
> -	spin_unlock_irq(&client->lock);
> =C2=A0
> =C2=A0	spin_lock_irq(&occ->list_lock);
> =C2=A0
> =C2=A0	clear_bit(XFR_IN_PROGRESS, &xfr->flags);
> =C2=A0	list_del(&xfr->link);
> =C2=A0	empty =3D list_empty(&occ->xfrs);
> -	canceled =3D test_bit(XFR_CANCELED, &xfr->flags);
> =C2=A0
> =C2=A0	spin_unlock_irq(&occ->list_lock);
> =C2=A0
> -	if (waiting)
> -		wake_up_interruptible(&client->wait);
> -	else if (canceled)
> -		kfree(client);
> +	wake_up_interruptible(&client->wait);
> +	occ_put_client(client);
> =C2=A0
> =C2=A0	if (!empty)
> =C2=A0		goto again;
--=-ON8emnaZ0Mz7BX1xXABh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1YcJAAoJEJ0dnzgO5LT5obMP/RtQI1knQHlQLeIG+/ORoSIa
2uHRneI5U9leVlg1LHUHJA/mRB+l6STBRnl6+qcOFYoQVmRKEXvXzgQighFJxv5n
SQOJGE8qCFGWWHv5QcukdvpnytbfN33mwftmB2N3w8balXf+wQy1eQlrmB61y65D
mfwxo1hx63MQdFiehfqTD+AFQMUVCmBd6vJdwkgZ0ADZ5mcqMqAdHRWinQzNwEQL
LbADIn1SwvMWgHB4A9s5vElw45sIc7SQG0zSq7OXFJN0wzfxiOMVMUcfC/yROJX9
+r1lRjF/AxSjE5O7nn797yzLScsrMDkhiWHt6reIwdVMTM7Dua8FR+UkMns+OD85
eeCQrud0QnkyDqZO2W4j3SyKm2V4t8gKcPbsSdVzVvJB4rIlMnsZSHwmTVrExZ5v
HGDZtVoiK12Q5xNRouxAJZrDqeSewpS4K+Bsb4vk/DXeupHWG1xeD0jdoS+J+3Zy
SLWJG3wHt1XsKd3B8qWYYd9Ne68Jy5F52tJZe8jJnrIH3uk43vrzRSiQ7zrpTQ6t
A/q7XX+xaYMz3GtRaqk5KSHF58TKCpaa2I7WjVrjtiKT4B/XhHa81+k6I0mw+9uo
lP3oTzpDPTl0hmsfMS9ia3gvh0VPO6wlCgFmReFf+KRI5a2solik0UzEMPn9u1QM
IZ46Q87e0UUjT3GL/D7D
=tce/
-----END PGP SIGNATURE-----

--=-ON8emnaZ0Mz7BX1xXABh--
