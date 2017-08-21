Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xbGZs1PsBzDrK5
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 11:39:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="g1GkFTp0"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="arC3v8vC"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2DEA820D4F;
 Sun, 20 Aug 2017 21:39:44 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Sun, 20 Aug 2017 21:39:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=bY/khITlRpePLqA3I6ZTDYg0yh+Gr2yP9do8fMsKK
 SI=; b=g1GkFTp0erHx8dHo1GyZxDudwpBc0LaHO0Ei3ftG0QZ+BkRxZSBG6Uadv
 gVfhZwbA05jY4TnnIQtcc8WtKcZkb81xyel6Osge5qGK3u94bop6BzrR//mLd/Lu
 e9z7uruqZvdnHyXZ2HobnIu4CrYN7qU69KcWLJnzEe3ONyuEP2yXewODgv1d1kYC
 WXLqjjskj96c+sTX+n7omhMpaPt1BDq0ma8EbunjQUqlmmqIaPX1lIJFAJcOE35x
 SCtGg20hI0SjoU+qWMJftKektqlLyeVGMmhULDN+8if5Uo4FODP0jFCTu2BIECp+
 JhRX5N6edK6micBjgl8xGM09IB7Qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=bY/khITlRpePLqA3I6
 ZTDYg0yh+Gr2yP9do8fMsKKSI=; b=arC3v8vC3qH/qhO491Lr9vj2vyGKOuC7qQ
 s5kXZHv/npVpp94yrTOG7BMVhDl4h1oxbYOuBSzm+UYGEdZ4INFWvavrNoo4MP8T
 HSn6TTGcDUaNDhGKlqWd8F1Rwa9jiYMO5TC+9KdVWLfHqAEwoxlzgV9qiaOX7smr
 /9RgnEISk2HotNleVAxnEVWvd1f/uQumDVuwPbLhLuZ//C12gnPoveyfkDBzCPtF
 3zpi+4ihR1JGx2kJYG/jYP7HUCpbeNHnFbASwyBtNvvPjKHG1MPKUdn0ojViMFA+
 TIgp/STXDT8/Bx9/AURXY+To4P3tSXEU3gRpHuUpngDTM1vQFYtA==
X-ME-Sender: <xms:4DmaWTBAiipRqz3X_k09VOWM93nkyjGCO2o4pSLTaPOnEFUritc-oQ>
X-Sasl-enc: tXltGEqZ+M9iSOjNdXedYuzKvmOmLOxwjXw3Qh2Ar/Fc 1503279583
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 203267FA6D;
 Sun, 20 Aug 2017 21:39:41 -0400 (EDT)
Message-ID: <1503279575.7266.2.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 1/2] hwmon: (ucd9000) Add gpio chip
 interface and clear logged faults
From: Andrew Jeffery <andrew@aj.id.au>
To: Matt Spinler <mspinler@linux.vnet.ibm.com>, Christopher Bostic
 <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Mon, 21 Aug 2017 11:09:35 +0930
In-Reply-To: <a9fa48ac-78df-3136-f881-299780e97bef@linux.vnet.ibm.com>
References: <20170818013526.35678-1-cbostic@linux.vnet.ibm.com>
 <20170818013526.35678-2-cbostic@linux.vnet.ibm.com>
 <1503035048.681.14.camel@aj.id.au>
 <a9fa48ac-78df-3136-f881-299780e97bef@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-6Juvmg5K49R5NdqsbpJb"
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
X-List-Received-Date: Mon, 21 Aug 2017 01:39:51 -0000


--=-6Juvmg5K49R5NdqsbpJb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

Thanks for clarifying your requirements. I have some comments inline below.

On Fri, 2017-08-18 at 09:35 -0500, Matt Spinler wrote:
> Hi Andrew,
>=C2=A0
> At this point, we just need a working driver so we can deliver the=C2=A0
> function.=C2=A0=C2=A0This is all I need:
>=C2=A0
> * read status_word
>=C2=A0
> * read mfr_status (though it isn't that useful because the pmbus core=C2=
=A0
> code that Chris had to start using sends a clear faults every second and=
=C2=A0
> clears out the edge triggered bits I'm interested in)

That's a valid complaint. At the moment pmbus_clear_faults() is driven by c=
alls
to pmbus_update_device() if the sensor value needs to be updated (values ar=
e
cached for a time-period by the core).

There's no timer that clears the faults, it's purely the accesses from
userspace. So if the accesses are ordered such that MFR_STATUS is read befo=
re
any sensors then you should not miss any edge-triggered faults.

However that's not to say that this behaviour is sane. Some work should be =
done
to figure out if we can avoid sending a CLEAR_FAULTS on every update.

>=C2=A0
> * read status_vout from each page
>=C2=A0
> * read the realtime GPI status using regs 0xFA and 0xFB for the 6 inputs=
=C2=A0
> that are wired on this system
>=C2=A0
> Chris's current code does all that, as did several of his previous=C2=A0
> versions, so I think we need the path of least resistance and just go=C2=
=A0
> with one of them.

I disagree on several fronts:

1. We've seen how frustrating userspace-breaking changes are with FSI and i=
t
follows (in my mind) that we'd want to minimise such problems going forward=
.
This driver has evolved from defining many new, non-standard ABIs in v1 and=
 v2
down to one in v3, which we're looking to get a blessing on from upstream. =
I
would be *very* surprised if v1 or v2 were accepted with no complaints by
upstream, and thus v3 is a big improvement over what we had (through minimi=
sing
new ABIs).

2. The implementation of v2 would have seriously disrupted the behaviour of=
 the
device or given incorrect values for queries of the GPIO state.

3. v3 makes many assumptions about how the device is programmed but documen=
ts
none of them. In light of that I can only review for the general case of
needing to put the device in the state required to read off the values you
need. Prior to your email the exact requirements on the implementation were=
 not
clear to me either. The flexibility and complexity of the UCD90160 means th=
is
is non-trivial, so either we implement the required functionality to achiev=
e
generality OR we heavily document the assumptions about how the device is
programmed so it's *obvious* to the reader why the implementation is hamstr=
ung
the way it is. The latter approach makes it unsuitable for sending upstream=
,
but at least it documents the path that should be followed before doing so.

Cheers,

Andrew

>=C2=A0
>=C2=A0
> On 8/18/2017 12:44 AM, Andrew Jeffery wrote:
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
> >=C2=A0
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
> > > >=C2=A0			ret);
> >=C2=A0
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
> >=C2=A0
> > > > > > > > +		return ret;
> > > > +	}
> > >=C2=A0
> > > +
> > > > +	return ret & UCD9000_GPIO_CONFIG_STATUS ? 1 : 0;
> >=C2=A0
> > We can avoid the branch with:
> >=C2=A0
> >=C2=A0	return !!(ret & UCD9000_GPIO_CONFIG_STATUS);
> >=C2=A0
> > Interestingly it's not clear from the datasheet whether the status bit =
contains
> > a relevant value when the pin is in output mode, as there's a separate =
bit (bit
> > 2) to set the value. Have you tested the behaviour?
> >=C2=A0
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
> >=C2=A0
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
> >=C2=A0
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
> >=C2=A0
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
> > > > > > > > +		return ret;
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
> >=C2=A0
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
> >=C2=A0
> > > > > > > > +	data->gpio.parent =3D &client->dev;
> > > > +	data->gpio.owner =3D THIS_MODULE;
> >=C2=A0
> > At some point we should think about pinconf as well (push-pull vs open-=
drain).
> >=C2=A0
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
--=-6Juvmg5K49R5NdqsbpJb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZmjnXAAoJEJ0dnzgO5LT5r8gP/3R25rq+jpWTuY4phccj8zhQ
nS2fw4lj2Qm6c+P/oEb+Mffu9hS+FVT9YGucHtiP+O2lgkTaZR/G+6VZd7+uuCM0
DrdLC9cwsRSq1PUIe7UICjpXDCot5kmtMxn7yTe1BU+cYs3bAsIno1SDKWJhPyiZ
b+OmoLZfNttpMt//HtipaZY0C06WCyYj79QdTa79eKygMosxK43Edv6p+o0AM+sH
rcJaa5x0SE2U9pTxdbNwhi4dCtC5YCoJAeDbygxEoV31Kr4ZCse6qNnvJOzMnaxf
OfJaydL6B2VezxNKVV/80gQs/6oVjQQr250BeSmyUac3RV54ba7qUmhITOs8KwS3
/LwGwdW99lEAJwVm8kFyTAHOaigfM/NPHRoDe1QDTHZSVMz+UFW7oHyw0fnUHiBz
lv6o9XjDjeRCtyV/P+cRVAQWo4/s/PsoMpSpmvmvjbXgjzi8UzmIEskU7qWmPp25
uko4MpAVjURG9rYXRt/xMD8o48NCymAWexzmAFmU8DsAZOEP6OXJ6dNAuNyAbbN5
FQto7LV8HjVGTriTrVR3oVngMRyJiVBbaTQ8lpsL5ZztHd6UOEZc9GCMk1OHgCKG
4sEoy/8cl9TJNTxAwcNmm3/RvaeVk6pp0blXpxuReZPd2hVvOD8tvHWK+In2F+gr
g/u95h7UThUPWuBtuK4i
=eqFb
-----END PGP SIGNATURE-----

--=-6Juvmg5K49R5NdqsbpJb--
