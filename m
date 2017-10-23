Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="o0pZPq3Y"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="d/Z5Nk4J"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yKy4w35WkzDqT0
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 11:31:27 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C8371207D1;
 Sun, 22 Oct 2017 20:31:21 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 22 Oct 2017 20:31:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=EBbXl2DZimN/J9WQVIf1F3KqYsV1Mm6IvatvrLrlnLw=; b=o0pZPq3Y
 pQsyIH0+YnWRsO5NkJArHuojJXW1ONS6UzkcSbO+x4agsGeeNxwFT9cSFvFl9zN/
 9FfFewABY/QqOhGY+r4IYvu8M3nX7qUNyG8++TvoTkUND+ykdPG4C/57hMiAQVln
 kEAPLttqw8izrtqnX4QS22nR0OtzjQ7laHZi3afOMIpqiGBjipAmxwUbwr3YLfif
 B2EntBr5csgMkYOubo7lAkPYXtIYwSPTwHi1qpgCP+YLd5yJ7qatLQHadzM8jp/P
 WPw5LnV/Jdrvo5hFcjcQkUhlomnyMOB4DYHpC/TlxcdpzWx21+0UwMjiVU2Ma9hq
 rTJdHYN4vFD5Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=EBbXl2DZimN/J9WQVIf1F3KqYsV1M
 m6IvatvrLrlnLw=; b=d/Z5Nk4JBiHqJonTUwNhrpjaynjjFuBDOewqNdpCWorSf
 mbkVB8Cde6APZfKfgWbXxt8P4bQlhbHGzWuGBV0lgHb36e77JPxfUXhUs+R1OdB1
 Kgmv42uobzL4BzcC5Xxq5Ubc1GAhzFyEK0uGUnMDVjc32/+v6gDf09JokFmbFw/0
 PNowl9bwCZHJQ9UGiVo4Mo29Gwj8BT7qFi0BQrYdZWeL0YAVcHPGAa/r2PCq1Sju
 p12SwEp27kFYfJcrFOFjM5YTP3N5T4KjKRGqA6RhprcgnQ1n0tH2VtJOElAs4C6r
 ojLkG2nr6mOOYZr+/nNcNmohdZXxdJ0tYgvJUjCyQ==
X-ME-Sender: <xms:WTjtWRC_H8ztvZDhV0lb378VrInUls-owhpXocgqo7NJJVMgQy495Q>
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id B0CB22479F;
 Sun, 22 Oct 2017 20:31:19 -0400 (EDT)
Message-ID: <1508718675.6013.3.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v2] drivers: i2c: fsi: Add proper abort
 method
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: cbostic@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
Date: Mon, 23 Oct 2017 11:01:15 +1030
In-Reply-To: <1508529741-29316-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1508529741-29316-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-r+qCrOLljsF7v5je4V/p"
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
X-List-Received-Date: Mon, 23 Oct 2017 00:31:31 -0000


--=-r+qCrOLljsF7v5je4V/p
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eddie,

Apologies for not being more thorough initially, I'm back again with commen=
ts.

On Fri, 2017-10-20 at 15:02 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Driver wasn't cleaning up on timeout or in an error situation properly.
> Need to do a full reset if we fail in order to re-stablish a good state
> of the engine.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>=C2=A0
> Changes since v1:
> =C2=A0* switch to TASK_UNINTERRUPTIBLE for waiting for command complete
>=C2=A0
> =C2=A0drivers/i2c/busses/i2c-fsi.c | 259 +++++++++++++++++++++++++++++++-=
-----------
> =C2=A01 file changed, 191 insertions(+), 68 deletions(-)
>=C2=A0
> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> index 1af9c01..fa44017 100644
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

I take it we're okay with cycling the bus as fast as we can, and not try to
maintain any particular rate? Not suggesting you need to change anything, j=
ust
asking the question.

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

I can't see that this (the whole reset sequence) is called with pre-emption
disabled, perhaps we should do so? It looks like this will be called in pro=
cess
context through fsi_i2c_xfer(). Stalling the recovery will just hold up oth=
er
processes wanting to use the bus as we'll hold the bus mutex across the tas=
k
switch.

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
> +	set_current_state(TASK_UNINTERRUPTIBLE);
> +	schedule_timeout(I2C_LOCAL_WAIT_TIMEOUT);
> +
> +	rc =3D fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
> +	if (rc)
> +		return rc;
> +
> +	if (stat & I2C_STAT_CMD_COMP)
> +		return 0;
> +
> +	/* failed to get command complete; reset engine again */
> +	rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
> +	if (rc)
> +		return rc;
> +
> +	/* re-init engine again */
> +	rc =3D fsi_i2c_dev_init(i2c);
> +	if (rc)
> +		return rc;
> +
> +	return 0;
> +}
> +
> +static int fsi_i2c_abort(struct fsi_i2c_port *port, u32 status)
> +{
> +	int rc;
> +	unsigned long start;
> +	u32 cmd =3D I2C_CMD_WITH_STOP;
> +	struct fsi_device *fsi =3D port->master->fsi;
> +
> +	rc =3D fsi_i2c_reset(port->master, port->port);
> +	if (rc)
> +		return rc;
> +
> +	/* skip final stop command for these errors */
> +	if (status & (I2C_STAT_PARITY | I2C_STAT_LOST_ARB | I2C_STAT_STOP_ERR))
> +		return 0;
> +
> +	rc =3D fsi_i2c_write_reg(fsi, I2C_FSI_CMD, &cmd);
> +	if (rc)
> +		return rc;
> +
> +	start =3D jiffies;
> +
> +	do {
> +		rc =3D fsi_i2c_read_reg(fsi, I2C_FSI_STAT, &status);
> +		if (rc)
> +			return rc;
> +
> +		if (status & I2C_STAT_CMD_COMP)
> +			return 0;
> +
> +		set_current_state(TASK_INTERRUPTIBLE);
> +		if (schedule_timeout(I2C_LOCAL_WAIT_TIMEOUT) > 0)
> +			return -EINTR;
> +
> +	} while (time_after(start + I2C_ABORT_TIMEOUT, jiffies));

I'm a bit ignorant here, but why do we expect the abort operation to take u=
p to
100ms? You mentioned you invented the numbers, but it's not clear what the
justification is.

> +
> +	return -ETIME;
> +}
> +
> =C2=A0static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
> =C2=A0				=C2=A0struct i2c_msg *msg, u32 status)
> =C2=A0{
> =C2=A0	int rc;
> =C2=A0	u8 fifo_count;
> -	struct fsi_i2c_master *i2c =3D port->master;
> -	u32 dummy =3D 0;
> =C2=A0
> =C2=A0	if (status & I2C_STAT_ERR) {
> -		rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
> +		rc =3D fsi_i2c_abort(port, status);
> =C2=A0		if (rc)
> =C2=A0			return rc;
> =C2=A0
> +		if (status & I2C_STAT_INV_CMD)
> +			return -EINVAL;
> +
> +		if (status & (I2C_STAT_PARITY | I2C_STAT_BE_OVERRUN |
> +		=C2=A0=C2=A0=C2=A0=C2=A0I2C_STAT_BE_ACCESS))
> +			return -EPROTO;
> +
> =C2=A0		if (status & I2C_STAT_NACK)
> =C2=A0			return -EFAULT;

EFAULT is "Bad address", but slaves can NACK things that aren't addresses.
As an example i2c-aspeed calls a NACK an EIO.

> =C2=A0
> +		if (status & I2C_STAT_LOST_ARB)
> +			return -ECANCELED;

So checking around the tree, all of i2c-aspeed, i2c-designware-core,
i2c-hix5hd2, i2c-kempld to name a few (I stopped checking at that point) us=
e
-EAGAIN for arbitration loss. I don't think -ECANCELLED is appropriate, and
certainly think that -EAGAIN is what we want: Nothing went wrong aside from
this master lost the arbitration race, so the caller should really just ret=
ry.

> +
> +		if (status & I2C_STAT_STOP_ERR)
> +			return -EBADMSG;
> +
> =C2=A0		return -EIO;
> =C2=A0	}
> =C2=A0
> @@ -396,9 +564,9 @@ static int fsi_i2c_handle_status(struct fsi_i2c_port =
*port,
> =C2=A0static int fsi_i2c_wait(struct fsi_i2c_port *port, struct i2c_msg *=
msg,
> =C2=A0			unsigned long timeout)
> =C2=A0{
> -	const unsigned long local_timeout =3D 2; /* jiffies */
> =C2=A0	u32 status =3D 0;
> -	int rc;
> +	int rc, rc_abort;
> +	unsigned long start =3D jiffies;
> =C2=A0
> =C2=A0	do {
> =C2=A0		rc =3D fsi_i2c_read_reg(port->master->fsi, I2C_FSI_STAT,
> @@ -419,13 +587,21 @@ static int fsi_i2c_wait(struct fsi_i2c_port *port, =
struct i2c_msg *msg,
> =C2=A0			continue;
> =C2=A0		}
> =C2=A0
> -		set_current_state(TASK_UNINTERRUPTIBLE);
> -		schedule_timeout(local_timeout);
> -		timeout =3D (timeout < local_timeout) ? 0 :
> -			timeout - local_timeout;
> -	} while (timeout);
> +		set_current_state(TASK_INTERRUPTIBLE);
> +		if (schedule_timeout(I2C_LOCAL_WAIT_TIMEOUT) > 0) {
> +			rc =3D -EINTR;
> +			goto abort;
> +		}
> +	} while (time_after(start + timeout, jiffies));
> =C2=A0
> -	return -ETIME;
> +	rc =3D -ETIME;
> +
> +abort:
> +	rc_abort =3D fsi_i2c_abort(port, status);
> +	if (rc_abort)
> +		return rc_abort;
> +
> +	return rc;
> =C2=A0}
> =C2=A0
> =C2=A0static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *m=
sgs,
> @@ -469,72 +645,19 @@ static u32 fsi_i2c_functionality(struct i2c_adapter=
 *adap)
> =C2=A0		| I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
> =C2=A0}
> =C2=A0
> -static int fsi_i2c_low_level_recover_bus(struct fsi_i2c_master *i2c)
> -{
> -	int i, rc;
> -	u32 mode, dummy =3D 0;
> -
> -	rc =3D fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
> -	if (rc)
> -		return rc;
> -
> -	mode |=3D I2C_MODE_DIAG;
> -	rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
> -	if (rc)
> -		return rc;
> -
> -	for (i =3D 0; i < 9; ++i) {
> -		rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SCL, &dummy);
> -		if (rc)
> -			return rc;
> -
> -		rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SCL, &dummy);
> -		if (rc)
> -			return rc;
> -	}
> -
> -	rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SCL, &dummy);
> -	if (rc)
> -		return rc;
> -
> -	rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_SDA, &dummy);
> -	if (rc)
> -		return rc;
> -
> -	rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SCL, &dummy);
> -	if (rc)
> -		return rc;
> -
> -	rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_SET_SDA, &dummy);
> -	if (rc)
> -		return rc;
> -
> -	mode &=3D ~I2C_MODE_DIAG;
> -	rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
> -
> -	return rc;
> -}
> -
> =C2=A0static int fsi_i2c_recover_bus(struct i2c_adapter *adap)
> =C2=A0{
> =C2=A0	int rc;
> -	u32 dummy =3D 0;
> =C2=A0	struct fsi_i2c_port *port =3D adap->algo_data;
> -	struct fsi_i2c_master *i2c =3D port->master;
> +	struct fsi_i2c_master *master =3D port->master;
> =C2=A0
> -	rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
> +	rc =3D fsi_i2c_lock_master(master, adap->timeout);
> =C2=A0	if (rc)
> =C2=A0		return rc;
> =C2=A0
> -	rc =3D fsi_i2c_dev_init(i2c);
> -	if (rc)
> -		return rc;
> +	rc =3D fsi_i2c_reset(master, port->port);
> =C2=A0
> -	rc =3D fsi_i2c_low_level_recover_bus(i2c);
> -	if (rc)
> -		return rc;
> -
> -	rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
> +	fsi_i2c_unlock_master(master);
> =C2=A0
> =C2=A0	return rc;
> =C2=A0}

Cheers,

Andrew
--=-r+qCrOLljsF7v5je4V/p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ7ThUAAoJEJ0dnzgO5LT59JEP/36Jmk7VedQuqBLHr3XFI8rv
YSwIRmqDF0OANY0JLHLpjdJJ5aNOSWIl1P/2x119NgFF+cxehyBoH3JA2b/eyk52
jt9qzavI9cOFKPfm17GUqvwCB7D5mOCtd6tUaiREYSGKLJfhyszHdeD6CylcVBzC
B2wGYlquxD/aaCgdkxNsjiRLI+cABqMUeFup4kROYe4urwsgegI1B+8MpQlLIeZz
w/WS1uCYCRNGUQu44Pd3TfzE1ZGsnbVWmaUxJ8bFn/ii0Jsj3DpXa096s+ENPq2N
uonIrAtknDm/OvWKM81oP72j3AlnyYxKmq2U0aDeNwbP5ux9yd1RWCfDbLEEiqGp
qMa8AcV76So83KUr+KBEp95M08lZjH7TWXpVeEh6cqWVuY4HynU7laOw5IRofh3U
CGjFsOwl0E5IYNtA3b7d1koLUL/mh7dKiYq6K8ELpQaWbk9PkNOPejz42g+wy+AE
etvzQLGJmGb/oko1Fo7k2ITjBxyDxxG7oFOwK1naWh1qH6Jg5FUm/S++K9DMUnD7
8hxKC0kOVXXbSAbE5bhrWP/1fz5sOlYGBqDHp1JYOZzd9tES6NJug7h4WbF/Lz3F
LTtU2ixUPPykC7CTIkT2yCndweIPlGjCXxh/RjGzutIGCokpwmbk6IUgv5a3jknT
iv4BQgaTTUT2K9YqwgYa
=S16r
-----END PGP SIGNATURE-----

--=-r+qCrOLljsF7v5je4V/p--
