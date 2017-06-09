Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkPnz5bkjzDqP5
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 11:28:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="CyOY3Kvr"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="WmY6xZwu"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4D30E20972;
 Thu,  8 Jun 2017 21:28:52 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 08 Jun 2017 21:28:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=B+AUiRPvhBE+nbUojf7T1v2j7X8hml2N7gK0G1BPw
 YU=; b=CyOY3KvrlNqiNBZkLSWUl8POSCvs3avuqaNcWMI9njG/eE8lbKqpfMR1c
 EPYd/yJGrzDPYBXWKRtoGdfRPUCEP147zTxTkj0xlsdeHrFY5XxZhK2VkIbAisaJ
 y2G02DG2GNqtCPTmq8LzipfzrRE1RAMTA9tXPSMicStm7syvcYS/v8aA+DQuoZWy
 gmTgOu3cGTOC7UYV9TewFhgd1AAt4Gqrg0ndkv7Efhx7+vRT2Q4LST1QVSGVj07Q
 VLR7GBcD8BOLOWohpgMJwHs0BwENe4+YSbZAgt8G+LuDnUtBqtS6Jch2sx7BMxcf
 b5d6W4ygNRAb9wsQgW9pJJa5sZGjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=B+AUiRPvhBE+nbUojf
 7T1v2j7X8hml2N7gK0G1BPwYU=; b=WmY6xZwuT+7FLPRegEQzYHFTPxWdOJqUn8
 Z2xBo9bj8yDqdBKkexW0aQDoJ4PA12GfFdpxiq6/SMia3LlR9hrD309YW0269Q9b
 ZdUmmisId6nAUGj8ZSVTzyB1sQmFiMcNaar0hEq25bd0rXTnaqeBwOIF4U8HUgKX
 sokg4H7YNijbHBipd0LOKfvPwfTwnNQtxTJiMc5YYMYojrcD/SYYdLF7r+yH4VjH
 DttgRoxqHnzQNrf+XRIpveVFdW9Mf66L63cDnaevxSJpLDzS6R8s0i25hCAf52t4
 faZ1tlKcUHzhGE8Sq24fH9kn21JyRhnKg0w4HE1pCFKedcNQbsUw==
X-ME-Sender: <xms:1Pk5WW5Mkqv29vVkL92CWBiMwyP8u5M6OPQS3jn8m6jNoqO4fPI69Q>
X-Sasl-enc: GgQrhOuXJoFOg8WoyKXC+woeiXyKn5L4HOvfuTcdukrW 1496971731
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8021C248B6;
 Thu,  8 Jun 2017 21:28:50 -0400 (EDT)
Message-ID: <1496971727.23335.7.camel@aj.id.au>
Subject: Re: [PATCH] hwmon: max31785: Use standard sysfs ABI for fast rotor
 inputs
From: Andrew Jeffery <andrew@aj.id.au>
To: Matthew Barth <msbarth@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Fri, 09 Jun 2017 10:58:47 +0930
In-Reply-To: <4cf240ac-723a-5205-5e78-14bb32497d17@linux.vnet.ibm.com>
References: <20170608061249.29233-1-andrew@aj.id.au>
 <4cf240ac-723a-5205-5e78-14bb32497d17@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-LQUiSs0DOWmj/rUp1C1J"
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
X-List-Received-Date: Fri, 09 Jun 2017 01:28:56 -0000


--=-LQUiSs0DOWmj/rUp1C1J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,


On Thu, 2017-06-08 at 15:42 -0500, Matthew Barth wrote:
>=20
>=20
> On 06/08/17 1:12 AM, Andrew Jeffery wrote:
> > Non-standard attributes are an obstacle for userspace. Instead, use the
> > standard fanX_input attributes, and number the fast-rotor values in
> > [NR_CHANNEL, 2 * NR_CHANNEL - 1].

Uh, so this range should be [NR_CHANNEL + 1, 2 * NR_CHANNEL], given
hwmon uses 1-based indexing.

Joel: I'll send a v2 to fix this and another issue.

> >=20
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > Matt,
> >=20
> > I have a couple of observations testing this on a Witherspoon system th=
at has
> > the necessary modifications:
> >=20
> > 1. The fast-rotor values are non-zero and vary despite the chassis powe=
r being
> > =C2=A0=C2=A0=C2=A0off (the slow rotor values become non-zero when the c=
hassis is powered-on).

> =C2=A0I worked with Jordan on this issue and it was something pointed out
> to Maxim to fix where we had verified the fix using a sampling of
> updated max31785 chips in Oct 2016.

Okay.

>  He is working with them to find out if this is a pre-mfg batch we
> have that's not 0'd out at poweroff and what the current set of
> max31785 chips FW should do.

Right - please keep me up to date with the state of play.

>  (Along with this, he's again going to request an updated datasheet
> for rev 0x3040).

Great. Will it be a public release like the existing datasheet?

> > 2. The fast-rotor values seem to be 'sticky' - sometimes they don't
> > vary as
> > =C2=A0=C2=A0=C2=A0often as I would expect (e.g. in fan ramp- up or down=
).


> =C2=A0Not sure what you mean by 'sticky', but during Jordan and I
> investigating, we found that the fast rotor 2bytes were reading 0's
> during any speed change (up or down) and would only continue
> providing the tach feedback once the target speed had been deemed
> reached.

Right - the behaviour I'm seeing is that instead of 0's I read the last
reported value, until the target is reached. I hadn't understood
exactly *when* the state changed, but my gut feeling is that the value
change aligned with reaching the target as you suggest.

>  This is another point Jordan is bringing up to Maxim, however this
> should not preclude us from getting these fast rotor feedbacks
> enabled as we have application code in place that does not mark these
> as faulted due to this.

Okay, so it sounds like we're covered either way (zero, or the last
reported value).

> > 2.
> >  The fast-rotor attributes appear to correspond to the slow rotor
> > values.

> =C2=A0What do you mean by attributes here?

hwmon sysfs attributes.

>  What were you seeing?

The attributes I assigned to the fast rotor values were reporting lower
values than the attributes I assigned to the slow rotor.

> Just for info...the faster of tach feedbacks (fanf_input) should
> always be in the 'upper' 2 bytes of the 0x90 reg and the slower
> (fans_input) should always be the 'lower' 2 bytes according to Maxim
> (and what I verified last year with this 0x3040 rev update).

I'll address this below in the patch where I've implemented the logic
for reading the 4-byte values off the bus.

>  So for the associated fanx_target, there will be differing speeds
> between the fans_input and fanf_input where these should be within a
> 15% deviation of the given fanx_target.
>=20
> > On point 1, here's what I see out of the box:
> >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0root@witherspoon:/sys/bus/i2c/drivers/max31=
785/3-0052/hwmon/hwmon1# grep '.*' fan*
> > =C2=A0=C2=A0=C2=A0=C2=A0fan10_input:10190
> > =C2=A0=C2=A0=C2=A0=C2=A0fan11_input:0
> > =C2=A0=C2=A0=C2=A0=C2=A0fan12_input:0
> > =C2=A0=C2=A0=C2=A0=C2=A0fan1_fault:0
> > =C2=A0=C2=A0=C2=A0=C2=A0fan1_input:10714
> > =C2=A0=C2=A0=C2=A0=C2=A0fan1_pulses:2
> > =C2=A0=C2=A0=C2=A0=C2=A0fan1_target:10500
> > =C2=A0=C2=A0=C2=A0=C2=A0fan2_fault:0
> > =C2=A0=C2=A0=C2=A0=C2=A0fan2_input:10416
> > =C2=A0=C2=A0=C2=A0=C2=A0fan2_pulses:2
> > =C2=A0=C2=A0=C2=A0=C2=A0fan2_target:10500
> > =C2=A0=C2=A0=C2=A0=C2=A0fan3_fault:0
> > =C2=A0=C2=A0=C2=A0=C2=A0fan3_input:10744
> > =C2=A0=C2=A0=C2=A0=C2=A0fan3_pulses:2
> > =C2=A0=C2=A0=C2=A0=C2=A0fan3_target:10500
> > =C2=A0=C2=A0=C2=A0=C2=A0fan4_fault:0
> > =C2=A0=C2=A0=C2=A0=C2=A0fan4_input:10806
> > =C2=A0=C2=A0=C2=A0=C2=A0fan4_pulses:2
> > =C2=A0=C2=A0=C2=A0=C2=A0fan4_target:10500
> > =C2=A0=C2=A0=C2=A0=C2=A0fan5_fault:0
> > =C2=A0=C2=A0=C2=A0=C2=A0fan5_input:0
> > =C2=A0=C2=A0=C2=A0=C2=A0fan5_pulses:1
> > =C2=A0=C2=A0=C2=A0=C2=A0fan5_target:1638
> > =C2=A0=C2=A0=C2=A0=C2=A0fan6_fault:0
> > =C2=A0=C2=A0=C2=A0=C2=A0fan6_input:0
> > =C2=A0=C2=A0=C2=A0=C2=A0fan6_pulses:1
> > =C2=A0=C2=A0=C2=A0=C2=A0fan6_target:1638
> > =C2=A0=C2=A0=C2=A0=C2=A0fan7_input:10135
> > =C2=A0=C2=A0=C2=A0=C2=A0fan8_input:9920
> > =C2=A0=C2=A0=C2=A0=C2=A0fan9_input:10162
> >=20
> > Expanding on point 2, I issued `obmcutil chassison`, then proceeded to =
set
> > progressively increasing fan targets:
> >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0root@witherspoon:/sys/bus/i2c/drivers/max31=
785/3-0052/hwmon/hwmon1# grep '.*' fan*
> > =C2=A0=C2=A0=C2=A0=C2=A0fan10_input:7142
> > =C2=A0=C2=A0=C2=A0=C2=A0fan11_input:0
> > =C2=A0=C2=A0=C2=A0=C2=A0fan12_input:0
> > =C2=A0=C2=A0=C2=A0=C2=A0fan1_fault:0
> > =C2=A0=C2=A0=C2=A0=C2=A0fan1_input:6432
> > =C2=A0=C2=A0=C2=A0=C2=A0fan1_pulses:2
> > =C2=A0=C2=A0=C2=A0=C2=A0fan1_target:6500
> > =C2=A0=C2=A0=C2=A0=C2=A0fan2_fault:0
> > =C2=A0=C2=A0=C2=A0=C2=A0fan2_input:9816
> > =C2=A0=C2=A0=C2=A0=C2=A0fan2_pulses:2
> > =C2=A0=C2=A0=C2=A0=C2=A0fan2_target:9500
> > =C2=A0=C2=A0=C2=A0=C2=A0fan3_fault:0
> > =C2=A0=C2=A0=C2=A0=C2=A0fan3_input:8426
> > =C2=A0=C2=A0=C2=A0=C2=A0fan3_pulses:2
> > =C2=A0=C2=A0=C2=A0=C2=A0fan3_target:8500
> > =C2=A0=C2=A0=C2=A0=C2=A0fan4_fault:0
> > =C2=A0=C2=A0=C2=A0=C2=A0fan4_input:7515
> > =C2=A0=C2=A0=C2=A0=C2=A0fan4_pulses:2
> > =C2=A0=C2=A0=C2=A0=C2=A0fan4_target:7500
> > =C2=A0=C2=A0=C2=A0=C2=A0fan5_fault:0
> > =C2=A0=C2=A0=C2=A0=C2=A0fan5_input:0
> > =C2=A0=C2=A0=C2=A0=C2=A0fan5_pulses:1
> > =C2=A0=C2=A0=C2=A0=C2=A0fan5_target:1638
> > =C2=A0=C2=A0=C2=A0=C2=A0fan6_fault:0
> > =C2=A0=C2=A0=C2=A0=C2=A0fan6_input:0
> > =C2=A0=C2=A0=C2=A0=C2=A0fan6_pulses:1
> > =C2=A0=C2=A0=C2=A0=C2=A0fan6_target:1638

> =C2=A0For witherspoon, fan5_target & fan6_target are not wired up so that
> 1638 target value is not valid and are never set (so it must be some
> default within the max31785).

Yes, understood.

>  So what did we decide on how these sysfs file names will be
> associated between _target and _input(s)? From our slack discussion,
> ie) fan1_input & fan2_input is the pair of feedbacks associated with
> fan1_target is that suppose to be true here?

No, I changed it as outlined in the commit message (modulo my off-by-
one error), as this made testing with the openbmc userspace easier.

> > =C2=A0=C2=A0=C2=A0=C2=A0fan7_input:6009
> > =C2=A0=C2=A0=C2=A0=C2=A0fan8_input:9351
> > =C2=A0=C2=A0=C2=A0=C2=A0fan9_input:7944
> >=20
> > The fanX_input values for X in [7, 10]

Again, due to some mental haziness, I was off-by-one here. That should
read [7, 11].

> >  are consistently lower than X in [1, 4].

> =C2=A0There is a chance this is correct as until the thermal team examine=
s
> the air flow, its not unheard of to have back pressure on fans
> causing them to actually spin slower, but regardless they should be
> within the 15% target deviation.

> It would be more beneficial to group each _input with its
> corresponding _target cuz it seems here, for example, that fan7_input
> & fan1_input are associated with fan1_target?

Is this a comment on how the driver is implemented or how I've
displayed the outputs for the analysis above?

> > =C2=A0drivers/hwmon/max31785.c | 103 +++++++++++++++++++++++++---------=
-------------
> > =C2=A01 file changed, 54 insertions(+), 49 deletions(-)
> >=20
> > diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
> > index ed47d08a0ada..ca69d0974c00 100644
> > --- a/drivers/hwmon/max31785.c
> > +++ b/drivers/hwmon/max31785.c
> > @@ -88,10 +88,14 @@ struct max31785 {
> > > > > > =C2=A0	u8	mfr_fan_config[NR_CHANNEL];
> > > > > > =C2=A0	u8	fault_status[NR_CHANNEL];
> > > > > > =C2=A0	u16	pwm[NR_CHANNEL];
> > > > > > -	u16	tach_rpm[NR_CHANNEL];
> > > > > > -	u16	tach_rpm_fast[NR_CHANNEL];
> > > > > > +	u16	tach_rpm[NR_CHANNEL * 2];
> > =C2=A0};
> >=20
> > +static inline bool max31785_has_fast_rotor(struct max31785 *data)
> > +{
> > > > +	return !!(data->capabilities & MAX31785_CAP_FAST_ROTOR);
> > +}
> > +
> > =C2=A0static int max31785_set_page(struct i2c_client *client,
> > > > =C2=A0				u8 page)
> > =C2=A0{
> > @@ -188,14 +192,14 @@ static int max31785_update_fan_speed(struct max31=
785 *data, u8 fan)
> > > > =C2=A0	if (rc)
> > > > =C2=A0		return rc;
> >=20
> > > > -	if (data->capabilities & MAX31785_CAP_FAST_ROTOR) {
> > > > +	if (max31785_has_fast_rotor(data)) {
> > > > =C2=A0		rc =3D max31785_smbus_read_long_data(data->client,
> > > > =C2=A0				MAX31785_REG_FAN_SPEED_1);
> > > > =C2=A0		if (rc < 0)
> > > > =C2=A0			return rc;
> >=20
> > > > =C2=A0		data->tach_rpm[fan] =3D rc & 0xffff;
> > > > -		data->tach_rpm_fast[fan] =3D (rc >> 16) & 0xffff;
> > +		data->tach_rpm[NR_CHANNEL + fan] =3D (rc >> 16) & 0xffff;

This is where I interpret the top 16 bits as the fast fan value. For
reference, the implementation of max31785_smbus_read_long_data() is:

    /* Cut down version of i2c_smbus_xfer_emulated(), reading 4 bytes */
    static s64 max31785_smbus_read_long_data(struct i2c_client *client, u8 =
command)
    {
    	    unsigned char cmdbuf[1];
    	    unsigned char rspbuf[4];
    	    s64 rc;

    	    struct i2c_msg msg[2] =3D {
    	    	    {
    	    	    	    .addr =3D client->addr,
    	    	    	    .flags =3D 0,
    	    	    	    .len =3D sizeof(cmdbuf),
    	    	    	    .buf =3D cmdbuf,
    	    	    },
    	    	    {
    	    	    	    .addr =3D client->addr,
    	    	    	    .flags =3D I2C_M_RD,
    	    	    	    .len =3D sizeof(rspbuf),
    	    	    	    .buf =3D rspbuf,
    	    	    },
    	    };

    	    cmdbuf[0] =3D command;

    	    rc =3D i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
    	    if (rc < 0)
    	    	    return rc;

    	    rc =3D (rspbuf[0] << (0 * 8)) | (rspbuf[1] << (1 * 8)) |
    	    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(rspbuf[2] << (2 * 8)) | (rspbuf[3] =
<< (3 * 8));

    	    return rc;
    }

Particularly,

	rc =3D (rspbuf[0] << (0 * 8)) | (rspbuf[1] << (1 * 8)) |
	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(rspbuf[2] << (2 * 8)) | (rspbuf[3] << (3 * =
8));

Is derived from the i2c_smbus_xfer_emulated() implementation, expanding
it out to 4 bytes. From the SMBus specification the low byte is sent
first, followed by the high byte. Your suggestion was the slow rotor is
still reported in the first two bytes for the 0x3040 firmware, and I
assume the fast rotor word conforms to the SMBus standard, therefore we
arrive at the implementation above for rspbuf bytes 2 and 3.

However, as I reported, I'm seeing *lower* RPM values for the 'fast'
bytes (2 and 3 in rspbuf, or bits 31-16 in the returned 32-bit
quantity). Can you please try the patch yourself?

Cheers,

Andrew
--=-LQUiSs0DOWmj/rUp1C1J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZOfnPAAoJEJ0dnzgO5LT5DQ8P/0lDaTeubMrmnNPlyH3NlVWU
ymHLWZm/P0UmKJ8ejqdCgSBfTi3p+6b2R4Vl0eEral9yqn4Pe52ydXe/XIaPIV3/
QamwKLJWVkoKJMo1KNWvPox6/Mx7QK94QWTVJQSee8AKNJWat2V1g/aRKkAOzcnw
3sEBmG7UNVrPH9DPav+ImuKTCBLaPIdO2Y/Dp0mlOwTNB9lAfucS6iBjg8PCCFEN
wtUI9s9cBtelWcs9LNanH7o7kEnMfVbyv4hVZGBGaoZbgNvQzdRU4jGTjQX+P2KO
PcBLZ+7Qt11ufBMNXHVnwD2ZUE0fSpwppEfJtmMzk2TLl6JwOxbtBwCIqE64vuZf
H02AHAqe+g/BXX04KtJaweuIwULo6bb2UxQUUEBqL8DOl9Ufl2+Fr3FCm84aquy1
qkLm4XqDxzO1hsvA2lC8+82QyD45KILWPx6vs8NLzIAeSRpjMynTX6gqn5CboFQU
WW1qR9YnykLGKXsA98ocRAxWrzO8Rr/Y2NLnoGfm6wT+2jp/aVKPYXQkh98JPf2Q
DY9tnzj/a918JfZQhp5CYtruigGLP44uTRr9EEHww9gAis1KMHj8Eimgz6UnU9kX
K+OJWtArVPenN5LVMBhzNL0CbxGurAXxDWXcsAt1UxXMaRn2FpjseCJMEswqE16I
zcYJL+DFfAmoT9Cvl3hG
=81ZB
-----END PGP SIGNATURE-----

--=-LQUiSs0DOWmj/rUp1C1J--
