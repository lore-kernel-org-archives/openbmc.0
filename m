Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wdpfy0bFzzDqFR
 for <openbmc@lists.ozlabs.org>; Thu,  1 Jun 2017 23:51:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="frfEaUz/"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="KfwOde/b"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0B7E120F25
 for <openbmc@lists.ozlabs.org>; Thu,  1 Jun 2017 09:51:51 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Thu, 01 Jun 2017 09:51:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=hzhXdL6LRTTIo/6ONVWbPulHFfL9k
 k2vK3+cqDFdano=; b=frfEaUz/VFIgPP+IonoZZDJiqldf2SEhVN0pA2/Anue/V
 eW8r8GPXRh9eCsHoCXgpqFyAUq6cdMzlxFXK49ecM6bgp495bf5hFolPpJYXCJ3A
 7Xmo9yj/+MyRy9xgb8Y2nouSAdrNK3DmrHszIOT8HeV0k/DBfJDjJ7tntv7YpIRg
 McJFvBNjb5gCkqMX4wMKMkJjDHcSUqZANsy/iCfg18IOkRBD8TqH57soVhr1DPJS
 LXlg+86+HhUUyAHuTCqC1+0wgDcrJWLkmv0VEeruuzvWXo69a5VQkpxrpZ86R7Gd
 TPp5rUHxbER89+y6aC7bQlMCHPfnYfBbu0OI/TkyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=hzhXdL
 6LRTTIo/6ONVWbPulHFfL9kk2vK3+cqDFdano=; b=KfwOde/bPkw7T/LjlZFP8x
 NKcAU3cb3FIAHH6DXaWYCVEQvizfWM2rS1tcg4EKriZf8G783FchflfLv8n/C4iP
 2XHFToa74m6lIL4re1h1KBkxv32p56bflMgouPnpDrkv9kdeKBYLLCLZiiRSELcY
 m/kQBNRyfFpkULk9WFVZ+xYF1KRysshs0NPpFvcwKStd/AN1qXNJMDhqBKbZfm0f
 GYQytMiLB/ZTuoGFPe5fsbhiDxGXQ9XwDQzvyv/lRmnwvZT8kPY2txv1JhZc9wAU
 LYDMsq9Fd7y1tp3+u7MZfn2TXDMICoGnUUz5kWXGS3yvKlDcuBUP5ajkGUOUafqA
 ==
X-ME-Sender: <xms:9hswWcT-t25xaB2NphcUMd2PU9qyq-PCLl2x2fhYc25XIfT0bj_qFA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id E053FBAB67; Thu,  1 Jun 2017 09:51:50 -0400 (EDT)
Message-Id: <1496325110.2448422.995421856.4D7FC7AF@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-16c78b46
Date: Thu, 01 Jun 2017 23:21:50 +0930
References: <20170601063703.3083-1-joel@jms.id.au>
Subject: Re: [PATCH linux dev-4.10] i2c: fsi: Fix unused variable warning
In-Reply-To: <20170601063703.3083-1-joel@jms.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Jun 2017 13:51:56 -0000



On Thu, Jun 1, 2017, at 16:07, Joel Stanley wrote:
> When there is no status bit to handle we return the uninitialised rc
> variable, causing this warning:
>=20
> drivers/i2c/busses/i2c-fsi.c: In function =E2=80=98fsi_i2c_xfer=E2=80=99:
> drivers/i2c/busses/i2c-fsi.c:410:7: warning: =E2=80=98rc=E2=80=99 may be =
used
> uninitialized in
> this function [-Wmaybe-uninitialized]
>     if (rc < 0)
>        ^
> drivers/i2c/busses/i2c-fsi.c:358:6: note: =E2=80=98rc=E2=80=99 was declar=
ed here
>   int rc;
>       ^~
>=20
> Instead return zero, but also print a warning as this looks like an
> error, as  we have checked the I2C_FSI_STAT register for
> I2C_STAT_ANY_RESP, but none of the status bits were set.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/i2c/busses/i2c-fsi.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> index 4689479acf5e..b4eb1028a2ae 100644
> --- a/drivers/i2c/busses/i2c-fsi.c
> +++ b/drivers/i2c/busses/i2c-fsi.c
> @@ -355,12 +355,12 @@ static int fsi_i2c_read_fifo(struct fsi_i2c_port
> *port, struct i2c_msg *msg,
>  static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
>  				 struct i2c_msg *msg, u32 status)
>  {
> -       int rc;
> -       u8 fifo_count;
>  	struct fsi_i2c_master *i2c =3D port->master;
> -       u32 dummy =3D 0;
> +       u8 fifo_count;
> +       int rc;
>=20=20
>  	if (status & I2C_STAT_ERR) {
> +               u32 dummy =3D 0;
>  		rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
>  		if (rc)
>  			return rc;
> @@ -387,9 +387,12 @@ static int fsi_i2c_handle_status(struct fsi_i2c_port
> *port,
>  			rc =3D -ENODATA;
>  		else
>  			rc =3D msg->len;
> +               return rc;
>  	}
>=20=20
> -       return rc;
> +       dev_warn(&port->adapter.dev, "no status to handle\n");
> +
> +       return 0;
>  }
>=20=20
>  static int fsi_i2c_wait(struct fsi_i2c_port *port, struct i2c_msg *msg,
> --=20
> 2.11.0
>=20
