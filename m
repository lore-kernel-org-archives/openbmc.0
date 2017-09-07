Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="EPPBjqqo"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="A2MF4spw"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnjHx68QfzDrSL
 for <openbmc@lists.ozlabs.org>; Thu,  7 Sep 2017 11:18:05 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3789020C10;
 Wed,  6 Sep 2017 21:18:03 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 06 Sep 2017 21:18:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=6Pb0qgHeny8nWGAzP1ekHfh/phbxBJKXZ6VYIcXxT
 gg=; b=EPPBjqqonAw4lG2/hRoFNZs4QhSCyuxGonuXxBBtZBhOm3HvSpWuOxasK
 tjiUTxBF1OHct0QCc1XeS1+t76lCZscJGQEipmrQXWyBcObFMOCgvbKBcoDgocsm
 9MnodsdNMLwoSWzsWVqpeAJ7qNkg8Ec4y5BVRGKefNJl4+7sdiwqrpBqfjcvzsrt
 7569TmuLZM8qQvs6xKFMBTG2NwaItdAMAGz8yUG6sthVHY0qsrBxRILu8vtlahgU
 YG9sIZoyIQkTnuEz99VZR/aTZYOfFyvo1vH/8GZFG4CFkeiPNO3W1Ryl+IM0iv6K
 6f4kz0a6USD3Hmyz+B0d5Sw9ylIOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=6Pb0qgHeny8nWGAzP1
 ekHfh/phbxBJKXZ6VYIcXxTgg=; b=A2MF4spww9D41SPMMyGZaXxHqUThw/b6SY
 7Yg6+lpSAjOAVvPGx4foJLL9GEL1ev4zBKmL8rGAYBMUHCPU42LxAXT43GnEjtRS
 B9EAGTZuydKMYhLxgohi2bnVor0okvI5Y2TaWVNoWkmRdnw9IEfxCWWds2l/+yB4
 Wa2ZhgPY3dIUsL1zHqZl7AykizJaZmstYFotYsyNpdrG029KaCR7iS21iJr9V9D1
 JgUUxf3wlwoT1m3ExL34Zmlr78M3B1vBPk4DqDg0vczt4LfnK4VvVZ1IVcHfG9Hq
 IgbjpK9X1Hj16B9CnhdIxGoWGzgnS0HOngDNb7WvO8RW7dJggfJQ==
X-ME-Sender: <xms:S56wWfWY-Wty-jLAURbC_Mevn9VmT0Fv6X7xj7Ex4xReC-kKrDhnLA>
X-Sasl-enc: plgW2yc1UTXEvy/hmPxkqS20LcdqGzRrC4prdDZG9h1L 1504747082
Received: from keelia (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7C47924A60;
 Wed,  6 Sep 2017 21:18:01 -0400 (EDT)
Message-ID: <1504747075.5105.2.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v7 2/2] hwmon: (ucd9000) Add debugfs to
 list mfr_status info
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Thu, 07 Sep 2017 11:17:55 +1000
In-Reply-To: <20170906210041.22533-3-cbostic@linux.vnet.ibm.com>
References: <20170906210041.22533-1-cbostic@linux.vnet.ibm.com>
 <20170906210041.22533-3-cbostic@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-K/F3yY/TXHSZmphcOeCA"
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
X-List-Received-Date: Thu, 07 Sep 2017 01:18:06 -0000


--=-K/F3yY/TXHSZmphcOeCA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-09-06 at 16:00 -0500, Christopher Bostic wrote:
> Expose via files in debugfs the gpiN_fault fields as well as
> the entire contents of the mfr_status register.=C2=A0=C2=A0Allows user
> space to pull this data for error logging etc...
>=C2=A0
> > Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> v7 - Patch order changed from #3 to #2 and as a result needed
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0to add the ucd9000_remove definition here.
> v6 - Remove chip idx values on remove so that we can retain the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0same indexes regardless how many times we'r=
e bound/unbound.
> =C2=A0=C2=A0=C2=A0- Remove type 90160 check when adding debugfs.
> v5 - Add unique debugfs dir ID for each ucd9000 sysfs device.
> =C2=A0=C2=A0=C2=A0- Change branching return to a !! method.
> =C2=A0=C2=A0=C2=A0- Clean up line breaks, other white space.
> =C2=A0=C2=A0=C2=A0- Add comments on assumptions made regarding ucd90160 v=
ersus other
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0types.
> v2 - Remove mfr_status directory in debugfs and place the files
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0up in the parent ucd9000 directory.
> ---
> =C2=A0drivers/hwmon/pmbus/ucd9000.c | 166 +++++++++++++++++++++++++++++++=
++++++++++-
> =C2=A01 file changed, 165 insertions(+), 1 deletion(-)
>=C2=A0
> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.=
c
> index 9a82e88..26870e6 100644
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
> @@ -27,6 +28,7 @@
> =C2=A0#include <linux/i2c.h>
> =C2=A0#include <linux/i2c/pmbus.h>
> =C2=A0#include <linux/gpio.h>
> +#include <linux/idr.h>
> =C2=A0#include "pmbus.h"
> =C2=A0
> =C2=A0enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd909=
10 };
> @@ -35,6 +37,7 @@
> =C2=A0#define UCD9000_NUM_PAGES		0xd6
> =C2=A0#define UCD9000_FAN_CONFIG_INDEX	0xe7
> =C2=A0#define UCD9000_FAN_CONFIG		0xe8
> +#define UCD9000_MFR_STATUS		0xf3
> =C2=A0#define UCD9000_GPIO_SELECT		0xfa
> =C2=A0#define UCD9000_GPIO_CONFIG		0xfb
> =C2=A0#define UCD9000_DEVICE_ID		0xfd
> @@ -56,17 +59,29 @@
> =C2=A0#define UCD9000_MON_VOLTAGE_HW	4
> =C2=A0
> =C2=A0#define UCD9000_NUM_FAN		4
> +#define UCD9000_NAME_SIZE	24
> =C2=A0
> =C2=A0#define UCD9000_GPIO_NAME_LEN	16
> =C2=A0#define UCD90160_NUM_GPIOS	26
> +#define UCD90160_GPI_COUNT	8
> +#define UCD90160_GPI_FAULT_BASE	16
> +
> +static DEFINE_IDA(ucd9000_ida);
> =C2=A0
> =C2=A0struct ucd9000_data {
> =C2=A0	u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_MAX];
> =C2=A0	struct pmbus_driver_info info;
> =C2=A0	struct gpio_chip gpio;
> +	struct dentry *debugfs;
> +	int idx;
> =C2=A0};
> =C2=A0#define to_ucd9000_data(_info) container_of(_info, struct ucd9000_d=
ata, info)
> =C2=A0
> +struct ucd9000_debugfs_entry {
> +	struct i2c_client *client;
> +	u8 index;
> +};
> +
> =C2=A0static int ucd9000_get_fan_config(struct i2c_client *client, int fa=
n)
> =C2=A0{
> =C2=A0	int fan_config =3D 0;
> @@ -294,6 +309,141 @@ static int ucd9000_gpio_direction_output(struct gpi=
o_chip *gc,
> =C2=A0	return ucd9000_gpio_set_direction(gc, offset, UCD9000_GPIO_OUTPUT,=
 val);
> =C2=A0}
> =C2=A0
> +static struct dentry *ucd9000_debugfs_dir;

I thought we were fixing this up?

> +
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +static int ucd9000_get_mfr_status(struct i2c_client *client, u32 *buffer=
)
> +{
> +	int ret;
> +
> +	ret =3D pmbus_set_page(client, 0);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "pmbus_set_page failed. rc:%d\n", ret);
> +
> +		return ret;
> +	}
> +
> +	/*
> +	=C2=A0* Warning:
> +	=C2=A0*
> +	=C2=A0* Though not currently supported this will cause stack corruption=
 for
> +	=C2=A0* ucd90240!=C2=A0=C2=A0Command reference, page 81:
> +	=C2=A0*
> +	=C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0With the ucd90120 and ucd90124 devices, =
this command [MFR_STATUS]
> +	=C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0is 2 bytes long (bits 0-15).=C2=A0=C2=A0=
With the ucd90240 this command is 5
> +	=C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0bytes long.=C2=A0=C2=A0With all other de=
vices, it is 4 bytes long.
> +	=C2=A0*/
> +	return i2c_smbus_read_block_data(client, UCD9000_MFR_STATUS,
> +					(u8 *)buffer);
> +}
> +
> +static int ucd9000_debugfs_get_mfr_status_bit(void *data, u64 *val)
> +{
> +	struct ucd9000_debugfs_entry *entry =3D data;
> +	struct i2c_client *client =3D entry->client;
> +	int nr =3D entry->index;
> +	u32 buffer;
> +	int ret;
> +
> +	ret =3D ucd9000_get_mfr_status(client, &buffer);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Failed to read mfr status. rc:%d\n",
> +			ret);
> +
> +		return ret;
> +	}
> +
> +	*val =3D !!(ret & BIT(nr));
> +
> +	return 0;
> +}
> +
> +DEFINE_DEBUGFS_ATTRIBUTE(ucd9000_debugfs_ops_mfr_status_bit,
> +		ucd9000_debugfs_get_mfr_status_bit, NULL, "%1lld\n");
> +
> +static int ucd9000_debugfs_get_mfr_status_word(void *data, u64 *val)
> +{
> +	struct ucd9000_debugfs_entry *entry =3D data;
> +	struct i2c_client *client =3D entry->client;
> +	u32 buffer;
> +	int ret;
> +
> +	ret =3D ucd9000_get_mfr_status(client, &buffer);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Failed to read mfr status. rc:%d\n",
> +			ret);
> +
> +		return ret;
> +	}
> +
> +	*val =3D ret;
> +
> +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(ucd9000_debugfs_ops_mfr_status_word,
> +		ucd9000_debugfs_get_mfr_status_word, NULL, "%08llx\n");
> +
> +static int ucd9000_init_debugfs(struct i2c_client *client,
> +				struct ucd9000_data *data)
> +{
> +	struct ucd9000_debugfs_entry *entries;
> +	char name[UCD9000_NAME_SIZE];
> +	int i;
> +
> +	data->idx =3D ida_simple_get(&ucd9000_ida, 0, INT_MAX, GFP_KERNEL);
> +	scnprintf(name, UCD9000_NAME_SIZE, "ucd9000.%d", data->idx);
> +	ucd9000_debugfs_dir =3D debugfs_create_dir(name, NULL);

We should be storing the dentry in the context struct. We're now uniquely
naming the directory, but we're still storing the dentry in static storage.=
 The
code as it stands will still stomp over the top of existing devices on prob=
e,
and it cannot be cleaned up properly. In fact, we'll cleanup the wrong entr=
y
depending on the order of probe/remove across the devices. It's not just fi=
xed
by uniquely naming the directory.

Andrew

> +	if (IS_ERR(ucd9000_debugfs_dir)) {
> +		dev_warn(&client->dev, "Failed to create debugfs dir: %p\n",
> +			ucd9000_debugfs_dir);
> +		ucd9000_debugfs_dir =3D NULL;
> +		ida_simple_remove(&ucd9000_ida, data->idx);
> +		return 0;
> +	}
> +
> +	/*
> +	=C2=A0* Warning:
> +	=C2=A0*
> +	=C2=A0* Makes assumption we're on a ucd90160 type! entries will be diff=
erent
> +	=C2=A0* sizes for other types.
> +	=C2=A0*/
> +	entries =3D devm_kzalloc(&client->dev, sizeof(*entries) *
> +				(UCD90160_GPI_COUNT + 1) * 10, GFP_KERNEL);
> +	if (!entries) {
> +		ida_simple_remove(&ucd9000_ida, data->idx);
> +		return -ENOMEM;
> +	}
> +
> +	/*
> +	=C2=A0* Warning:
> +	=C2=A0*
> +	=C2=A0* This makes the assumption we're probing a ucd90160 type and how=
 the
> +	=C2=A0* GPI information is organized.=C2=A0=C2=A0Needs to account for a=
ll other
> +	=C2=A0* ucd9000 varieties.
> +	=C2=A0*/
> +	for (i =3D 0; i < UCD90160_GPI_COUNT; i++) {
> +		entries[i].client =3D client;
> +		entries[i].index =3D UCD90160_GPI_FAULT_BASE + i;
> +		scnprintf(name, UCD9000_NAME_SIZE, "gpi%d_alarm", i+1);
> +		debugfs_create_file(name, 0444, ucd9000_debugfs_dir,
> +				&entries[i],
> +				&ucd9000_debugfs_ops_mfr_status_bit);
> +	}
> +	entries[i].client =3D client;
> +	scnprintf(name, UCD9000_NAME_SIZE, "mfr_status");
> +	debugfs_create_file(name, 0444, ucd9000_debugfs_dir, &entries[i],
> +			&ucd9000_debugfs_ops_mfr_status_word);
> +
> +	return 0;
> +}
> +#else
> +static int ucd9000_init_debugfs(struct i2c_client *client,
> +				struct ucd9000_data *data)
> +{
> +	return 0;
> +}
> +#endif /* IS_ENABLED(CONFIG_DEBUG_FS) */
> +
> =C2=A0static int ucd9000_probe(struct i2c_client *client,
> =C2=A0			=C2=A0const struct i2c_device_id *id)
> =C2=A0{
> @@ -433,16 +583,30 @@ static int ucd9000_probe(struct i2c_client *client,
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> +	ret =3D ucd9000_init_debugfs(client, data);
> +	if (ret < 0)
> +		dev_warn(&client->dev, "Failed to register debugfs: %d\n", ret);
> +
> =C2=A0	return pmbus_do_probe(client, mid, info);
> =C2=A0}
> =C2=A0
> +static int ucd9000_remove(struct i2c_client *client)
> +{
> +	struct ucd9000_data *data
> +		=3D to_ucd9000_data(pmbus_get_driver_info(client));
> +
> +	ida_simple_remove(&ucd9000_ida, data->idx);
> +	debugfs_remove_recursive(ucd9000_debugfs_dir);
> +	return pmbus_do_remove(client);
> +}
> +
> =C2=A0/* This is the driver that will be inserted */
> =C2=A0static struct i2c_driver ucd9000_driver =3D {
> =C2=A0	.driver =3D {
> =C2=A0		.name =3D "ucd9000",
> =C2=A0	},
> =C2=A0	.probe =3D ucd9000_probe,
> -	.remove =3D pmbus_do_remove,
> +	.remove =3D ucd9000_remove,
> =C2=A0	.id_table =3D ucd9000_id,
> =C2=A0};
> =C2=A0
--=-K/F3yY/TXHSZmphcOeCA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZsJ5DAAoJEJ0dnzgO5LT5qq4QAKBkuahUN6JWjoDarePTKCts
pX0fRcs5XWYOZVsvdwcL75aywlYVO6EVOwbThfrkXLMw3Me+gJRnw+8PXYBsKwQ6
KN/5x2dbxfTQ8HxQgVx4aeimTc6jJB9b/j1In+kzcrYyxRdeqfSODzV49FgPkWUv
rfNYRp9i8OVNsCeHF3BrSm+FwVUP0gmr94NLK5vwvJWSr+rOB06ZYkwJS1g2lq3M
hblt9O7gYgSLYoLIWr5faDq8cFYNMP9k97qUVvQ+NG2X+PQ+t/zgDkWbAl6vYVLo
Ke9vAwqY6Bv2zWzX2jEZ3+b1x/l2gQKNubzaVI7dXI3Q0go/KVMt4EPdtrUhpsj0
bXSiRTWjRLPMrF1GZ0AaKAQ3MRndzK9/tHq6vJxjW/Z3ycr1JcJtxJ+mQrmm2225
Dt50TZDhbFLRlH3YMQfrc2w17ierYNTqTDW3lUJjmxmv5CiXWOxG+OZaII9Bnj+a
6dkhPsChg8LhfScF2EXLHhUsleG+QZvbbkzMS9MpbzmeRvputkwXuIDgi390GalB
juBEB1vAu5hWKywN/FMGj6VpbsTVi4REoGxu2J5A2rfeVmjjQ7A3Uo1Oi126BEdT
vE5gNcfd8iWUHIDXSEtOLrIanfVGDoAB1qOj4q69ltBy000Dku7jXrF7FSV/9xJk
DuXuNlO26cMxDhjWyRXe
=sx3F
-----END PGP SIGNATURE-----

--=-K/F3yY/TXHSZmphcOeCA--
