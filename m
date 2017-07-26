Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHSNc022rzDqmb
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 18:06:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="qavVZysK"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="CVki2Tpy"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C842F20A26
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 04:06:05 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 26 Jul 2017 04:06:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=d+gHVIK/MX7SxT5D8qyNQxsrE3WVwT7obwwXEFszd
 8I=; b=qavVZysKkvgOFIaFyX4h29RB/dSpmPq3i2xu/dTgWzofKCZfd0PcT0mbz
 pexKK8gmY6xY+KGM/P6zOeXXS8JIgyKF7YGcXwoOCXNMA6RZUVoAJc3i/jBvQDe4
 quP7EPDsbjshKljGz/cRggz99Pl24ajGsGav6Aa4/GGNZqdFoY7f/IYEhML4O0MY
 UAQG67P2sRtJd7rgCdj/PIS6gy6iSHsHCq3fYnuSkivcQoAx66AHljQcHfHEgsuJ
 YvHKpfWIbwbADZcQnXuQb+T9ukwDq2EP3Mn9B5/u6e/0w2P5xB9T6pKA70t3o9vU
 VFhMMv/p8GbXnf4ETH+FTiH1FOMPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=d+gHVIK/MX7SxT5D8q
 yNQxsrE3WVwT7obwwXEFszd8I=; b=CVki2Tpyc/bmV0pbM9kiku1/yqTQ4tUqKk
 /d4CEZR+wou7OYHkh91Kf0k6bNHNkL5wNTJrTsBvUVaJucROUmx73xehZjs4mhD3
 a0ljC2CH24nN+sv9gs6sPBgky9lk/qBNWBbNhA/tCc6tDCrgXF0BJaogq2TPyMP1
 jYKVzIrakpCMi1VxmreJ4fl3eC2gy/RqAY9id4VHZ5Ee3I0FiGoSIzTk2cAxOQhL
 vNcTgtj747wrnDf31vSqTa8+52voBrw52m4pHumA5/1QT9vhBkdakh0KtvxQP5Rh
 jXa4sGs0Q7rkKzaCHhCiWWpGLwJfo0ejG7ZkZolep3DJZ8K4oYqw==
X-ME-Sender: <xms:bU14WRQXnasw8bG5HfsLizSemkPK2iL2xJFuznrU2hG-fZ4CGOkmMw>
X-Sasl-enc: aNDZJzMsaVpqwAw/7ekKLXFZbn0n6doV+iGfHP2HCm3l 1501056364
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 93A6124407
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 04:06:04 -0400 (EDT)
Message-ID: <1501056352.5179.12.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] i2c: aspeed: Reset to upstream version
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Date: Wed, 26 Jul 2017 17:35:52 +0930
In-Reply-To: <20170725065407.30880-1-joel@jms.id.au>
References: <20170725065407.30880-1-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-/DquaWV4R+c/OXTTKTqr"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Wed, 26 Jul 2017 08:06:09 -0000


--=-/DquaWV4R+c/OXTTKTqr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-07-25 at 16:24 +0930, Joel Stanley wrote:
> This sets the i2c device driver to the same state as the one that was
> included in the 4.13 merge window.
>=20
> By doing this we get fixes that happened in the latter stages of upstream
> review.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Tested-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> Instead of doing the revert and then cherry pick, this sets the tree to t=
he
> same state as the upstream driver.
>=20
> =C2=A0drivers/i2c/busses/i2c-aspeed.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 233 =
++++++++++++++++++------------------
> =C2=A0drivers/irqchip/irq-aspeed-i2c-ic.c |=C2=A0=C2=A031 +++--
> =C2=A02 files changed, 139 insertions(+), 125 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-asp=
eed.c
> index ee1f546fec05..f19348328a71 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -78,11 +78,6 @@
> > =C2=A0#define ASPEED_I2CD_INTR_RX_DONE			BIT(2)
> > =C2=A0#define ASPEED_I2CD_INTR_TX_NAK				BIT(1)
> > =C2=A0#define ASPEED_I2CD_INTR_TX_ACK				BIT(0)
> > -#define ASPEED_I2CD_INTR_ERROR						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0\
> > > -		(ASPEED_I2CD_INTR_ARBIT_LOSS |				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0\
> > > -		=C2=A0ASPEED_I2CD_INTR_ABNORMAL |				=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0\
> > > -		=C2=A0ASPEED_I2CD_INTR_SCL_TIMEOUT |				=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0\
> > -		=C2=A0ASPEED_I2CD_INTR_SDA_DL_TIMEOUT)
> > =C2=A0#define ASPEED_I2CD_INTR_ALL						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0\
> > > =C2=A0		(ASPEED_I2CD_INTR_SDA_DL_TIMEOUT |			=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0\
> > > =C2=A0		=C2=A0ASPEED_I2CD_INTR_BUS_RECOVER_DONE |			=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0\
> @@ -137,7 +132,8 @@ struct aspeed_i2c_bus {
> > =C2=A0	/* Synchronizes I/O mem access to base. */
> > > =C2=A0	spinlock_t			lock;
> > > =C2=A0	struct completion		cmd_complete;
> > > -	int				irq;
> > > +	unsigned long			parent_clk_frequency;
> > > +	u32				bus_frequency;
> > =C2=A0	/* Transaction state. */
> > > =C2=A0	enum aspeed_i2c_master_state	master_state;
> > > =C2=A0	struct i2c_msg			*msgs;
> @@ -146,6 +142,8 @@ struct aspeed_i2c_bus {
> > > =C2=A0	size_t				msgs_count;
> > > =C2=A0	bool				send_stop;
> > > =C2=A0	int				cmd_err;
> > +	/* Protected only by i2c_lock_bus */
> > > +	int				master_xfer_result;
> =C2=A0#if IS_ENABLED(CONFIG_I2C_SLAVE)
> > > =C2=A0	struct i2c_client		*slave;
> > > =C2=A0	enum aspeed_i2c_slave_state	slave_state;
> @@ -167,7 +165,7 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_b=
us *bus)
> > =C2=A0		/* Bus is idle: no recovery needed. */
> > =C2=A0		if (command & ASPEED_I2CD_SCL_LINE_STS)
> > =C2=A0			goto out;
> > -		dev_dbg(bus->dev, "bus hung (state %x), attempting recovery\n",
> > +		dev_dbg(bus->dev, "SCL hung (state %x), attempting recovery\n",
> > =C2=A0			command);
> =C2=A0
> > =C2=A0		reinit_completion(&bus->cmd_complete);
> @@ -185,13 +183,14 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c=
_bus *bus)
> > =C2=A0		/* Recovery failed. */
> > =C2=A0		else if (!(readl(bus->base + ASPEED_I2C_CMD_REG) &
> > =C2=A0			=C2=A0=C2=A0=C2=A0ASPEED_I2CD_SCL_LINE_STS))
> > -			ret =3D -EIO;
> > +			goto reset_out;
> > =C2=A0	/* Bus error. */
> > =C2=A0	} else {
> > -		dev_dbg(bus->dev, "bus hung (state %x), attempting recovery\n",
> > +		dev_dbg(bus->dev, "SDA hung (state %x), attempting recovery\n",
> > =C2=A0			command);
> =C2=A0
> > =C2=A0		reinit_completion(&bus->cmd_complete);
> > +		/* Writes 1 to 8 SCL clock cycles until SDA is released. */
> > =C2=A0		writel(ASPEED_I2CD_BUS_RECOVER_CMD,
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bus->base + ASPEED_I2=
C_CMD_REG);
> > =C2=A0		spin_unlock_irqrestore(&bus->lock, flags);
> @@ -207,7 +206,7 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_b=
us *bus)
> > =C2=A0		/* Recovery failed. */
> > =C2=A0		else if (!(readl(bus->base + ASPEED_I2C_CMD_REG) &
> > =C2=A0			=C2=A0=C2=A0=C2=A0ASPEED_I2CD_SDA_LINE_STS))
> > -			ret =3D -EIO;
> > +			goto reset_out;
> > =C2=A0	}
> =C2=A0
> =C2=A0out:
> @@ -325,7 +324,8 @@ static bool aspeed_i2c_slave_irq(struct aspeed_i2c_bu=
s *bus)
> =C2=A0}
> =C2=A0#endif /* CONFIG_I2C_SLAVE */
> =C2=A0
> -static void __aspeed_i2c_do_start(struct aspeed_i2c_bus *bus)
> +/* precondition: bus.lock has been acquired. */
> +static void aspeed_i2c_do_start(struct aspeed_i2c_bus *bus)
> =C2=A0{
> > =C2=A0	u32 command =3D ASPEED_I2CD_M_START_CMD | ASPEED_I2CD_M_TX_CMD;
> > =C2=A0	struct i2c_msg *msg =3D &bus->msgs[bus->msgs_index];
> @@ -346,30 +346,47 @@ static void __aspeed_i2c_do_start(struct aspeed_i2c=
_bus *bus)
> > =C2=A0	writel(command, bus->base + ASPEED_I2C_CMD_REG);
> =C2=A0}
> =C2=A0
> -static void __aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus)
> +/* precondition: bus.lock has been acquired. */
> +static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus)
> =C2=A0{
> > =C2=A0	bus->master_state =3D ASPEED_I2C_MASTER_STOP;
> > =C2=A0	writel(ASPEED_I2CD_M_STOP_CMD, bus->base + ASPEED_I2C_CMD_REG);
> =C2=A0}
> =C2=A0
> -static void __aspeed_i2c_next_msg_or_stop(struct aspeed_i2c_bus *bus)
> +/* precondition: bus.lock has been acquired. */
> +static void aspeed_i2c_next_msg_or_stop(struct aspeed_i2c_bus *bus)
> =C2=A0{
> > =C2=A0	if (bus->msgs_index + 1 < bus->msgs_count) {
> > =C2=A0		bus->msgs_index++;
> > -		__aspeed_i2c_do_start(bus);
> > +		aspeed_i2c_do_start(bus);
> > =C2=A0	} else {
> > -		__aspeed_i2c_do_stop(bus);
> > +		aspeed_i2c_do_stop(bus);
> > =C2=A0	}
> =C2=A0}
> =C2=A0
> +static int aspeed_i2c_is_irq_error(u32 irq_status)
> +{
> > +	if (irq_status & ASPEED_I2CD_INTR_ARBIT_LOSS)
> > +		return -EAGAIN;
> > +	if (irq_status & (ASPEED_I2CD_INTR_SDA_DL_TIMEOUT |
> > +			=C2=A0=C2=A0ASPEED_I2CD_INTR_SCL_TIMEOUT))
> > +		return -EBUSY;
> > +	if (irq_status & (ASPEED_I2CD_INTR_ABNORMAL))
> > +		return -EPROTO;
> +
> > +	return 0;
> +}
> +
> =C2=A0static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
> =C2=A0{
> > =C2=A0	u32 irq_status, status_ack =3D 0, command =3D 0;
> > =C2=A0	struct i2c_msg *msg;
> > =C2=A0	u8 recv_byte;
> > +	int ret;
> =C2=A0
> > =C2=A0	spin_lock(&bus->lock);
> > =C2=A0	irq_status =3D readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> > +	/* Ack all interrupt bits. */
> > =C2=A0	writel(irq_status, bus->base + ASPEED_I2C_INTR_STS_REG);
> =C2=A0
> > =C2=A0	if (irq_status & ASPEED_I2CD_INTR_BUS_RECOVER_DONE) {
> @@ -379,15 +396,24 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c=
_bus *bus)
> > =C2=A0	}
> =C2=A0
> > =C2=A0	/*
> > -	=C2=A0* Either we encountered an interrupt that reports an error, or =
we are
> > -	=C2=A0* in an invalid state.
> > +	=C2=A0* We encountered an interrupt that reports an error: the hardwa=
re
> > +	=C2=A0* should clear the command queue effectively taking us back to =
the
> > +	=C2=A0* INACTIVE state.
> > =C2=A0	=C2=A0*/
> > -	if (irq_status & ASPEED_I2CD_INTR_ERROR ||
> > -	=C2=A0=C2=A0=C2=A0=C2=A0(!bus->msgs && bus->master_state !=3D ASPEED_=
I2C_MASTER_STOP)) {
> > +	ret =3D aspeed_i2c_is_irq_error(irq_status);
> > +	if (ret < 0) {
> > =C2=A0		dev_dbg(bus->dev, "received error interrupt: 0x%08x",
> > =C2=A0			irq_status);
> > +		bus->cmd_err =3D ret;
> > +		bus->master_state =3D ASPEED_I2C_MASTER_INACTIVE;
> > +		goto out_complete;
> > +	}
> +
> > +	/* We are in an invalid state; reset bus to a known state. */
> > +	if (!bus->msgs && bus->master_state !=3D ASPEED_I2C_MASTER_STOP) {
> > +		dev_err(bus->dev, "bus in unknown state");
> > =C2=A0		bus->cmd_err =3D -EIO;
> > -		__aspeed_i2c_do_stop(bus);
> > +		aspeed_i2c_do_stop(bus);
> > =C2=A0		goto out_no_complete;
> > =C2=A0	}
> > =C2=A0	msg =3D &bus->msgs[bus->msgs_index];
> @@ -399,12 +425,17 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c=
_bus *bus)
> > =C2=A0	=C2=A0*/
> > =C2=A0	if (bus->master_state =3D=3D ASPEED_I2C_MASTER_START) {
> > =C2=A0		if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_ACK))) {
> > -			dev_dbg(bus->dev,
> > -				"no slave present at %02x", msg->addr);
> > +			pr_devel("no slave present at %02x", msg->addr);
> > =C2=A0			status_ack |=3D ASPEED_I2CD_INTR_TX_NAK;
> > -			goto error_and_stop;
> > +			bus->cmd_err =3D -ENXIO;
> > +			aspeed_i2c_do_stop(bus);
> > +			goto out_no_complete;
> > =C2=A0		}
> > =C2=A0		status_ack |=3D ASPEED_I2CD_INTR_TX_ACK;
> > +		if (msg->len =3D=3D 0) { /* SMBUS_QUICK */
> > +			aspeed_i2c_do_stop(bus);
> > +			goto out_no_complete;
> > +		}
> > =C2=A0		if (msg->flags & I2C_M_RD)
> > =C2=A0			bus->master_state =3D ASPEED_I2C_MASTER_RX_FIRST;
> > =C2=A0		else
> @@ -431,7 +462,7 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_b=
us *bus)
> > =C2=A0			writel(ASPEED_I2CD_M_TX_CMD,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bus->base + ASPEED_I=
2C_CMD_REG);
> > =C2=A0		} else {
> > -			__aspeed_i2c_next_msg_or_stop(bus);
> > +			aspeed_i2c_next_msg_or_stop(bus);
> > =C2=A0		}
> > =C2=A0		goto out_no_complete;
> > =C2=A0	case ASPEED_I2C_MASTER_RX_FIRST:
> @@ -452,7 +483,7 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_b=
us *bus)
> > =C2=A0		if (msg->flags & I2C_M_RECV_LEN) {
> > =C2=A0			if (unlikely(recv_byte > I2C_SMBUS_BLOCK_MAX)) {
> > =C2=A0				bus->cmd_err =3D -EPROTO;
> > -				__aspeed_i2c_do_stop(bus);
> > +				aspeed_i2c_do_stop(bus);
> > =C2=A0				goto out_no_complete;
> > =C2=A0			}
> > =C2=A0			msg->len =3D recv_byte +
> @@ -467,7 +498,7 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_b=
us *bus)
> > =C2=A0				command |=3D ASPEED_I2CD_M_S_RX_CMD_LAST;
> > =C2=A0			writel(command, bus->base + ASPEED_I2C_CMD_REG);
> > =C2=A0		} else {
> > -			__aspeed_i2c_next_msg_or_stop(bus);
> > +			aspeed_i2c_next_msg_or_stop(bus);
> > =C2=A0		}
> > =C2=A0		goto out_no_complete;
> > =C2=A0	case ASPEED_I2C_MASTER_STOP:
> @@ -491,14 +522,19 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c=
_bus *bus)
> > =C2=A0	default:
> > =C2=A0		WARN(1, "unknown master state\n");
> > =C2=A0		bus->master_state =3D ASPEED_I2C_MASTER_INACTIVE;
> > -		bus->cmd_err =3D -EIO;
> > +		bus->cmd_err =3D -EINVAL;
> > =C2=A0		goto out_complete;
> > =C2=A0	}
> =C2=A0error_and_stop:
> > =C2=A0	bus->cmd_err =3D -EIO;
> > -	__aspeed_i2c_do_stop(bus);
> > +	aspeed_i2c_do_stop(bus);
> > =C2=A0	goto out_no_complete;
> =C2=A0out_complete:
> > +	bus->msgs =3D NULL;
> > +	if (bus->cmd_err)
> > +		bus->master_xfer_result =3D bus->cmd_err;
> > +	else
> > +		bus->master_xfer_result =3D bus->msgs_index + 1;
> > =C2=A0	complete(&bus->cmd_complete);
> =C2=A0out_no_complete:
> > =C2=A0	if (irq_status !=3D status_ack)
> @@ -520,16 +556,13 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void=
 *dev_id)
> > =C2=A0	}
> =C2=A0#endif /* CONFIG_I2C_SLAVE */
> =C2=A0
> > -	if (aspeed_i2c_master_irq(bus))
> > -		return IRQ_HANDLED;
> > -	else
> > -		return IRQ_NONE;
> > +	return aspeed_i2c_master_irq(bus) ? IRQ_HANDLED : IRQ_NONE;
> =C2=A0}
> =C2=A0
> =C2=A0static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
> > =C2=A0				=C2=A0=C2=A0struct i2c_msg *msgs, int num)
> =C2=A0{
> > -	struct aspeed_i2c_bus *bus =3D adap->algo_data;
> > +	struct aspeed_i2c_bus *bus =3D i2c_get_adapdata(adap);
> > =C2=A0	unsigned long time_left, flags;
> > =C2=A0	int ret =3D 0;
> =C2=A0
> @@ -547,30 +580,22 @@ static int aspeed_i2c_master_xfer(struct i2c_adapte=
r *adap,
> > =C2=A0		spin_lock_irqsave(&bus->lock, flags);
> > =C2=A0	}
> =C2=A0
> > +	bus->cmd_err =3D 0;
> > =C2=A0	bus->msgs =3D msgs;
> > =C2=A0	bus->msgs_index =3D 0;
> > =C2=A0	bus->msgs_count =3D num;
> =C2=A0
> > =C2=A0	reinit_completion(&bus->cmd_complete);
> > -	__aspeed_i2c_do_start(bus);
> > +	aspeed_i2c_do_start(bus);
> > =C2=A0	spin_unlock_irqrestore(&bus->lock, flags);
> =C2=A0
> > =C2=A0	time_left =3D wait_for_completion_timeout(&bus->cmd_complete,
> > =C2=A0						bus->adap.timeout);
> =C2=A0
> > -	spin_lock_irqsave(&bus->lock, flags);
> > -	bus->msgs =3D NULL;
> > =C2=A0	if (time_left =3D=3D 0)
> > -		ret =3D -ETIMEDOUT;
> > -	else
> > -		ret =3D bus->cmd_err;
> > -	spin_unlock_irqrestore(&bus->lock, flags);
> -
> > -	/* If nothing went wrong, return number of messages transferred. */
> > -	if (ret >=3D 0)
> > -		return bus->msgs_index + 1;
> > +		return -ETIMEDOUT;
> > =C2=A0	else
> > -		return ret;
> > +		return bus->master_xfer_result;
> =C2=A0}
> =C2=A0
> =C2=A0static u32 aspeed_i2c_functionality(struct i2c_adapter *adap)
> @@ -579,6 +604,7 @@ static u32 aspeed_i2c_functionality(struct i2c_adapte=
r *adap)
> =C2=A0}
> =C2=A0
> =C2=A0#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +/* precondition: bus.lock has been acquired. */
> =C2=A0static void __aspeed_i2c_reg_slave(struct aspeed_i2c_bus *bus, u16 =
slave_addr)
> =C2=A0{
> > =C2=A0	u32 addr_reg_val, func_ctrl_reg_val;
> @@ -597,10 +623,9 @@ static void __aspeed_i2c_reg_slave(struct aspeed_i2c=
_bus *bus, u16 slave_addr)
> =C2=A0
> =C2=A0static int aspeed_i2c_reg_slave(struct i2c_client *client)
> =C2=A0{
> > -	struct aspeed_i2c_bus *bus;
> > +	struct aspeed_i2c_bus *bus =3D i2c_get_adapdata(client->adapter);
> > =C2=A0	unsigned long flags;
> =C2=A0
> > -	bus =3D client->adapter->algo_data;
> > =C2=A0	spin_lock_irqsave(&bus->lock, flags);
> > =C2=A0	if (bus->slave) {
> > =C2=A0		spin_unlock_irqrestore(&bus->lock, flags);
> @@ -618,7 +643,7 @@ static int aspeed_i2c_reg_slave(struct i2c_client *cl=
ient)
> =C2=A0
> =C2=A0static int aspeed_i2c_unreg_slave(struct i2c_client *client)
> =C2=A0{
> > -	struct aspeed_i2c_bus *bus =3D client->adapter->algo_data;
> > +	struct aspeed_i2c_bus *bus =3D i2c_get_adapdata(client->adapter);
> > =C2=A0	u32 func_ctrl_reg_val;
> > =C2=A0	unsigned long flags;
> =C2=A0
> @@ -687,71 +712,38 @@ static u32 aspeed_i2c_get_clk_reg_val(u32 divisor)
> > =C2=A0			| (base_clk & ASPEED_I2CD_TIME_BASE_DIVISOR_MASK);
> =C2=A0}
> =C2=A0
> -static int __aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus,
> > -				=C2=A0struct platform_device *pdev)
> +/* precondition: bus.lock has been acquired. */
> +static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus)
> =C2=A0{
> > -	u32 clk_freq, divisor, clk_reg_val;
> > -	struct clk *pclk;
> > -	int ret;
> -
> > -	pclk =3D devm_clk_get(&pdev->dev, NULL);
> > -	if (IS_ERR(pclk)) {
> > -		dev_err(&pdev->dev, "clk_get failed\n");
> > -		return PTR_ERR(pclk);
> > -	}
> > -	ret =3D of_property_read_u32(pdev->dev.of_node,
> > -				=C2=A0=C2=A0=C2=A0"bus-frequency", &clk_freq);
> > -	if (ret < 0) {
> > -		dev_err(&pdev->dev,
> > -			"Could not read bus-frequency property\n");
> > -		clk_freq =3D 100000;
> > -	}
> > -	divisor =3D clk_get_rate(pclk) / clk_freq;
> > -	/* We just need the clock rate, we don't actually use the clk object.=
 */
> > -	devm_clk_put(&pdev->dev, pclk);
> > +	u32 divisor, clk_reg_val;
> =C2=A0
> > +	divisor =3D bus->parent_clk_frequency / bus->bus_frequency;
> > =C2=A0	clk_reg_val =3D aspeed_i2c_get_clk_reg_val(divisor);
> > =C2=A0	writel(clk_reg_val, bus->base + ASPEED_I2C_AC_TIMING_REG1);
> -
> > -	/*
> > -	=C2=A0* If the base divisor is non-zero then we do not want to enable=
 high
> > -	=C2=A0* speed mode, otherwise we might as well enable it.
> > -	=C2=A0* For reference, setting high speed mode will make the base div=
isor
> > -	=C2=A0* zero and corresponds to a minimum SCL frequency of about 1.5M=
Hz.
> > -	=C2=A0*/
> > -	if (clk_reg_val & ASPEED_I2CD_TIME_BASE_DIVISOR_MASK) {
> > -		writel(ASPEED_NO_TIMEOUT_CTRL,
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bus->base + ASPEED_I2C_AC_=
TIMING_REG2);
> > -	} else {
> > -		writel(readl(bus->base + ASPEED_I2C_FUN_CTRL_REG) |
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ASPEED_I2CD_M_HIGH_SPEED_E=
N |
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ASPEED_I2CD_M_SDA_DRIVE_1T=
_EN |
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ASPEED_I2CD_SDA_DRIVE_1T_E=
N,
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bus->base + ASPEED_I2C_FUN=
_CTRL_REG);
> -
> > -		writel(0x3, bus->base + ASPEED_I2C_AC_TIMING_REG2);
> > -	}
> > +	writel(ASPEED_NO_TIMEOUT_CTRL, bus->base + ASPEED_I2C_AC_TIMING_REG2)=
;
> =C2=A0
> > =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static int __aspeed_i2c_init(struct aspeed_i2c_bus *bus,
> +/* precondition: bus.lock has been acquired. */
> +static int aspeed_i2c_init(struct aspeed_i2c_bus *bus,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct platform_device *pdev)
> =C2=A0{
> > +	u32 fun_ctrl_reg =3D ASPEED_I2CD_MASTER_EN;
> > =C2=A0	int ret;
> =C2=A0
> > =C2=A0	/* Disable everything. */
> > =C2=A0	writel(0, bus->base + ASPEED_I2C_FUN_CTRL_REG);
> =C2=A0
> > -	ret =3D __aspeed_i2c_init_clk(bus, pdev);
> > +	ret =3D aspeed_i2c_init_clk(bus);
> > =C2=A0	if (ret < 0)
> > =C2=A0		return ret;
> =C2=A0
> > +	if (!of_property_read_bool(pdev->dev.of_node, "multi-master"))
> > +		fun_ctrl_reg |=3D ASPEED_I2CD_MULTI_MASTER_DIS;
> +
> > =C2=A0	/* Enable Master Mode */
> > -	writel(readl(bus->base + ASPEED_I2C_FUN_CTRL_REG) |
> > -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ASPEED_I2CD_MASTER_EN |
> > -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* TODO: provide device tre=
e option for multi-master mode. */
> > -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ASPEED_I2CD_MULTI_MASTER_DI=
S,
> > +	writel(readl(bus->base + ASPEED_I2C_FUN_CTRL_REG) | fun_ctrl_reg,
> > =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bus->base + ASPEED_I2C=
_FUN_CTRL_REG);
> =C2=A0
> =C2=A0#if IS_ENABLED(CONFIG_I2C_SLAVE)
> @@ -774,20 +766,11 @@ static int aspeed_i2c_reset(struct aspeed_i2c_bus *=
bus)
> =C2=A0
> > =C2=A0	spin_lock_irqsave(&bus->lock, flags);
> =C2=A0
> > -	/* Disable and quiesce interrupts. */
> > -	reinit_completion(&bus->cmd_complete);
> > +	/* Disable and ack all interrupts. */
> > =C2=A0	writel(0, bus->base + ASPEED_I2C_INTR_CTRL_REG);
> > +	writel(0xffffffff, bus->base + ASPEED_I2C_INTR_STS_REG);
> =C2=A0
> > -	spin_unlock_irqrestore(&bus->lock, flags);
> > -	/*
> > -	=C2=A0* We need to make sure that there are no interrupts that fired =
just
> > -	=C2=A0* before we grabbed the lock; if that did not happen, then we a=
re going
> > -	=C2=A0* to timeout and that is okay.
> > -	=C2=A0*/
> > -	wait_for_completion_timeout(&bus->cmd_complete, bus->adap.timeout);
> > -	spin_lock_irqsave(&bus->lock, flags);
> -
> > -	ret =3D __aspeed_i2c_init(bus, pdev);
> > +	ret =3D aspeed_i2c_init(bus, pdev);
> =C2=A0
> > =C2=A0	spin_unlock_irqrestore(&bus->lock, flags);
> =C2=A0
> @@ -797,8 +780,9 @@ static int aspeed_i2c_reset(struct aspeed_i2c_bus *bu=
s)
> =C2=A0static int aspeed_i2c_probe_bus(struct platform_device *pdev)
> =C2=A0{
> > =C2=A0	struct aspeed_i2c_bus *bus;
> > +	struct clk *parent_clk;
> > =C2=A0	struct resource *res;
> > -	int ret;
> > +	int irq, ret;
> =C2=A0
> > =C2=A0	bus =3D devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
> > =C2=A0	if (!bus)
> @@ -809,6 +793,21 @@ static int aspeed_i2c_probe_bus(struct platform_devi=
ce *pdev)
> > =C2=A0	if (IS_ERR(bus->base))
> > =C2=A0		return PTR_ERR(bus->base);
> =C2=A0
> > +	parent_clk =3D devm_clk_get(&pdev->dev, NULL);
> > +	if (IS_ERR(parent_clk))
> > +		return PTR_ERR(parent_clk);
> > +	bus->parent_clk_frequency =3D clk_get_rate(parent_clk);
> > +	/* We just need the clock rate, we don't actually use the clk object.=
 */
> > +	devm_clk_put(&pdev->dev, parent_clk);
> +
> > +	ret =3D of_property_read_u32(pdev->dev.of_node,
> > +				=C2=A0=C2=A0=C2=A0"bus-frequency", &bus->bus_frequency);
> > +	if (ret < 0) {
> > +		dev_err(&pdev->dev,
> > +			"Could not read bus-frequency property\n");
> > +		bus->bus_frequency =3D 100000;
> > +	}
> +
> > =C2=A0	/* Initialize the I2C adapter */
> > =C2=A0	spin_lock_init(&bus->lock);
> > =C2=A0	init_completion(&bus->cmd_complete);
> @@ -816,24 +815,26 @@ static int aspeed_i2c_probe_bus(struct platform_dev=
ice *pdev)
> > =C2=A0	bus->adap.retries =3D 0;
> > =C2=A0	bus->adap.timeout =3D 5 * HZ;
> > =C2=A0	bus->adap.algo =3D &aspeed_i2c_algo;
> > -	bus->adap.algo_data =3D bus;
> > =C2=A0	bus->adap.dev.parent =3D &pdev->dev;
> > =C2=A0	bus->adap.dev.of_node =3D pdev->dev.of_node;
> > -	snprintf(bus->adap.name, sizeof(bus->adap.name), "Aspeed i2c");
> > +	strlcpy(bus->adap.name, pdev->name, sizeof(bus->adap.name));
> > +	i2c_set_adapdata(&bus->adap, bus);
> =C2=A0
> > =C2=A0	bus->dev =3D &pdev->dev;
> =C2=A0
> > +	/* Clean up any left over interrupt state. */
> > +	writel(0, bus->base + ASPEED_I2C_INTR_CTRL_REG);
> > +	writel(0xffffffff, bus->base + ASPEED_I2C_INTR_STS_REG);
> > =C2=A0	/*
> > -	=C2=A0* No need to quiesce interrupts because there is no interrupt h=
andler
> > -	=C2=A0* installed.
> > +	=C2=A0* bus.lock does not need to be held because the interrupt handl=
er has
> > +	=C2=A0* not been enabled yet.
> > =C2=A0	=C2=A0*/
> > -	writel(0, bus->base + ASPEED_I2C_INTR_CTRL_REG);
> > -	ret =3D __aspeed_i2c_init(bus, pdev);
> > +	ret =3D aspeed_i2c_init(bus, pdev);
> > =C2=A0	if (ret < 0)
> > =C2=A0		return ret;
> =C2=A0
> > -	bus->irq =3D irq_of_parse_and_map(pdev->dev.of_node, 0);
> > -	ret =3D devm_request_irq(&pdev->dev, bus->irq, aspeed_i2c_bus_irq,
> > +	irq =3D irq_of_parse_and_map(pdev->dev.of_node, 0);
> > +	ret =3D devm_request_irq(&pdev->dev, irq, aspeed_i2c_bus_irq,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00, dev_name(&pdev->d=
ev), bus);
> > =C2=A0	if (ret < 0)
> > =C2=A0		return ret;
> @@ -845,7 +846,7 @@ static int aspeed_i2c_probe_bus(struct platform_devic=
e *pdev)
> > =C2=A0	platform_set_drvdata(pdev, bus);
> =C2=A0
> > =C2=A0	dev_info(bus->dev, "i2c bus %d registered, irq %d\n",
> > -		=C2=A0bus->adap.nr, bus->irq);
> > +		=C2=A0bus->adap.nr, irq);
> =C2=A0
> > =C2=A0	return 0;
> =C2=A0}
> diff --git a/drivers/irqchip/irq-aspeed-i2c-ic.c b/drivers/irqchip/irq-as=
peed-i2c-ic.c
> index a36fb09c10c2..815b88dd18f2 100644
> --- a/drivers/irqchip/irq-aspeed-i2c-ic.c
> +++ b/drivers/irqchip/irq-aspeed-i2c-ic.c
> @@ -69,24 +69,31 @@ static int __init aspeed_i2c_ic_of_init(struct device=
_node *node,
> > =C2=A0					struct device_node *parent)
> =C2=A0{
> > =C2=A0	struct aspeed_i2c_ic *i2c_ic;
> > +	int ret =3D 0;
> =C2=A0
> > =C2=A0	i2c_ic =3D kzalloc(sizeof(*i2c_ic), GFP_KERNEL);
> > =C2=A0	if (!i2c_ic)
> > =C2=A0		return -ENOMEM;
> =C2=A0
> > =C2=A0	i2c_ic->base =3D of_iomap(node, 0);
> > -	if (IS_ERR(i2c_ic->base))
> > -		return PTR_ERR(i2c_ic->base);
> > +	if (IS_ERR(i2c_ic->base)) {
> > +		ret =3D PTR_ERR(i2c_ic->base);
> > +		goto err_free_ic;
> > +	}
> =C2=A0
> > =C2=A0	i2c_ic->parent_irq =3D irq_of_parse_and_map(node, 0);
> > -	if (i2c_ic->parent_irq < 0)
> > -		return i2c_ic->parent_irq;
> > +	if (i2c_ic->parent_irq < 0) {
> > +		ret =3D i2c_ic->parent_irq;
> > +		goto err_iounmap;
> > +	}
> =C2=A0
> > -	i2c_ic->irq_domain =3D irq_domain_add_linear(
> > -			node, ASPEED_I2C_IC_NUM_BUS,
> > -			&aspeed_i2c_ic_irq_domain_ops, NULL);
> > -	if (!i2c_ic->irq_domain)
> > -		return -ENOMEM;
> > +	i2c_ic->irq_domain =3D irq_domain_add_linear(node, ASPEED_I2C_IC_NUM_=
BUS,
> > +						=C2=A0=C2=A0=C2=A0&aspeed_i2c_ic_irq_domain_ops,
> > +						=C2=A0=C2=A0=C2=A0NULL);
> > +	if (!i2c_ic->irq_domain) {
> > +		ret =3D -ENOMEM;
> > +		goto err_iounmap;
> > +	}
> =C2=A0
> > =C2=A0	i2c_ic->irq_domain->name =3D "aspeed-i2c-domain";
> =C2=A0
> @@ -96,6 +103,12 @@ static int __init aspeed_i2c_ic_of_init(struct device=
_node *node,
> > =C2=A0	pr_info("i2c controller registered, irq %d\n", i2c_ic->parent_ir=
q);
> =C2=A0
> > =C2=A0	return 0;
> +
> +err_iounmap:
> > +	iounmap(i2c_ic->base);
> +err_free_ic:
> > +	kfree(i2c_ic);
> > +	return ret;
> =C2=A0}
> =C2=A0
> =C2=A0IRQCHIP_DECLARE(ast2400_i2c_ic, "aspeed,ast2400-i2c-ic", aspeed_i2c=
_ic_of_init);
--=-/DquaWV4R+c/OXTTKTqr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZeE1gAAoJEJ0dnzgO5LT5pn4QAKJSGeUGyX7PgQtMooxZsRe8
u3b9GoYkebwA2Mn9mzCSEcEZfyR86vzIfJt7eNvIrJwau5ByxQm8Hp8VxABdPddw
z4XBX8RFN/mwPO2ZziVQNOQPfNZY9ygvAJ0+Qrk/teaU25i5oVbuWo6odpZdGFxA
FrjpyFsS/BAEcEA5P5wa23w+5HdbE3xvwKGU7q3vT/NyUFNZNQwsYl/Lv2Os36hu
1l0yxDDmdxv4swJ2tQa+YKVQDUaIvH4emMJ6+yiZ1u2pQAyG74a/8Z/6lbeVIg9B
ZIgRIJ8aB1fOEN7EkII1rFwLvNfyf5191wUBPqRGaj9OtuAcdbSrqJfaVmMLOLiP
qhcY1yjaO+Z7TNCAHZZl9+5ipr4sKBEH78BQ012DdS6YDXWP4n/+nagrKY1OtzOs
XAygBtF6SX5eUlDl4cTu0Mp61u7GV/Fs0exQv31BVI+P0HScnGwHl6KzFae1AIVZ
VhzzRx17Skhddjx2i+6nX8i827eC7c9Yg8xhxoM05g1i0CA13o/1edsLLmLaq9k/
Iz+M0HHMVR3iE7zYyjudguBadXl5quaVQ0qQeD97/C9NhOOTNKmkIpHeSFIZLhSx
zVBP8QvOfaBUuVnrnxReBY7vnEmsHX9eMJjKIRRXN9gZeiTLZuN8hm/3j4vcp45Y
CsVe6irZXDl3TPCOMQ++
=cQyP
-----END PGP SIGNATURE-----

--=-/DquaWV4R+c/OXTTKTqr--
