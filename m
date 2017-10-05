Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="lkrjJ16I"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HyqfEHCu"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7T8W0TDrzDqhf
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 10:13:15 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0A07720988;
 Thu,  5 Oct 2017 19:13:13 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 19:13:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=2fQ/c+E5WPtd/mk8RVsBjzXM/+zmqvtLz51+YpvLI
 tU=; b=lkrjJ16IaPzlQO6a/0+JkAQ5raCylmR2xMAsm9mf5OCUsFB/WH8+t/3KY
 1IGq3QfLQDU6UjN5xLoMfzd7Fkfqg/3ugvVwtyjb20fP1NpgDNjd4q19d59RsQxp
 QIDggIC2dspLDY7HSjyE79C1eTGWckfJl3Ewtw2XCqG3jlO2CJgC55LlDhEGLXoC
 7lVkkEMzrICOFTPcCl+ZMHzi7Sp5EGfsjhRmhX7AxWTnHkqiNrahbdslQom1t+92
 vrSDh2uNCC9gyV+2jbyxG+Dti4NQrJm0gSPwGzbCaDhveDrNmUGhBhJPE0ZIP4te
 Y736oa+bYs1giVgu4l2yYmA06Kq7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=2fQ/c+E5WPtd/mk8RV
 sBjzXM/+zmqvtLz51+YpvLItU=; b=HyqfEHCuvgoQE1IZv5IM6CjVDeHSI1Wo1X
 5poUtcIFT7cUjcpaenZEzI2xkn3jlqxui/9RIGWq/azGpVryyGNTCx9EQeHs7SV4
 hID/RDXmGO2ad+7n2GIG7VocqO4PZOS/4MKgkFPwKic0zjikLCtB52drWb3hVaNm
 2WjnZ2N9xTk7VZE9G/i9DEbzOnQ4IAKbRKIohjl6KdVC36ZwuN9Gib1Pu6MoVIXc
 6qhp+T67qmwfynPIm1uatkmMRDa8n7u2TQP0kYWWwLWauu8IzeY105e/ruhyy5Qt
 FGU0LwAFcwerzfBTTazgwLu9zDLR8Y5c9P39Hl+j+o6DrspkdHkA==
X-ME-Sender: <xms:iLzWWVAxRJ0XORf81soTVmfbjODhgiGXnSy2ajStNtu0WFyR_q4QRg>
X-Sasl-enc: Ef/O4iUPtvQ/CK7ZfgFFdD6pQgHglOgCv7udQOBO8v/d 1507245192
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 07B2E7E4ED;
 Thu,  5 Oct 2017 19:13:10 -0400 (EDT)
Message-ID: <1507245187.5452.109.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 23/31] drivers: fsi: occ: Destroy the
 ida list on exit
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 09:43:07 +1030
In-Reply-To: <1507231464-13635-24-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-24-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-HdzqXhGLQJKfnJJuSLgU"
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
X-List-Received-Date: Thu, 05 Oct 2017 23:13:15 -0000


--=-HdzqXhGLQJKfnJJuSLgU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Need to clean up the index list structure.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/occ.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=C2=A0
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index f27345c..916c342 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -788,6 +788,8 @@ static void occ_exit(void)
> =C2=A0	destroy_workqueue(occ_wq);
> =C2=A0
> =C2=A0	platform_driver_unregister(&occ_driver);
> +
> +	ida_destroy(&occ_ida);
> =C2=A0}
> =C2=A0
> =C2=A0module_init(occ_init);
--=-HdzqXhGLQJKfnJJuSLgU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1ryDAAoJEJ0dnzgO5LT5bJoP/iWDPS7GIxFE8zGDAt+UjF/z
1PDT9HUcc9dBQcDLuW6jdCSpoh4fkzQyMyHuFjNjLqTGXZosgPWfQ2mrEDwmIh11
MT1mipfTiMzTa7GM38CW2zCn6/M49w19eQCeeuzTPW0rimrAUTtquVGAKS2WNCTl
bXmlDItvl7EJ/w5LuTU9txZLXCMfOvW4N64AwH3+23GEnaOZC6GI5PB2lZPnb8cd
FJwxpK8lFzy6yAxZdvsmM+3afsFrm1vZfNOKZ7UDo4AI4JwQytEgnVyfLzbzAqPb
qSI9gmSMMD6xbraDTylsI7XC2CrtZpsw1/E69iHtiPZa1Itr8LOhLSDqKkEF6ZQD
ZV8g2UnO9mn7bawdSGG1fsbz+a63gtWFbLgTTDJhf7Y1IErpW/Bd1kUBBLzSg0lf
94Ufzwt3PGF+M8Xz7r/3ywgDVHuaS1itdqjvgIyEF8QPULumj1WF5Gv9L3dtEwU8
UU/nyfqtX9OB0VeSAfAwa5Bs80Mnnv16dWkDl4QU/wfAbmu/CtUvO/sgsJ8/Ltr5
g35fzM5MvIsNjJ3B8dGcm9xtuu1V/MyCwFGtNSvjuZAnRCHj7rc6+XSLc40XV2Uv
1nr7g9dDvxcx9DWn0/dBJU3e6kMk9rSkTzXO5d9/NdO+EvCcuxBOQ3ibggB3IBRf
Uzu3Dk5P7c+vpuEHf7ip
=9z2l
-----END PGP SIGNATURE-----

--=-HdzqXhGLQJKfnJJuSLgU--
