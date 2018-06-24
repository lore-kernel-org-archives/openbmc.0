Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hS81LR6N"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="hWhmWwYF"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41DT9f0Y5yzF18f
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jun 2018 09:32:21 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5A82221751;
 Sun, 24 Jun 2018 19:32:16 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Sun, 24 Jun 2018 19:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=TuCUmeWAu5QGD3mBfF5wvZFsEjYdp
 sKHSXxK4/OXG54=; b=hS81LR6NUG7r2hIPfNiNnK39upZEUbiOZSBQG/IdGJA/r
 UQ95smKxWOZ3SXIfta0EiifAkanvmVB4tkPUznVO5EphyraUjtJLT4m4zqAewXx2
 V6i2iivyAh4wSsZVWD0bwm2HXNeOqip9vy0/Y9LNnKFsdy+zj4BAoo6sArTvZBd6
 6eGKBBtVbr/p0hq1xdG5BFAjfZF9MLMx80vl5bOtsaHdIdnBB5hSzaXcTh0212bD
 5rMg/wXveR2x1gG1Zw3Ua4RRD9koPFj4fU0Ltq9elV3sgCCgXUGcUlqjWteoWdX9
 /1eq7EhjqfrcK+YcZHGuiRcfZCt0uaHwrCjw/+0mA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=TuCUme
 WAu5QGD3mBfF5wvZFsEjYdpsKHSXxK4/OXG54=; b=hWhmWwYFAd5Xub/E0aHp6s
 bqs6HI0OJ4KcoqQkuBhCe6T5H5GO+wFFSOJ5wSTKFGGFTc28c/vYih5Vyvj2YhGt
 BdxAe5b67zkpOT5Va+V/EllVXUd/LPS/eMuCkmFTQtHNUEAvbxREBEgZOL6IDAED
 uSHvemOjvD+o+ssSiIc0ziLwFC3WZ9iVZscWvu533f/jaRa3lq8TPwoCpJwGkf4c
 MhlerqkoV3+jSrKhJ0LJndA3b3o0CkNA+CcOYh8FLyF+W9spXbFbQuFvC/P4xdwb
 /kxYtqjczstsvC703rSS/an0XvGbxDecpoF/CExi5DQigyI5FFITnkAo8/+GJ0Sg
 ==
X-ME-Proxy: <xmx:ACowW7fyqYFfUNKShi0So5WU-aqPLB54ZH4cLaCGgB3v5yZckgPcPg>
 <xmx:ACowW1CQvhFBk5V3vWitIqZ-WXz6ELjOgS49-msS24RdJOA4o7eT0Q>
 <xmx:ACowW5HrSY0PDDMzi1LJa9byfskKMDQMsLVeOxduWMJmqq0MLzvfPQ>
 <xmx:ACowW0ePauE-jwIvZ1NYlpY4ccVuODgQxzxh2fnROBKpNPG_QUpntw>
 <xmx:ACowW3yf9FZupYmcEXS3IFVgyHkls2XLWTXWxHhxbaphaeeUHgKV-A>
 <xmx:ACowW3KpjgHQpTtixQ2FicwmdlfxKCpJZGR85jzfNI6x6gMirwNq5Q>
X-ME-Sender: <xms:ACowW6bWwUf_PImMDuaX0TH5gfXeqGmHmr_q6uxM-NxIECY0jKLLqg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 1007DBA43D; Sun, 24 Jun 2018 19:32:16 -0400 (EDT)
Message-Id: <1529883135.2168638.1418889552.697D5014@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-0d8ea36c
In-Reply-To: <20180622070937.21498-2-clg@kaod.org>
References: <20180622070937.21498-1-clg@kaod.org>
 <20180622070937.21498-2-clg@kaod.org>
Subject: Re: [PATCH linux dev-4.17 v2 1/2] ARM: dts: aspeed: Add
 "spi-max-frequency" property
Date: Mon, 25 Jun 2018 09:02:15 +0930
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Jun 2018 23:32:24 -0000

On Fri, 22 Jun 2018, at 16:39, C=C3=A9dric Le Goater wrote:
> Keep the FMC controller chips at a safe 50 MHz rate and use 100 MHz
> for the PNOR on the machines using a AST2500 SoC.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/boot/dts/aspeed-ast2500-evb.dts         | 2 ++
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts    | 2 ++
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 2 ++
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 3 +++
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 2 ++
>  arch/arm/boot/dts/aspeed-g4.dtsi                 | 2 ++
>  arch/arm/boot/dts/aspeed-g5.dtsi                 | 7 +++++++
>  7 files changed, 20 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/
> dts/aspeed-ast2500-evb.dts
> index c0a7f51e7eb6..6b78e40d3259 100644
> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> @@ -41,6 +41,7 @@
>  		status =3D "okay";
>  		m25p,fast-read;
>  		label =3D "bmc";
> +		spi-max-frequency =3D <50000000>;
>  #include "openbmc-flash-layout.dtsi"
>  	};
>  };
> @@ -51,6 +52,7 @@
>  		status =3D "okay";
>  		m25p,fast-read;
>  		label =3D "pnor";
> +		spi-max-frequency =3D <100000000>;
>  	};
>  };
>=20=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/
> boot/dts/aspeed-bmc-opp-palmetto.dts
> index e6095f51ecf5..af41973a3882 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -66,6 +66,7 @@
>  		status =3D "okay";
>  		m25p,fast-read;
>  		label =3D "bmc";
> +		spi-max-frequency =3D <50000000>;
>  #include "openbmc-flash-layout.dtsi"
>  	};
>  };
> @@ -78,6 +79,7 @@
>  	flash@0 {
>  		status =3D "okay";
>  		m25p,fast-read;
> +		spi-max-frequency =3D <50000000>;
>  		label =3D "pnor";
>  	};
>  };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/
> boot/dts/aspeed-bmc-opp-romulus.dts
> index 347938673c83..ffe0c991d985 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -93,6 +93,7 @@
>  		status =3D "okay";
>  		m25p,fast-read;
>  		label =3D "bmc";
> +		spi-max-frequency =3D <50000000>;
>  #include "openbmc-flash-layout.dtsi"
>  	};
>  };
> @@ -106,6 +107,7 @@
>  		status =3D "okay";
>  		m25p,fast-read;
>  		label =3D "pnor";
> +		spi-max-frequency =3D <100000000>;
>  	};
>  };
>=20=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/
> arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index d05ace220a09..c51e3e8ece62 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -190,6 +190,7 @@
>  		status =3D "okay";
>  		label =3D "bmc";
>  		m25p,fast-read;
> +		spi-max-frequency =3D <50000000>;
>  #include "openbmc-flash-layout.dtsi"
>  	};
>=20=20
> @@ -197,6 +198,7 @@
>  		status =3D "okay";
>  		label =3D "alt";
>  		m25p,fast-read;
> +		spi-max-frequency =3D <50000000>;
>  	};
>  };
>=20=20
> @@ -209,6 +211,7 @@
>  		status =3D "okay";
>  		label =3D "pnor";
>  		m25p,fast-read;
> +		spi-max-frequency =3D <100000000>;
>  	};
>  };
>=20=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/
> dts/aspeed-bmc-opp-zaius.dts
> index 80cc7cba163c..757d6b3eb041 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -124,6 +124,7 @@
>  		status =3D "okay";
>  		label =3D "bmc";
>  		m25p,fast-read;
> +		spi-max-frequency =3D <50000000>;
>  #include "openbmc-flash-layout.dtsi"
>  	};
>  };
> @@ -137,6 +138,7 @@
>  		status =3D "okay";
>  		label =3D "pnor";
>  		m25p,fast-read;
> +		spi-max-frequency =3D <100000000>;
>  	};
>  };
>=20=20
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
> index 79257bf415a8..e526f54f400e 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -65,6 +65,7 @@
>  			flash@0 {
>  				reg =3D < 0 >;
>  				compatible =3D "jedec,spi-nor";
> +				spi-max-frequency =3D <50000000>;
>  				status =3D "disabled";
>  			};
>  		};
> @@ -80,6 +81,7 @@
>  			flash@0 {
>  				reg =3D < 0 >;
>  				compatible =3D "jedec,spi-nor";
> +				spi-max-frequency =3D <50000000>;
>  				status =3D "disabled";
>  			};
>  		};
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index 9cc50551c42e..afd33112c329 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -65,16 +65,19 @@
>  			flash@0 {
>  				reg =3D < 0 >;
>  				compatible =3D "jedec,spi-nor";
> +				spi-max-frequency =3D <50000000>;
>  				status =3D "disabled";
>  			};
>  			flash@1 {
>  				reg =3D < 1 >;
>  				compatible =3D "jedec,spi-nor";
> +				spi-max-frequency =3D <50000000>;
>  				status =3D "disabled";
>  			};
>  			flash@2 {
>  				reg =3D < 2 >;
>  				compatible =3D "jedec,spi-nor";
> +				spi-max-frequency =3D <50000000>;
>  				status =3D "disabled";
>  			};
>  		};
> @@ -90,11 +93,13 @@
>  			flash@0 {
>  				reg =3D < 0 >;
>  				compatible =3D "jedec,spi-nor";
> +				spi-max-frequency =3D <50000000>;
>  				status =3D "disabled";
>  			};
>  			flash@1 {
>  				reg =3D < 1 >;
>  				compatible =3D "jedec,spi-nor";
> +				spi-max-frequency =3D <50000000>;
>  				status =3D "disabled";
>  			};
>  		};
> @@ -110,11 +115,13 @@
>  			flash@0 {
>  				reg =3D < 0 >;
>  				compatible =3D "jedec,spi-nor";
> +				spi-max-frequency =3D <50000000>;
>  				status =3D "disabled";
>  			};
>  			flash@1 {
>  				reg =3D < 1 >;
>  				compatible =3D "jedec,spi-nor";
> +				spi-max-frequency =3D <50000000>;
>  				status =3D "disabled";
>  			};
>  		};
> --=20
> 2.13.6
>=20
