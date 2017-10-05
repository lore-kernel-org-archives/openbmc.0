Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JxpENSXY"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Sc5ABfk9"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Rh15lBhzDqhb
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 09:06:57 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3DA1B20A80;
 Thu,  5 Oct 2017 18:06:55 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 18:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=5/XpQ+92h8SJ3V5eNxeUXib1eNJEvKXmbJjS0jdmc
 wU=; b=JxpENSXYHnGRq7achF53FUSs1Wm5WUN+6Bpc9rbacuDCX/GC4GybEj77t
 23Er43Hssy6jcizOM0OP3QFmFR0896jCcsL1H7Ii9hCXESsgwiGqud8hvuSrDPyc
 nDsVxtn73Wen9ehfBDudbW2U0FqxznXcaucszPWmmQuPhquvJZsZFd34zigEqwo+
 aH0t3rsnMVsx1HKgnBBNjafd3Paw8/m/ckQt47evC4o0L2os/3cDYgRGYCAtxvCc
 nJWYo/u6Vj1IV1UYQyyRYMnNgCeu7ilx0kWQR0OvNQ4s0Gj1AvLWB8GXEYGw2B6c
 Hsa6Ra66BrMaUcl1gmKFcwwn+FseA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=5/XpQ+92h8SJ3V5eNx
 eUXib1eNJEvKXmbJjS0jdmcwU=; b=Sc5ABfk9ZuQRgAQ3JQYo1Ms7Ph0URcACii
 +P+EfHCLeGt6hR1a5vfp/wZBdEMoEELjc+jdToT+aPDX8mjhv0W71iKOKGi8p463
 TwR3Zu6y3fCvedc0lv0Fvv+Bgxj5dAXQ2DERBkxVPtn201BSP16k1HRnDn/Qop/J
 vFLB9cP1YmzYzSA3wovas1n/UreePkgZ7J/S5Jv7GhT2oZ5xC3THKIBw+Zjb9DvE
 fO5/AvUfh74r0qyBXciEGVgE2p7ye1ovYMdfkJdAzS80Bd5u0209W57zrPzWsCvi
 Ac+Vuknhzhy2ejmdqONtocge9jkwGjRw1Fx1zVrALYqPEYN8KfCg==
X-ME-Sender: <xms:_6zWWXS8LDpLzlKXVmNQrqvLeWDhMcf1GRXxKEKtjiJEgjqeDRBZDg>
X-Sasl-enc: /8zBwEpSpGI9dAb2PWSVH0huIZGPmEWfDLrja6tuVF5k 1507241214
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 59BDF2489B;
 Thu,  5 Oct 2017 18:06:53 -0400 (EDT)
Message-ID: <1507241209.5452.89.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 10/31] drivers: fsi: sbefifo: destroy
 the ida list on exit
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 08:36:49 +1030
In-Reply-To: <1507231464-13635-11-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-11-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-KX31d2KemgG02lL8/mGp"
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
X-List-Received-Date: Thu, 05 Oct 2017 22:06:58 -0000


--=-KX31d2KemgG02lL8/mGp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=20
> Need to clean this up.
>=20
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/fsi-sbefifo.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index 60b133d..0ff5209 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -947,6 +947,8 @@ static int sbefifo_init(void)
> =C2=A0static void sbefifo_exit(void)
> =C2=A0{
> =C2=A0	fsi_driver_unregister(&sbefifo_drv);
> +
> +	ida_destroy(&sbefifo_ida);
> =C2=A0}
> =C2=A0
> =C2=A0module_init(sbefifo_init);
--=-KX31d2KemgG02lL8/mGp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1qz6AAoJEJ0dnzgO5LT5fk0P/3A7CVd7YPpxmiqRg69qKk2/
klj6UhQGu8tB6ZNo/P7zfjqM/miqeBojPg/aRE1FgErZmbdU3vsG/Qx47mtZfWoa
8qHh64v+IYCWjNNkUzjDO3IpgABxxh+g7+6dJl7ajsIrbEH6M4y/41BMycEcTRpC
52omubVPeSk3HZ3PyarvMPRG/9QYOMhlE59oOLi2VBTS+R6ltR+xYkJsZNqld2RI
XD5KEUIcHiVEWKyvJPNURaN0RLHbgApJXTdRwmyrg3Y5QAIOHvDuy08KjS8VJVmc
+TdY9rwI+ohcaWBjYFMPO7wLnwqUxifBmdiTvnrwPiqhVnd1D1MTTsMEsDdV/j7x
cYyuAEXLj+GMimTMj3NRc9eWOYxPlFFe2Ahl13ijWdZD5Tlgf0E8SrUmKxR0/7zB
r9kyMYrQCXNxSdtb9uhoVu4BFIvvMyh+n8FkPTjPT8KDikn3VejvZ73YuR0+Gfea
0mmFs5WmGwfmjjw2UvHh0teU2ofx//C+SnxDbXiAxAmG2pBBCzY2gCXokRZJU3iB
31snC0L4+TfA7AI4NBLSiWgEehHAiw7oK0YhKRC1M+mjGCaoSfsp8avrQoI9R/Fc
sjyyknZj0IXkhfw2E/GMd39zeBi0Rvtc4UoDzUfGQzQ1FsIFf4SpqL6C9X7KOPrX
HkFzaqlYW6t3XBqg6fEk
=u2oV
-----END PGP SIGNATURE-----

--=-KX31d2KemgG02lL8/mGp--
