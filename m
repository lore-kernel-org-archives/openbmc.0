Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="IVsUYWZP"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="amtitity"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7R8T1XRwzDqm8
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 08:43:05 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 197C220B1D;
 Thu,  5 Oct 2017 17:43:03 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 17:43:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=zWxOwEsPswudD84Ehyftr7ihya6fbCiG5g3Z4drgP
 z8=; b=IVsUYWZPspOTZWkT2bDC2PkBiFuG2Bjly3yLIot993CK7Tk8by0R6FT0z
 MNLP71x6TXzgy1LpfA1Ah9c+f2KQOMTEQlQDiM9DSTZwt4HPfvdagtrDJmRL6t1W
 cY/L8YMHJDtOr19D6LWIqK6cIW0v2plkLj1ht4cVsA2ZPODSMbGpYBRYnRzCi8lx
 qy/ED0Z5F2OAk03X40m8iFYuWHre8Swdg9krYjrjdIfoy5XAl1lyDihiaUiHztq9
 a2JzplGmsnQf0fSIV6ma5BSatfTq9bWg3gt0cTgiBTQjz3EELbBG+rcy/r0YuRDM
 ISaa4HcKA0yTcIb91Po2ymnnx4hsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=zWxOwEsPswudD84Ehy
 ftr7ihya6fbCiG5g3Z4drgPz8=; b=amtitity1YTNSauErutdybsmiCNRFzg2H9
 SeQu65Dv65bw/xeHZaMiNELggfE7p79o/G0f8KwGeXrxj5hPuspB0QvBuF3bzCFx
 VvKPf+VaGm3HHP5Yg6e0hbJd+bGGLmsLBuQUPBaIFq8jDQCxqqSioxTqSOIJANde
 AuKZKnto916rGk9UmYF2TWvnQuR7LP4QIQr8hq18vl04ZsEiVPf4TqHNcIU8S2m1
 oXXZi2vOeQNMrZLd6AuQ1sxHNwCMDmp6eKxNyeIag+LQ2XdWrTgntukwgCn5g2sR
 AKG/IyvykaFU0GMfY6FcNwNuWaofqA3z3lShJBnsqLzfW1XKwZ7g==
X-ME-Sender: <xms:Z6fWWabeQcQBPbR_duRisd3JiEnxNcAnc8dykldHeEh2_duFfBAkjw>
X-Sasl-enc: M6u14vsBfnBFZU4EG1Q2Vb4058e6xsAADwawK/QdmM7v 1507239782
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 33F25247DD;
 Thu,  5 Oct 2017 17:43:00 -0400 (EDT)
Message-ID: <1507239777.5452.77.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 04/31] drivers: fsi: sbefifo: white
 space fixes
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 08:12:57 +1030
In-Reply-To: <1507231464-13635-5-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-5-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-QwewPa3sJspnulWZK3Kw"
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
X-List-Received-Date: Thu, 05 Oct 2017 21:43:05 -0000


--=-QwewPa3sJspnulWZK3Kw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:23 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Fix some spacing issues.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/fsi-sbefifo.c | 66 ++++++++++++++++++++++++------------=
-----------
> =C2=A01 file changed, 34 insertions(+), 32 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index c5eeace..561a7f6 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -147,7 +147,7 @@ static int sbefifo_ack_eot(struct sbefifo *sbefifo)
> =C2=A0		return ret;
> =C2=A0
> =C2=A0	return sbefifo_outw(sbefifo, SBEFIFO_DWN | SBEFIFO_EOT_ACK,
> -			SBEFIFO_EOT_MAGIC);
> +			=C2=A0=C2=A0=C2=A0=C2=A0SBEFIFO_EOT_MAGIC);
> =C2=A0}
> =C2=A0
> =C2=A0static size_t sbefifo_dev_nwreadable(u32 sts)
> @@ -221,6 +221,7 @@ static bool sbefifo_buf_readnb(struct sbefifo_buf *bu=
f, size_t n)
> =C2=A0		rpos =3D buf->buf;
> =C2=A0
> =C2=A0	WRITE_ONCE(buf->rpos, rpos);
> +
> =C2=A0	return rpos =3D=3D wpos;
> =C2=A0}
> =C2=A0
> @@ -240,14 +241,14 @@ static bool sbefifo_buf_wrotenb(struct sbefifo_buf =
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
> @@ -284,8 +285,7 @@ static struct sbefifo_xfr *sbefifo_client_next_xfr(
> =C2=A0	if (list_empty(&client->xfrs))
> =C2=A0		return NULL;
> =C2=A0
> -	return container_of(client->xfrs.next, struct sbefifo_xfr,
> -			client);
> +	return container_of(client->xfrs.next, struct sbefifo_xfr, client);
> =C2=A0}
> =C2=A0
> =C2=A0static bool sbefifo_xfr_rsp_pending(struct sbefifo_client *client)
> @@ -360,6 +360,7 @@ static struct sbefifo_xfr *sbefifo_next_xfr(struct sb=
efifo *sbefifo)
> =C2=A0			kfree(xfr);
> =C2=A0			continue;
> =C2=A0		}
> +
> =C2=A0		return xfr;
> =C2=A0	}
> =C2=A0
> @@ -381,7 +382,7 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0
> =C2=A0	spin_lock(&sbefifo->lock);
> =C2=A0	xfr =3D list_first_entry_or_null(&sbefifo->xfrs, struct sbefifo_xf=
r,
> -			xfrs);
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0xfrs);
> =C2=A0	if (!xfr)
> =C2=A0		goto out_unlock;
> =C2=A0
> @@ -399,8 +400,7 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0
> =C2=A0	=C2=A0/* Drain the write buffer. */
> =C2=A0	while ((bufn =3D sbefifo_buf_nbreadable(wbuf))) {
> -		ret =3D sbefifo_inw(sbefifo, SBEFIFO_UP | SBEFIFO_STS,
> -				&sts);
> +		ret =3D sbefifo_inw(sbefifo, SBEFIFO_UP | SBEFIFO_STS, &sts);
> =C2=A0		if (ret)
> =C2=A0			goto out;
> =C2=A0
> @@ -425,9 +425,8 @@ static void sbefifo_poll_timer(unsigned long data)
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
> @@ -477,7 +476,7 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0			set_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags);
> =C2=A0			list_del(&xfr->xfrs);
> =C2=A0			if (unlikely(test_bit(SBEFIFO_XFR_CANCEL,
> -							&xfr->flags)))
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&xfr->flags)))
> =C2=A0				kfree(xfr);
> =C2=A0			break;
> =C2=A0		}
> @@ -487,7 +486,7 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0	if (unlikely(ret)) {
> =C2=A0		sbefifo->rc =3D ret;
> =C2=A0		dev_err(&sbefifo->fsi_dev->dev,
> -				"Fatal bus access failure: %d\n", ret);
> +			"Fatal bus access failure: %d\n", ret);
> =C2=A0		list_for_each_entry(xfr, &sbefifo->xfrs, xfrs)
> =C2=A0			kfree(xfr);
> =C2=A0		INIT_LIST_HEAD(&sbefifo->xfrs);
> @@ -508,7 +507,7 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0static int sbefifo_open(struct inode *inode, struct file *file)
> =C2=A0{
> =C2=A0	struct sbefifo *sbefifo =3D container_of(file->private_data,
> -			struct sbefifo, mdev);
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sbefifo, mdev);
> =C2=A0	struct sbefifo_client *client;
> =C2=A0	int ret;
> =C2=A0
> @@ -562,12 +561,13 @@ static ssize_t sbefifo_read_common(struct sbefifo_c=
lient *client,
> =C2=A0
> =C2=A0	sbefifo_get_client(client);
> =C2=A0	if (wait_event_interruptible(sbefifo->wait,
> -				(ret =3D READ_ONCE(sbefifo->rc)) ||
> -				(n =3D sbefifo_buf_nbreadable(
> -						&client->rbuf)))) {
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(ret =3D READ_ONCE(sbefifo->rc)) ||
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(n =3D sbefifo_buf_nbreadable(
> +					&client->rbuf)))) {
> =C2=A0		sbefifo_put_client(client);
> =C2=A0		return -ERESTARTSYS;
> =C2=A0	}
> +
> =C2=A0	if (ret) {
> =C2=A0		INIT_LIST_HEAD(&client->xfrs);
> =C2=A0		sbefifo_put_client(client);
> @@ -581,8 +581,9 @@ static ssize_t sbefifo_read_common(struct sbefifo_cli=
ent *client,
> =C2=A0			sbefifo_put_client(client);
> =C2=A0			return -EFAULT;
> =C2=A0		}
> -	} else
> +	} else {
> =C2=A0		memcpy(kbuf, READ_ONCE(client->rbuf.rpos), n);
> +	}
> =C2=A0
> =C2=A0	if (sbefifo_buf_readnb(&client->rbuf, n)) {
> =C2=A0		xfr =3D sbefifo_client_next_xfr(client);
> @@ -605,8 +606,8 @@ static ssize_t sbefifo_read_common(struct sbefifo_cli=
ent *client,
> =C2=A0	return n;
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
> @@ -648,6 +649,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_cl=
ient *client,
> =C2=A0		spin_unlock_irq(&sbefifo->lock);
> =C2=A0		return -ENOMEM;
> =C2=A0	}
> +
> =C2=A0	spin_unlock_irq(&sbefifo->lock);
> =C2=A0
> =C2=A0	sbefifo_get_client(client);
> @@ -659,8 +661,8 @@ static ssize_t sbefifo_write_common(struct sbefifo_cl=
ient *client,
> =C2=A0	while (len) {
> =C2=A0		if (wait_event_interruptible(sbefifo->wait,
> =C2=A0				READ_ONCE(sbefifo->rc) ||
> -					(sbefifo_client_next_xfr(client) =3D=3D xfr &&
> -					=C2=A0(n =3D sbefifo_buf_nbwriteable(
> +				(sbefifo_client_next_xfr(client) =3D=3D xfr &&
> +				=C2=A0(n =3D sbefifo_buf_nbwriteable(
> =C2=A0							&client->wbuf))))) {
> =C2=A0			set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
> =C2=A0			sbefifo_get(sbefifo);
> @@ -670,6 +672,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_cl=
ient *client,
> =C2=A0			sbefifo_put_client(client);
> =C2=A0			return -ERESTARTSYS;
> =C2=A0		}
> +
> =C2=A0		if (sbefifo->rc) {
> =C2=A0			INIT_LIST_HEAD(&client->xfrs);
> =C2=A0			sbefifo_put_client(client);
> @@ -719,7 +722,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_cl=
ient *client,
> =C2=A0}
> =C2=A0
> =C2=A0static ssize_t sbefifo_write(struct file *file, const char __user *=
buf,
> -		size_t len, loff_t *offset)
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0size_t len, loff_t *offset)
> =C2=A0{
> =C2=A0	struct sbefifo_client *client =3D file->private_data;
> =C2=A0
> @@ -820,22 +823,21 @@ static int sbefifo_probe(struct device *dev)
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
> +		dev_err(dev, "Found data in downstream fifo\n");
> =C2=A0		return -EIO;
> =C2=A0	}
> =C2=A0
> @@ -848,13 +850,13 @@ static int sbefifo_probe(struct device *dev)
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
> @@ -863,7 +865,7 @@ static int sbefifo_probe(struct device *dev)
> =C2=A0				=C2=A0sbefifo->name, child_idx++);
> =C2=A0			child =3D of_platform_device_create(np, child_name, dev);
> =C2=A0			if (!child)
> -				dev_warn(&sbefifo->fsi_dev->dev,
> +				dev_warn(dev,
> =C2=A0					=C2=A0"failed to create child node dev\n");
> =C2=A0		}
> =C2=A0	}
--=-QwewPa3sJspnulWZK3Kw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1qdiAAoJEJ0dnzgO5LT5tIgP/3FM1DuZIWLrbf2SlrLgPnjA
8SnaaOiL7jFfUUMNgnr+8QX3j6O3XyZYzeWopn/P8hEfXlafIZDrVblJhKufj69S
AuXuSrDfnBJfBYkV/EDTiC4DKaAodef2SA8IeVtheN0GSs4KM6y2nyZlaSWJDvJz
6lr8P+92v72BOWm3M2LzRFvcsszg7J9CQ/aDrv5vV+vVO0hZ1fWTTX+2RtTPY57Q
z/YTLH/GKQH8GVX0VBGreqZRRpuxVkiVnT/rksrIwfs9d805FMKZZXctSzxAMu7M
GSnCi+/CKrRshx19a3AwjVqXd2zs1oi6PCKuE0FduVaoBC6pZHF6rq/we3S6SsnD
4SpSBs687xYs87mKFGQf5wXFUQ8cA8OCEGe/ukmew0PAkZfYg+2DLe2sNuEal5UE
sIpkDSMBiGzg9DGVdDHXLRTjVSZswAxdaKARjssbgOWksG/tOMuaRpA/xxisGdih
vFYReZsqhvsvDTh9mMvgBn/JRT4jQlq6upZkwfTZ9YRAu9plrFN5oQNgm0xPfG7V
1DXCKwShrDtWRibKlFkmQr7GlJYEBusHW/HSAfm93DJIG3nZjTnA2EJWbNajOfD1
ozJO7n5zkRVm8UgRvBhI972q5p+8JDvS2vrJuH8Aiy+oUIVBFk70WAiTcSMwtBnV
FOIQ2Z84BPKH+un0Fzy9
=aHW0
-----END PGP SIGNATURE-----

--=-QwewPa3sJspnulWZK3Kw--
