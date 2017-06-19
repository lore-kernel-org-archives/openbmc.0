Return-Path: <wsa@the-dreams.de>
X-Greylist: delayed 439 seconds by postgrey-1.36 at bilbo;
 Tue, 20 Jun 2017 00:20:46 AEST
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 3wrtRy5YdYzDq7c
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 00:20:46 +1000 (AEST)
Received: from localhost (p54B337D6.dip0.t-ipconnect.de [84.179.55.214])
 by pokefinder.org (Postfix) with ESMTPSA id D01D12C1F4C;
 Mon, 19 Jun 2017 16:13:23 +0200 (CEST)
Date: Mon, 19 Jun 2017 16:13:22 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
 jason@lakedaemon.net, marc.zyngier@arm.com, joel@jms.id.au,
 vz@mleia.com, mouse@mayc.ru, clg@kaod.org, benh@kernel.crashing.org,
 ryan_chen@aspeedtech.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH v10 4/5] i2c: aspeed: added driver for Aspeed I2C
Message-ID: <20170619141322.devvmcbjaeq4jnv5@ninjato>
References: <20170603012952.2192-1-brendanhiggins@google.com>
 <20170603012952.2192-5-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2cmgty3wah3fdqz5"
Content-Disposition: inline
In-Reply-To: <20170603012952.2192-5-brendanhiggins@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
X-List-Received-Date: Mon, 19 Jun 2017 14:20:47 -0000


--2cmgty3wah3fdqz5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Brendan,

here is my review. Only minor stuff, no real show-stopper.

> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 144cbadc7c72..280f84a0d7d1 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -326,6 +326,16 @@ config I2C_POWERMAC
> =20
>  comment "I2C system bus drivers (mostly embedded / system-on-chip)"
> =20
> +config I2C_ASPEED
> +	tristate "Aspeed I2C Controller"
> +	depends on ARCH_ASPEED

|| COMPILE_TEST?

> +	help
> +	  If you say yes to this option, support will be included for the
> +	  Aspeed I2C controller.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called i2c-aspeed.
> +
>  config I2C_AT91
>  	tristate "Atmel AT91 I2C Two-Wire interface (TWI)"
>  	depends on ARCH_AT91
> +struct aspeed_i2c_bus {
> +	struct i2c_adapter		adap;
> +	struct device			*dev;
> +	void __iomem			*base;
> +	/* Synchronizes I/O mem access to base. */
> +	spinlock_t			lock;
> +	struct completion		cmd_complete;
> +	int				irq;

'irq' not really needed, I'd think.

> +	unsigned long			parent_clk_frequency;
> +	u32				bus_frequency;
> +	/* Transaction state. */
> +	enum aspeed_i2c_master_state	master_state;
> +	struct i2c_msg			*msgs;
> +	size_t				buf_index;
> +	size_t				msgs_index;
> +	size_t				msgs_count;
> +	bool				send_stop;
> +	int				cmd_err;
> +	/* Protected only by i2c_lock_bus */
> +	int				master_xfer_result;
> +};

=2E..

> +static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
> +{
> +	unsigned long time_left, flags;
> +	int ret =3D 0;
> +	u32 command;
> +
> +	spin_lock_irqsave(&bus->lock, flags);
> +	command =3D readl(bus->base + ASPEED_I2C_CMD_REG);
> +
> +	if (command & ASPEED_I2CD_SDA_LINE_STS) {
> +		/* Bus is idle: no recovery needed. */
> +		if (command & ASPEED_I2CD_SCL_LINE_STS)
> +			goto out;
> +		dev_dbg(bus->dev, "bus hung (state %x), attempting recovery\n",
> +			command);
> +
> +		reinit_completion(&bus->cmd_complete);
> +		writel(ASPEED_I2CD_M_STOP_CMD, bus->base + ASPEED_I2C_CMD_REG);
> +		spin_unlock_irqrestore(&bus->lock, flags);
> +
> +		time_left =3D wait_for_completion_timeout(
> +				&bus->cmd_complete, bus->adap.timeout);
> +
> +		spin_lock_irqsave(&bus->lock, flags);
> +		if (time_left =3D=3D 0)
> +			goto reset_out;
> +		else if (bus->cmd_err)
> +			goto reset_out;
> +		/* Recovery failed. */
> +		else if (!(readl(bus->base + ASPEED_I2C_CMD_REG) &
> +			   ASPEED_I2CD_SCL_LINE_STS))
> +			goto reset_out;
> +	/* Bus error. */
> +	} else {
> +		dev_dbg(bus->dev, "bus hung (state %x), attempting recovery\n",
> +			command);

Same dbg message as in the condition? Move it out of the 'if'?

> +
> +		reinit_completion(&bus->cmd_complete);
> +		writel(ASPEED_I2CD_BUS_RECOVER_CMD,
> +		       bus->base + ASPEED_I2C_CMD_REG);

Out of interest: What does the RECOVER_CMD do?

> +		spin_unlock_irqrestore(&bus->lock, flags);
> +
> +		time_left =3D wait_for_completion_timeout(
> +				&bus->cmd_complete, bus->adap.timeout);
> +
> +		spin_lock_irqsave(&bus->lock, flags);
> +		if (time_left =3D=3D 0)
> +			goto reset_out;
> +		else if (bus->cmd_err)
> +			goto reset_out;
> +		/* Recovery failed. */
> +		else if (!(readl(bus->base + ASPEED_I2C_CMD_REG) &
> +			   ASPEED_I2CD_SDA_LINE_STS))
> +			goto reset_out;
> +	}
> +
> +out:
> +	spin_unlock_irqrestore(&bus->lock, flags);
> +
> +	return ret;
> +
> +reset_out:
> +	spin_unlock_irqrestore(&bus->lock, flags);
> +
> +	return aspeed_i2c_reset(bus);
> +}

=2E..

> +	case ASPEED_I2C_MASTER_INACTIVE:
> +		dev_err(bus->dev,
> +			"master received interrupt 0x%08x, but is inactive",
> +			irq_status);
> +		bus->cmd_err =3D -EIO;
> +		/* Do not STOP as we should be inactive. */
> +		goto out_complete;
> +	default:
> +		WARN(1, "unknown master state\n");
> +		bus->master_state =3D ASPEED_I2C_MASTER_INACTIVE;
> +		bus->cmd_err =3D -EIO;
> +		goto out_complete;
> +	}
> +error_and_stop:
> +	bus->cmd_err =3D -EIO;
> +	aspeed_i2c_do_stop(bus);
> +	goto out_no_complete;
> +out_complete:
> +	bus->msgs =3D NULL;
> +	if (bus->cmd_err)
> +		bus->master_xfer_result =3D bus->cmd_err;
> +	else
> +		bus->master_xfer_result =3D bus->msgs_index + 1;
> +	complete(&bus->cmd_complete);
> +out_no_complete:
> +	if (irq_status !=3D status_ack)
> +		dev_err(bus->dev,
> +			"irq handled !=3D irq. expected 0x%08x, but was 0x%08x\n",
> +			irq_status, status_ack);
> +	spin_unlock(&bus->lock);
> +	return !!irq_status;
> +}

You return in the interrupt handler -EIO always in case of errors. Can
you check Documentation/i2c/fault-codes and see if you can follow those
guidelines? Especially ENXIO on NACK and EAGAIN...

> +
> +static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
> +{
> +	struct aspeed_i2c_bus *bus =3D dev_id;
> +
> +	if (aspeed_i2c_master_irq(bus))
> +		return IRQ_HANDLED;
> +	else
> +		return IRQ_NONE;

Ternary operator? Your choice, though...

And one more question: Why do you use adapter->algo_data instead of
i2c_{get|set}_adapdata?

Kind regards,

   Wolfram


--2cmgty3wah3fdqz5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAllH2/4ACgkQFA3kzBSg
Kbb0UQ//fdFgh0M9+NVgpjET/eOsWQDt7zSv3AKJjU0bPgre84VgA46/MijYa2K3
d7Xe7sHFGw4CEbNOy6AD1oKkvLXNkk28Wv7sKahArbrAM18E5KP07817B4bOtr3b
2LuX0rHfK80OkUV5/ZZo5E4yDJiI4EbnJ2Dm2YF6fobLf2Wf5S6Oar7QarbteWah
P6tdVMPKokPGLePs9unWEQAKMQdtXcmHHh5+rcGjrFKdbpBTC1D5npqKKdn4RuFK
lQn1z+od4Yjd/eL7RqjmogFyUEkH3lBYWix+pQWeJc3fNfGS4QdhrVQlhwSZwFm3
MzEdeLerLZdPNksBQUe3CSDbHYPprW3x1+oDLNImythxqOujUZYtU/AXEJyA+BSG
3fQh9OK/2DExzlC7h3dZipvGe98iPohxBZHTITR8EGEj/BbpNLIYBQdHCzNbkuMd
U77Qf5s0YhBDr9QlyDNSJ2L1G+tCrc/LAv4/Q+B5PtdqivXE8Ffp3SpL5rO0wI1H
1iZ3s8bjb+uJD+YeImuwkYGKmaR5NHGPpT74YovsdSkuMrnZPHMRYhVaFIvFcZeO
qJ9BQ+YpRPISqSq232cX57Yf7Ed/NRE4TeCkEVI+pY4ZLsS+kBIVohzUzfqs5xgr
tBtZIxiGeWdBjY4ylBHvCy6vyGKP5TDv1uT4aqxDJi12jqzDewI=
=0fbT
-----END PGP SIGNATURE-----

--2cmgty3wah3fdqz5--
