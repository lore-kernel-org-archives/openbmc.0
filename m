Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LsDAT3n1"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="U4QtFxei"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yY9Sn3dRHzDrKG
 for <openbmc@lists.ozlabs.org>; Fri, 10 Nov 2017 17:42:33 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B0CC820D07;
 Fri, 10 Nov 2017 01:42:30 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 10 Nov 2017 01:42:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=i1qHjzRpHUALH/gM9M9m7qEaN/ORFblwH/Yh1ZNju5M=; b=LsDAT3n1
 anCYuLqTD19bdSEsqPplPnePWHSOlZC80Vlseo+inbXBFIYFpKy3FgntPCKjVk+8
 XZT8AaIaPtlQHMqvwk4i85/rFTIS7NbwYCD5/H9vb0O4VndD6ppSzSoSoVVvM2FT
 NxRuwS8g8dyNeBhg/ZJ4hd1sbSSznbdnb1ySbrMlGJWtM6qzknmRtu8D2UTu6jqr
 baASBPAB5qoKCLMjnMB4dD78Ram/3yvRcS2uk68ZaFy1xdAIyQfP1dmDJK+DPvqW
 ezL36JKmmT7gsewbsxqlfQND61mjjzJkuPNDMfumTjpSGPIRRKQSCm6mMG+vXW/6
 5FPPfuHdpX8edg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=i1qHjzRpHUALH/gM9M9m7qEaN/ORF
 blwH/Yh1ZNju5M=; b=U4QtFxei8lSC7fcv9Ov+kM0hCS3e7mpr7/2yC112l3VDf
 PHZDlurO0QvuMFOcCEGka1Zn+E7a5++IKa7p8HUdl7q+BhlhQlJCZ8wuZYn+wszn
 0tWr1JoDzh+csz3J6lkHZEgFsvAB7p5TyCdZD/ATmcG4TKUC/NYYW7+5ov0K+P4O
 jdBzLmA1WADae9G5HiAICGMtVDQBJdYVVpReX+GC6k05Tqg8mPFL8D385yWZzaV8
 HqVZeDMpV3QQHxiUYlVNgVZR5rkHbZNxc5acK9nGJCm81wDWkcbow7hnW9oA63J7
 43R5UwvPpUBnCT00sV1KRTbjRnqrwyBFdPICp7t2g==
X-ME-Sender: <xms:VkoFWiFhgGFmIW-dCIPN3IegisGmjyyCtGYhkxDb9cXrW25FsHa-tg>
Received: from dave (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 06956240B2;
 Fri, 10 Nov 2017 01:42:28 -0500 (EST)
Message-ID: <1510296145.4287.65.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 2/2] hwmon: (pmbus): cffps: Add
 input_history debugfs file
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 10 Nov 2017 17:12:25 +1030
In-Reply-To: <1509656381-22755-3-git-send-email-eajames@linux.vnet.ibm.com>
References: <1509656381-22755-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1509656381-22755-3-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-VXo+ndFyC0spZigt9uv/"
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
X-List-Received-Date: Fri, 10 Nov 2017 06:42:34 -0000


--=-VXo+ndFyC0spZigt9uv/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-11-02 at 15:59 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=20
> Provide binary data of the powers supply input history to debugfs.

Please improve this commit message to discuss the finer points of the
approach you took. For instance, getting the history off of the PSU
involves some annoying quasi-duplication of core functions with the
ibm_cffps_read_input_history() implementation.

>=20
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  drivers/hwmon/pmbus/ibm-cffps.c | 97 +++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 96 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cf=
fps.c
> index 1a6294c..0570c12 100644
> --- a/drivers/hwmon/pmbus/ibm-cffps.c
> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
> @@ -7,13 +7,19 @@
>   * (at your option) any later version.
>   */
> =20
> +#include <linux/debugfs.h>
>  #include <linux/device.h>
> +#include <linux/fs.h>
>  #include <linux/i2c.h>
>  #include <linux/jiffies.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
> =20
>  #include "pmbus.h"
> =20
> +#define CFFPS_INPUT_HISTORY_CMD			0xD6
> +#define CFFPS_INPUT_HISTORY_SIZE		100
> +
>  /* STATUS_MFR_SPECIFIC bits */
>  #define CFFPS_MFR_FAN_FAULT			BIT(0)
>  #define CFFPS_MFR_THERMAL_FAULT			BIT(1)
> @@ -24,6 +30,70 @@
>  #define CFFPS_MFR_VAUX_FAULT			BIT(6)
>  #define CFFPS_MFR_CURRENT_SHARE_WARNING		BIT(7)
> =20
> +struct ibm_cffps {
> +	struct i2c_client *client;
> +
> +	struct mutex update_lock;
> +	unsigned long last_updated;
> +
> +	u8 byte_count;
> +	u8 input_history[CFFPS_INPUT_HISTORY_SIZE];
> +};
> +
> +static ssize_t ibm_cffps_read_input_history(struct file *file,
> +					    char __user *buf, size_t count,
> +					    loff_t *ppos)
> +{
> +	int rc;
> +	struct ibm_cffps *psu =3D file->private_data;
> +	u8 msgbuf0[1] =3D { CFFPS_INPUT_HISTORY_CMD };
> +	u8 msgbuf1[CFFPS_INPUT_HISTORY_SIZE + 1] =3D { 0 };
> +	struct i2c_msg msg[2] =3D {
> +		{
> +			.addr =3D psu->client->addr,
> +			.flags =3D psu->client->flags,
> +			.len =3D 1,
> +			.buf =3D msgbuf0,
> +		}, {
> +			.addr =3D psu->client->addr,
> +			.flags =3D psu->client->flags | I2C_M_RD,
> +			.len =3D CFFPS_INPUT_HISTORY_SIZE + 1,
> +			.buf =3D msgbuf1,
> +		},
> +	};
> +
> +	if (!*ppos) {
> +		mutex_lock(&psu->update_lock);
> +		if (time_after(jiffies, psu->last_updated + HZ)) {
> +			/*
> +			 * Use a raw i2c transfer, since we need more bytes
> +			 * than Linux I2C supports through smbus xfr (only 32).
> +			 */
> +			rc =3D i2c_transfer(psu->client->adapter, msg, 2);
> +			if (rc < 0) {
> +				mutex_unlock(&psu->update_lock);
> +				return rc;
> +			}
> +
> +			psu->byte_count =3D msgbuf1[0];
> +			memcpy(psu->input_history, &msgbuf1[1],
> +			       CFFPS_INPUT_HISTORY_SIZE);
> +			psu->last_updated =3D jiffies;
> +		}
> +
> +		mutex_unlock(&psu->update_lock);
> +	}
> +
> +	return simple_read_from_buffer(buf, count, ppos, psu->input_history,
> +				       psu->byte_count);
> +}
> +
> +static const struct file_operations ibm_cffps_fops =3D {
> +	.llseek =3D noop_llseek,
> +	.read =3D ibm_cffps_read_input_history,
> +	.open =3D simple_open,
> +};
> +
>  static int ibm_cffps_read_byte_data(struct i2c_client *client, int page,
>  				    int reg)
>  {
> @@ -119,7 +189,32 @@ static int ibm_cffps_read_word_data(struct i2c_clien=
t *client, int page,
>  static int ibm_cffps_probe(struct i2c_client *client,
>  			   const struct i2c_device_id *id)
>  {
> -	return pmbus_do_probe(client, id, &ibm_cffps_info);
> +	int rc;
> +	struct dentry *debugfs;
> +	struct ibm_cffps *psu;
> +
> +	rc =3D pmbus_do_probe(client, id, &ibm_cffps_info);
> +	if (rc)
> +		return rc;
> +
> +	/* Don't fail the probe if we can't create debugfs */
> +	psu =3D devm_kzalloc(&client->dev, sizeof(*psu), GFP_KERNEL);
> +	if (!psu)
> +		return 0;
> +
> +	psu->client =3D client;
> +	mutex_init(&psu->update_lock);
> +	if (jiffies > HZ)
> +		psu->last_updated =3D jiffies - HZ;

I think we can ditch the test: jiffies is an unsigned long and unsigned
underflow is defined as wrapping. If jiffies <=3D HZ, then jiffies - HZ
becomes (jiffies - HZ) + ULONG_MAX + 1, which can be rewritten as
ULONG_MAX - HZ + jiffies + 1 to keep your sanity in an unsigned world.
Then because you're using time_after() in the read() function, the
wrapping is taken care of in the jiffies <=3D HZ case (and naturally the
jiffies > HZ case is catered for), and we're home.

> +
> +	debugfs =3D pmbus_get_debugfs_dir(client);
> +	if (!debugfs)
> +		return 0;
> +
> +	debugfs_create_file("ibm_cffps_input_history", 0444, debugfs, psu,
> +			    &ibm_cffps_fops);
> +
> +	return 0;
>  }
> =20
>  static const struct i2c_device_id ibm_cffps_id[] =3D {

Please send this patch upstream as well. We'll cherry-pick it back
after it's applied.

Cheers,

Andrew
--=-VXo+ndFyC0spZigt9uv/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJaBUpRAAoJEJ0dnzgO5LT5jZoQAJLFKf8DCGKrOe4scslfQOJN
Oe9CFAGhRwTKE2Q4bXoBVJxVLdIWx4OfsiiRMu4NL1z9CSudM/Uq7c49/KDVD1RC
wuYHsJsCyHYVv8MyBqw4cB8dNyn6ybt0bgAG96F2SVG9n2EqoNBlzv+zMCUWumil
H137ZjZV3QZ6zwctnmO4hrzs2OqC/v8OJI8zqXW5nJjmrCnIWxP5ENUPdFjTufsv
wxeL4xn2buUdaqwAuY36BtSlRwIe5sttrByUBYvdDjnOJ3UzB9Mp1OTZe5iEhdC2
rQqfkIlnBfLgIImWm7jG1+QgSYZ1U7uFgNdFwFGSpEJ23QiG0kDwMjVJmGDDayOS
xgv58MsBZ6CnfxZ5TvZtUVyQnQYHysmhhGyf65SXFtCTdui8XDrZVAm9InCUIEf3
W2Swmos1X5nxnzf2RN2VAOvv4xFLvzpD3KnHM3VuiY4foFgKlMt178frOUWsAii5
n+GHUxr8BgQoqpUk3osIv8uIayolyiiV4XULeGsGSR5PtOyMsOzlm2Cyxc1sFXP5
bjgHDdN4r4qGOtkhPF+n/1bgAdERcLAaMx9/PLoXpm7VZqMtpWPLEPgXQldtkzoF
WFQQTydoicGbsEIXcrKn7L+8G4namVRwU8HPtTBDMpjkhR86OPpl/4AMunkxMOSA
0ZFxVR1rQldsRLL9xjfl
=1foD
-----END PGP SIGNATURE-----

--=-VXo+ndFyC0spZigt9uv/--
