Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="IU4kBb/4"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="liQqMUGq"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yY8J20x5hzDrKG
 for <openbmc@lists.ozlabs.org>; Fri, 10 Nov 2017 16:49:52 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E28C020B7A;
 Fri, 10 Nov 2017 00:49:49 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 10 Nov 2017 00:49:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=YyugwjDfL3ZxYvmwSg/PA/rpWUkbSh3zS/QreQ81BJM=; b=IU4kBb/4
 AG7cARZj9kTS7arTcXT99lVuRD0qZO7crXYGItuOiEuVFUG4z05Wk/CDShSGwYHB
 qeVDOc4PDPAewEA+AQLlzOK45I5otvyVBGDQHmAgzs0+RviNt3Nmt9pMwPXF2lxW
 uto5ZLAt+Rs3GjoGQrcr+affaysizh8Za/SxhjCCXGoGSUxLE2KSpsPjJwpOoty4
 qs0jUJ5P1+xY83CqOZGr8QP9UsE7YprppjNLdDvUzI4zUhUaIhWv/bdX3TF+MeG1
 ccCvqMtR8KbY1nTvdy6hrz8OoMUGzmwD1Bo2IJnnLJ5xnWGKCWLzkRVaJO2XlQnh
 y/8TExbGNumNXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=YyugwjDfL3ZxYvmwSg/PA/rpWUkbS
 h3zS/QreQ81BJM=; b=liQqMUGqznLdkzItcdPMMr8DId7gme7OfoPat0N92Y6OL
 cHNfdtxKyTw51XLapu/2d73/vfuDIWzMOIMxtknqXsUpt72rCmiJVhAcJ0iNYEia
 9KdNTcPmfY/IkI1UhzpPb2rxGuD6uY2yedlpn92INXNtFKJWQymj8ibmG+EfSnqj
 XVUdu5sFQvGpfBnYQ6JJkBMy3+rYOh5VTHTZKL9Ca3bXPCFiEh0t/X/8LW7tSbis
 ZcHo16/I0RoKLqT7b02Up5LBhPhUN0BzG7GqAXNdY29y6Fm/5AX45+PhtF/QM9SS
 BT7I7CzPOc9Fx0PRfeJl4h2lVxKS+6SNh/+v280hA==
X-ME-Sender: <xms:_T0FWq352J0jjXzjqA0NsFv6Yjg47NK28_IwpyPuLoYWFPellgg31A>
Received: from dave (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id D45AD24A8B;
 Fri, 10 Nov 2017 00:49:47 -0500 (EST)
Message-ID: <1510292983.4287.48.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 1/2] hwmon: (pmbus): Export pmbus device
 debugfs directory entry
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 10 Nov 2017 16:19:43 +1030
In-Reply-To: <1509656381-22755-2-git-send-email-eajames@linux.vnet.ibm.com>
References: <1509656381-22755-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1509656381-22755-2-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-pb3wf5I3txbidEQsnu/W"
X-Mailer: Evolution 3.26.1-1 
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
X-List-Received-Date: Fri, 10 Nov 2017 05:49:56 -0000


--=-pb3wf5I3txbidEQsnu/W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-11-02 at 15:59 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=20
> Pmbus client drivers, if they want to use debugfs, should use the same
> root directory as the pmbus debugfs entries are using. Therefore, export
> the device dentry for the pmbus client.
>=20
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

I prefer you send this upstream and we cherry-pick it back after it
gets applied. I can't see it being controversial too.

Cheers,

Andrew

> ---
>  drivers/hwmon/pmbus/pmbus.h      | 1 +
>  drivers/hwmon/pmbus/pmbus_core.c | 7 +++++++
>  2 files changed, 8 insertions(+)
>=20
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index fd422cd..153d3f6 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -452,5 +452,6 @@ int pmbus_do_probe(struct i2c_client *client, const s=
truct i2c_device_id *id,
>  int pmbus_do_remove(struct i2c_client *client);
>  const struct pmbus_driver_info *pmbus_get_driver_info(struct i2c_client
>  						      *client);
> +struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client);
> =20
>  #endif /* PMBUS_H */
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus=
_core.c
> index c4b551b..b943f99 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2371,6 +2371,13 @@ int pmbus_do_remove(struct i2c_client *client)
>  }
>  EXPORT_SYMBOL_GPL(pmbus_do_remove);
> =20
> +struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client)
> +{
> +	struct pmbus_data *data =3D i2c_get_clientdata(client);
> +
> +	return data->debugfs;
> +}
> +
>  static int __init pmbus_core_init(void)
>  {
>  	pmbus_debugfs_dir =3D debugfs_create_dir("pmbus", NULL);
--=-pb3wf5I3txbidEQsnu/W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJaBT33AAoJEJ0dnzgO5LT5g7wP/jxMFfgAVt/Nrdxde9hrS38L
22Ho/IaQpHF3aj1Gk9n9zshVfVFvMC5Ptc+4b0h5GFNK/g6o8aDSwkHYn/WW02Nk
WKBj7Twyn2+L9t/Tcp1AV63cOZ89tw11ALNTe2j6Z+bRjmliyMbeHjJm7ZuDYKxp
GNVbAzE7kCXiaqWgedGguXnBqqMS0+/VOsJxAXWB+5diSbgA1dXuD8SHQwNcGH8y
slOCMgxpPYrwTbbiFL5QJKCwrTyIk0sesEiaYHRaimlax4YXGATKFYnybBJHg6dY
qpadLLl/h5fTgTymiLr79ydO1t+akEdmpebh5akL9sg9EuVTU9HbPgn+Jz4DjjfT
d0HeI+8LzWlg8GtaUuTKMGgg2DJUJ5HWYXnyXnsOTDjLlpOx+Zsx44mwIIitA7M5
CGMXzv/rg5q4qAlt9PIUbQgYFjsXmZJL29ososCxkG2R+2U1Up+M8kt1kAbf+S5G
e66lEnsFCGMWyjanwmcLcFR7e+XoHanaTaEU/66YEKw9LbfW7hs6fVyeAQmL5NeJ
NUiix11Q6UErgWj6GXK4EjJsteJ+1nt6Rpy31IiRYtzfUo9j0EcxuiJdRnNQzNET
Mq7ua4K0//nDmIohgMfFcu5m9y0+eIHivpEAXLKsc3b+lAZzBlz/xzyw692+7mmS
iqMBO3B+WldbgSj2ypku
=RsRv
-----END PGP SIGNATURE-----

--=-pb3wf5I3txbidEQsnu/W--
