Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhsFx3ZHwzDqGG
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 13:59:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="YlRHZvBy"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="BhWRHDjs"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E90F920F86;
 Tue, 29 Aug 2017 23:59:30 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 29 Aug 2017 23:59:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=VeSjbmTES/ok49dDiDL6hUGE03BgAockMcC3Kayay
 5I=; b=YlRHZvBySWHwOKnozU4tsnZueW1oZZ96Inh0zmuzamBVLS1stKVqWVOiA
 rov4gOQKk8PrIewE7FI205lD9cSRHlgx2DWlfROya0nJZZUlEmBNTVnc04NgHk6V
 F3Xk4JVCnqkvh+X4zTSlGCF/HNJzSeWnLi2Qnu0fIDcMhWhGE4Nx8mFFncIe97R4
 zS4KgHJpvAYKU3iy4wsQC5udnj7bSsfErfU9WvTw+f2rcz5rK3zD2tgfdKeBIFNz
 tKUEvpjZl8tHOleMkivqSrxO2EpQIW+N0BaUuKYs4zIJmJNpoTlRgPXqek0mHlT9
 AbmXAox0KZdquRhEKC14ElDkUR4Qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=VeSjbmTES/ok49dDiD
 L6hUGE03BgAockMcC3Kayay5I=; b=BhWRHDjsxcOHymig3ucUFbhY4nlEH2CMAb
 8F0x1gMHbMJJI6ugFrbHhpPatMdEC0f7thF0VbdHbfRXjSgIoO7hW+NfK/M2Ktaa
 ZOoqu9OyLAOdhnhgNgr/e+T1+EZVnzVMjLc5vFv43xzzPCiVpnyfzS+k6d1PoxIf
 yaBRFJ/sIYDExfaL87/umta4O2gBYhDsHeZoDzXh/r49Lwm0nuZslxhIQ9b6H41r
 VfpOAip7h0OTK2+K2jtMg8Mxt1a4ra2fp14pe1Uc6RB8LLWMie3heBydQq/MgVmp
 wiBmySNHSNNyI9Tfi9LH3RR8yJ1veQKuzoBMbGRppMCRApfxdM3Q==
X-ME-Sender: <xms:IjimWRv7Hji-Mbp3NWckjrYuNIDanokS0tPjdEiuTMrrGS2RppD4JQ>
X-Sasl-enc: a7iXHyepl58ABLQHUhavskROVQUag+gPoI0F6qRlWCMy 1504065570
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id C25A524871;
 Tue, 29 Aug 2017 23:59:28 -0400 (EDT)
Message-ID: <1504065563.5933.18.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v5 2/2] hwmon: (ucd9000) Add debugfs for
 mfr_status info
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Wed, 30 Aug 2017 13:29:23 +0930
In-Reply-To: <20170829200813.66010-3-cbostic@linux.vnet.ibm.com>
References: <20170829200813.66010-1-cbostic@linux.vnet.ibm.com>
 <20170829200813.66010-3-cbostic@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-etJ+tVv0G1lRQG4U5+FE"
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
X-List-Received-Date: Wed, 30 Aug 2017 03:59:34 -0000


--=-etJ+tVv0G1lRQG4U5+FE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-08-29 at 15:08 -0500, Christopher Bostic wrote:
> Add debugfs to list mfr_status register and its gpiN_fault fields.
>=C2=A0
> > Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> v5 - Add unique debugfs dir ID for each ucd9000 sysfs device.
> =C2=A0=C2=A0=C2=A0- Change branching return to a !! method.
> =C2=A0=C2=A0=C2=A0- Clean up line breaks, other white space.
> =C2=A0=C2=A0=C2=A0- Add comments on assumptions made regarding ucd90160 v=
ersus other
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0types.
> v2 - Remove mfr_status directory in debugfs and place the files
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0up in the parent ucd9000 directory.
> ---
> =C2=A0drivers/hwmon/pmbus/ucd9000.c | 154 +++++++++++++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 154 insertions(+)
>=C2=A0
> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.=
c
> index cfd7703..edb026f 100644
> --- a/drivers/hwmon/pmbus/ucd9000.c
> +++ b/drivers/hwmon/pmbus/ucd9000.c
> @@ -19,6 +19,7 @@
> =C2=A0 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
> =C2=A0 */
> =C2=A0
> +#include <linux/debugfs.h>
> =C2=A0#include <linux/kernel.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/init.h>
> @@ -29,6 +30,7 @@
> =C2=A0#include <linux/sysfs.h>
> =C2=A0#include <linux/hwmon-sysfs.h>
> =C2=A0#include <linux/gpio.h>
> +#include <linux/idr.h>
> =C2=A0#include "pmbus.h"
> =C2=A0
> =C2=A0enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd909=
10 };
> @@ -38,6 +40,7 @@
> > =C2=A0#define UCD9000_FAN_CONFIG_INDEX	0xe7
> > =C2=A0#define UCD9000_FAN_CONFIG		0xe8
> > =C2=A0#define UCD9000_LOGGED_FAULTS		0xea
> > +#define UCD9000_MFR_STATUS		0xf3
> > =C2=A0#define UCD9000_GPIO_SELECT		0xfa
> > =C2=A0#define UCD9000_GPIO_CONFIG		0xfb
> > =C2=A0#define UCD9000_DEVICE_ID		0xfd
> @@ -59,17 +62,28 @@
> > =C2=A0#define UCD9000_MON_VOLTAGE_HW	4
> =C2=A0
> > =C2=A0#define UCD9000_NUM_FAN		4
> > +#define UCD9000_NAME_SIZE	24
> =C2=A0
> > =C2=A0#define UCD9000_GPIO_NAME_LEN	16
> > =C2=A0#define UCD90160_NUM_GPIOS	26
> > +#define UCD90160_GPI_COUNT	8
> > +#define UCD90160_GPI_FAULT_BASE	16
> +
> +static DEFINE_IDA(ucd9000_ida);
> =C2=A0
> =C2=A0struct ucd9000_data {
> > =C2=A0	u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_MAX];
> > =C2=A0	struct pmbus_driver_info info;
> > =C2=A0	struct gpio_chip gpio;
> > +	struct dentry *debugfs;
> =C2=A0};
> =C2=A0#define to_ucd9000_data(_info) container_of(_info, struct ucd9000_d=
ata, info)
> =C2=A0
> +struct ucd9000_debugfs_entry {
> > +	struct i2c_client *client;
> > +	u8 index;
> +};
> +
> =C2=A0static int ucd9000_get_fan_config(struct i2c_client *client, int fa=
n)
> =C2=A0{
> > =C2=A0	int fan_config =3D 0;
> @@ -297,6 +311,138 @@ static int ucd9000_gpio_direction_output(struct gpi=
o_chip *gc,
> > =C2=A0	return ucd9000_gpio_set_direction(gc, offset, UCD9000_GPIO_OUTPU=
T, val);
> =C2=A0}
> =C2=A0
> +static struct dentry *ucd9000_debugfs_dir;
> +
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +static int ucd9000_get_mfr_status(struct i2c_client *client, u32 *buffer=
)
> +{
> > +	int ret;
> +
> > +	ret =3D pmbus_set_page(client, 0);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "pmbus_set_page failed. rc:%d\n", ret);
> +
> > +		return ret;
> > +	}
> +
> > +	/*
> > +	=C2=A0* Warning:
> > +	=C2=A0*
> > +	=C2=A0* Though not currently supported this will cause stack corrupti=
on for
> > +	=C2=A0* ucd90240!=C2=A0=C2=A0Command reference, page 81:
> > +	=C2=A0*
> > +	=C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0With the ucd90120 and ucd90124 devices=
, this command [MFR_STATUS]
> > +	=C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0is 2 bytes long (bits 0-15).=C2=A0=C2=
=A0With the ucd90240 this command is 5
> > +	=C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0bytes long.=C2=A0=C2=A0With all other =
devices, it is 4 bytes long.
> +	=C2=A0*/

Hopefully it won't be missed :)

> +	return i2c_smbus_read_block_data(client, UCD9000_MFR_STATUS,
> > +					(u8 *)buffer);
> +}
> +
> +static int ucd9000_debugfs_get_mfr_status_bit(void *data, u64 *val)
> +{
> > +	struct ucd9000_debugfs_entry *entry =3D data;
> > +	struct i2c_client *client =3D entry->client;
> > +	int nr =3D entry->index;
> > +	u32 buffer;
> > +	int ret;
> +
> > +	ret =3D ucd9000_get_mfr_status(client, &buffer);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "Failed to read mfr status. rc:%d\n",
> > +			ret);
> +
> > +		return ret;
> > +	}
> +
> > +	*val =3D !!(ret & BIT(nr));
> +
> > +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(ucd9000_debugfs_ops_mfr_status_bit,
> > +		ucd9000_debugfs_get_mfr_status_bit, NULL, "%1lld\n");
> +
> +static int ucd9000_debugfs_get_mfr_status_word(void *data, u64 *val)
> +{
> > +	struct ucd9000_debugfs_entry *entry =3D data;
> > +	struct i2c_client *client =3D entry->client;
> > +	u32 buffer;
> > +	int ret;
> +
> > +	ret =3D ucd9000_get_mfr_status(client, &buffer);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "Failed to read mfr status. rc:%d\n",
> > +			ret);
> +
> > +		return ret;
> > +	}
> +
> > +	*val =3D ret;
> +
> > +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(ucd9000_debugfs_ops_mfr_status_word,
> > +		ucd9000_debugfs_get_mfr_status_word, NULL, "%08llx\n");
> +
> +static int ucd9000_init_debugfs(struct i2c_client *client,
> > +				struct ucd9000_data *data)
> +{
> > +	struct ucd9000_debugfs_entry *entries;
> > +	char name[UCD9000_NAME_SIZE];
> > +	int i;
> +
> > +	i =3D ida_simple_get(&ucd9000_ida, 0, INT_MAX, GFP_KERNEL);
> > +	scnprintf(name, UCD9000_NAME_SIZE, "ucd9000.%d", i);

Given it's debugfs it doesn't matter for the moment, but I do wonder whethe=
r we
should use the actual device name rather than the driver name here. Some th=
ing
to fix later.

> > +	ucd9000_debugfs_dir =3D debugfs_create_dir(name, NULL);
> > +	if (IS_ERR(ucd9000_debugfs_dir)) {
> > +		dev_warn(&client->dev, "Failed to create debugfs dir: %p\n",
> > +			ucd9000_debugfs_dir);
> > +		ucd9000_debugfs_dir =3D NULL;
> +
> > +		return 0;
> > +	}
> +
> > +	/*
> > +	=C2=A0* Warning:
> > +	=C2=A0*
> > +	=C2=A0* Makes assumption we're on a ucd90160 type! entries will be di=
fferent
> > +	=C2=A0* sizes for other types.
> > +	=C2=A0*/
> > +	entries =3D devm_kzalloc(&client->dev, sizeof(*entries) *
> > +				(UCD90160_GPI_COUNT + 1) * 10, GFP_KERNEL);
> > +	if (!entries)
> > +		return -ENOMEM;
> +
> > +	/*
> > +	=C2=A0* Warning:
> > +	=C2=A0*
> > +	=C2=A0* This makes the assumption we're probing a ucd90160 type and h=
ow the
> > +	=C2=A0* GPI information is organized.=C2=A0=C2=A0Needs to account for=
 all other
> > +	=C2=A0* ucd9000 varieties.
> > +	=C2=A0*/
> > +	for (i =3D 0; i < UCD90160_GPI_COUNT; i++) {
> > +		entries[i].client =3D client;
> > +		entries[i].index =3D UCD90160_GPI_FAULT_BASE + i;
> > +		scnprintf(name, UCD9000_NAME_SIZE, "gpi%d_alarm", i+1);
> > +		debugfs_create_file(name, 0444, ucd9000_debugfs_dir,
> > +				&entries[i],
> > +				&ucd9000_debugfs_ops_mfr_status_bit);
> > +	}
> > +	entries[i].client =3D client;
> > +	scnprintf(name, UCD9000_NAME_SIZE, "mfr_status");
> > +	debugfs_create_file(name, 0444, ucd9000_debugfs_dir, &entries[i],
> > +			&ucd9000_debugfs_ops_mfr_status_word);
> +
> > +	return 0;
> +}
> +#else
> +static int ucd9000_init_debugfs(struct i2c_client *client,
> > +				struct ucd9000_data *data)
> +{
> > +	return 0;
> +}
> +#endif /* IS_ENABLED(CONFIG_DEBUG_FS) */
> +
> =C2=A0static ssize_t ucd9000_clear_logged_faults(struct device *dev,
> > =C2=A0				struct device_attribute *attr, const char *buf,
> > =C2=A0				size_t count)
> @@ -467,12 +613,20 @@ static int ucd9000_probe(struct i2c_client *client,
> > =C2=A0		return ret;
> > =C2=A0	}
> =C2=A0
> > +	if (mid->driver_data =3D=3D ucd90160) {
> > +		ret =3D ucd9000_init_debugfs(client, data);
> > +		if (ret < 0)
> > +			dev_warn(&client->dev,
> > +				"Failed to register debugfs: %d\n", ret);
> > +	}
> +
> > =C2=A0	return=C2=A0=C2=A0pmbus_do_probe(client, mid, info);
> =C2=A0}
> =C2=A0
> =C2=A0static int ucd9000_remove(struct i2c_client *client)
> =C2=A0{
> > =C2=A0	sysfs_remove_group(&client->dev.kobj, &ucd9000_attr_group);
> > +	debugfs_remove_recursive(ucd9000_debugfs_dir);
> > =C2=A0	return pmbus_do_remove(client);
> =C2=A0}
> =C2=A0

Looks good.

Thanks,

Andrew
--=-etJ+tVv0G1lRQG4U5+FE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZpjgbAAoJEJ0dnzgO5LT5LJwP/08rvoS2NSi83HQ8DnCupckX
LkBYOiuu+QDMNFjH3sSrJU9Tl0Q3bi8VdYykSmIjGKLdtlEpjSskGsP8D5OPfcGw
d4xuLAARdc1LIViu7kxE4b82ALGvNwXc+5Mxnf/ufPdE0u84qkg0EAlLj+g6yNUB
E6S03rLEFFQsIQofZDa//vcREwTcjtite7p5qvRHKDyXP2dNq5LPbc0F7wTll+S0
WRFIuS4894oMkAdeMCQFGk7BC03chZ4dBW8yrPWLKKo9ASWPzGmvNs0iZG6bW83f
jASQ2tvyjh9HRSiamfLrQLqhkiJILtZ3lAOvhvJjx9Z39WchjV3VcF7IHDoN+ir/
j4SaXroPBa0G0uZQHwWP9z522o7wDQLU5taWVGDx2eQ9WKhNBLTlfrK0bBOj8+Ag
Xji6MTX2etnBiLuENpQj9TIiiszN3F0hxwGS1v2TswPB2zol32hxDGOZMAdHIgz0
0AjqhqWMw5kF+tyrIAVWQSIBvKYVf4Hlwx1tOSGnhP+ixmShzaqRi008ZOSFbmme
KaBv0qyAr9p2EBzt8gc1dl+k4o7HX++io5qD3/ND9abbrds3vyitGV2y+ehGFZ5y
nrbeO91qZnDrBSddbSE4wIKdYSUCjWI3Te+KabJTgYhYozKewnSGfR56AhMxPys2
40kXiUkc6QW11gliSvdO
=00Yi
-----END PGP SIGNATURE-----

--=-etJ+tVv0G1lRQG4U5+FE--
