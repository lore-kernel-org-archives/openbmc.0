Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xdzkP5TspzDrHC
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 21:40:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="C53CtKZq"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="jX+25cyd"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2F77B20DD5;
 Fri, 25 Aug 2017 07:40:43 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 25 Aug 2017 07:40:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=bLihhFsCfAAelOEu9HPImb010GgxDhWxPbbzG+qfj
 Pc=; b=C53CtKZq16fUoPJABZTVnuhrOByE7InA6ymsnUD6VxWrAtRfinEJOXvxW
 u0+xY7yBCHygKVFi0J0Cug3htnh4OeV7JbJzCzSDLCtjaDqtm7CppyCIK+dYoDDj
 KWTBvCB/r77lpEUplRVZQMNqb6TqhyOXSfWQHHcODwWbHkw/C66FQmRRqOvNpJgz
 Y5omEL8EsmJNrFhboGN15xFOEdKmZW89rSEBcldvsMatXELEhoraovmAdst/b/lw
 G1kdjZo+bYFNRLyH4G9/RirEbPnbT4gzBNrSeRf8DHLmJl+R+y8exX/bo+t1qy3N
 S4duTpj0hwrpPY6lOfh1ha3eawjEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=bLihhFsCfAAelOEu9H
 PImb010GgxDhWxPbbzG+qfjPc=; b=jX+25cydIcTUQWHDn7aQ7A0JfvsROSRIDO
 J090nLR9V9jow7C8JoeRziDymr/w40y9j8XnFzKVGYVWOGVO3aOSkEFvxTjNy8G+
 cQ/dBN1Ny7Yw1W3lPa6ZHOVBJ18J3OoiqQgOZKpyoKz5s3uV8vAG4nLoHw5zUXRy
 funYSrhkYCh0KpEsEAswQTKGbI6H+FbDb6Qw1Z8NKwvxknfE4tkwK4AYdlz3nbH8
 f0xWlex1zqptpnMiv6xyaJZJWJ1nuzZsdBnrNxtpkQo3oJB6WE1vjAdySSxEW5PC
 OkyxvxQn3dblS61DOaLfBZRmb9rPDW/TNoCyfONMgZXjdp0qxxkA==
X-ME-Sender: <xms:uwygWSANUuu26KI5YdzpaIMkq3MCNOKkWGTG9MoCOLeaddkc8KnYyg>
X-Sasl-enc: d2/F8PL/LksD/hfe2V621Ib0DMBzEBF5dN5BmSeqWQMB 1503661242
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5722E7FA08;
 Fri, 25 Aug 2017 07:40:41 -0400 (EDT)
Message-ID: <1503661234.32695.5.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v4 1/2] hwmon: (ucd9000) Add gpio chip
 interface and clear logged faults
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Fri, 25 Aug 2017 21:10:34 +0930
In-Reply-To: <9243474d-d62f-3f36-d7e1-f7d37ad35f75@linux.vnet.ibm.com>
References: <20170821220946.85617-1-cbostic@linux.vnet.ibm.com>
 <20170821220946.85617-2-cbostic@linux.vnet.ibm.com>
 <1503367256.7266.17.camel@aj.id.au>
 <9243474d-d62f-3f36-d7e1-f7d37ad35f75@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-hfH0KlGHc9Vz6PFtvozt"
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
X-List-Received-Date: Fri, 25 Aug 2017 11:40:47 -0000


--=-hfH0KlGHc9Vz6PFtvozt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-08-24 at 13:45 -0500, Christopher Bostic wrote:
>=C2=A0
> On 8/21/17 9:00 PM, Andrew Jeffery wrote:
> > Hi Chris,
> >=C2=A0
> > On Mon, 2017-08-21 at 17:09 -0500, Christopher Bostic wrote:
> > > Add a struct gpio_chip and define some methods so that this device's
> > > I/O can be accessed via /sys/class/gpio.
> > > =C2=A0=C2=A0
> > > Present requirements only call for retrieving current state of pin
> > > values and their direction.=C2=A0=C2=A0No requirement at this time to=
 switch
> > > modes between output and input within the device driver.
> > > =C2=A0=C2=A0
> > > Add capability to clear logged faults via sysfs.
> > > =C2=A0=C2=A0
> > > > Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> > >=C2=A0
> > > ---
> > > v4 - Change status check from branch to a !! non branching method
> > > =C2=A0=C2=A0=C2=A0=C2=A0- Remove usage comments on libgpiod for the s=
truct gpio_chip
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0methods.
> > > =C2=A0=C2=A0=C2=A0=C2=A0- Clean up some text formatting.
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
> > > =C2=A0 drivers/hwmon/pmbus/ucd9000.c | 128 ++++++++++++++++++++++++++=
+++++++++++++++-
> > > =C2=A0 1 file changed, 126 insertions(+), 2 deletions(-)
> > > =C2=A0=C2=A0
> > > diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9=
000.c
> > > index 3e3aa95..5cea5f6 100644
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
> > >=C2=A0
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
> > > @@ -119,6 +133,87 @@ static int ucd9000_read_byte_data(struct i2c_cli=
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
> > > > > > > > +		dev_err(&client->dev, "Failed to select GPIO %d: %d\n", =
offset,
> > > > > > > > +			ret);
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
> > > > > > > > +		dev_err(&client->dev, "failed to read GPIO config\n");
> > > > > > > > +		return ret;
> > > > +	}
> > >=C2=A0
> > > +
> > > > +	return !!(ret & UCD9000_GPIO_CONFIG_STATUS);
> >=C2=A0
> > I see you've fixed this case, but didn't audit the rest of the code to =
fix the
> > remainder. For example the return statement in ucd9000_gpio_get_directi=
on()
> > still branches. Similarly there are error messages that don't report th=
e error
> > return value*, and unnecessary line breaks in in dev_err() calls. In th=
e future,
> > can you please audit your code for classes of problems that are identif=
ied in
> > review? I'd hate to have to comment on literally every instance to get =
them all
> > fixed, as that feels like a waste of my time and a bit patronising towa=
rds you.
> >=C2=A0
> > * Where and when we do this needs some judgement with respect to taste,=
 but it
> > =C2=A0=C2=A0=C2=A0certainly frustrates me when I'm reading logs and I s=
ee vague messages like
> > =C2=A0=C2=A0=C2=A0"Failed". What failed? Why?
>=C2=A0
> Hi Andrew,
>=C2=A0
> OK, I'll be sure to be more thorough with respect to auditing as you=C2=
=A0
> suggest and will address these items for next version.

Thanks.

>=C2=A0
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
> > > +static int ucd9000_gpio_direction_input(struct gpio_chip *gc,
> > > > +					unsigned int offset)
> > >=C2=A0
> > > +{
> > > > +	return 0;
> >=C2=A0
> > In your reply to my comments on v3 you said you'd implement the directi=
on
> > switching, but this is still unimplemented. What happened?
>=C2=A0
> Based on discussions in our meeting that followed my replies we had=C2=A0
> decided to only implement what was required for our implementation (non=
=C2=A0
> upstream OpenBMC).=C2=A0=C2=A0Direction checks weren't added as a result.=
=C2=A0=C2=A0For=C2=A0
> next pass I will add them.

Right; that wasn't my understanding, or at least not what I intended to con=
vey.
We've spent more time discussing whether to implement it than it should tak=
e to
do. Implementing it removes a pretty large assumption in the code so I thin=
k it
is worthwhile.

>=C2=A0
> > Also I spent some
> > time discussing documentation of assumptions in my reply to Matt, but t=
hat
> > seems to not be addressed either. Why is that?
>=C2=A0
> Some basic notes on assumptions were added to the patch set cover=C2=A0
> letter.=C2=A0=C2=A0I hadn't understood this was to be commented within th=
e code.=C2=A0=C2=A0
> I'll do that for next version.

Thanks. Explicitly documenting the assumptions in the code will help when w=
e
get around to improving it to the point we can send it upstream.

> > Did you look at a bare-bones pinctrl implementation so we can describe =
the GPIO
> > ranges appropriately? If you did and it was too much effort then it wou=
ld be
> > nice to know that, and why.
>=C2=A0
> I haven't looked into pinctrl implementation in very much depth yet.=C2=
=A0=C2=A0=C2=A0
> I'd like to implement what the user requires for now and phase pinctrl=C2=
=A0
> in later.=C2=A0=C2=A0It might be trivial but regardless of that fact ther=
e will, I=C2=A0
> assume, be some refining of any implementation requiring further=C2=A0
> revisions/time.

Yeah, this was always a stretch request. However, like the direction issues
above, it would eliminate some pretty hefty assumptions from the code.

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
> > Joel requested the patch be sent upstream to get a decision from the
> > maintainers on this new ABI, and I suggested to you yesterday that it s=
hould
> > probably be split out to address ABI changes separate to the GPIO probl=
em, but
> > neither appear to have been done. Why was that?
>=C2=A0
> I have done the separate ABI changes but was interrupted by other=C2=A0
> unrelated high priority work before I could send out to maintainers.=C2=
=A0=C2=A0It=C2=A0
> is on its way, I have not forgotten.

Great. Thanks.

Andrew
--=-hfH0KlGHc9Vz6PFtvozt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZoAyyAAoJEJ0dnzgO5LT5BnAP/3EwiVMHr93zbk5aR9QFpYV3
aB+tg8Bf1RrqEFBnYE2cbK9FJxnj6E90aak9aIyxiC7HeezIPVCt4EPvnmfOTEo/
H89iGm3Vh8a7cMSV1iGgG0j52tOt1l5emvlknt91+F5ysXhmWtselxhm2AlZ27H5
KLoNf1gE6uDcW1bj+DbAuIoE/A5jOYOMmITNw2vDXNbdAOURc5Fp9hkPZ87YvC/N
Z/jX0NTBQ07JtmEAWcLSoCj3+G3GSLHnggUBL0H/43WXaqab+kgtt2AXk6ULNnlx
IefzoHs5s7cMMaFAJlAQ+xYZs2KpQc4X3p7OYHC8YhGrU4oFflXz+FaayfLxx34R
w5PgwM2RCA+RH59OhZG1Yc4s3K5aS0C9RnXzzqjnm/D2ltVcVs/rUFY2AndgkY+9
fpCeax3HCBwVO1l+MPJIGi3rjGM++8UsYcff7mRd/iV8wP6O/ftrlz78A5isjRKX
UniA+IF9OQU3v7+103p3M7+GKbgAwZf/y0ru8mJFpf+eKWF2wJJWjTbBD8qCIU0k
qxHe3ceegeCAqUQfEbmsqUstqDUmxWC6X7euyFHPDd0hMMTLVC8TrExyBO0Q6UwU
lnXChWQm4fHheNfsG2g2BNNi0A2GvMD7citDZYj5Med0VJfAKh4ykqMRmNvO0UQ7
J66SzayooajmtGY+jroi
=BYVd
-----END PGP SIGNATURE-----

--=-hfH0KlGHc9Vz6PFtvozt--
