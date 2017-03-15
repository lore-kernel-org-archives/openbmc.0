Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vjXWL5zZ2zDqXc
 for <openbmc@lists.ozlabs.org>; Wed, 15 Mar 2017 11:27:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VZz+KT6a"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DcFNLa0F"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A077620C93;
 Tue, 14 Mar 2017 20:27:56 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 14 Mar 2017 20:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=tppqElIft4LBh90iUzMsVMqbYXk=; b=VZz+KT
 6aEZy5RcnpdTZjzC0cBWV61Tme+41k7FrkVSxxwP2quCzjn9F8fg8NjDY41bC7hH
 7zFaNfm5Ozs8nJucYu6ZpoLApAupyD920rNR/Bbx18VtcgxhxVisUsagf78nKzwR
 JjD0eO9yBqFv04ATE3CLWu9+smcnSYTvLOaFg=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=tppqElIft4LBh9
 0iUzMsVMqbYXk=; b=DcFNLa0FFiN0zTXyssRsSmxXsKKnS5RaSr9bzdsGHtNKsT
 gF62g6U3sxMR4d4p3sX0D9gzXLVArQ1nLad8VT/DKjP2cgpAsEAjDemB0raDvuoj
 R9zXkmqvExHNqhBj9Ohe2s39WdqPvkaF4Fzl3tBDp1kxSSYfIXTaOv1UvOcYI=
X-ME-Sender: <xms:jIrIWHdZm7javRevhwKf6sUos13-Sb2bmtvX3N2ei6XoB0_YwzvIvA>
X-Sasl-enc: cSBTua7t1Q1d/Zs5ubA48jxopwr5UkMHZSt4RQ8143JN 1489537675
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3452B24519;
 Tue, 14 Mar 2017 20:27:52 -0400 (EDT)
Message-ID: <1489537665.3847.2.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.{7,10} v2] i2c-core: Expand buffers used in
 i2c_smbus_xfer_emulated()
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: miltonm@us.ibm.com, wghoffa@us.ibm.com, patrick@stwcx.xyz,
 xow@google.com,  openbmc@lists.ozlabs.org
Date: Wed, 15 Mar 2017 10:57:45 +1030
In-Reply-To: <20170314092023.13994-1-andrew@aj.id.au>
References: <20170314092023.13994-1-andrew@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-BEt5+UK+D14BeSDJYSVL"
X-Mailer: Evolution 3.22.1-0ubuntu2 
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
X-List-Received-Date: Wed, 15 Mar 2017 00:28:00 -0000


--=-BEt5+UK+D14BeSDJYSVL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-03-14 at 19:50 +1030, Andrew Jeffery wrote:
> Protect against suspect hardware causing the bus to read off more data
> than defined in the SMBus specification.
>=20
> Some investigation that suggests that the DEVICE_ID command (0xfd) to
> a UCD9xxx power sequencer occasionally returns all 0xff, causing the bus
> driver to overrun the 34-byte data buffer provided by the I2C core with
> a 255-byte broken response. Usually the result was the following:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Kernel panic - not =
syncing: stack-protector: Kernel stack is corrupted
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0in: 802e5e38
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CPU: 0 PID: 1559 Co=
mm: zaius_vcs.sh Not tainted
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A04.7.10-f26558191540=
830589fe03932d05577957670b8d #2
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Hardware name: ASpe=
ed SoC
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[<801072f8>] (unwin=
d_backtrace) from [<80105558>] (show_stack+0x10/0x14)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[<80105558>] (show_=
stack) from [<8016d06c>] (panic+0xb8/0x248)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[<8016d06c>] (panic=
) from [<80110df4>] (__stack_chk_fail+0x10/0x14)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[<80110df4>] (__sta=
ck_chk_fail) from [<802e5e38>]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(i2c_smbus_xfer+0x5=
08/0x54c)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[<802e5e38>] (i2c_s=
mbus_xfer) from [<ffffffff>] (0xffffffff)
>=20
> This patch prevents the broken response from trashing the surrounding
> memory and returns an error code up the call-chain.
>=20
> The I2C core doesn't help itself in this case as it does not provide any
> means for the bus driver to sanity check the caller-provided
> response-buffer length against the device-provided payload length. At
> the point where we perform the I2C transfers for the SMBus protocol
> we've lost the information about what type of transaction is being
> performed (i.e. that we're performing an SMBus block transfer), so we
> cannot in general make assumptions about the buffer size based on the
> protocol (i2c, SMBus, PMBus).=C2=A0=C2=A0Further, struct i2c_msg is defin=
ed in the
> uapi headers so no further members (e.g. a length field) can be added
> without breaking userspace.
>=20
> Instead, let's move the buffers off the stack and expand them such that
> they will fit any payload length reported by the bus.
>=20
> The patch has been tested on a Zaius system, consecutively unbinding and
> binding the UCD9000 driver over 1000 times. Whilst errors were reported
> during probe in some cases ("ucd9000: probe of 0-0064 failed with error
> -74"), the system remained stable and did not reboot. Triggering the bug
> without the patch typically at most requires in the order of 100
> unbind/bind attempts, often significantly less.
>=20
> Finally, the host was successfully powered up immediately after the 1000
> unbind/bind attempts.
>=20
> > Suggested-by: Joel Stanley <joel@jms.id.au>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
> =C2=A0drivers/i2c/i2c-core.c | 74 ++++++++++++++++++++++++++++++++++++++-=
-----------
> =C2=A01 file changed, 56 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
> index af11b658984d..a46c4a39aee8 100644
> --- a/drivers/i2c/i2c-core.c
> +++ b/drivers/i2c/i2c-core.c
> @@ -2894,16 +2894,26 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_ada=
pter *adapter, u16 addr,
> > =C2=A0				=C2=A0=C2=A0=C2=A0char read_write, u8 command, int size,
> > =C2=A0				=C2=A0=C2=A0=C2=A0union i2c_smbus_data *data)
> =C2=A0{
> > -	/* So we need to generate a series of msgs. In the case of writing, w=
e
> > -	=C2=A0=C2=A0need to use only one message; when reading, we need two. =
We initialize
> > -	=C2=A0=C2=A0most things with sane defaults, to keep the code below so=
mewhat
> > -	=C2=A0=C2=A0simpler. */
> > -	unsigned char msgbuf0[I2C_SMBUS_BLOCK_MAX+3];
> > -	unsigned char msgbuf1[I2C_SMBUS_BLOCK_MAX+2];
> > +	/*
> > +	=C2=A0* So we need to generate a series of msgs. In the case of writi=
ng, we
> > +	=C2=A0* need to use only one message; when reading, we need two. We
> > +	=C2=A0* initialize most things with sane defaults, to keep the code b=
elow
> > +	=C2=A0* somewhat simpler.
> > +	=C2=A0*
> > +	=C2=A0* Also, allocate 256 byte buffers as protection against suspect
> > +	=C2=A0* hardware like the UCD90xx, where on occasion the returned blo=
ck
> > +	=C2=A0* length is 0xff[1].
> > +	=C2=A0*
> > +	=C2=A0* [1] https://github.com/openbmc/openbmc/issues/998
> > +	=C2=A0*/
> > +	unsigned char *msgbuf0 =3D kmalloc(0x100, GFP_KERNEL);
> > +	unsigned char *msgbuf1 =3D kmalloc(0x100, GFP_KERNEL);
> > =C2=A0	int num =3D read_write =3D=3D I2C_SMBUS_READ ? 2 : 1;
> > -	int i;
> > =C2=A0	u8 partial_pec =3D 0;
> > +	s32 ret =3D 0;
> > =C2=A0	int status;
> > +	int i;
> +
> > =C2=A0	struct i2c_msg msg[2] =3D {
> > =C2=A0		{
> > =C2=A0			.addr =3D addr,
> @@ -2918,6 +2928,9 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapt=
er *adapter, u16 addr,
> > =C2=A0		},
> > =C2=A0	};
> =C2=A0
> > +	if (!(msgbuf0 && msgbuf1))
> > +		return -ENOMEM;
> +
> > =C2=A0	msgbuf0[0] =3D command;
> > =C2=A0	switch (size) {
> > =C2=A0	case I2C_SMBUS_QUICK:
> @@ -2970,7 +2983,8 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapt=
er *adapter, u16 addr,
> > =C2=A0				dev_err(&adapter->dev,
> > =C2=A0					"Invalid block write size %d\n",
> > =C2=A0					data->block[0]);
> > -				return -EINVAL;
> > +				ret =3D -EINVAL;
> > +				goto out;
> > =C2=A0			}
> > =C2=A0			for (i =3D 1; i < msg[0].len; i++)
> > =C2=A0				msgbuf0[i] =3D data->block[i-1];
> @@ -2983,7 +2997,8 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapt=
er *adapter, u16 addr,
> > =C2=A0			dev_err(&adapter->dev,
> > =C2=A0				"Invalid block write size %d\n",
> > =C2=A0				data->block[0]);
> > -			return -EINVAL;
> > +			ret =3D -EINVAL;
> > +			goto out;
> > =C2=A0		}
> > =C2=A0		msg[0].len =3D data->block[0] + 2;
> > =C2=A0		for (i =3D 1; i < msg[0].len; i++)
> @@ -3001,7 +3016,8 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapt=
er *adapter, u16 addr,
> > =C2=A0				dev_err(&adapter->dev,
> > =C2=A0					"Invalid block write size %d\n",
> > =C2=A0					data->block[0]);
> > -				return -EINVAL;
> > +				ret =3D -EINVAL;
> > +				goto out;
> > =C2=A0			}
> > =C2=A0			for (i =3D 1; i <=3D data->block[0]; i++)
> > =C2=A0				msgbuf0[i] =3D data->block[i];
> @@ -3009,7 +3025,8 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapt=
er *adapter, u16 addr,
> > =C2=A0		break;
> > =C2=A0	default:
> > =C2=A0		dev_err(&adapter->dev, "Unsupported transaction %d\n", size);
> > -		return -EOPNOTSUPP;
> > +		ret =3D -EOPNOTSUPP;
> > +		goto out;
> > =C2=A0	}
> =C2=A0
> > =C2=A0	i =3D ((flags & I2C_CLIENT_PEC) && size !=3D I2C_SMBUS_QUICK
> @@ -3028,17 +3045,23 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_ada=
pter *adapter, u16 addr,
> > =C2=A0	}
> =C2=A0
> > =C2=A0	status =3D i2c_transfer(adapter, msg, num);
> > -	if (status < 0)
> > -		return status;
> > +	if (status < 0) {
> > +		ret =3D status;
> > +		goto out;
> > +	}
> =C2=A0
> > =C2=A0	/* Check PEC if last message is a read */
> > =C2=A0	if (i && (msg[num-1].flags & I2C_M_RD)) {
> > =C2=A0		status =3D i2c_smbus_check_pec(partial_pec, &msg[num-1]);
> > -		if (status < 0)
> > -			return status;
> > +		if (status < 0) {
> > +			ret =3D status;
> > +			goto out;
> > +		}
> > =C2=A0	}
> =C2=A0
> > -	if (read_write =3D=3D I2C_SMBUS_READ)
> > +	if (read_write =3D=3D I2C_SMBUS_READ) {
> > +		size_t recvd;
> +
> > =C2=A0		switch (size) {
> > =C2=A0		case I2C_SMBUS_BYTE:
> > =C2=A0			data->byte =3D msgbuf0[0];
> @@ -3056,11 +3079,26 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_ada=
pter *adapter, u16 addr,
> > =C2=A0			break;
> > =C2=A0		case I2C_SMBUS_BLOCK_DATA:
> > =C2=A0		case I2C_SMBUS_BLOCK_PROC_CALL:
> > -			for (i =3D 0; i < msgbuf1[0] + 1; i++)
> > +			recvd =3D msgbuf1[0] + 1;
> +
> > +			if (recvd > sizeof(*data)) {
> > +				dev_warn(&adapter->dev,
> > +						"SMBus block operation received invalid payload length of %zu\n"=
,
> > +						recvd);
> +				return -EIO;

The irony. Please fix when you apply (if there are no other issues).

> +			}
> +
> > +			for (i =3D 0; i < recvd; i++)
> > =C2=A0				data->block[i] =3D msgbuf1[i];
> +
> > =C2=A0			break;
> > =C2=A0		}
> > -	return 0;
> > +	}
> +out:
> > +	kfree(msgbuf0);
> > +	kfree(msgbuf1);
> +
> > +	return ret;
> =C2=A0}
> =C2=A0
> =C2=A0/**
--=-BEt5+UK+D14BeSDJYSVL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYyIqBAAoJEJ0dnzgO5LT5aRwP/2QhyEwzI92g4q8VwliTH8ue
7eHLw4SMbAK7eztKrEvq862aSgpErf1zsW7NNkEc0+5DMfD7M60tMUziU4COT4CC
d7eVqwivJRY9LpfiRWr4arIfsIMImKC8Q7sKFYbIMpQthWxc/g3UfeP1GRoNZeZz
jHgg1MBBxce3dvh2SXR4uULCQmvluXGYhd6R9t/wPBQy9NhZlPZSqaNNJkEhcdQK
z/cffn+HKwnw5EOyQaQIdO4UVzh3PMOCE+JCnilv0f6mgwPUipuIhqZsnfpSLPxZ
SqHwlwG9tPB52zqvAfNDhh0rg/JuByTeR1IkHl1dO/u1fPPGREapp5UsbdAIrgAK
m+tgJXdKybiMSxi70YcVK/kgzoGwW85N/Iyr8W6joZHj82cy7swc8/5VKEHCkNaq
cezU082RIEsthIQbcHQR/R/XquV5bruEJOShev/DxZqrrDIQ+0z650puaNFhc6K8
xHJsOCh88VbO3qehL14XUnSJf7HZqlmy3BrXS2ePTlPjiljQ29zQTgNYckIK0QzZ
fSNHVNBkIKkufVxLBTHyzq6rWc9tFysMySIp4Rsv2wqnAKm1WaS66GkNH+Afnbkx
Hfy4g+UxbmzNhT1W8LUIctfu3RBY8Hg02ZIKtklWI20B3S24XGQudEvBjIoCUard
RejdZ4geCkFyQYAWYdFb
=kfpL
-----END PGP SIGNATURE-----

--=-BEt5+UK+D14BeSDJYSVL--
