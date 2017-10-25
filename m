Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="DdRtK3AY"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Le1EhDZc"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yMBjL3jlQzDqT0
 for <openbmc@lists.ozlabs.org>; Wed, 25 Oct 2017 12:03:49 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4B15E20A43;
 Tue, 24 Oct 2017 21:03:44 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 24 Oct 2017 21:03:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=XWYzc6mbDX/ol3toqJaSJhMmktqt0InjA76/iQduf2g=; b=DdRtK3AY
 5TUvHGTZQi8mpWxSAkWfF/OvSB0hjixdqan/8kXu00IDhhagba3+Npo4Vg1pEs5L
 hGHRuYRtweUdk924UbiFHf3gxWZlYdDlpDMgorZvVlWLRB3jd756LgOHwK6ajQXS
 NX5SgSJ3cv7PS88omzJEGN/PknQiaGedrAKl/HVkPC0upc+XWlEJkuR3bMwNZ30b
 Dqm1w5x8ZwJbBf2YD+mZiJ8qU+eGDfn82hpwH4DMV1rZPmyVkEoPriTahr0bEPTA
 7VSI+nMsSHHbxu7oS9uuJ/rDXefQ8IuJDrb5wMz/NrakSLcnzhey2SRgVWmE2hKq
 G2VauqucV3zEqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=XWYzc6mbDX/ol3toqJaSJhMmktqt0
 InjA76/iQduf2g=; b=Le1EhDZcj6h8i6IkOIVhRfUi7RKCta0+nSb9R3H7A4I7Z
 cNMZg22RmC74g2cOWAzBpgBNNmvKh5w8lGsQcLCzki1uq62TBqDhLvUydHXb/ltJ
 k5XbMjnZByZ0Eiv5wB0fz+XKy0OP2M/8m+ucUmJdgXOlwbAhTAuPoOgfdEIQv67I
 LPoKmKYVztjDJyDWoBL+WymKrp8XsAJhKoqOxHxdMe7v9ps5WBmjqmvaE6T/UjO4
 yvWx8nS/8gwbbJbEBjxdWQHDMGTGKsV3PIw8OYJZkK67YVuLov12TnYkLLAAjRJA
 SRPEcZWdrlNwoNFPM4miV95eXvqI3SiQ8O2s0T+PQ==
X-ME-Sender: <xms:8OLvWZcC83NinQGsUOL2_sw71SDtHE7xdTvXpTaH4N45-fA-MoLA2g>
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 991A1241D9;
 Tue, 24 Oct 2017 21:03:42 -0400 (EDT)
Message-ID: <1508893417.13477.1.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v2] drivers: i2c: fsi: Add proper abort
 method
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, cbostic@linux.vnet.ibm.com
Date: Wed, 25 Oct 2017 11:33:37 +1030
In-Reply-To: <de884d77-04a2-1095-8198-89f2ce93e029@linux.vnet.ibm.com>
References: <1508529741-29316-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1508718675.6013.3.camel@aj.id.au>
 <de884d77-04a2-1095-8198-89f2ce93e029@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-w88OMmEopmiXVks7jYz3"
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
X-List-Received-Date: Wed, 25 Oct 2017 01:03:53 -0000


--=-w88OMmEopmiXVks7jYz3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > > +static int fsi_i2c_reset(struct fsi_i2c_master *i2c, u16 port)
> > > +{
> >=C2=A0
> > I can't see that this (the whole reset sequence) is called with pre-emp=
tion
> > disabled, perhaps we should do so? It looks like this will be called in=
 process
> > context through fsi_i2c_xfer(). Stalling the recovery will just hold up=
 other
> > processes wanting to use the bus as we'll hold the bus mutex across the=
 task
> > switch.
>=C2=A0
> Well, presumably we want to block other access to the bus? We need to=C2=
=A0
> get the master back in a good state before releasing it for other transfe=
rs.

Right, that's my point. By disabling pre-emption we do that as fast as
possible by avoiding switching to other process contexts whilst holding the
mutex. This would happen at the cost of processes that don't care about the
bus (those that do are, or will, be waiting on the mutex anyway), but as we=
're
performing a hardware recovery sequence I feel it should be prioritised. On=
ly
the context owning the mutex can recover the bus, therefore I think it's mo=
re
useful to avoid switching to other process contexts until we finish the
recovery.

I guess we need to think about system robustness in that case though. Can w=
e
get stuck in this recovery sequence? fsi_*() calls time out if I recall
correctly, so the answer would appear to be no, in which case this shouldn'=
t be
problematic. The system might be "sticky" if we start hitting FSI timeouts =
but
beyond that things should continue (aside from either FSI or the I2C bus be=
ing
broken).

So this is all coming from my gut feeling that things like bus recovery wou=
ld
usually happen under a spinlock, which disables pre-emption. Maybe we shoul=
d
discuss that before getting down in the weeds like we are.

>=C2=A0
> >=C2=A0
> > > +	int rc;
> > > +	u32 mode, stat, dummy =3D 0;
> > > +
> > > +	/* reset engine */
> > > +	rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
> > > +	if (rc)
> > > +		return rc;
> > > +
> > > +	/* re-init engine */
> > > +	rc =3D fsi_i2c_dev_init(i2c);
> > > +	if (rc)
> > > +		return rc;
> > > +
> > > +	rc =3D fsi_i2c_read_reg(i2c->fsi, I2C_FSI_MODE, &mode);
> > > +	if (rc)
> > > +		return rc;
> > > +
> > > +	/* set port; default after reset is 0 */
> > > +	if (port) {
> > > +		mode =3D SETFIELD(I2C_MODE_PORT, mode, port);
> > > +		rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
> > > +		if (rc)
> > > +			return rc;
> > > +	}
> > > +
> > > +	/* reset busy register; hw workaround */
> > > +	dummy =3D I2C_PORT_BUSY_RESET;
> > > +	rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_PORT_BUSY, &dummy);
> > > +	if (rc)
> > > +		return rc;
> > > +
> > > +	/* force bus reset */
> > > +	rc =3D fsi_i2c_reset_bus(i2c);
> > > +	if (rc)
> > > +		return rc;
> > > +
> > > +	/* reset errors */
> > > +	dummy =3D 0;
> > > +	rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
> > > +	if (rc)
> > > +		return rc;
> > > +
> > > +	/* wait for command complete */
> > > +	set_current_state(TASK_UNINTERRUPTIBLE);
> > > +	schedule_timeout(I2C_LOCAL_WAIT_TIMEOUT);
> > > +
> > > +	rc =3D fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
> > > +	if (rc)
> > > +		return rc;
> > > +
> > > +	if (stat & I2C_STAT_CMD_COMP)
> > > +		return 0;
> > > +
> > > +	/* failed to get command complete; reset engine again */
> > > +	rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
> > > +	if (rc)
> > > +		return rc;
> > > +
> > > +	/* re-init engine again */
> > > +	rc =3D fsi_i2c_dev_init(i2c);
> > > +	if (rc)
> > > +		return rc;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int fsi_i2c_abort(struct fsi_i2c_port *port, u32 status)
> > > +{
> > > +	int rc;
> > > +	unsigned long start;
> > > +	u32 cmd =3D I2C_CMD_WITH_STOP;
> > > +	struct fsi_device *fsi =3D port->master->fsi;
> > > +
> > > +	rc =3D fsi_i2c_reset(port->master, port->port);
> > > +	if (rc)
> > > +		return rc;
> > > +
> > > +	/* skip final stop command for these errors */
> > > +	if (status & (I2C_STAT_PARITY | I2C_STAT_LOST_ARB | I2C_STAT_STOP_E=
RR))
> > > +		return 0;
> > > +
> > > +	rc =3D fsi_i2c_write_reg(fsi, I2C_FSI_CMD, &cmd);
> > > +	if (rc)
> > > +		return rc;
> > > +
> > > +	start =3D jiffies;
> > > +
> > > +	do {
> > > +		rc =3D fsi_i2c_read_reg(fsi, I2C_FSI_STAT, &status);
> > > +		if (rc)
> > > +			return rc;
> > > +
> > > +		if (status & I2C_STAT_CMD_COMP)
> > > +			return 0;
> > > +
> > > +		set_current_state(TASK_INTERRUPTIBLE);
> > > +		if (schedule_timeout(I2C_LOCAL_WAIT_TIMEOUT) > 0)
> > > +			return -EINTR;
> > > +
> > > +	} while (time_after(start + I2C_ABORT_TIMEOUT, jiffies));
> >=C2=A0
> > I'm a bit ignorant here, but why do we expect the abort operation to ta=
ke up to
> > 100ms? You mentioned you invented the numbers, but it's not clear what =
the
> > justification is.
>=C2=A0
> I used the same timeout used in the FSP driver, which seems to work. I=C2=
=A0
> really have no other justification for this value.

That's probably worth a comment in the code.

>=C2=A0
> >=C2=A0
> > > +
> > > +	return -ETIME;
> > > +}
> > > +
> > > =C2=A0 static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
> > > =C2=A0=C2=A0				=C2=A0struct i2c_msg *msg, u32 status)
> > > =C2=A0 {
> > > =C2=A0=C2=A0	int rc;
> > > =C2=A0=C2=A0	u8 fifo_count;
> > > -	struct fsi_i2c_master *i2c =3D port->master;
> > > -	u32 dummy =3D 0;
> > > =C2=A0=C2=A0
> > > =C2=A0=C2=A0	if (status & I2C_STAT_ERR) {
> > > -		rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
> > > +		rc =3D fsi_i2c_abort(port, status);
> > > =C2=A0=C2=A0		if (rc)
> > > =C2=A0=C2=A0			return rc;
> > > =C2=A0=C2=A0
> > > +		if (status & I2C_STAT_INV_CMD)
> > > +			return -EINVAL;
> > > +
> > > +		if (status & (I2C_STAT_PARITY | I2C_STAT_BE_OVERRUN |
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0I2C_STAT_BE_ACCESS))
> > > +			return -EPROTO;
> > > +
> > > =C2=A0=C2=A0		if (status & I2C_STAT_NACK)
> > > =C2=A0=C2=A0			return -EFAULT;
> >=C2=A0
> > EFAULT is "Bad address", but slaves can NACK things that aren't address=
es.
> > As an example i2c-aspeed calls a NACK an EIO.
>=C2=A0
> True, but I dislike returning EIO as it's somewhat of a default option=C2=
=A0
> and makes it very difficult to determine what actually went wrong. How=C2=
=A0
> about ENXIO?

What does userspace do with that knowledge? Is it worth differentiating? I
can't immediately see that it is. Maybe it's worth a dev_dbg() or something=
?
I feel ENXIO doesn't address my point either, as it means "No such device o=
r
address", which is still inappropriate for data NACKs.

>=C2=A0
> >=C2=A0
> > > =C2=A0=C2=A0
> > > +		if (status & I2C_STAT_LOST_ARB)
> > > +			return -ECANCELED;
> >=C2=A0
> > So checking around the tree, all of i2c-aspeed, i2c-designware-core,
> > i2c-hix5hd2, i2c-kempld to name a few (I stopped checking at that point=
) use
> > -EAGAIN for arbitration loss. I don't think -ECANCELLED is appropriate,=
 and
> > certainly think that -EAGAIN is what we want: Nothing went wrong aside =
from
> > this master lost the arbitration race, so the caller should really just=
 retry.
>=C2=A0
> Good point, however, for this master, it can often return arbitration=C2=
=A0
> lost if the clock or data line is stuck, and retries will not work. I'll=
=C2=A0
> switch it to EAGAIN, callers shouldn't try too many times hopefully...

Can we test status again when a new transfer is starting to see if we need =
to
recover the bus before proceeding?

Cheers,

Andrew
--=-w88OMmEopmiXVks7jYz3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ7+LpAAoJEJ0dnzgO5LT51hYQAK0bMEVOygNldQjbCywksC02
ia2+FR1/UpY89HXKyv/MteQfODLFcVfLr93aAWrttbtnkkhTWlELXD8rAtHtGnmC
9Fm7bzh7+5Nec0WNRWGU5titr4Vps9wbbDUVEdv79b6+1TSrvyyS7dGyOGVaV6t2
OYGo4YLM91ZTeDOX3Nk7x5DWOdPPVkC1hVRRKbb1wfOlbhAldnNf1srTRF8T4MxU
zahcw/Mig9lMQbBxyz7h5TEmqV2AktV3wnkcue/xGjgjojzSFo9kBGq8OyA1W9jL
UBoEpq3/bvIVnbPigx/PVUZNB7ClxCrkBMrI2qNYwcz5ZfBZ847OkJctjTnxGTkr
h8RUu6sO6UHiXrr39our8x8prTrs7sZIROm6Ykp8rXeXbyx3f3RbfGAZY/r3fZuI
5RB6MjgrNxmSKoYcESbR8i9lGHp84jx+Kq8GvHS4aSXdxraziDoaupFxWZgHRSv1
w20RpglDSH5Mz+11dDC/gfigyv5dwIAD/TephLjvtqYmA20VyfRvi8kM9nK5vpss
bUrLP954ady88C6CMG0pBhoP2R+fNv2FXCIgew7/XluO2pZ+tQydLWnvzubQbCZu
0m+ROvG2NNxeRvfcO71QXI7yiA08Xd5YJ0pcHsvgLWVUKTowQSZVK38EQ3ZiS9mq
k9duWtm2cojydOPD9vYl
=3qpA
-----END PGP SIGNATURE-----

--=-w88OMmEopmiXVks7jYz3--
