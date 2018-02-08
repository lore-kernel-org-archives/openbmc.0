Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cwc+Qd0/"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="dYwA1CCy"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zcVdc3MlLzF15S
 for <openbmc@lists.ozlabs.org>; Thu,  8 Feb 2018 18:47:00 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 38CE1204B9;
 Thu,  8 Feb 2018 02:46:58 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 08 Feb 2018 02:46:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=wIeS66V/Y5fNwa/OlgomipGNxRTVg0DKHPYLPmzLEKw=; b=cwc+Qd0/
 m5u96sFIilul6OkoW12QZgsCaajZ58Q95+Jc+dt67mR6wbE1F7tKrj2QIVTImPI+
 s3d1hcMNV26L49TDsrFKJVr7k/DWcmSy8H/YWolmXvzC61B2HmoB1LL5dvu7BWvU
 ggw7E1qMJGRSah8bY2TJ6i3IAurWdf7fJmUu1zApd6Fn+Ft9i89lf9EreHpRz3JE
 DPki6TCniFHA5xUuuqe1Zem4Pe79Js8jpIswTNvUNKue1jPLwebJf6QzGexGt0aI
 OqWDaOFrQ2lVMGtsJtzTz9Tjq/51LFDLMb8p7IktrYnSzZsKue6wpBbrP+GHHQXS
 NWxcmoxaCePB4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=wIeS66V/Y5fNwa/OlgomipGNxRTVg
 0DKHPYLPmzLEKw=; b=dYwA1CCy8K/I6MZsWqmxcm2OCU+R4GpYX5ODi8aGUn3Lv
 MFWFD4g0SEgl43D7KOGefG3uF0pGdbAVJofjAcb7wM4EeLvVfKOdETvQLLP5nRLG
 6fRMDjfeNPwuZnJQ3edrgLciz/T0Uo/CBHHIOnSaMooosXeV1YBVoPiggfKbPPwL
 75gFqHZ9bBdPCgyyF9dGJIjifL8Yez9zbTTU/RFTOwRlnYzJ4BKbG/LJEO85i4lv
 DGIgePcOjcPMU9B2EBbUmXvMJvxuYYxAfBflB/tuRVRTxmzjX6dfSKJ0GsQidAir
 6X86EVwR1jyvIAr2fp1JnnG5G8l+BUYv2XiDuRzLA==
X-ME-Sender: <xms:cgB8WqxpqVGfkjNx1UaTvKNsXaKt3_wLtqyVp5cUDnM6rv-F6Zucvg>
Received: from dave (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 356E524575;
 Thu,  8 Feb 2018 02:46:55 -0500 (EST)
Message-ID: <1518076012.14456.5.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.13 2/3] misc: aspeed-lpc: Enable clock
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>, Cyril Bur <cyrilbur@gmail.com>
Date: Thu, 08 Feb 2018 18:16:52 +1030
In-Reply-To: <20180208053745.31254-3-joel@jms.id.au>
References: <20180208053745.31254-1-joel@jms.id.au>
 <20180208053745.31254-3-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-jSRIBnZlsUyQWbVfX+0a"
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Feb 2018 07:47:01 -0000


--=-jSRIBnZlsUyQWbVfX+0a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-02-08 at 16:07 +1030, Joel Stanley wrote:
> The LPC device needs to ensure it's clock is enabled before it can do
> anything.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/misc/aspeed-lpc-ctrl.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/drivers/misc/aspeed-lpc-ctrl.c b/drivers/misc/aspeed-lpc-ctr=
l.c
> index b5439643f54b..4a818ad3827e 100644
> --- a/drivers/misc/aspeed-lpc-ctrl.c
> +++ b/drivers/misc/aspeed-lpc-ctrl.c
> @@ -7,6 +7,7 @@
>   * 2 of the License, or (at your option) any later version.
>   */
> =20
> +#include <linux/clk.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/miscdevice.h>
>  #include <linux/mm.h>
> @@ -26,6 +27,7 @@
>  struct aspeed_lpc_ctrl {
>  	struct miscdevice	miscdev;
>  	struct regmap		*regmap;
> +	struct clk		*clk;
>  	phys_addr_t		mem_base;
>  	resource_size_t		mem_size;
>  	u32		pnor_size;
> @@ -180,6 +182,17 @@ static int aspeed_lpc_ctrl_probe(struct platform_dev=
ice *pdev)
>  	if (!lpc_ctrl)
>  		return -ENOMEM;
> =20
> +	lpc_ctrl->clk =3D devm_clk_get(dev, NULL);
> +	if (IS_ERR(lpc_ctrl->clk)) {
> +		dev_err(dev, "couldn't get clock\n");
> +		return PTR_ERR(lpc_ctrl->clk);
> +	}
> +	rc =3D clk_prepare_enable(lpc_ctrl->clk);
> +	if (rc) {
> +		dev_err(dev, "couldn't enable clock\n");
> +		return rc;
> +	}
> +
>  	node =3D of_parse_phandle(dev->of_node, "flash", 0);
>  	if (!node) {
>  		dev_err(dev, "Didn't find host pnor flash node\n");
> @@ -239,6 +252,7 @@ static int aspeed_lpc_ctrl_remove(struct platform_dev=
ice *pdev)
>  	struct aspeed_lpc_ctrl *lpc_ctrl =3D dev_get_drvdata(&pdev->dev);
> =20
>  	misc_deregister(&lpc_ctrl->miscdev);
> +	clk_disable_unprepare(lpc_ctrl->clk);
> =20
>  	return 0;
>  }
--=-jSRIBnZlsUyQWbVfX+0a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJafABsAAoJEJ0dnzgO5LT5/AIP/itkllFE5SGksNy/G02qBc8+
Ldk95vsLzCLjdus3yEsn3mpcDz4HSiYVtUPxphdhxu7B4fpkjqZbi2K0//Pj2qjP
K8fHZ31Q0jZ05GdcwJcHtIg8lbgSsnUJ/4Mj3zdSUFZJpdjEC5bExLM21LKEcpSX
LbFLwm5a5NiaLnTYn9wKWbuGguK6U+TDxjc6CXacbqk7i8fGnCNTYmG9F+QPhS+D
n2MQdOatqq4y42NeVEuEEhiQTlwhvJqzml7yczi+onVeyI0jiOtl+amQNN+gmKQm
k1+teq/Cfxzc7w0UTi7+IbHTK160tFjLwFFzgXtb/kQZRopZ8VH6gnp/4sSxCVB8
uNhwky95efxt52q6UByA4I0A86oumgFmfkjZN8fnxgzxpn+a3TrGyUtR8OtIaBDs
CIQWYGuwT2wtbRhZWuwdIwM2TRsopPkse1fEfQ0uymtPUOnnRvG1ZE6K85idEr7p
PNui0xnEUSTKesbCXq6jLAReTt18vFEcGQ4A9+oQIxw5e8xZCy5j40p59feV5jnJ
2Q6bO/ztltAErR5w95wEe3niueDfOLT0D4xTEZoPTxQyScPlIY4yOGZYjmzdiLDf
ysSVtinPQWpLlhBFF02TLgX2nQbgiiD6PB4PU/nvbHwo908sfbyCvrLcO9Q+WNbH
IOda5yR+z1r9iQsOQ9d8
=mjVs
-----END PGP SIGNATURE-----

--=-jSRIBnZlsUyQWbVfX+0a--
