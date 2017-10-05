Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="QJ004EG9"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="BXTmi87k"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7SbR0qXLzDqhg
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 09:48:02 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id ED3E320BC4;
 Thu,  5 Oct 2017 18:47:59 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 18:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=gWedtfJVIb0UCtt/+cweaUeCT42kDiTM0fok42+Ez
 A8=; b=QJ004EG9PmlQSr3zb8kS8pBjPMwH9pfTlmCG3fuymwAl8WKtUHqE6UnfZ
 jTrQYFxkerbA3IDxeDahcRKdD+aY0chxPeMUJSsQNacNnq/azT42NIApftlAv0Jd
 rzmV4iV+pRyuvVk4e1vZIIE26f/4BrlY1LsVUZ83/BLo3NXtrI5ego2nOKnXKjtC
 H+HtCd4LMTo3w1RkR8VPEP3N3iwOJYBppHlst9iCyIyx917fRNrnUw4ouMfN5I49
 lmFbxNwE1Mo7GcKti03InZ/nTMmwJcXOGlOTfElJ/nd+Pp7yBxxoQp6VhXDppJbI
 j2ORjjYAk7CLDzGbJ7iK3hrbROEDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=gWedtfJVIb0UCtt/+c
 weaUeCT42kDiTM0fok42+EzA8=; b=BXTmi87kejzXmOgJ1MG81K4V9Ms4sp4v8A
 fUGPSMX4icu3r0bQEnQ/PRsv41Qr1D3h7w6iTGOgU5ZQzHib/IzxjTeaeSIejl0g
 j95pBE4zORVZ864MB3UmIB9FolhNhaJKkrZfsbkZzICELgXq0b/09sAMq8ciezcW
 e+Ogk602Ym35PFRyzGN/z47z84y0/B6t4BRrxAZQF/+vNVYbGuBPKg+gDsgTH5B2
 3SJ/diuVf6r4eaT9v8plIIqtSS9ZRWk+Kiq/qvanT+80rSUbkT5NN9DMJxCLj9xC
 IyPxM9pTAKAzMRXrZVUv33FHRJHmNVhZWok0fdqazwd8rXP+dxgw==
X-ME-Sender: <xms:n7bWWZ-rPIxIuhptuDoXpJ5oeun8c_zKmktFl-QOHVJqoHods9SgOQ>
X-Sasl-enc: /q+zjZx8BSYORCGF53fTG8X2sTHkEBsx+jS1iLvux2HE 1507243679
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0E80824A6C;
 Thu,  5 Oct 2017 18:47:57 -0400 (EDT)
Message-ID: <1507243672.5452.94.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 13/31] drivers: fsi: SBEFIFO: Fix
 probe() and remove()
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 09:17:52 +1030
In-Reply-To: <1507231464-13635-14-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-14-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-aaKDyhHHwK8+JBK/0Lq2"
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
X-List-Received-Date: Thu, 05 Oct 2017 22:48:04 -0000


--=-aaKDyhHHwK8+JBK/0Lq2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Probe didn't handle a failed misc device registration properly. Remove
> had the potential for hangs. Also, remove the list of SBEFIFOs and
> instead just use the device "driver data" pointer.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/fsi-sbefifo.c | 111 ++++++++++++++++++++++-------------=
-----------
> =C2=A01 file changed, 53 insertions(+), 58 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index a2acf76..9b560ec 100644
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
> @@ -605,7 +605,7 @@ static ssize_t sbefifo_read_common(struct sbefifo_cli=
ent *client,
> =C2=A0		} else {
> =C2=A0			kfree(xfr);
> =C2=A0			list_del(&xfr->client);
> -			wake_up(&sbefifo->wait);
> +			wake_up_interruptible(&sbefifo->wait);
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> @@ -664,9 +664,9 @@ static ssize_t sbefifo_write_common(struct sbefifo_cl=
ient *client,
> =C2=A0	}
> =C2=A0
> =C2=A0	xfr =3D sbefifo_enq_xfr(client);		/* this xfr queued up */
> -	if (!xfr) {
> +	if (IS_ERR(xfr)) {
> =C2=A0		spin_unlock_irq(&sbefifo->lock);
> -		ret =3D -ENOMEM;
> +		ret =3D PTR_ERR(xfr);
> =C2=A0		goto out;
> =C2=A0	}
> =C2=A0
> @@ -769,18 +769,15 @@ static int sbefifo_release(struct inode *inode, str=
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
> @@ -854,69 +851,68 @@ static int sbefifo_probe(struct device *dev)
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
> +	wake_up_all(&sbefifo->wait);
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
> @@ -941,7 +937,6 @@ static int sbefifo_remove(struct device *dev)
> =C2=A0
> =C2=A0static int sbefifo_init(void)
> =C2=A0{
> -	INIT_LIST_HEAD(&sbefifo_fifos);
> =C2=A0	return fsi_driver_register(&sbefifo_drv);
> =C2=A0}
> =C2=A0
--=-aaKDyhHHwK8+JBK/0Lq2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1raYAAoJEJ0dnzgO5LT5Ga0P/2wgWmW4PO/4ydIC1yeO327l
5rRuiq0UqRaac+C6pVNfJ+V4w5QzblMSo2co/obtELzgtdFUUIZRk0tf28VVFqND
ODoRnpIs4ekHH58xskRXRbANoeLQRO4ChrJDKvuwtVN45hN8O5VqOsoKXqLlZV9x
1JuVK3Fr0C7DNJUy9RVWp6AFBsm53FB5gZABUp8SoVOd3YYa7fHSB5PHAiABIM7x
BvMzO7wwhdunHuLCLqADREwJnufB1oR3bX11rjKilOqpwmbi1oBP6XhWBZ49jWB7
9DCB+gzmKOJIQR3l20JJORJzwxWBJbWf1Rf9PP/8Dph41UMOriiNTKZmCDH/Ouqj
o0ZVyzGFdoU13Z+ynOT/Q8vs0y3wH4dwkDdd4mVNnCEio94uQmRC6rsQ2p37Lpm9
uNUOL55bRFCHdsmVpbvzfnNwQjokvclM2zI3SDIufWokjzGbbR2glFY/jIkIgNMj
28XMpjojfso4ZW4NC0SKCAVj3oaKaleI+6wh2aL6qPn2/iswmDICQsGzxs4QcJcM
GVJsHbBojl1u9/GGPBoR3jNoAwgQ9yXPWtckhJmLUF3GmH57zLP9pry6DGt99tW9
ZfWcBQIfiU8grE420GneFvY3l95VjSxNCLuuptLDJMGCbejRGbMgF+wHuhDreIgZ
CRA4KrgT/FKE/eiIkfWB
=iW/g
-----END PGP SIGNATURE-----

--=-aaKDyhHHwK8+JBK/0Lq2--
