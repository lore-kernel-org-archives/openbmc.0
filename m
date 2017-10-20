Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Q9Nqj8Rr"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QsFdXQH2"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJF5C0fFfzDqBc
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 16:40:47 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 04FFD20D4A;
 Fri, 20 Oct 2017 01:40:45 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 20 Oct 2017 01:40:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=IEXeJS/m/B80vHHepzNORr1ZN+7iEDvBYnSTXmXoGzw=; b=Q9Nqj8Rr
 Ho5NUvJ58hwv8tK63lIsXSGDv1WJrMR8hlNj754dUxFM747xcH48i14k4zJG2ITZ
 V7RANjMxm/wlxsDHP3KDC0EmlWl4AWXDCgg/mAHRk8s6XVmvrR2ZRN52bAzMeO6l
 quDWWPHsBbYLHA7qDV4p2dd9GzlAbK2P5DgE4CAq/OLt+MQcSemP188cN2bAXh2O
 RfeVItaR6fcnP8801jdZGt+fNpdmyGZGPhHlK8dz6UnWoZ54F41XYhLdras06+sP
 4bwzmVLb6PrZVGBhUtqfG4CJNuqB5ZxHEeTg7XdfD/1dimyqhv3ebTA6gBRvOSfM
 dSsduxOaoJpajA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=IEXeJS/m/B80vHHepzNORr1ZN+7iE
 DvBYnSTXmXoGzw=; b=QsFdXQH2ryMSxdRNUM+fZh34UYrWjw83zGiNiNey/ZqPo
 b8KIyAQslZtMtdd2FL/xRbMbIpQYBTzRrEw/8ppduIY7i1l07NVHPia07G0rHHmi
 IONsWjnoOOznFofBEz6kwJH5gvdP8luCvfC2L9vWHgZeioyh2RECBig0gl2WGhWb
 bzCNw/+BlhG99RcD4AdwHC/HRQx9/jFKZ09c1hWA4f/ZXpZpRbAjEk8qMxiRYVep
 9Xu+9ymyFoY/3LnsnUXbDkq1sGlVfdo46fwGgfzAQi3M9J+qbmn64o8uLznnuYsj
 /5AM1aGNtzhalPXdAJb822YPNxdUbezOdK0BFKuFQ==
X-ME-Sender: <xms:XIzpWWx8SJAYcQlCZeOBzvwp2nX_ttPyF-UrNvPIhyX_4tjUkPgCqw>
Received: from keelia26 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5C37E7E1AE;
 Fri, 20 Oct 2017 01:40:43 -0400 (EDT)
Message-ID: <1508478037.24322.37.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] drivers (pmbus): ir35221: Set PMBUS_PAGE
 before reading id and model
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 20 Oct 2017 16:10:37 +1030
In-Reply-To: <1508446133-11823-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1508446133-11823-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-RYk0ZJZ3wSXT5OcNmit3"
X-Mailer: Evolution 3.22.6-1ubuntu1 
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
X-List-Received-Date: Fri, 20 Oct 2017 05:40:47 -0000


--=-RYk0ZJZ3wSXT5OcNmit3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-19 at 15:48 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> The MFR_ID and MFR_MODEL, which are manually read before probing the
> pmbus core,=C2=A0=C2=A0are only valid for the two pages that the ir35221 =
has
> available. Since we don't know the state of the device when we start
> probing, set the page number first before reading id and model.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Thanks, applied to dev-4.10.

Andrew

> ---
> =C2=A0drivers/hwmon/pmbus/ir35221.c | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=C2=A0
> diff --git a/drivers/hwmon/pmbus/ir35221.c b/drivers/hwmon/pmbus/ir35221.=
c
> index cc7b3b5..9aae633 100644
> --- a/drivers/hwmon/pmbus/ir35221.c
> +++ b/drivers/hwmon/pmbus/ir35221.c
> @@ -243,6 +243,12 @@ static int ir35221_probe(struct i2c_client *client,
> =C2=A0				| I2C_FUNC_SMBUS_READ_BLOCK_DATA))
> =C2=A0		return -ENODEV;
> =C2=A0
> +	ret =3D i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Failed to set PMBUS_PAGE\n");
> +		return ret;
> +	}
> +
> =C2=A0	ret =3D i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
> =C2=A0	if (ret < 0) {
> =C2=A0		dev_err(&client->dev, "Failed to read PMBUS_MFR_ID\n");
--=-RYk0ZJZ3wSXT5OcNmit3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ6YxWAAoJEJ0dnzgO5LT53WIQAJSXabqH/YEprCBFRxWhyonk
Py1RegjQKYuTNoh0MNsK+ItBbLYAYmONOpZlEAnRVyrxRY7PGZfJqdfa/zR9db/U
t1sFUGfbSs9jXAyBa8rvqI5wy584V1MACynvmEOXaLnoFj5YptWzo6X5dSjzOFYM
qompmm6TDBtABj9NK8NGI/toURB6Y9O5zpx7OZDoWofCryX853tqmXeC2hD3apVF
rh10Js61Qw/XOpNqs+zLNqNqFWRMlvdVzpB5KGjy26B4OR5f375UTLljNTngIuOw
MsebK2ZGA/qGWPvKqUXiH/Sw3VL20rSGQEsLhObZzrwsYnQh25pujJ6Wke4fmB8f
ar/cioWi9keD/TK8h5mX8RQu8MErYU/ajhb/kyvlmjCB1zbhiRZMda7BtMJ+BzyW
Y4GBAXvaOmcfB0vl2WYber6cNGGsnpvrLBLp9zFakSmzx7EVpXf6wqmLjX2rEEGM
tJ7NRpndO5dlE+LouEwew2hBq1RtJ+FFDIrfSOuecqfiop5Y7n6MYXlsh2xOaOrD
BEQ6YZ8iKBxR8aIxOjPDmypMwRHfc2kwNf2puUIGbM9ddc05uwBSiN6vlCuaTSbk
405J1c2F1Of4rum03hz9vx+ICQl0ABcD0EmvBa9P6SXJfOkmdQpXDsXKuiXRE3le
JkG2Tz/dSWR1L81sV7mI
=/gbm
-----END PGP SIGNATURE-----

--=-RYk0ZJZ3wSXT5OcNmit3--
