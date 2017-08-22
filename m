Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xbv1M1XPZzDqXr
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 12:01:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="C4yXsHPI"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ddz8T8c0"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8DFC22143A;
 Mon, 21 Aug 2017 22:01:24 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 21 Aug 2017 22:01:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=zWHFTfPHwkVTtfd/Eq05GpjwFGBLakOYR84kHi4Us
 RQ=; b=C4yXsHPIoxgrsrmPa6N4S7GBYLF3LuNdpHuwrY37wMuZ1bifMAmamYQ9i
 ZgTGEUWPvT8/h7H+19GIAov7L5KJC2R2Oa8HJZiuckUiF4p5lhQNCC7lif36ltgk
 ysHWL+q2IdqZqokssuAbx6Z+ue3bmYIaidbhDhcDvBwGzxjuN64W986dTHUjSal/
 FUtSCMVZxV7mqe8sVcSgQym/PFIcgDa4fyMrzAiuxupvFtRsXqdiTRCKPmuLSkJX
 FXNY9m8+/7CtETPPv/yw5mZNUI0BzgMyyRBrBwGlk8aiKGcsDWGPcQgZu9LKHjyi
 tRkUDfZKOCUX0iraxdT0sbPPMQWCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=zWHFTfPHwkVTtfd/Eq
 05GpjwFGBLakOYR84kHi4UsRQ=; b=ddz8T8c0+bnqjZjr7U4iVAOXYhCWrAE43B
 bzSpncLgIyRe57VAbrr7toMH7Sxk/KrQ/GigNJJejwlYOzmeiP12aGvg2ZCHbAZ9
 KTs0OpHe3cr/VSfssshP0tqkW+8yHhMaGqWB6dq54uhdOHuE/ch6kV88Mi9IhLIg
 k1NUVo52ReOxhX9PB3sDrMSqqeF209NC5C2DuquXyT4ehBfuFEQXHKieMBIT0PoZ
 8NIlP6Ud2oHKRuCR8zizlHZsWmOkMcr3VZvM4a9jAlXFhC/9p8yjn/VWaIO1d2T1
 InKiHAdz4bvOCPxO3y+Ancs3y1UWmHCXxUEQQrNIClmxxj/CXwmw==
X-ME-Sender: <xms:dJCbWbMo7YYQEC63n3ns4-QnrCER_GS9EDtXMI7Z6N-f6m6xDyuiCQ>
X-Sasl-enc: bYxr1fPDqa2nXrUF9889OgJTRsFdCP4k7y/A0dlTDn8F 1503367283
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id A60962459C;
 Mon, 21 Aug 2017 22:01:22 -0400 (EDT)
Message-ID: <1503367279.7266.18.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v4 2/2] hwmon: (ucd9000) Add debugfs for
 mfr_status info
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Tue, 22 Aug 2017 11:31:19 +0930
In-Reply-To: <20170821220946.85617-3-cbostic@linux.vnet.ibm.com>
References: <20170821220946.85617-1-cbostic@linux.vnet.ibm.com>
 <20170821220946.85617-3-cbostic@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-lxs5qUy/A6w0/xAhENlF"
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
X-List-Received-Date: Tue, 22 Aug 2017 02:01:27 -0000


--=-lxs5qUy/A6w0/xAhENlF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-08-21 at 17:09 -0500, Christopher Bostic wrote:
> Add debugfs to list the mfr_status register and its gpiN_fault
> fields.
>=C2=A0
> > Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> v2 - Remove mfr_status directory in debugfs and place the files
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0up in the parent ucd9000 directory.
> ---
> =C2=A0drivers/hwmon/pmbus/ucd9000.c | 122 +++++++++++++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 122 insertions(+)
>=C2=A0
> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.=
c
> index 5cea5f6..f906d8e 100644
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
> @@ -38,6 +39,7 @@
> > =C2=A0#define UCD9000_FAN_CONFIG_INDEX	0xe7
> > =C2=A0#define UCD9000_FAN_CONFIG		0xe8
> > =C2=A0#define UCD9000_LOGGED_FAULTS		0xea
> > +#define UCD9000_MFR_STATUS		0xf3
> > =C2=A0#define UCD9000_GPIO_SELECT		0xfa
> > =C2=A0#define UCD9000_GPIO_CONFIG		0xfb
> > =C2=A0#define UCD9000_DEVICE_ID		0xfd
> @@ -56,16 +58,25 @@
> > =C2=A0#define UCD9000_MON_VOLTAGE_HW	4
> =C2=A0
> > =C2=A0#define UCD9000_NUM_FAN		4
> > +#define UCD9000_NAME_SIZE	24
> =C2=A0
> > =C2=A0#define UCD90160_NUM_GPIOS	26
> > +#define UCD90160_GPI_COUNT	8
> > +#define UCD90160_GPI_FAULT_BASE	16
> =C2=A0
> =C2=A0struct ucd9000_data {
> > =C2=A0	u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_MAX];
> > =C2=A0	struct pmbus_driver_info info;
> > =C2=A0	struct gpio_chip gpio;
> > > +	struct dentry *debugfs;	/* debugfs device directory */
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
> @@ -143,6 +154,7 @@ static int ucd9000_gpio_read_config(struct i2c_client=
 *client,
> > =C2=A0	if (ret < 0) {
> > =C2=A0		dev_err(&client->dev, "Failed to select GPIO %d: %d\n", offset,
> > =C2=A0			ret);
> +

Can we fold the whitespace cleanups into the appropriate patch? Please audi=
t
the rest of the patch for similar issues.

> > =C2=A0		return ret;
> > =C2=A0	}
> =C2=A0
> @@ -157,6 +169,7 @@ static int ucd9000_gpio_get(struct gpio_chip *gc, uns=
igned int offset)
> > =C2=A0	ret =3D ucd9000_gpio_read_config(client, offset);
> > =C2=A0	if (ret < 0) {
> > =C2=A0		dev_err(&client->dev, "failed to read GPIO config\n");
> +
> > =C2=A0		return ret;
> > =C2=A0	}
> =C2=A0
> @@ -185,6 +198,108 @@ static int ucd9000_gpio_direction_input(struct gpio=
_chip *gc,
> > =C2=A0	return 0;
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
> > +		return ret;
> > +	}
> > +	return i2c_smbus_read_block_data(client, UCD9000_MFR_STATUS,
> > +					(u8 *)buffer);

I know you don't intend to support the device but this will cause stack
corruption on the ucd90240. Maybe it's not worth fixing at the moment, but =
it's
probably worth a comment. From the command reference, page 81:

	With the UCD90120 and UCD90124 devices, this command [MFR_STATUS] is 2
	bytes long (bits 0-15). With the UCD90240, this command is 5 bytes
	long. With all other devices, it is 4 bytes long.

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
> > +		dev_err(&client->dev,
> > +			"Failed to read mfr status. rc:%d\n", ret);
> > +		return ret;
> > +	}
> +
> > +	*val =3D ret & BIT(nr) ? 1 : 0;

We should switch this to the non-branchy solution.

> +
> > +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(ucd9000_debugfs_ops_mfr_status_bit,
> > +			ucd9000_debugfs_get_mfr_status_bit, NULL, "%1lld\n");
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
> > +		dev_err(&client->dev,
> > +			"Failed to read mfr status. rc:%d\n", ret);
> > +		return ret;
> > +	}
> +
> > +	*val =3D ret;
> +
> > +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(ucd9000_debugfs_ops_mfr_status_word,
> > +			ucd9000_debugfs_get_mfr_status_word, NULL, "%08llx\n");
> +
> +static int ucd9000_init_debugfs(struct i2c_client *client,
> > +				struct ucd9000_data *data)
> +{
> > +	struct ucd9000_debugfs_entry *entries;
> > +	char name[UCD9000_NAME_SIZE];
> > +	int i;
> +
> > +	ucd9000_debugfs_dir =3D debugfs_create_dir("ucd9000", NULL);
> > +	if (IS_ERR(ucd9000_debugfs_dir)) {
> > +		ucd9000_debugfs_dir =3D NULL;
> > +		dev_warn(&client->dev, "Failed to create debugfs dir\n");
> > +		return 0;
> > +	}
> +
> > +	entries =3D devm_kzalloc(&client->dev, sizeof(*entries) *
> > +				(UCD90160_GPI_COUNT + 1) * 10,
> > +				GFP_KERNEL);
> > +	if (!entries)
> > +		return -ENOMEM;
> +
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
> > +				&ucd9000_debugfs_ops_mfr_status_word);

Given the static ucd9000_debugfs_dir, how does this work if there are multi=
ple
devices? It's a naive question - I haven't looked into it at all, but I'm
curious.

Cheers,

Andrew

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
> @@ -345,12 +460,19 @@ static int ucd9000_probe(struct i2c_client *client,
> > =C2=A0	if (ret < 0)
> > =C2=A0		return ret;
> =C2=A0
> > +	if (mid->driver_data =3D=3D ucd90160) {
> > +		ret =3D ucd9000_init_debugfs(client, data);
> > +		if (ret < 0)
> > +			dev_warn(&client->dev, "Failed to register debugfs\n");
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
--=-lxs5qUy/A6w0/xAhENlF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZm5BvAAoJEJ0dnzgO5LT5JWgP/1OsdoC5txzjk5rQqtYwAHlc
E1HXpD99+9JoBp3nT+vmPIlo/6JxM8agDFkS6Jnk9bVGWGIXu8D8BFmL7iW/O/uJ
W3ArtMD+eyIUjBR3bF2Pr2gPjkpmOsBTwLJq+cfKoXZby2vCGSnxUwyRmf+TjG8X
y22FSE6i9lcLpQ3sSeQQMPESZ/t7RhIp7khmAODwRQs3wJpA+fT099REHB9lT4ff
j1SmLErPqnXbQNzyE+0GMntvitkihnfl/HoTMg9disWiTd1MqROsiHpF9Kb6nLx/
HObUiixFruHvDApLhCPKVFuXwGRCPKg8GFS/hoe6l0StEZdCeljyVzm6so7RbBpK
ZtrE5pBHBksx1G/gg90rX8WvC6XWvvj5kq/CiDZ8DVdDomcTl9cikYmF4DDUl3xK
ovOhT6CwMzUQVlEgfKGnJIkcUszpn+sSXpodJ2egPC7WHg8613exo8TB708FFsl9
kDGEfY7LpMCYtXpIyLQ6iBD3JOiHipOKjHThuClxc4xujA3GvBrJMvCXkk6FX6Xo
7VGGBa9W3S0cxaISU4ND/MrDf/0SuZrdCj19jpjHO47jfkh72vORWZn21xBCktXM
i64Patv7xvE12+Dg3yBfNl+CT6jaj8t3qhy4xnZKi3B+whzJ8LIJibl1qeb+sGly
QM2LbOvxlF/4/HuO/ALU
=8L7n
-----END PGP SIGNATURE-----

--=-lxs5qUy/A6w0/xAhENlF--
