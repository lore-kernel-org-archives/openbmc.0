Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="mMadqw+I"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bKR4xdt3"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJDX92HsszDqBc
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 16:15:37 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DF1AE209F9;
 Fri, 20 Oct 2017 01:15:34 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 20 Oct 2017 01:15:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=///9dn+1CEvSQtf+Ca9qpkBsdIOzA1v7PDvZXx3koWs=; b=mMadqw+I
 +ziejK4agtEFC+xsmwJhwXo/PIFI8DsfX4l1ORElbt7RZgECWOKS07+AS2NO6Y04
 hH/pVDCrI3pu2xywKXzWvvA7RxdZbzRk1bw8gIMr/eOQMuSTQXGUnR7Plf8ON5Fo
 Ob3fKWSSu/Bxn3ds04JOsbooUmcur75aYKsdIVxp6X43yOYmqmFSlfNl/BSjm7FK
 rvm9pkv0pdnVkvw/vIfejibT0T/ZEOtJibhMhY8KXGnjLHQ5D1ucYaEPFBzcOlFX
 DXJ4lpLw/3+MwODuCBQJUpzpGwhqz0KD+CybYF9WvbZbUc2NaG9JJ7YUAjMU4zXL
 Izwsr8Ly9gDffQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=///9dn+1CEvSQtf+Ca9qpkBsdIOzA
 1v7PDvZXx3koWs=; b=bKR4xdt3q7wolm4nuN3EmssK/KlhKNdbx7K4MVmeJafOj
 vBlLfmfKK+3jILziRFZRwQW2fA78An0PexUt/bk3wZePZDfOZJVSmonPTTVQCkn3
 Zxx5WjOYqBBxF1/LsCcxLFS5VcQCXrtoMG45m5LXkT6SxR9YrKyIPZBJCx5ywWwS
 rj25XdWomzPKoFj1Z8I04B3iGMXoOqc4Pjn1E7QDZY2zku8mmwgIbJoO+KmgOOIs
 XJWhyVGteV1rVW/RVdy0EJBpj89aGX60EIIAD/+wqaUDm8sKbwMMzvzb5bNSp7Zz
 52oPl7/N1q5Zzyh4ebm8FzwSx3oOMqxWBju5pbvOg==
X-ME-Sender: <xms:dobpWQJ33YsI4bviRwK6kv-iJ-b8EW3MwQEa-D5mRjesB4ocXPeNeQ>
Received: from keelia26 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id E001D2473E;
 Fri, 20 Oct 2017 01:15:32 -0400 (EDT)
Message-ID: <1508476526.24322.36.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] drivers: i2c: fsi: Add proper abort method
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 20 Oct 2017 15:45:26 +1030
In-Reply-To: <1507840944-421-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507840944-421-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-WRdNKndVP1ws+44VEg7O"
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
X-List-Received-Date: Fri, 20 Oct 2017 05:15:38 -0000


--=-WRdNKndVP1ws+44VEg7O
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-12 at 15:42 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Driver wasn't cleaning up on timeout or in an error situation properly.
> Need to do a full reset if we fail in order to re-stablish a good state
> of the engine.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/i2c/busses/i2c-fsi.c | 259 +++++++++++++++++++++++++++++++-=
-----------
> =C2=A01 file changed, 191 insertions(+), 68 deletions(-)
>=C2=A0
> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> index 1af9c01..6c582d8 100644
> --- a/drivers/i2c/busses/i2c-fsi.c
> +++ b/drivers/i2c/busses/i2c-fsi.c
> @@ -133,6 +133,11 @@
> =C2=A0#define I2C_ESTAT_SELF_BUSY	0x00000040
> =C2=A0#define I2C_ESTAT_VERSION	0x0000001f
> =C2=A0
> +#define I2C_PORT_BUSY_RESET	0x80000000
> +
> +#define I2C_LOCAL_WAIT_TIMEOUT	2		/* jiffies */
> +#define I2C_ABORT_TIMEOUT	msecs_to_jiffies(100)
> +
> =C2=A0struct fsi_i2c_master {
> =C2=A0	struct fsi_device	*fsi;
> =C2=A0	u8			fifo_size;
> @@ -351,22 +356,185 @@ static int fsi_i2c_read_fifo(struct fsi_i2c_port *=
port, struct i2c_msg *msg,
> =C2=A0	return rc;
> =C2=A0}
> =C2=A0
> +static int fsi_i2c_reset_bus(struct fsi_i2c_master *i2c)
> +{
> +	int i, rc;
> +	u32 mode, dummy =3D 0;
> +
> +	rc =3D fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
> +	if (rc)
> +		return rc;
> +
> +	mode |=3D I2C_MODE_DIAG;
> +	rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
> +	if (rc)
> +		return rc;
> +
> +	for (i =3D 0; i < 9; ++i) {
> +		rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SCL, &dummy);
> +		if (rc)
> +			return rc;
> +
> +		rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SCL, &dummy);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SCL, &dummy);
> +	if (rc)
> +		return rc;
> +
> +	rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SDA, &dummy);
> +	if (rc)
> +		return rc;
> +
> +	rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SCL, &dummy);
> +	if (rc)
> +		return rc;
> +
> +	rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SDA, &dummy);
> +	if (rc)
> +		return rc;
> +
> +	mode &=3D ~I2C_MODE_DIAG;
> +	rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
> +
> +	return rc;
> +}
> +
> +static int fsi_i2c_reset(struct fsi_i2c_master *i2c, u16 port)
> +{
> +	int rc;
> +	u32 mode, stat, dummy =3D 0;
> +
> +	/* reset engine */
> +	rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
> +	if (rc)
> +		return rc;
> +
> +	/* re-init engine */
> +	rc =3D fsi_i2c_dev_init(i2c);
> +	if (rc)
> +		return rc;
> +
> +	rc =3D fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
> +	if (rc)
> +		return rc;
> +
> +	/* set port; default after reset is 0 */
> +	if (port) {
> +		mode =3D SETFIELD(I2C_MODE_PORT, mode, port);
> +		rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	/* reset busy register; hw workaround */
> +	dummy =3D I2C_PORT_BUSY_RESET;
> +	rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_PORT_BUSY, &dummy);
> +	if (rc)
> +		return rc;
> +
> +	/* force bus reset */
> +	rc =3D fsi_i2c_reset_bus(i2c);
> +	if (rc)
> +		return rc;
> +
> +	/* reset errors */
> +	dummy =3D 0;
> +	rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
> +	if (rc)
> +		return rc;
> +
> +	/* wait for command complete */
> +	set_current_state(TASK_INTERRUPTIBLE);
> +	schedule_timeout(I2C_LOCAL_WAIT_TIMEOUT);

Shouldn't we use the uninterruptible state to ensure we get at least
I2C_LOCAL_WAIT_TIMEOUT in the face of signals?

Andrew
--=-WRdNKndVP1ws+44VEg7O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ6YZuAAoJEJ0dnzgO5LT5vCgP/RRZyepE9i3J7ci6bpeZ21Dg
EErttcZWOFJY35DAuUsFTosjY3P4Y7/BH6mWdUgcrXomtRB3s2UaBKV7rjs3vHfc
B6QTPcWAbNjIz+PFcbkLRVBCLVlLBV4cmTBqKO2hFJvXzMHO2UGAB805kMkpfJ3i
9iGgYmGZhadN8obpPcNSR0YSPJqmA5QksEQXGpzr2E4u1scZS5ZYUVBhsm3wOHWp
GZCxRqBKYlIA9qhzMxOe8lVPQEsG7qG9G39tYpHITOaI2i9ZgerdE3biyCcLQyR2
FDvR7FSrTov1V3CmTHWCBSLFQd5c3DA0bZFM0OnZLyfuAskhxV9C0CZksWN87kDM
Be2ji4xVW7wdjIcG9LPIkPS/TLbS28CKxXTWS2nsWkjXTPcF5jekhald5e2k2cJU
KEV8BpLZc+RJXGK0JV0xfNcQ2z174yAq4RWDTBQ7fohzEl41rvEVZ7ffGJKaii6v
pogXDSaM+Y9GEHk2NnFnMOos4XHapo7GgwVnXJmRAlV8aO7/MGVfC5ef8J6rMWZ3
Xzvy1k/hc+RX3OEIUxlAl3G6hAxATCrdDOl4Qt/8N8q8YehYO8X2ps/JbqgrCJLU
IiQtBpzcMoyXRom3jeLVkaoyUa3T7LI+PzRmFc4vqath3kkwrVhIqi8hyJRktYd5
8Z+ruZviY1g7RDJ8iG7S
=Nzrx
-----END PGP SIGNATURE-----

--=-WRdNKndVP1ws+44VEg7O--
