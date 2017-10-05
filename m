Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ts6Z3GlS"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="EFn4IMJ7"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Szh5WpmzDqhf
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 10:05:36 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A7B2E20DD6;
 Thu,  5 Oct 2017 19:05:34 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 19:05:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=S8JLd2f7ky0q7rFD0tpRPefLCDALpHJhFC+PxReOx
 Jw=; b=ts6Z3GlSdXF/nhlR1Su7MUvM9nEqf0/2wzPG+0jd7hS/xki+NhbA35Iic
 HQAZX4m1kugORJslFnchytuPzbvbQqB/NlHUCuW6qYipEL9aMQ2mRixZVcwhuKaa
 Lefw8j5YeDi+GE0paDMITcko7246V9ozlI5rdB7RAOEVvyovettBQNgsddH1p5tk
 Y74WNip3Cr126p6vkNO5uwtOf9F1Bd8BfXBPxqJ6w9AzO+V48yIf1Qxz1tLdiOUF
 ge5uj523afyeRhF2/4TLiz8QO+8qUc0AT36utxNRnqxVUGSAJhsftprJXAMr9iC8
 um0R0JdJ/9nxj37Th9c3udhfG+/Iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=S8JLd2f7ky0q7rFD0t
 pRPefLCDALpHJhFC+PxReOxJw=; b=EFn4IMJ71GVYOqjqsfb3/8uh9eAJ6p7Rws
 siIX+G+t3lYHI2qBzZQ5hJWUZ5fI0hW82hfv/XyClJOwR+kZ3nw0y/vBnOKBc0kF
 jyL1z7lujvjFzZkjaYTWQWG8i8oPdWjpOh7eV1I299MZDZpS7AESlT4m4TR8v2uA
 T38rh9aeeHiOfucHa/OoJMoD311mfVpFsZZ9gTbptxgz7V7zOHiwI5NDWsx+WfgK
 ZOlT52mlXJVVE7LYzUTvdXezlr7KHfVhsjw1EQ21XR3Mp9ALHHtdqWL/QcGiCntl
 qrH9zMroVABO3aItxuCVoggo9FucBKOLvBeKZEHZhv1fqNXRCbYA==
X-ME-Sender: <xms:vrrWWWM34oeJzG9SOhSeBkMG4KuWq34ECZ0Cv1OQC5wD_iswNgC-wQ>
X-Sasl-enc: HQyjK1cN8m+b/GCw/eivi/QRZadFdCmMPRk+C4bfDsRr 1507244733
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id A7A117E4ED;
 Thu,  5 Oct 2017 19:05:32 -0400 (EDT)
Message-ID: <1507244728.5452.103.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 19/31] drivers: fsi: occ: Return
 ENODEV if client is NULL
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 09:35:28 +1030
In-Reply-To: <1507231464-13635-20-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-20-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-+G6a3XMo2g+7aBWoSA6P"
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
X-List-Received-Date: Thu, 05 Oct 2017 23:05:37 -0000


--=-+G6a3XMo2g+7aBWoSA6P
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Safeguard the in-kernel api functions.

Why just the in-kernel API functions? Why not do the check in
*{read,write,release}_common()?

>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/fsi/occ.c | 9 +++++++++
> =C2=A01 file changed, 9 insertions(+)
>=C2=A0
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index 55f293d..a551349 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -654,18 +654,27 @@ struct occ_client *occ_drv_open(struct device
*dev, unsigned long flags)
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
t
len)
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
--=-+G6a3XMo2g+7aBWoSA6P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1rq5AAoJEJ0dnzgO5LT5cLQP/jru6kQCNMfTYabkCrm+pvFY
Su1rqQlY4Wbcz+JB0g1Jj/RdjNam9yGJYxtZVYqvJ6TPPmvlEQwwvJnyMT7icsOQ
iPqY31hEJvjPl7s4vAXrZyw5h/IYV9dQ6+kQ4eTY58Sg1H1bzYXBnERXJ8w/8F3N
bIzuqgL7o68+JpYlAnTmlBgeWAfmxosoHpkfsUSFZtL8I42qJuP+YHjZcn5Zrfaf
AXEB5xMz63HzOIhiNaiRO5BaARBeMuI/j78I6kKyvBv0lIwG/p/G0tlzhomFUDsd
7BqbhQUw7xcDUL31tQ8ibTiFeWaof5ZoiggbDgyh6SuiKDqwJU6GJ0Vb3pEEnLUE
bkqkY0FdqHrN9iHUsl0jRy7SkfigayWwVsDOkhe+QM8NMcbzwHejdxtW5RYdSr3c
cl64J41ovkqxoTdeSmiId3h9sKWXjAkxgyebxc4HDFsexmgTQJAajh5ig+qYeE55
55xJKTuVtQlGqKjBYEOL5Uz3YlJO8avX3Wu0Oexu6sxXnayijUtuXgxqhhlxwcI0
pQ0wxt2S2GT7aIpbNqVNYkpi/ywaRE7dqWf/C95nhC67gN9ZsgJHg/r+ehtF1Hsh
szVm4mQmWmamTSP5JFkEmqJGxnyo2310fMa/VyGTqe2dG4ybeSfGZiH7iwACpH7O
Wea4KDAARDvmyjF612y8
=HwY+
-----END PGP SIGNATURE-----

--=-+G6a3XMo2g+7aBWoSA6P--
