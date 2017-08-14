Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xW6n76VQSzDr9G
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 17:34:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="TiAZ76Je"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HVCkmrs4"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BF5012101D;
 Mon, 14 Aug 2017 03:34:17 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 14 Aug 2017 03:34:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=YgRBUKPg5x4gMDykFRQpH5I1NwWXq0kwkhLbmpeXx
 F0=; b=TiAZ76JePcAZn2yFjEq3jwjDexi8+MAfEJY7fid01v34csgsWDnv0/uKU
 rHtTmn1PcZgzRkncw5sPrLAf22ZIgqcPX4RB6sCw1sqRCjiSiibpUbSFaWgR6rjA
 510tE0nB+M2F91E8KyVLSUNaKvT/kRI1BnZMsdJCdT+TZdnLql2VRopc8SlV7X13
 2D3lvk2pZ8xX6aCZdmc8vW66yziSbpS0Pnn3LIe/hjlIerGoRvgro8CulFi+WhK6
 RoPG11fIbI4vDTrG/A4k/2Acx8suRdC3oSoohMz5R7WenXf1q5FnfMpoAI8OwsKU
 DTVJKx+ZOILwOcUdDG7zp1shVZ05w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=YgRBUKPg5x4gMDykFR
 QpH5I1NwWXq0kwkhLbmpeXxF0=; b=HVCkmrs4tED5a6FNmrna924RIpoNN4NzvJ
 jUzy70PCwIdpMVxBNzcAGsJ9R3T8bFkX2It1LHQVUg8YyQRhwoS8oLy/m0JxN2Oz
 8Kva11+4rABjg7r4XOpoDEs/U28/lNNcZl8vXxx3KndzkIrt5tPKFXq20lil1siL
 4NTeSWHXS2/CpCD4dEoS/hfEidYmVY8rKBZL/lvKWoOvwbUVl2as9YYKQFiYgHvM
 U1uvKciTiObrRdB/fwRipZJhLCrmy1ZWe6Y17BUe+RV99CuBz99Zw6VmG1UQv7fi
 B0e6Y3GGgEnja9vFf9KghRVwXkHQzJDwOTO1IjGamMnHKbFOpUuw==
X-ME-Sender: <xms:eVKRWT5Yg8Yovet-SPuBZK0Okb5m6bnaEbSJ69gA1nlMHNC67CKtuw>
X-Sasl-enc: re+QWHuVv4qNI3pbaBFlhrQPcQOmNfj0AtT8kxooUpDd 1502696057
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id DFDBE24442;
 Mon, 14 Aug 2017 03:34:15 -0400 (EDT)
Message-ID: <1502696052.14932.22.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v5 3/4] Documentation: hwmon: Document
 the IBM CFF power supply
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, bjwyman@gmail.com
Date: Mon, 14 Aug 2017 17:04:12 +0930
In-Reply-To: <1502474205-1557-4-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502474205-1557-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1502474205-1557-4-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-VqqPuhFGlYF3eGY0TdQq"
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
X-List-Received-Date: Mon, 14 Aug 2017 07:34:20 -0000


--=-VqqPuhFGlYF3eGY0TdQq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-08-11 at 12:56 -0500, Eddie James wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0Documentation/hwmon/ibm-cffps | 54
+++++++++++++++++++++++++++++++++++++++++++
> =C2=A01 file changed, 54 insertions(+)
> =C2=A0create mode 100644 Documentation/hwmon/ibm-cffps
>=C2=A0
> diff --git a/Documentation/hwmon/ibm-cffps b/Documentation/hwmon/ibm-
cffps
> new file mode 100644
> index 0000000..e091ff2
> --- /dev/null
> +++ b/Documentation/hwmon/ibm-cffps
> @@ -0,0 +1,54 @@
> +Kernel driver ibm-cffps
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Supported chips:
> +=C2=A0=C2=A0* IBM Common Form Factor power supply
> +
> > +Author: Eddie James <eajames@us.ibm.com>
> +
> +Description
> +-----------
> +
> +This driver supports IBM Common Form Factor (CFF) power supplies.
This driver
> +is a client to the core PMBus driver.
> +
> +Usage Notes
> +-----------
> +
> +This driver does not auto-detect devices. You will have to
instantiate the
> +devices explicitly. Please see Documentation/i2c/instantiating-
devices for
> +details.
> +
> +Sysfs entries
> +-------------
> +
> +The following attributes are supported:
> +
> > +curr1_alarm		Output current over-current fault.
> > +curr1_input		Measured output current in mA.
> > +curr1_label		"iout1"
> +
> > +fan1_alarm		Fan 1 warning.
> > +fan1_fault		Fan 1 fault.
> > +fan1_input		Fan 1 speed in RPM.
> > +fan2_alarm		Fan 2 warning.
> > +fan2_fault		Fan 2 fault.
> > +fan2_input		Fan 2 speed in RPM.
> +
> > +in1_alarm		Input voltage under-voltage fault.
> > +in1_input		Measured input voltage in mV.
> > +in1_label		"vin"
> > +in2_alarm		Output voltage over-voltage fault.
> > +in2_input		Measured output voltage in mV.
> > +in2_label		"vout1"
> +
> > +power1_alarm		Input fault.
> > +power1_input		Measured input power in uW.
> > +power1_label		"pin"
> +
> > +temp1_alarm		PSU inlet ambient temperature over-
temperature fault.
> > +temp1_input		Measured PSU inlet ambient temp in
millidegrees C.
> > +temp2_alarm		Secondary rectifier temp over-
temperature fault.
> > +temp2_input		Measured secondary rectifier temp in
millidegrees C.
> > +temp3_alarm		ORing FET temperature over-temperature
fault.
> > +temp3_input		Measured ORing FET temperature in
millidegrees C.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
--=-VqqPuhFGlYF3eGY0TdQq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZkVJ0AAoJEJ0dnzgO5LT5CYcP/A0w+xCdJyEzLT+uXKKcN7fi
KPTeQ133SVWH10vju++HsY8RdA02RYmyBRpuw3euZIwG6vQQQ+3OWhwa9AK5Lt6R
EO0WX1Q9Zb3KmryVyWqd+lCDHRYQIAw2aN+uurRtlP6mu6k7Hl3PUvt0iocFjxJS
/nVmIlbvm2raoUpGvKxN4lETRZZy1xcdkZ+Peg9LS10zhoMPKcdel9ePd5T2Jk8e
+z6Z64RYnJr2+230vlJd5lVd5y1a47l209OMW4G4rqFfdVbS0y4JaMZK5UijGwPc
5YpHi1EXRvwDPx5rmQ3XDOwHS3LgD8bqj7+wICN7xuPRXedqW4LfDQBjJP36oFMD
k72r+QNlXpaJGHnb9sp+Ro/77V3QKVdH9xL6cxHqZ7iaW26/zTcSpIMODKNHr0jz
QskErJ0mKJUgzb5Ndio6jPgc1cjB7nPrdFsGRrcmxGdqMGVxPJaStOcFOig3SvDK
HKZ5SjRziE3ZAU5Eox/L0cktNxC+51wxUVxok+hoV/pS+GLNuum9OLTVr7tUbrZZ
WCyaEzmp/ZnLMSjseuW0+tm3rUfw1WwgRjTAOKAEltZ2ptm5H6lBu+2Lx3qmLgmG
au53Nzkpw7GF2MWmZBXF7rbgAibSsem48ZTDoOeOUlIrDFhiJUGIH2lUl2mAFc/e
8jLd2AJfMXn0/ZfjgVFP
=2wVL
-----END PGP SIGNATURE-----

--=-VqqPuhFGlYF3eGY0TdQq--
