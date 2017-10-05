Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RcePZrgI"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="U+PGzwN7"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y6tyf21VPzDqnG
 for <openbmc@lists.ozlabs.org>; Thu,  5 Oct 2017 11:32:40 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DCD6720CEB;
 Wed,  4 Oct 2017 20:32:37 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 04 Oct 2017 20:32:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=U1Wbu/JlQw0Y25uJt/HLMEwSDXMCMVfkt7yp6rKK1
 kA=; b=RcePZrgIFPQWYYWgL9m9TG3fwYhl7J0jY1fP5cQTyx/zWX9mVBX4smrki
 8oZ0RORwZxZ4HQxRPqU7NrFtre9N2h2scPWfXihlCX//tNXxttX72u+0VyrGyCDe
 gqbx75QHQ6oVFgn7LSp9C/Tuq4cqfLyc3cz2/l9iqWglv4LOIZ0bV7KFDxzB3Ok4
 PJwEVBAje9+rl2YRNkxC9jO6iIsMICQb6/cJNOkJdZm9mLnUl/+OkiYOKkQOrlKC
 yTfFzDonFTZyCl1qDLY+fduIRAjJKKR3kZZyoPr5GwTGl8cyJRqU9CQxVo8MJVcj
 JPITDx5sLkAPIBseHKo+LRzbKXJXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=U1Wbu/JlQw0Y25uJt/
 HLMEwSDXMCMVfkt7yp6rKK1kA=; b=U+PGzwN75TalwOUV4DAf41FMj72PcbgM3y
 EF/mh+qjD1xGHwNxhWgueOKaMF+0hHVKKJ2IlQV9e6eseiAGrak00sVB6SvNsP6o
 kaNfTaopShm38PEO9Raj9I7U/4YMPWXN9sRyfwzqOf9B0XjZWiJ4pHvFDpx3bNg/
 2CNUDgii6asxC5Nvh0j/rN1m9dqL0bBgaB1PkJBWX1hiWSM1S3JUFC9MsRx/Ey76
 Ox2TMzreVM+mD2G/a7Abbh4bBKh4ZfA3AJj55iQFpvsakSTSCEDotDr9yIEeKmQ1
 dX3PDR8kEfpUTF0HiTHx4Pm+1c1zhrZXKb5iTWkZVxrZN/Q39VyA==
X-ME-Sender: <xms:pX3VWav_IELid_o7aS9eD5UiwwD4yj6BeZgq8thEyMF6X5wZ-RRbHw>
X-Sasl-enc: N9jSoqTzyQrDpnFQJqS5COZbS9NHixRVNMlWBHM9zurM 1507163556
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9DDA724772;
 Wed,  4 Oct 2017 20:32:35 -0400 (EDT)
Message-ID: <1507163549.5452.42.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v2 2/9] drivers: fsi: SBEFIFO: Fix
 probe() and remove()
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Thu, 05 Oct 2017 11:02:29 +1030
In-Reply-To: <1506724868-13010-3-git-send-email-eajames@linux.vnet.ibm.com>
References: <1506724868-13010-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1506724868-13010-3-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-E11IGRD70dNLV93Z232U"
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
X-List-Received-Date: Thu, 05 Oct 2017 00:32:44 -0000


--=-E11IGRD70dNLV93Z232U
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-09-29 at 17:41 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Probe didn't handle a failed misc device registration properly. Remove
> had the potential for hangs. Also, remove the list of SBEFIFOs and
> instead just use the device "driver data" pointer.

What was the purpose of the list of SBEFIFOs? Are we losing something from =
the
intended design here? The list could be stored in the driver data pointer
right?

>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/fsi/fsi-sbefifo.c | 109 ++++++++++++++++++++++-------------=
-----------
> =C2=A01 file changed, 52 insertions(+), 57 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index a4cd353..fa34bd8 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -58,7 +58,6 @@ struct sbefifo {
> =C2=A0	struct fsi_device *fsi_dev;
> =C2=A0	struct miscdevice mdev;
> =C2=A0	wait_queue_head_t wait;
> -	struct list_head link;
> =C2=A0	struct list_head xfrs;
> =C2=A0	struct kref kref;
> =C2=A0	spinlock_t lock;
> @@ -96,8 +95,6 @@ struct sbefifo_client {
> =C2=A0	unsigned long f_flags;
> =C2=A0};
> =C2=A0
> -static struct list_head sbefifo_fifos;
> -
> =C2=A0static DEFINE_IDA(sbefifo_ida);
> =C2=A0
> =C2=A0static int sbefifo_inw(struct sbefifo *sbefifo, int reg, u32 *word)
> @@ -267,9 +264,12 @@ static struct sbefifo_xfr *sbefifo_enq_xfr(struct sb=
efifo_client *client)
> =C2=A0	struct sbefifo *sbefifo =3D client->dev;
> =C2=A0	struct sbefifo_xfr *xfr;
> =C2=A0
> +	if (READ_ONCE(sbefifo->rc))
> +		return ERR_PTR(sbefifo->rc);
> +
> =C2=A0	xfr =3D kzalloc(sizeof(*xfr), GFP_KERNEL);
> =C2=A0	if (!xfr)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
> =C2=A0
> =C2=A0	xfr->rbuf =3D &client->rbuf;
> =C2=A0	xfr->wbuf =3D &client->wbuf;
> @@ -490,7 +490,7 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0	}
> =C2=A0
> =C2=A0	sbefifo_put(sbefifo);
> -	wake_up(&sbefifo->wait);
> +	wake_up_interruptible(&sbefifo->wait);
> =C2=A0
> =C2=A0out_unlock:
> =C2=A0	spin_unlock(&sbefifo->lock);
> @@ -604,7 +604,7 @@ static ssize_t sbefifo_read_common(struct sbefifo_cli=
ent *client,
> =C2=A0		} else {
> =C2=A0			kfree(xfr);
> =C2=A0			list_del(&xfr->client);
> -			wake_up(&sbefifo->wait);
> +			wake_up_interruptible(&sbefifo->wait);
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> @@ -664,7 +664,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_cl=
ient *client,
> =C2=A0	}
> =C2=A0
> =C2=A0	xfr =3D sbefifo_enq_xfr(client);		/* this xfr queued up */
> -	if (!xfr) {
> +	if (IS_ERR(xfr)) {

Should this be in what is currently patch 0/9?

> =C2=A0		spin_unlock_irq(&sbefifo->lock);
> =C2=A0		ret =3D PTR_ERR(xfr);
> =C2=A0		goto out;
> @@ -766,18 +766,15 @@ static int sbefifo_release(struct inode *inode, str=
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
> @@ -850,69 +847,68 @@ static int sbefifo_probe(struct device *dev)
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
> =C2=A0		=C2=A0sbefifo->idx);
> -	init_waitqueue_head(&sbefifo->wait);
> -	INIT_LIST_HEAD(&sbefifo->xfrs);
> =C2=A0
> =C2=A0	/* This bit of silicon doesn't offer any interrupts... */
> =C2=A0	setup_timer(&sbefifo->poll_timer, sbefifo_poll_timer,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0(unsigned long)sbefifo);
> =C2=A0
> -	if (dev->of_node) {
> -		/* create platform devs for dts child nodes (occ, etc) */
> -		for_each_child_of_node(dev->of_node, np) {
> -			snprintf(child_name, sizeof(child_name), "%s-dev%d",
> -				=C2=A0sbefifo->name, child_idx++);
> -			child =3D of_platform_device_create(np, child_name, dev);
> -			if (!child)
> -				dev_warn(dev,
> -					=C2=A0"failed to create child node dev\n");
> -		}
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
> =C2=A0	}
> =C2=A0
> -	list_add(&sbefifo->link, &sbefifo_fifos);
> -=09
> -	return misc_register(&sbefifo->mdev);
> +	/* create platform devs for dts child nodes (occ, etc) */
> +	for_each_available_child_of_node(dev->of_node, np) {
> +		snprintf(child_name, sizeof(child_name), "%s-dev%d",
> +			=C2=A0sbefifo->name, child_idx++);
> +		child =3D of_platform_device_create(np, child_name, dev);
> +		if (!child)
> +			dev_warn(dev, "failed to create child %s dev\n",
> +				=C2=A0child_name);
> +	}
> +
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
> +	WRITE_ONCE(sbefifo->rc, -ENODEV);
> +	wake_up_interruptible_all(&sbefifo->wait);

If we're removing, we want to wake up non-interruptible tasks as well, so I
think wake_up_all() is more appropriate.

> =C2=A0
> -		device_for_each_child(dev, NULL, sbefifo_unregister_child);
> +	misc_deregister(&sbefifo->mdev);
> +	device_for_each_child(dev, NULL, sbefifo_unregister_child);
> =C2=A0
> -		misc_deregister(&sbefifo->mdev);
> -		list_del(&sbefifo->link);
> -		ida_simple_remove(&sbefifo_ida, sbefifo->idx);
> -
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
> =C2=A0
> -		wake_up(&sbefifo->wait);
> -		sbefifo_put(sbefifo);
> -	}
> +	sbefifo_put(sbefifo);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -937,7 +933,6 @@ static int sbefifo_remove(struct device *dev)
> =C2=A0
> =C2=A0static int sbefifo_init(void)
> =C2=A0{
> -	INIT_LIST_HEAD(&sbefifo_fifos);
> =C2=A0	return fsi_driver_register(&sbefifo_drv);
> =C2=A0}
> =C2=A0
--=-E11IGRD70dNLV93Z232U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1X2dAAoJEJ0dnzgO5LT5sHwP/3bCxyFSa68FeiGUMSUyi9rJ
3Yfxd1BL7ihQQbMzPAuJvlLcMHE6WQTab9yZX+k2ISEHWZwKv6OaXX6+WJ5nb58J
DvkwRRQV94Qvs0shyQ2oYw67OHhJjul0dy6NVUnjphu0YEE7QA+dydMN2NhGZ+nt
94+/v8PP5qrGlDBKmNPJXxQljLvPZXhFbW8CZ4jK68m6FsVwrO8TwPnE+T5WZCsZ
O26WUfxBlXGcJ0j53l2WyPfPckYOeiBbxYfmG2/MwkEfQF521CReSp33wLGLibBU
0rDd29OVYhHLH0oTJAU+6+cZsyatYvI0+KUFUIis3qfHvd80vwG+jr8KEQcMf5mM
ZCd70r3qC7szk6VroHXQVpLqhPHyZnOY2EpoUGL5W+BM40/c/QrX3Q+cJhkGCl17
MSsQiRoyBHczBE4D92tRfQN/JYO2OdyO1u/+aAOE9TLTNkSW8cqJdHuxdd1bhSed
TlAq8BfhlvYEsCWv0u+olstaPiOzt0SRuxV1YBY1iI2fVYMUooQznd6dwoFed/Uc
TSuuWqT4M9Mkgk+REJOcgScEkX77+Yc+sPACsosLEY0EX8y4ji2/d7kZSOgC992y
3YF1r8TEmp3qejvVPkNZ2BS5lMVzJc9RVtBW0gK6i49aAiVGFggwqZI7ms3X1usN
cR3ADOzM4uTDssI2VaGL
=4mXM
-----END PGP SIGNATURE-----

--=-E11IGRD70dNLV93Z232U--
