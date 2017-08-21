Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xbGzK3yDrzDqGs
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 11:57:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="dlnkuFR4"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Na6Uc/Eu"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 476FF20EF6;
 Sun, 20 Aug 2017 21:57:31 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 20 Aug 2017 21:57:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=6UMmqA3+lnXM75S9vkmA1pV+GG/powPKDtaoQVBMD
 G4=; b=dlnkuFR4ggkasa/wF5tweD1LHt9i/qmdgN8UZrFDLF0k4tbAGKU4WgzvW
 epZcvP+4yutMtrcxYdmi1yqFjnYAgqLhMKNoDGY9ZWHLfnI+Hd/nkrbaFSYXDZHG
 EooHIv9JomscWoXafpqvGSJqlpQbixr6JNnVwNIpz+04Ou02m1Z5/OEShPOG29jj
 gXLWec4wDEX8UyY4BKvtSpVv5vNInRH+3nV2G39KLUOJtOWrNxDa7E8AUpvtI35Z
 bdQqsyjgq5YeS1gC62flTjDDOyC74rv3pzPOlPN6W/BqXZuBlVfVoNpTUMHscrEu
 otKeF0BHVkJu+A2pbLrM1C5h9ti9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=6UMmqA3+lnXM75S9vk
 mA1pV+GG/powPKDtaoQVBMDG4=; b=Na6Uc/Eu4IhtVdWZjy38Ayzdnu8fTm8hdf
 34RIKGmBnzpdrDc60H/6q3grYWVuAtN5CVju1jcr8/iPQdGBZN6bHcz/blvhAANf
 3g+hQbeWJD6s0Ic0sY5kjpjYSJ0y2fkkapqzxJcQX6YZI6ik6hjvxFkKCp8Hf2EU
 lyCo0W7O+a/kLvS3g/3reQMZN8uMrGpo8cnh/Fzp2PaOcxKVXWZV323JvSmLeqKV
 NxmjqKtIsxX3RuxeaWjMlWejz8eIGrxqyMZSznxO9+Xd7KKOKc7+5fQ7m0oSL6TC
 Zx1U0tph2cvNXsMqkal26WZWkhS70nOb/BNyi1CtsZB35BgZkrxQ==
X-ME-Sender: <xms:Cz6aWY5ZIS2wmOuJwTq__M_jS764ygPh5gewMjKBLjnUJndG10fiDg>
X-Sasl-enc: uOIc8DHp5bT3DMucKVfRadrpyEWaIDq4TBvh7BiN9uRg 1503280650
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 914AA248A1;
 Sun, 20 Aug 2017 21:57:29 -0400 (EDT)
Message-ID: <1503280646.7266.4.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 1/2] hwmon: (ucd9000) Add gpio chip
 interface and clear logged faults
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Mon, 21 Aug 2017 11:27:26 +0930
In-Reply-To: <42d093a3-3567-00e1-6eb7-009033b2919b@linux.vnet.ibm.com>
References: <20170818013526.35678-1-cbostic@linux.vnet.ibm.com>
 <20170818013526.35678-2-cbostic@linux.vnet.ibm.com>
 <1503035048.681.14.camel@aj.id.au>
 <42d093a3-3567-00e1-6eb7-009033b2919b@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-66jwDdOb4J5fJv/mSQA1"
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
X-List-Received-Date: Mon, 21 Aug 2017 01:57:34 -0000


--=-66jwDdOb4J5fJv/mSQA1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chris,

On Fri, 2017-08-18 at 15:38 -0500, Christopher Bostic wrote:
>=C2=A0
> On 8/18/17 12:44 AM, Andrew Jeffery wrote:
> > Hi Chris,
> >=C2=A0
> > On Thu, 2017-08-17 at 20:35 -0500, Christopher Bostic wrote:
> > > Add a struct gpio_chip and define some methods so that this device's
> > > I/O can be accessed via /sys/class/gpio.
> > > =C2=A0=C2=A0
> > > Add capability to clear logged faults via sysfs.
> > > =C2=A0=C2=A0
> > > > Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> > >=C2=A0
> > > ---
> > > v3 - Correct bug in gpio_chip get method.=C2=A0=C2=A0Wasn't retrievin=
g
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gpio config information correctly=
.
> > > =C2=A0=C2=A0=C2=A0=C2=A0- Remove old debugfs flag from previous pmbus=
 core changes.
> > > =C2=A0=C2=A0=C2=A0=C2=A0- Remove all sysfs files for mfr_status comma=
nd.
> > > =C2=A0=C2=A0=C2=A0=C2=A0- Add comments on direct i2c_smbus calls to c=
larify that no page
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0set is required.
> > > v2 - Remove clear_faults file - redundant since all other sysfs
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0core accesses result in an automa=
tic clear fault.
> > > =C2=A0=C2=A0=C2=A0=C2=A0- Removed local status_word and status_vout r=
egister dumps and
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0use the new pmbus core status fac=
ilities instead.
> > > =C2=A0=C2=A0=C2=A0=C2=A0- Rename gpi<x>_fault to gpi<x>_alarm to bett=
er match core naming
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0conventions.
> > > =C2=A0=C2=A0=C2=A0=C2=A0- Add full register dump for mfr_status.
> > > =C2=A0=C2=A0=C2=A0=C2=A0- Add gpio chip to device structure and use g=
pio interfaces.
> > > ---
> > > =C2=A0 drivers/hwmon/pmbus/ucd9000.c | 136 ++++++++++++++++++++++++++=
+++++++++++++++-
> > > =C2=A0 1 file changed, 134 insertions(+), 2 deletions(-)
> > > =C2=A0=C2=A0
> > > diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9=
000.c
> > > index 3e3aa95..af44c1e 100644
> > > --- a/drivers/hwmon/pmbus/ucd9000.c
> > > +++ b/drivers/hwmon/pmbus/ucd9000.c
> > > @@ -26,6 +26,9 @@
> > > =C2=A0 #include <linux/slab.h>
> > > =C2=A0 #include <linux/i2c.h>
> > > =C2=A0 #include <linux/i2c/pmbus.h>
> > > +#include <linux/sysfs.h>
> > > +#include <linux/hwmon-sysfs.h>
> > > +#include <linux/gpio.h>
> > > =C2=A0 #include "pmbus.h"
> > > =C2=A0=C2=A0
> > > =C2=A0 enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, u=
cd90910 };
> > > @@ -34,8 +37,16 @@
> > > > > > > > =C2=A0 #define UCD9000_NUM_PAGES		0xd6
> > > > > > > > =C2=A0 #define UCD9000_FAN_CONFIG_INDEX	0xe7
> > > > > > > > =C2=A0 #define UCD9000_FAN_CONFIG		0xe8
> > > > > > > > +#define UCD9000_LOGGED_FAULTS		0xea
> > > > > > > > +#define UCD9000_GPIO_SELECT		0xfa
> > > > > > > > +#define UCD9000_GPIO_CONFIG		0xfb
> > > > =C2=A0 #define UCD9000_DEVICE_ID		0xfd
> > >=C2=A0
> > > =C2=A0=C2=A0
> > > +/* GPIO CONFIG bits */
> > > > > > > > +#define UCD9000_GPIO_CONFIG_ENABLE	BIT(0)
> > > > > > > > +#define UCD9000_GPIO_CONFIG_OUT_ENABLE	BIT(1)
> > > > +#define UCD9000_GPIO_CONFIG_STATUS	BIT(3)
> > >=C2=A0
> > > +
> > > > > > > > =C2=A0 #define UCD9000_MON_TYPE(x)	(((x) >> 5) & 0x07)
> > > > =C2=A0 #define UCD9000_MON_PAGE(x)	((x) & 0x0f)
> > >=C2=A0
> > > =C2=A0=C2=A0
> > > @@ -46,9 +57,12 @@
> > > =C2=A0=C2=A0
> > > > =C2=A0 #define UCD9000_NUM_FAN		4
> > >=C2=A0
> > > =C2=A0=C2=A0
> > > > +#define UCD90160_NUM_GPIOS	26
> >=C2=A0
> > This is mostly true, though there are only 22 physical GPIOs, plus 4 GP=
Is.
> > We're additionally constrained on the UCD90160 by "Table 3. GPIO Pin
> > Configuration Options" in "16-Rail Power Supply Sequencer and Monitor w=
ith ACPI
> > Support datasheet (Rev. C)" (ucd90160.pdf, page 22) to 8/26 as GPIs and=
 16/22
> > as GPOs. It would probably pay to think about how these constraints wou=
ld
> > impact the implementation.
>=C2=A0
> Hi Andrew,
>=C2=A0
> Will go through and review the data for the various ucd9000 devs. I=C2=A0
> understand the need to cover all these device types but want to also be=
=C2=A0
> able to deliver internally what is needed which is just the gpi faults.=
=C2=A0=C2=A0
> Maybe we can discuss further on Sunday's call.

Yeah, understood, it was a thinking-out-loud comment. However I would hate =
to
get too deep on an implementation only to find that it's not appropriate fo=
r
the device's behaviour.

>=C2=A0
> > > +
> > > =C2=A0 struct ucd9000_data {
> > > > > > > > =C2=A0=C2=A0	u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_M=
AX];
> > > > > > > > =C2=A0=C2=A0	struct pmbus_driver_info info;
> > > > +	struct gpio_chip gpio;
> > >=C2=A0
> > > =C2=A0 };
> > > =C2=A0 #define to_ucd9000_data(_info) container_of(_info, struct ucd9=
000_data, info)
> > > =C2=A0=C2=A0
> > > @@ -119,6 +133,92 @@ static int ucd9000_read_byte_data(struct i2c_cli=
ent *client, int page, int reg)
> > > =C2=A0 };
> > > =C2=A0 MODULE_DEVICE_TABLE(i2c, ucd9000_id);
> > > =C2=A0=C2=A0
> > > +static int ucd9000_gpio_read_config(struct i2c_client *client,
> > > > +				unsigned int offset)
> > >=C2=A0
> > > +{
> > > > +	int ret;
> > >=C2=A0
> > > +
> > > > > > > > +	/* No page set required */
> > > > > > > > +	ret =3D i2c_smbus_write_byte_data(client, UCD9000_GPIO_SE=
LECT, offset);
> > > > > > > > +	if (ret < 0) {
> > > > +		dev_err(&client->dev,
> >=C2=A0
> > Why is there a linebreak here?
>=C2=A0
> No good reason, will correct.
>=C2=A0
> >=C2=A0
> > > > +			"Failed to read pin ID %d\n", offset);
> >=C2=A0
> > The error message is confusing - it relates to the semantics of
> > ucd9000_gpio_read_config() and not the operation on which the error occ=
urred.
> >=C2=A0
> > I feel strongly that we should also report the error code as well: It p=
rovides
> > additional context on what went wrong.
> >=C2=A0
> > As a consequence I would suggest something like:
> >=C2=A0
> > > >=C2=A0		dev_err(&client->dev, "Failed to select GPIO %d: %d\n", offs=
et,
> >=C2=A0			ret);
>=C2=A0
> OK, will go with your suggestion.
>=C2=A0
> > > > > > > > +		return ret;
> > > > +	}
> > >=C2=A0
> > > +
> > > > +	return i2c_smbus_read_byte_data(client, UCD9000_GPIO_CONFIG);
> > >=C2=A0
> > > +}
> > > +
> > > +static int ucd9000_gpio_get(struct gpio_chip *gc, unsigned int offse=
t)
> > > +{
> > > > > > > > +	struct i2c_client *client=C2=A0=C2=A0=3D gpiochip_get_dat=
a(gc);
> > > > +	int ret;
> > >=C2=A0
> > > +
> > > > > > > > +	ret =3D ucd9000_gpio_read_config(client, offset);
> > > > > > > > +	if (ret < 0) {
> > > > > > > > +		dev_err(&client->dev,
> > > > +			"failed to read GPIO config\n");
> >=C2=A0
> > Again, we don't need a linebreak above, but we probably should have one=
 between
> > the dev_err() and the return statement.
>=C2=A0
> Will take care of that.
>=C2=A0
>=C2=A0
> > > > > > > > +		return ret;
> > > > +	}
> > >=C2=A0
> > > +
> > > > +	return ret & UCD9000_GPIO_CONFIG_STATUS ? 1 : 0;
> >=C2=A0
> > We can avoid the branch with:
> >=C2=A0
> >=C2=A0	return !!(ret & UCD9000_GPIO_CONFIG_STATUS);
>=C2=A0
> Will update.
>=C2=A0
> > Interestingly it's not clear from the datasheet whether the status bit =
contains
> > a relevant value when the pin is in output mode, as there's a separate =
bit (bit
> > 2) to set the value. Have you tested the behaviour?
>=C2=A0
> I've not tested this in output mode.=C2=A0=C2=A0Up to this point there is=
n't any=C2=A0
> means to set direction so, at least for how we're using it currently=C2=
=A0
> these are all set to inputs.
> Will see how this behaves in output mode.

Do it as you have time - as you point out there's not support for output
currently so it's not the end of the world. I just wanted to note the behav=
iour
so we didn't forget about it.

> > > +}
> > > +
> > > +static int ucd9000_gpio_get_direction(struct gpio_chip *gc,
> > > > +					unsigned int offset)
> > >=C2=A0
> > > +{
> > > > > > > > +	struct i2c_client *client=C2=A0=C2=A0=3D gpiochip_get_dat=
a(gc);
> > > > +	int ret;
> > >=C2=A0
> > > +
> > > > > > > > +	ret =3D ucd9000_gpio_read_config(client, offset);
> > > > > > > > +	if (ret < 0) {
> > > > > > > > +		dev_err(&client->dev,
> > > > > > > > +			"failed to read GPIO config\n");
> > > > > > > > +		return ret;
> > > > +	}
> > >=C2=A0
> > > +
> > > > +	return ret & UCD9000_GPIO_CONFIG_OUT_ENABLE ? 0 : 1;
> > >=C2=A0
> > > +}
> > > +
> > > +/*
> > > + * Defined so that libgpiod tool can access pin states.=C2=A0=C2=A0N=
o plan to actually
> > > + * change pin direction within this driver.
> >=C2=A0
> > That's not true - the driver is general purpose. Lets not limit it too =
much to
> > *how you intend to use it* vs the actual hardware capability.
>=C2=A0
> Understand.=C2=A0=C2=A0Will implement direction switch for next revision =
in any case.

Great.

>=C2=A0
> > > + */
> > > +static int ucd9000_gpio_direction_input(struct gpio_chip *gc,
> > > > +					unsigned int offset)
> > >=C2=A0
> > > +{
> > > > +	return 0;
> >=C2=A0
> > I don't think we should do this for several reasons:
> >=C2=A0
> > 1) It's not that hard to implement the functionality
> > 2) It's not true that all GPIOs are inputs with factory defaults
> > 3) There will be uncertainty if custom defaults are programmed
> >=C2=A0
> > Again from ucd90160.pdf, on page 34:
> >=C2=A0
> >=C2=A0	7.5 Programming
> >=C2=A0	7.5.1 Device Configuration and Programming
> >=C2=A0	From the factory, the device contains the sequencing and monitori=
ng
> >=C2=A0	firmware. It is also configured so that all GPOs are high-impedan=
ce
> >=C2=A0	(except for FPWM/GPIO pins 17-24, which are driven low), with no
> >=C2=A0	sequencing or fault-response operation. See Configuration Program=
ming
> >=C2=A0	of UCD Devices, available from the Documentation & Help Center th=
at can
> >=C2=A0	be selected from the Fusion GUI Help menu, for full UCD90160
> >=C2=A0	configuration details.
> >=C2=A0
> > The FPWM pins are driven low, implying they are configured for output m=
ode.
> > It's not obvious to me from this whether the other GPIOs are input or o=
utput
> > out-of-the-box as the chip supports active and open-drain drive types. =
It does
> > say "GPOs" in the paragraph above, but I haven't found documentation on=
 which
> > pins are in what state from factory, and I don't know how we're configu=
ring it
> > for production.
> >=C2=A0
> > Regardless, the driver shouldn't make assumptions about how the device =
is
> > pre-programmed - without further information there's already ambiguity =
as to
> > whether the default settings are in play or whether the system integrat=
or has
> > configured the chip. We need information from the platform about how th=
e device
> > is/should be managed.
> >=C2=A0
> > Further, the note in section 10.43 (FBh) GPIO_CONFIG (MFR_SPECIFIC_43) =
says:
> >=C2=A0
> >=C2=A0	Configuring a pin that is also being used by another function (en=
able,
> >=C2=A0	fan control, and so forth) may likely result in unexpected and un=
wanted
> >=C2=A0	behavior.
>=C2=A0
> All good points.=C2=A0=C2=A0Will implement direction switching for next s=
ubmit.

Thanks.

>=C2=A0
> > This suggests my favourite topic: pinctrl.
> >=C2=A0
> > Twenty-two of the pins on the UCD90160 are GPIO-capable. Of these 22 pi=
ns, 16
> > of them have alternate functions. See "Table 3. GPIO Pin Configuration =
Options"
> > on page 22 of ucd90160.pdf. But a quick rundown:
> >=C2=A0
> > 1. 4 PWM pins (GPIOs 1-4, pins 31, 32, 42, 41)
> > 2. 8 FPWM (Fast PWM) pins (GPIOs 5-12, pins 17-24)
> > 3. 4 pins shared with JTAG (GPIOs 19-22, pins 36-39)
> >=C2=A0
> > Now, in terms of devicetree we'd be breaking things in the future by sp=
ecifying
> > a GPIO controller that relies on a pinmux in hardware without also spec=
ifying
> > the pin controller in the devicetree. This necessitates at least *some*=
 pinctrl
> > capability be baked into the driver as well, so we can point the gpioch=
ip to
> > the relevant pin controller (the same device, but the bindings are gene=
ral) and
> > map the pin spaces in the devicetree (the gpio and pin spaces are diffe=
rent).
>=C2=A0
> I'd like to avoid implementing pinctrl for the time being given the=C2=A0
> limited function we need internally.=C2=A0=C2=A0=C2=A0I do see the advant=
ages as you=C2=A0
> point out so maybe we can phase this in?

I think it should be possible to do a bare-bones pinctrl implementation tha=
t
describes no pinmux functions but allows allocation of GPIOs. That way the
devicetree won't have to change in a breaking way. See how the GPIO control=
ler
defers to the pinctrl node to allocate pins in the Aspeed DTSIs:

	https://github.com/openbmc/linux/blob/dev-4.10/Documentation/devicetree/bi=
ndings/gpio/gpio.txt#L230
	https://github.com/openbmc/linux/blob/dev-4.10/arch/arm/boot/dts/aspeed-g5=
.dtsi#L271
	https://github.com/openbmc/linux/blob/dev-4.10/drivers/pinctrl/aspeed/pinc=
trl-aspeed-g5.c#L2439
	https://github.com/openbmc/linux/blob/dev-4.10/drivers/pinctrl/aspeed/pinc=
trl-aspeed.c#L453

The implementation should be no-where near as complex as the Aspeed pinmux,=
 and
hopefully we only need the GPIO portions of it.

Cheers,

Andrew

>=C2=A0
> > > +}
> > > +
> > > +static ssize_t ucd9000_clear_logged_faults(struct device *dev,
> > > > > > > > +				struct device_attribute *attr, const char *buf,
> > > > +				size_t count)
> > >=C2=A0
> > > +{
> > > > > > > > +	struct i2c_client *client =3D to_i2c_client(dev);
> > > > +	int ret;
> > >=C2=A0
> > > +
> > > > > > > > +	/* No page set required */
> > > > > > > > +	ret =3D i2c_smbus_write_byte_data(client, UCD9000_LOGGED_=
FAULTS, 0);
> > > > > > > > +	if (ret) {
> > > > > > > > +		dev_err(&client->dev, "Failed to clear logged faults\n")=
;
"> > > > > > > > +		return ret;
> > > > +	}
> > >=C2=A0
> > > +
> > > > +	return count;
> > >=C2=A0
> > > +}
> > > +
> > > +static DEVICE_ATTR(clear_logged_faults, 0200, NULL,
> > > > +		ucd9000_clear_logged_faults);
> > >=C2=A0
> > > +
> > > +static struct attribute *ucd9000_attributes[] =3D {
> > > > > > > > +	&dev_attr_clear_logged_faults.attr,
> > > > +	NULL
> > >=C2=A0
> > > +};
> > > +
> > > +static const struct attribute_group ucd9000_attr_group =3D {
> > > > +	.attrs =3D ucd9000_attributes,
> > >=C2=A0
> > > +};
> > > +
> >=C2=A0
> > Joel's made a fair comment here regarding upstream. Please address that=
.
>=C2=A0
> Next patch set will be sent upstream.
>=C2=A0
> > > =C2=A0 static int ucd9000_probe(struct i2c_client *client,
> > > > =C2=A0=C2=A0			=C2=A0const struct i2c_device_id *id)
> > >=C2=A0
> > > =C2=A0 {
> > > @@ -227,7 +327,39 @@ static int ucd9000_probe(struct i2c_client *clie=
nt,
> > > > > > > > =C2=A0=C2=A0		=C2=A0=C2=A0| PMBUS_HAVE_FAN34 | PMBUS_HAVE_S=
TATUS_FAN34;
> > > > =C2=A0=C2=A0	}
> > >=C2=A0
> > > =C2=A0=C2=A0
> > > > > > > > -	return pmbus_do_probe(client, mid, info);
> > > > > > > > +	data->gpio.label =3D "gpio-ucd9000";
> > > > > > > > +	data->gpio.get_direction =3D ucd9000_gpio_get_direction;
> > > > > > > > +	data->gpio.direction_input =3D ucd9000_gpio_direction_inp=
ut;
> > > > +	data->gpio.get =3D ucd9000_gpio_get;
> >=C2=A0
> > I feel like it wouldn't be much effort to make this more complete and s=
pecify
> > the direction_output() and set() callbacks as well.
>=C2=A0
> Right, will do that.
>=C2=A0
> >=C2=A0
> > > > > > > > +	data->gpio.can_sleep =3D 1;
> > > > > > > > +	data->gpio.base =3D -1;
> > > > > > > > +	if (mid->driver_data =3D=3D ucd90160)
> > > > +		data->gpio.ngpio =3D UCD90160_NUM_GPIOS;
> >=C2=A0
> > This might need some rework in the future as the other ucd9000 variants=
 want
> > GPIO support.
> >=C2=A0
> > In fact, what's the behaviour of the other drivers now given we're
> > unconditionally registering a gpiochip?
>=C2=A0
> The other drivers would have a gpio_chip that is available but if they=C2=
=A0
> don't use it I'm not thinking this would break them in any way.=C2=A0=C2=
=A0Would=C2=A0
> it be better to only register a gpiochip if its a ucd90160 in particular?
>=C2=A0
> > > > > > > > +	data->gpio.parent =3D &client->dev;
> > > > +	data->gpio.owner =3D THIS_MODULE;
> >=C2=A0
> > At some point we should think about pinconf as well (push-pull vs open-=
drain).
>=C2=A0
> Ok, will make a note of that.
>=C2=A0
>=C2=A0
> > > +
> > > > > > > > +	ret =3D devm_gpiochip_add_data(&client->dev, &data->gpio,=
 client);
> > > > > > > > +	if (ret) {
> > > > > > > > +		data->gpio.parent =3D NULL;
> > > > > > > > +		dev_warn(&client->dev, "Count not add gpiochip\n");
> > > > > > > > +		return ret;
> > > > +	}
> > >=C2=A0
> > > +
> > > > > > > > +	dev_info(&client->dev, "gpios %i...%i\n", data->gpio.base=
,
> > > > +		data->gpio.base + data->gpio.ngpio - 1);
> >=C2=A0
> > Let's drop this.
>=C2=A0
> Will remove.
>=C2=A0
> Thanks,
> Chris
>=C2=A0
>=C2=A0
> >=C2=A0
> > Cheers,
> >=C2=A0
> > Andrew
> >=C2=A0
> > > +
> > > > > > > > +	ret =3D sysfs_create_group(&client->dev.kobj,
> > > > > > > > +				&ucd9000_attr_group);
> > > > > > > > +	if (ret < 0)
> > > > +		return ret;
> > >=C2=A0
> > > +
> > > > +	return=C2=A0=C2=A0pmbus_do_probe(client, mid, info);
> > >=C2=A0
> > > +}
> > > +
> > > +static int ucd9000_remove(struct i2c_client *client)
> > > +{
> > > > > > > > +	sysfs_remove_group(&client->dev.kobj, &ucd9000_attr_group=
);
> > > > +	return pmbus_do_remove(client);
> > >=C2=A0
> > > =C2=A0 }
> > > =C2=A0=C2=A0
> > > =C2=A0 /* This is the driver that will be inserted */
> > > @@ -236,7 +368,7 @@ static int ucd9000_probe(struct i2c_client *clien=
t,
> > > > > > > > =C2=A0=C2=A0		.name =3D "ucd9000",
> > > > > > > > =C2=A0=C2=A0	},
> > > > > > > > =C2=A0=C2=A0	.probe =3D ucd9000_probe,
> > > > > > > > -	.remove =3D pmbus_do_remove,
> > > > > > > > +	.remove =3D ucd9000_remove,
> > > > =C2=A0=C2=A0	.id_table =3D ucd9000_id,
> > >=C2=A0
> > > =C2=A0 };
> > > =C2=A0=C2=A0
>=C2=A0
>=C2=A0
--=-66jwDdOb4J5fJv/mSQA1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZmj4GAAoJEJ0dnzgO5LT5vc4QAJFSab59XEPDmpLsD1Vb7ql3
LahOULwyq11qrry4VaxdxfJgQQV8Iu0GP5rioit5jWFCopbh8+9RTlOeDiWbeh2v
krgjO0+Ulo9422RktwQ13b0LuaDJubeP65JUba6GiFOYjaInSewdDD0tXU6gKrLU
/2f/1tPfyhIX865ESayTwdOwtvdH+tNHXhp+PRxi4sAYT12FL+X/h85Ul4UsAMpG
Fc3/Q5hG/v5bUqBcCsrnpc9X+syw1VZPY8ZNprH3Pyr5CvG6K+hzdso7XejkWTZG
eXIbPIfjQWc1E8PBUaqPP9dGtSmueAKFbU+IbfFW48YZETMEzNdEV0B2+iNaqmwg
v5IK4p5HRfPPYVzKLx1IjBVDT5VdoMVih9uqSt8k6Dqo34CUXbiZbeABJlpPUJ89
xVmKbPsRPlpXi1zw9qOXfpDJTiaoLd9dQdRL814/EJYzcCFTGEkp2w/ev1eAMG0k
Q5VIC9+kB+T3YQzNNt10Z/SY3DseP7WV35eLjMGDi7JzO5sWCCmHd0tWy2/7eWRw
g41d/o1OwSChVJMkLCt/9eV13qmkm09ISKySeXfPqVUWznYYZuZEdLdCSZe4mMqW
9nTBZQ8gwT6V1EZwkeK0K8ijZM1sA+b3er5N22ytGUQ6tWAp2oLkvTZGCs+1Lm+C
feiN4WqpxfdG6DkdmhSw
=Va0b
-----END PGP SIGNATURE-----

--=-66jwDdOb4J5fJv/mSQA1--
