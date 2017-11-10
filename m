Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="V/mfypDC"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="AXowv6/X"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yY4m56Cf3zDrKJ
 for <openbmc@lists.ozlabs.org>; Fri, 10 Nov 2017 14:10:29 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 69B8420AA9;
 Thu,  9 Nov 2017 22:10:27 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 09 Nov 2017 22:10:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=n69DZT1graHatL9VuWVDtO+S5gRq4oGlAAdKw+feghk=; b=V/mfypDC
 2VMas6XevpDvn9109aHxp4oiflZ+LJ1LM4SPgzH5c9OHZ1SxC4UpuS+veF8iGfT6
 6nWDeOvWuglRKfJNGVRt4MK/3JtTWLGgJ9Nxa34PaZfvIfnoAXLMeRQzyVFf8RiE
 vYfyLT1tyBL48iwu0WKBWTj6DaZPrQHu0umYSLQjVHIDbEUqnZPz3T4vEXrlcuAv
 tryllsJPIHLRXOMeboVW5mSuCF7aLGxkmjWMaeJG1VgqP1jj2nkjphI4PQ4KuSxA
 nJZ8i+HrAM17Aoiaz8uiQkWWT+ciFtg/kcUwPfThdztbPw6vhe/GUmKnQXRoYMNw
 EAnnQ9DxuYf2Gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=n69DZT1graHatL9VuWVDtO+S5gRq4
 oGlAAdKw+feghk=; b=AXowv6/XLVv8fe0GBQ8H1mZXE+J+kgY05mbZIYTAaYdr7
 kWzQZQP5viB36LIGGrOMNWcATXpFuWhwLm151eMicfUNnhQQtKGkFqJLtr54MGPt
 2DAzQbDdWjro82As4LHf4FHCpFweQ5qsrlJwPyu9kpC2DUfNUbb91ki4HRTrJ54b
 r5/ciAQm5qMQ5J+Jl0Cfh9QDI0bwAdy08YxvrNzNs1cwdK3LfZPF0U5M8hMcK1en
 GSrFzXslFNHeZYirfqX1Bd7bkoufudfVKMXAPtZFUqVYkjO+fh1/8Zd8okjvilLD
 BfZeLb3NfrJ5CbWYdMGWUD9MTYkAE1LuvxqJd8OvQ==
X-ME-Sender: <xms:oxgFWlyOgvBwV-HNFxSrpnJDzgCnArAP1WGjNgP79wz0G0M5AXxexQ>
Received: from dave (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2BF6E7F35E;
 Thu,  9 Nov 2017 22:10:22 -0500 (EST)
Message-ID: <1510283416.4287.43.camel@aj.id.au>
Subject: Re: [v4,4/6] pmbus: max31785: Add fan control
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, 
 jdelvare@suse.com, corbet@lwn.net, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, joel@jms.id.au, 
 openbmc@lists.ozlabs.org
Date: Fri, 10 Nov 2017 13:40:16 +1030
In-Reply-To: <20171105150441.GA26191@roeck-us.net>
References: <20171103045306.26448-5-andrew@aj.id.au>
 <20171105150441.GA26191@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-SOWC8MSMlpwrpMztMX9w"
X-Mailer: Evolution 3.26.1-1 
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
X-List-Received-Date: Fri, 10 Nov 2017 03:10:31 -0000


--=-SOWC8MSMlpwrpMztMX9w
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2017-11-05 at 07:04 -0800, Guenter Roeck wrote:
> On Fri, Nov 03, 2017 at 03:53:04PM +1100, Andrew Jeffery wrote:
> > The implementation makes use of the new fan control virtual registers
> > exposed by the pmbus core. It mixes use of the default implementations
> > with some overrides via the read/write handlers to handle FAN_COMMAND_1
> > on the MAX31785, whose definition breaks the value range into various
> > control bands dependent on RPM or PWM mode.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  Documentation/hwmon/max31785   |   4 ++
> >  drivers/hwmon/pmbus/max31785.c | 104 +++++++++++++++++++++++++++++++++=
+++++++-
> >  2 files changed, 107 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/hwmon/max31785 b/Documentation/hwmon/max3178=
5
> > index 45fb6093dec2..e9edbf11948f 100644
> > --- a/Documentation/hwmon/max31785
> > +++ b/Documentation/hwmon/max31785
> > @@ -32,6 +32,7 @@ Sysfs attributes
> >  fan[1-4]_alarm		Fan alarm.
> >  fan[1-4]_fault		Fan fault.
> >  fan[1-4]_input		Fan RPM.
> > +fan[1-4]_target		Fan input target
> > =20
> >  in[1-6]_crit		Critical maximum output voltage
> >  in[1-6]_crit_alarm	Output voltage critical high alarm
> > @@ -44,6 +45,9 @@ in[1-6]_max_alarm	Output voltage high alarm
> >  in[1-6]_min		Minimum output voltage
> >  in[1-6]_min_alarm	Output voltage low alarm
> > =20
> > +pwm[1-4]		Fan target duty cycle (0..255)
> > +pwm[1-4]_enable		0: full-speed, 1: manual control, 2: automatic
> > +
> >  temp[1-11]_crit		Critical high temperature
> >  temp[1-11]_crit_alarm	Chip temperature critical high alarm
> >  temp[1-11]_input	Measured temperature
> > diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31=
785.c
> > index 9313849d5160..0d97ddf67079 100644
> > --- a/drivers/hwmon/pmbus/max31785.c
> > +++ b/drivers/hwmon/pmbus/max31785.c
> > @@ -20,8 +20,102 @@ enum max31785_regs {
> > =20
> >  #define MAX31785_NR_PAGES		23
> > =20
> > +static int max31785_get_pwm(struct i2c_client *client, int page)
> > +{
> > +	int config;
> > +	int command;
> > +
> > +	config =3D pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);
> > +	if (config < 0)
> > +		return config;
> > +
> > +	command =3D pmbus_read_word_data(client, page, PMBUS_FAN_COMMAND_1);
> > +	if (command < 0)
> > +		return command;
> > +
> > +	if (!(config & PB_FAN_1_RPM)) {
> > +		if (command >=3D 0x8000)
> > +			return 0;
> > +		else if (command >=3D 0x2711)
> > +			return 0x2710;
> > +
> > +		return command;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int max31785_get_pwm_mode(struct i2c_client *client, int page)
> > +{
> > +	int config;
> > +	int command;
> > +
> > +	config =3D pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);
> > +	if (config < 0)
> > +		return config;
> > +
> > +	command =3D pmbus_read_word_data(client, page, PMBUS_FAN_COMMAND_1);
> > +	if (command < 0)
> > +		return command;
> > +
> > +	if (!(config & PB_FAN_1_RPM)) {
> > +		if (command >=3D 0x8000)
> > +			return 2;
> > +		else if (command >=3D 0x2711)
> > +			return 0;
> > +
> > +		return 1;
> > +	}
> > +
> > +	return (command >=3D 0x8000) ? 2 : 1;
> > +}
> > +
> > +static int max31785_read_word_data(struct i2c_client *client, int page=
,
> > +				   int reg)
> > +{
> > +	int rv;
> > +
> > +	switch (reg) {
> > +	case PMBUS_VIRT_PWM_1:
> > +		rv =3D max31785_get_pwm(client, page);
> > +		if (rv < 0)
> > +			return rv;
> > +
> > +		rv *=3D 255;
> > +		rv /=3D 100;
> > +		break;
> > +	case PMBUS_VIRT_PWM_ENABLE_1:
> > +		rv =3D max31785_get_pwm_mode(client, page);
> > +		break;
>=20
> I do wonder ... does it even make sense to specify generic code
> for the new virtual attributes in the pmbus core code, or would
> it be better to have it all in this driver, at least for now ?

I think I'll pull the generic implementations out in light of my
response on 3/6. At best the generic implementation for the PWM virtual
regs is a guess. We can always put it back if others come to need it.

Cheers,

Andrew
--=-SOWC8MSMlpwrpMztMX9w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJaBRiYAAoJEJ0dnzgO5LT5CkcQAJsoerG0RAM/F240ztHjiKzW
OtqwpUknCjviUjtLdEmvCN/DNh+4q94e5peJY1LD+SgYzapnUtS7xC2hCHaLoa26
Zx3m2jg8Ku/XRfksaPGg/EzJHhFJ/DR4xMkF+4eApFk9VO2PkalXCuy7F3gbW/f3
293awjNRjtrFR/rxLXMG2ARabCg+dA+GWYWbdDTCr72A58Vy3cxKUoyj/Xaw1pbR
RRvtNgXW/ElcCpYwJz1A1RdtXc79fU4oqa51Ag9Wupe0x6TKpVd0dndgGnk3Le4H
ucRVG/3xAj2OAJeCaba9+UPSRJH8KA8kJcBWr5rAMnc9HVAg2PJPVDnoUS79CP1B
iWz5x6N+3GYgz07RuCDiPzRb8NlAkIZ9lejz/DDZgxh2WmjkBRJV9YvMIL3zYVbV
Fnv0Sgz64yPATcjaPZwnjb66z9DPCghU9/qIXQB7xNT8S3of90Pts63oLygqhm3k
JahcNTyrW2ibQYgjovSyThbpNgsYcrEvUlj9NdtrNFxqEGWzvxZ1/m4QRrd482Kd
224e/cin+yIokggIFrNqTfNCrTAl63taBUsOITIJQzucjlSfEsHSd+0cV4f30BoH
NOIZfEFHmrFHRiOF77hPRNgwdX7Je0ov6w2lClOIqEUrHZyk/G+6Hk9BRxyxBSlt
/dZnjdNHb7Ec6AsR9QWQ
=px/K
-----END PGP SIGNATURE-----

--=-SOWC8MSMlpwrpMztMX9w--
