Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Bt86aLDK"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="pnRU3m4A"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yNwlg08VWzDqlM
 for <openbmc@lists.ozlabs.org>; Sat, 28 Oct 2017 07:41:50 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B8AA020AB8;
 Fri, 27 Oct 2017 16:41:47 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Fri, 27 Oct 2017 16:41:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=OXYtmWZtcB7VfxNSWAL6ycKJAMybj
 1XP5LDFEvYd9lc=; b=Bt86aLDKJ90ahJLRXMUo3Dmicb5on9bhgk8rnFJGgMJ5o
 ARwBZeEYfxp4DQDqRUuSPCB6qyQDMzWPcE9ieNyUc3EBCvw+/juLdBqg9eGk00EX
 M/aC+9hImduMUGOdAsW6LnarAtikKzW/F+HWU1TUpL9uanktSkdioPiwURe52zy1
 UP4bdCL2Bcfrh2ENcwnG4Ws3Pu2I0z7Og7QBRKp+tJA002+e5duBqbJYbjwHx/iZ
 wP3p7GC99gCHItWI2Ww0qbHsW5L0Nm4ptYCMMZJK2FAKHtEreIMsY6fyUVfmH2Kk
 UWfTgncI6kAzw6nVPnhu5igOmMzLqUqJ6eo325oug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=OXYtmW
 ZtcB7VfxNSWAL6ycKJAMybj1XP5LDFEvYd9lc=; b=pnRU3m4AAgpJXIGFfMYyp1
 EVSqJD0o0OUUTmeJOBaq0Sz4BKa0ixlKviMWctqP6pW/KTsPgQlNb6wUaYyZF3O7
 N/H9EWr0q8OjYXZOIECsd8XPjyjD/U+Yu7oHevAm8s7FfMJuiPpNwoFpjgsaHwlj
 nZ9OZxyYsMfGXoMTx7UxHu8y1cvPNI/5CIC4yPnHmwjxnrHxhjQeu2bKlWwmNL5o
 u/AWV5oeoVtlNffmcbglBTleBYbneHIPVR1NvKivNFa4girkRYUxLpQRyERLHjwJ
 qo1T6231gB0XCW/WO2j01SbP0A6m/4+s2q6iKBbbFF5lH6+ff5dMxof+eCn12bkw
 ==
X-ME-Sender: <xms:C5rzWV3zZXsgXB1-aqFGdIg04u7P-8JjFluV_R7LiZBhLbWHRP-wdA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 8A248BAB45; Fri, 27 Oct 2017 16:41:47 -0400 (EDT)
Message-Id: <1509136907.1496317.1153410920.0302A4F4@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, cbostic@linux.vnet.ibm.com
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-4cf23885
Subject: Re: [PATCH linux dev-4.10 v2] drivers: i2c: fsi: Add proper abort
 method
Date: Sat, 28 Oct 2017 07:11:47 +1030
References: <1508529741-29316-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1508718675.6013.3.camel@aj.id.au>
 <de884d77-04a2-1095-8198-89f2ce93e029@linux.vnet.ibm.com>
 <1508893417.13477.1.camel@aj.id.au>
 <57eb4d71-3db5-d3ec-7a67-db3013c872d8@linux.vnet.ibm.com>
In-Reply-To: <57eb4d71-3db5-d3ec-7a67-db3013c872d8@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 27 Oct 2017 20:41:53 -0000


> >>>> +
> >>>> +	return -ETIME;
> >>>> +}
> >>>> +
> >>>>  =C2=A0 static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
> >>>>  =C2=A0=C2=A0				=C2=A0struct i2c_msg *msg, u32 status)
> >>>>  =C2=A0 {
> >>>>  =C2=A0=C2=A0	int rc;
> >>>>  =C2=A0=C2=A0	u8 fifo_count;
> >>>> -	struct fsi_i2c_master *i2c =3D port->master;
> >>>> -	u32 dummy =3D 0;
> >>>>=20=20=20=20
> >>>>  =C2=A0=C2=A0	if (status & I2C_STAT_ERR) {
> >>>> -		rc =3D fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
> >>>> +		rc =3D fsi_i2c_abort(port, status);
> >>>>  =C2=A0=C2=A0		if (rc)
> >>>>  =C2=A0=C2=A0			return rc;
> >>>>=20=20=20=20
> >>>> +		if (status & I2C_STAT_INV_CMD)
> >>>> +			return -EINVAL;
> >>>> +
> >>>> +		if (status & (I2C_STAT_PARITY | I2C_STAT_BE_OVERRUN |
> >>>> +		=C2=A0=C2=A0=C2=A0=C2=A0I2C_STAT_BE_ACCESS))
> >>>> +			return -EPROTO;
> >>>> +
> >>>>  =C2=A0=C2=A0		if (status & I2C_STAT_NACK)
> >>>>  =C2=A0=C2=A0			return -EFAULT;
> >>>=20=20=20
> >>> EFAULT is "Bad address", but slaves can NACK things that aren't addre=
sses.
> >>> As an example i2c-aspeed calls a NACK an EIO.
> >>=20=20=20
> >> True, but I dislike returning EIO as it's somewhat of a default option
> >> and makes it very difficult to determine what actually went wrong. How
> >> about ENXIO?
> > What does userspace do with that knowledge? Is it worth differentiating=
? I
> > can't immediately see that it is. Maybe it's worth a dev_dbg() or somet=
hing?
> > I feel ENXIO doesn't address my point either, as it means "No such devi=
ce or
> > address", which is still inappropriate for data NACKs.
>=20
> Well, when someone sees an i2c failure and opens a defect and assigns it=
=20
> to me, I would like to know if it was a NACK or something else :) If I=20
> see EIO, it could be either some other I2C error, an FSI bus error, o=20
> probably even a GPIO error. And dev_dbg probably won't help in the field=
=20
> since it'll be compiled out.

That's not true currently as we set CONFIG_DYNAMIC_DEBUG:

https://github.com/openbmc/openbmc/blob/51af974f81c1d8a6df250fb38c27c1a0444=
b2cf3/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-=
obmc/defconfig#L200

unless we plan to change that? You can control it via debugfs. We really
must return something sensible with respect to the error that occurred,
and neither EFAULT nor ENXIO fit that bill.

>=20
> >
> >>=20=20=20
> >>>=20=20=20
> >>>>=20=20=20=20
> >>>> +		if (status & I2C_STAT_LOST_ARB)
> >>>> +			return -ECANCELED;
> >>>=20=20=20
> >>> So checking around the tree, all of i2c-aspeed, i2c-designware-core,
> >>> i2c-hix5hd2, i2c-kempld to name a few (I stopped checking at that poi=
nt) use
> >>> -EAGAIN for arbitration loss. I don't think -ECANCELLED is appropriat=
e, and
> >>> certainly think that -EAGAIN is what we want: Nothing went wrong asid=
e from
> >>> this master lost the arbitration race, so the caller should really ju=
st retry.
> >>=20=20=20
> >> Good point, however, for this master, it can often return arbitration
> >> lost if the clock or data line is stuck, and retries will not work. I'=
ll
> >> switch it to EAGAIN, callers shouldn't try too many times hopefully...
> > Can we test status again when a new transfer is starting to see if we n=
eed to
> > recover the bus before proceeding?
>=20
> Well with this change, bus should be recovered after any failure, if=20
> recovery is possible. I more meant the case when the clock or data line=20
> is really stuck such that the master cannot recover them.

What do we do in this case then? Power cycle?

Andrew
