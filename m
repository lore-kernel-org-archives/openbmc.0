Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xKkYg6X6jzDqmr
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jul 2017 10:51:51 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.100] (unknown [192.168.253.100])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 626221277F5;
 Sat, 29 Jul 2017 20:51:48 -0400 (EDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH linux dev-4.10 v6 1/2] ARM: dts: aspeed: Witherspoon add
 gpio-keys-polled for fan presence
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20170729183638.17503-2-cbostic@linux.vnet.ibm.com>
Date: Sat, 29 Jul 2017 20:51:48 -0400
Cc: joel@jms.id.au,
 openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2FAFAB17-11F2-406C-97E4-1958C30DC57D@fuzziesquirrel.com>
References: <20170729183638.17503-1-cbostic@linux.vnet.ibm.com>
 <20170729183638.17503-2-cbostic@linux.vnet.ibm.com>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3273)
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
X-List-Received-Date: Sun, 30 Jul 2017 00:51:52 -0000


> On Jul 29, 2017, at 2:36 PM, Christopher Bostic =
<cbostic@linux.vnet.ibm.com> wrote:
>=20
> Add gpio-keys-polled  node for pca955x fan presence lines.
> Add GPIO details to pca955x for the presence lines as well.
>=20
> Polling period of 1 second determined to be the max acceptable
> value based on discussions with Brad Bishop and Matt Spinler.
> Tested with gpiomon program - verified.
>=20
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Tested-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

> ---
> v6 - Add gpio pin details for fan presence to pca955x node
> v5 - Fix gpio-keys-polled driver probe errors.  Missing pca955x
>     gpio cells property and wrong format for poll-interval.
> v4 - Add details regarding polling period to commit message.
> v3 - Remove 'autorepeat'
>   - Increase polling period to 1 second.
>   - Remove GPIO specifiers from pca955x in dev tree
> v2 - Change 'linux,code' from a unique global value to a local one
>     for all the gpio-keys-polled devices.
> ---
> arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 52 =
++++++++++++++++++++++++
> 1 file changed, 52 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts =
b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 5afc03a..70328668 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -56,6 +56,37 @@
> 		};
> 	};
>=20
> +	gpio-keys-polled {
> +		compatible =3D "gpio-keys-polled";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		poll-interval =3D <1000>;
> +
> +		fan0-presence {
> +			label =3D "fan0-presence";
> +			gpios =3D <&pca0 4 GPIO_ACTIVE_LOW>;
> +			linux,code =3D <4>;
> +		};
> +
> +		fan1-presence {
> +			label =3D "fan1-presence";
> +			gpios =3D <&pca0 5 GPIO_ACTIVE_LOW>;
> +			linux,code =3D <5>;
> +		};
> +
> +		fan2-presence {
> +			label =3D "fan2-presence";
> +			gpios =3D <&pca0 6 GPIO_ACTIVE_LOW>;
> +			linux,code =3D <6>;
> +		};
> +
> +		fan3-presence {
> +			label =3D "fan3-presence";
> +			gpios =3D <&pca0 7 GPIO_ACTIVE_LOW>;
> +			linux,code =3D <7>;
> +		};
> +	};
> +
> 	leds {
> 		compatible =3D "gpio-leds";
>=20
> @@ -277,6 +308,7 @@
> 		reg =3D <0x60>;
> 		#address-cells =3D <1>;
> 		#size-cells =3D <0>;
> +		#gpio-cells =3D <2>;
>=20
> 		fan0: led@0 {
> 			label =3D "fan0";
> @@ -302,6 +334,26 @@
> 			reg =3D <3>;
> 			type =3D <PCA955X_TYPE_LED>;
> 		};
> +		fan0_pres_gpio: gpio@4 {
> +			label =3D "fan0_presence";
> +			reg =3D <4>;
> +			type =3D <PCA955X_TYPE_GPIO>;
> +		};
> +		fan1_pres_gpio: gpio@5 {
> +			label =3D "fan1_presence";
> +			reg =3D <5>;
> +			type =3D <PCA955X_TYPE_GPIO>;
> +		};
> +		fan2_pres_gpio: gpio@6 {
> +			label =3D "fan2_presence";
> +			reg =3D <6>;
> +			type =3D <PCA955X_TYPE_GPIO>;
> +		};
> +		fan3_pres_gpio: gpio@7 {
> +			label =3D "fan3_presence";
> +			reg =3D <7>;
> +			type =3D <PCA955X_TYPE_GPIO>;
> +		};
> 		front_fault: led@13 {
> 			label =3D "front-fault";
> 			default-state =3D "keep";
> --=20
> 1.8.2.2
