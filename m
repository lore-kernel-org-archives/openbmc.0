Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wf4hl5KD3zDqKm
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 10:24:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JXztusOu"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="YTY1DOku"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5E75D206E9;
 Thu,  1 Jun 2017 20:24:20 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 01 Jun 2017 20:24:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=+fNy/KsAw2EKq2FKBMFe2QQSP94Lcyw2/tPKId0ne
 Pg=; b=JXztusOuHdYc6Vlp+WKNrdSfbLalHaIR9BRJq1sSjC5L2MlBZi5QeLspM
 XkXilWX6CRJq5nRrEqcZqhaNNUKa+Z80/DuNhSrQ8nCTjaHzXy340U2WgWFPoBpd
 se/kOTvuRxbVeroOQPDHBpbxplKgHzukAqyuSNaNwaOCETDv6VUvh01kMt3enhKE
 4zStYIdV3MxHKHZEu31nAmPJo65/dJhHeKIihwm1YCQtnGTdTNMSYOeDBWwkEaTW
 9wIcSdUGG7fiqr+mh9JdkiWOk7/NQJZPycY2W8uyLB/QW7YR/Sz3zkg8EivqUquy
 UlW5m05m8e2zfOCs36Aqi27t6vPjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=+fNy/KsAw2EKq2FKBM
 Fe2QQSP94Lcyw2/tPKId0nePg=; b=YTY1DOku6j8zjwK22cmSoj/mDoPDc6UdrB
 RyjtA+aMvTOWZLT4nxxty3o2ToauDnE0EPY+9wKhxLaNaNoPDhllItXgNpuEtlb0
 wvpYmIaL3ACEtxUef1w2S7ZQWWVZEwCuoIxBJNxTkzfwIwvbWQyWsdBxQle4w0wG
 BoltaXfKvk0A57o4BsKRJbOa3wMpA/B3lk/P9W6cXykvnIRoEYOsuIX83ePd0zHi
 oDK+gcd85X5D6op/yJZNArkILRipm1BdLdfw8TyEbgiQVK1kq6JEMfex4JQ4X0sh
 LXb/MeVt+IzVKrMlLu3sddcQo9nj0Dl34YiPUVhOKHUAA1c6md6Q==
X-ME-Sender: <xms:NLAwWQIiXMAUu53snJEBF8_0caEHwKGH43W4V2mQ4Gy4hRWYVMNAjA>
X-Sasl-enc: YFhgDdLoOdC4gW7Tmhqa5NMlopzGatC1WFpMPwsgbBpJ 1496363059
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id B94F27E263;
 Thu,  1 Jun 2017 20:24:18 -0400 (EDT)
Message-ID: <1496363052.8159.14.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] drivers/hwmon: MAX31785 Provide config
 of fault pin bevavior
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Fri, 02 Jun 2017 09:54:12 +0930
In-Reply-To: <20170601200644.56311-1-cbostic@linux.vnet.ibm.com>
References: <20170601200644.56311-1-cbostic@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-kq62FlTIUHpeMOucsOgN"
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
X-List-Received-Date: Fri, 02 Jun 2017 00:24:26 -0000


--=-kq62FlTIUHpeMOucsOgN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-06-01 at 15:06 -0500, Christopher Bostic wrote:
> Provide interface to set behavior when FAULT pin is asserted.
> When enabled force fan to 100% PWM duty cycle.
>=20

I'll apply this on top of my rework of the driver and send both later
today.

Cheers,

Andrew

> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> =C2=A0drivers/hwmon/max31785.c | 70 +++++++++++++++++++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 70 insertions(+)
>=20
> diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
> index fb7b3f0..9b42ce5 100644
> --- a/drivers/hwmon/max31785.c
> +++ b/drivers/hwmon/max31785.c
> @@ -37,6 +37,7 @@
> > =C2=A0#define MAX31785_REG_FAN_SPEED_1		0x90
> > =C2=A0#define MAX31785_REG_MFR_ID			0x99
> > =C2=A0#define MAX31785_REG_MFR_MODEL			0x9a
> > +#define MAX31785_REG_MFR_FAULT_RESP		0xd9
> > =C2=A0#define MAX31785_REG_MFR_FAN_CONFIG		0xf1
> > =C2=A0#define MAX31785_REG_READ_FAN_PWM		0xf3
> =C2=A0
> @@ -50,6 +51,9 @@
> =C2=A0/* Fan Status register bits */
> > =C2=A0#define MAX31785_FAN_STATUS_FAULT_MASK		0x80
> =C2=A0
> +/* Fault response register bits */
> > +#define MAX31785_FAULT_RESP_PIN_MONITOR		0x01
> +
> =C2=A0/* Fan Command constants */
> > =C2=A0#define MAX31785_FAN_COMMAND_PWM_RATIO		40
> =C2=A0
> @@ -657,6 +661,68 @@ static int max31785_detect(struct i2c_client *client=
,
> > =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static ssize_t fault_resp_store(struct device *dev,
> > +				struct device_attribute *attr, const char *buf,
> > +				size_t count)
> +{
> > +	struct i2c_client *client =3D to_i2c_client(dev);
> > +	int rv;
> +
> > +	rv =3D max31785_set_page(client, 0);
> > +	if (rv < 0)
> > +		return rv;
> +
> > +	rv =3D i2c_smbus_read_byte_data(client, MAX31785_REG_MFR_FAULT_RESP);
> > +	if (rv < 0)
> > +		return rv;
> +
> > +	if (!strncmp(buf, "on", strlen("on"))) {
> > +		if (!(rv & MAX31785_FAULT_RESP_PIN_MONITOR)) {
> > +			rv |=3D MAX31785_FAULT_RESP_PIN_MONITOR;
> > +			rv =3D i2c_smbus_write_byte_data(client,
> > +					MAX31785_REG_MFR_FAULT_RESP, rv);
> > +			if (rv < 0)
> > +				return rv;
> > +		}
> > +	} else if (!strncmp(buf, "off", strlen("off"))) {
> > +		if (rv & MAX31785_FAULT_RESP_PIN_MONITOR) {
> > +			rv &=3D ~MAX31785_FAULT_RESP_PIN_MONITOR;
> > +			rv =3D i2c_smbus_write_byte_data(client,
> > +					MAX31785_REG_MFR_FAULT_RESP, rv);
> > +			if (rv < 0)
> > +				return rv;
> > +		}
> > +	} else {
> > +		dev_warn(dev, "Unknown fault response type: [%s]\n", buf);
> > +		return -EINVAL;
> > +	}
> > +	return count;
> +}
> +
> +static ssize_t fault_resp_show(struct device *dev,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *=
attr, char *buf)
> +{
> > +	struct i2c_client *client =3D to_i2c_client(dev);
> > +	int rv;
> +
> > +	rv =3D max31785_set_page(client, 0);
> > +	if (rv < 0)
> > +		return rv;
> +
> > +	rv =3D i2c_smbus_read_byte_data(client, MAX31785_REG_MFR_FAULT_RESP);
> > +	if (rv < 0)
> > +		return rv;
> +
> > +	if (rv & MAX31785_FAULT_RESP_PIN_MONITOR)
> > +		rv =3D sprintf(buf, "on\n");
> > +	else
> > +		rv =3D sprintf(buf, "off\n");
> +
> > +	return rv;
> +}
> +
> +static DEVICE_ATTR(fault_resp, 0644, fault_resp_show, fault_resp_store);
> +
> =C2=A0static int max31785_probe(struct i2c_client *client,
> > =C2=A0			=C2=A0=C2=A0const struct i2c_device_id *id)
> =C2=A0{
> @@ -684,6 +750,10 @@ static int max31785_probe(struct i2c_client *client,
> > =C2=A0	if (err)
> > =C2=A0		return err;
> =C2=A0
> > +	err =3D device_create_file(dev, &dev_attr_fault_resp);
> > +	if (err)
> > +		return err;
> +
> > =C2=A0	hwmon_dev =3D devm_hwmon_device_register_with_groups(dev,
> > =C2=A0			client->name, data, max31785_groups);
> =C2=A0
--=-kq62FlTIUHpeMOucsOgN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZMLAtAAoJEJ0dnzgO5LT5K2cP/RAIUOdFx+srceLOdT1H54Kl
30O0lljCebEm9s/7Mjk0mQ+FZTH1N+qwxa/858MSFHTLyaH1UMLSZ5I7nL9c1Ui8
JSPH7T5515LSdcy0tTQqRZk/Z8KLw1qRoy017UcOv1NhE+z/t7MGCxBMwqMSEFWI
LDhb/RsryeKeeBZhxT1AkVB3se2u8BysLs1jRABo9F5NiKp2Kmq2S9JKVuPfVO9d
cajrkPJ1mwzH/kEoU/QKR6+wPozpGTcRRJzhtJbYj2kjlAr6C+sweP+aclZMX0rl
7JroLGeINONS2OzHUpLeppDiStuR5QktJ2N/4ndFfR4jAUvda8d1IgxZy45SWJGO
j7x+uN/xOPTl1Rw0DkU9zHhSqhov6RdrWAdglkiS8rltvqOw9432cLo9CQ4aYkO7
FjCEoCoMd+LW3xf01CyluSNbRODqzbJ7XtvlxUNejqAWgrL/QY8wtDCuIgk0hrAL
UYQFXWcj+AQ0l6jQX3vtvG1gna9RsybYfV5YXNd1B6AbBLy9z0B/G8ljj9uhyfYY
RDH3KSo/OARl/uQEhzV82A3/09LE92mtbArVy9Rymy4UfWX6ou+79tKiUpyigR8D
KY6nokdTW/zd4bPAwdkggewK/yBayvpfFnXEIQavrrWKVJv4Xc8D1XmjZ9hf5HgA
UOKuAG17Jw2XdDlQkLRo
=PyA0
-----END PGP SIGNATURE-----

--=-kq62FlTIUHpeMOucsOgN--
