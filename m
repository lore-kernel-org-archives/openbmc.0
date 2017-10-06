Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="haVxztaH"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="OrRx/sGZ"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7YJt45lZzDqhg
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 13:20:46 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6BD0820BC7;
 Thu,  5 Oct 2017 22:20:44 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 22:20:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=C9j9exeCWdK5w53TWnAMcnXl+ihQnAjadejnH1yFV
 /s=; b=haVxztaHfT2KwtYLW1tq98Jv+k4Cc9pcCLHVIH22fjHwZRqhLPqOr8bVj
 dqq8cOHSECRFNhVra1Z9k0JmnUdu2jwlJ/bCznC4tafgcg3GubCYmYCqPH+oanzy
 hbAXd74R1xIdTPmYvpE4+BO4F4Vrx0NZHYP6bcGlVubXZI6E4vnrHvnCju9snyLB
 qY/ZSKTZxRn//Olbn2qwnvNL5EEqMjgjYQ981E73p0hmT5Wwfx/25B/fMgEn7f9w
 zwZ01qNWUKy16e+xMNeVb/pxClmqeWW/AIvsWrlAQ/Xm94ciNColpAMCfmQs9iMF
 0AMxJW7Cc7tvZDRC1gx1ph9BhB4cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=C9j9exeCWdK5w53TWn
 AMcnXl+ihQnAjadejnH1yFV/s=; b=OrRx/sGZFm1YW+w4tdRNp1TzhS2OCTDhBx
 t1PD6mqwmlTwAE15onOENbAEyzX/f+QogxUUCPkOMkkVpeDlY7SbsRGiVt1+0xQ0
 EAZDNOBc6F+Sh1mzM7E535O/IsIq8rrZ5re8GLKYotasVnxLM06sShRbSsfFJgZ1
 nBP5Flcqt//DdKmNFk/IqMeSsbcEnZLrxL9X3Tr+6aatfDBk/LIhnTGOX9/J8Lh5
 xCH39gaIalpYqnjZxXomVW1pp31yh6rvnJ/Tq6dDauN4TNTWHK11PwThqEtAkKIi
 iltp0PO51+6jI7J7q2o9NP4fVd0UHLaMAmrBU/bNXppQ11MUXAwQ==
X-ME-Sender: <xms:fOjWWaNcpmfMsNunxMtfd8zN0AMGc6k2NTMcGiosi16LD_TuHUVqWQ>
X-Sasl-enc: US+f6Y5TY8uR2hU0u3stsY4Zx0I48PDc19EQRGDr79At 1507256443
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5DDA67F9A9;
 Thu,  5 Oct 2017 22:20:42 -0400 (EDT)
Message-ID: <1507256439.5452.136.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v4 29/31] drivers: fsi: occ: Fix client
 memory management
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 12:50:39 +1030
In-Reply-To: <1507255553-13301-30-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507255553-13301-30-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-q8wvj5w+XgwSShwJcNWI"
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
X-List-Received-Date: Fri, 06 Oct 2017 02:20:47 -0000


--=-q8wvj5w+XgwSShwJcNWI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 21:05 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Potential for bad memory access in the worker function. Now fixed by
> using reference counters.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

This is hairy, but given the current design I understand the need. I feel t=
hat
ideas similar to I have for the SBEFIFO might be able to clean it up.=C2=A0

For the moment:

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/occ.c | 92 ++++++++++++++++++++++++++------------------=
-----------
> =C2=A01 file changed, 43 insertions(+), 49 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index ec42fc0..800e8b6 100644
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
> =C2=A0	struct occ_client *client =3D kzalloc(sizeof(*client), GFP_KERNEL)=
;
> @@ -148,6 +163,7 @@ static struct occ_client *occ_open_common(struct occ =
*occ, unsigned long flags)
> =C2=A0		return NULL;
> =C2=A0
> =C2=A0	client->occ =3D occ;
> +	kref_init(&client->kref);
> =C2=A0	spin_lock_init(&client->lock);
> =C2=A0	init_waitqueue_head(&client->wait);
> =C2=A0
> @@ -192,6 +208,7 @@ static ssize_t occ_read_common(struct occ_client *cli=
ent, char __user *ubuf,
> =C2=A0	if (len > OCC_SRAM_BYTES)
> =C2=A0		return -EINVAL;
> =C2=A0
> +	occ_get_client(client);
> =C2=A0	xfr =3D &client->xfr;
> =C2=A0	occ =3D client->occ;
> =C2=A0
> @@ -215,8 +232,6 @@ static ssize_t occ_read_common(struct occ_client *cli=
ent, char __user *ubuf,
> =C2=A0			goto done;
> =C2=A0		}
> =C2=A0
> -		set_bit(XFR_WAITING, &xfr->flags);
> -
> =C2=A0		spin_unlock_irq(&client->lock);
> =C2=A0
> =C2=A0		rc =3D wait_event_interruptible(client->wait,
> @@ -224,15 +239,12 @@ static ssize_t occ_read_common(struct occ_client *c=
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
> @@ -263,6 +275,7 @@ static ssize_t occ_read_common(struct occ_client *cli=
ent, char __user *ubuf,
> =C2=A0
> =C2=A0done:
> =C2=A0	spin_unlock_irq(&client->lock);
> +	occ_put_client(client);
> =C2=A0	return rc;
> =C2=A0}
> =C2=A0
> @@ -289,6 +302,7 @@ static ssize_t occ_write_common(struct occ_client *cl=
ient,
> =C2=A0	if (len > (OCC_CMD_DATA_BYTES + 3) || len < 3)
> =C2=A0		return -EINVAL;
> =C2=A0
> +	occ_get_client(client);
> =C2=A0	xfr =3D &client->xfr;
> =C2=A0
> =C2=A0	spin_lock_irq(&client->lock);
> @@ -340,6 +354,7 @@ static ssize_t occ_write_common(struct occ_client *cl=
ient,
> =C2=A0
> =C2=A0done:
> =C2=A0	spin_unlock_irq(&client->lock);
> +	occ_put_client(client);
> =C2=A0	return rc;
> =C2=A0}
> =C2=A0
> @@ -364,38 +379,26 @@ static int occ_release_common(struct occ_client *cl=
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
> +	wake_up_all(&client->wait);
> +
> +done:
> =C2=A0	spin_unlock_irq(&client->lock);
> +
> +	occ_put_client(client);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> @@ -601,7 +604,7 @@ static int occ_trigger_attn(struct device *sbefifo)
> =C2=A0
> =C2=A0static void occ_worker(struct work_struct *work)
> =C2=A0{
> -	int rc =3D 0, empty, waiting, canceled;
> +	int rc =3D 0, empty;
> =C2=A0	u16 resp_data_length;
> =C2=A0	unsigned long start;
> =C2=A0	const unsigned long timeout =3D msecs_to_jiffies(OCC_TIMEOUT_MS);
> @@ -624,6 +627,8 @@ static void occ_worker(struct work_struct *work)
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> +	client =3D to_client(xfr);
> +	occ_get_client(client);
> =C2=A0	resp =3D (struct occ_response *)xfr->buf;
> =C2=A0	set_bit(XFR_IN_PROGRESS, &xfr->flags);
> =C2=A0
> @@ -679,29 +684,18 @@ static void occ_worker(struct work_struct *work)
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
--=-q8wvj5w+XgwSShwJcNWI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1uh3AAoJEJ0dnzgO5LT5uZUP+QEjgPd+Byx8D9T80tKEWgZj
rLGWskBn4rtKmsGoEW1je63ybKMV6JZSWbeNJmTV4e8Rg/4P87G75QcVj8SXyPeN
921zWwtnO4/aGxAX2pcNAt8Oxc5Amjwte3NFtMT/x9/hAeLhdXFeua9g/brxj8qW
0bdUIdBukUbxSv9Gyhd+7E6AKiQszMH0h6POykG8PbFVHRsoH4vaB2r5d9EUvibm
xCeim0A4WP1+5QVb4jDOdBXnTGcldaVhQShsPgIbBoHJhKB6rOY+/HLINHzWELnO
UT9cxptjJr8xx3RL6xGv4TxAXGq9pT0CGrjAlFa7Sb7x+8mQa5oR0o3jpmfL+Y0i
pcdPYXTriis7d/f3lvVpcbIjul5l1i2GwXe5TzzyPxVI+5hB3qPtvnOdKjbw4RK+
ZMIEb7uSW++3h/c3lVUVjwIiw7UOMOlibrZzOtxGE8kHxVJfcw9K+gdiEBZ6CA4M
tlw64EgkoQsluosWplUFhSbST9hZ7Eaua+KLQ451xGBewloX7/yEgvs01SEbKa2F
pvFTBoifWw+8UEkfPEZaTxYfkVdMLeWWzCM6Olxi3eB4Nbk8oiSc55hpaq/Ltnkz
4NR1vlGhIfACAHYJEzYrC21Py4Fh0zLepPXOtxMLTG0+plOly0wI4DwN4ELHsp3c
qDpVTN1Q4gnWnDXZb620
=pM2r
-----END PGP SIGNATURE-----

--=-q8wvj5w+XgwSShwJcNWI--
