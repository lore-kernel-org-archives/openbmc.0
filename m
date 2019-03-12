Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VXC1k3So"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="KFaMOyTg"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44JrZS0FJ7zDqF6;
 Wed, 13 Mar 2019 10:21:19 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C2C3437CF;
 Tue, 12 Mar 2019 19:21:15 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 12 Mar 2019 19:21:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:cc:subject
 :content-type; s=fm2; bh=hsySSPXg2xSoBsvzudPGFUA79X04wcB931dlPSB
 nyhg=; b=VXC1k3So2RGEtW1uyI4sBkLB78XFA562ORBHnjIFoMwo4ecP843fdmO
 SGLgHI2ZcXCoru/ZOoJ5ONtkzHbInJHLtKSA5xEmnd6RIljY27deb0Q//238SlLu
 vC9IdSr1u3MKgBR7zT/ajxs/WjaPLvh3SBUK8CgiWZCcr6ZUWvUB6rGrhnADZQ5y
 XnCG4QYpBJ8wBa592FIIPQdGRZn9EAj2jGhYtkMGMsazebKrS4cOc8CH1DpstCoT
 y4LHY7CZhCJAqjoax1k9IHUcVOWTFOB3RQOWzZ4gB47/QfQ0HSxUs69xCq7lX2rB
 IHtSdaic4iQfyzFss5Riy/Si2WIwpDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=hsySSPXg2xSoBsvzu
 dPGFUA79X04wcB931dlPSBnyhg=; b=KFaMOyTgmNcC4XaUcpUKJz+qgTw+ubxx4
 II/yT8CpICm4HHy0qKulssxQNf3DAFBV1dCQ3QTk8uaSJ3t8XzB7/9ZzgYC0hw0q
 AQd+EsHOsZp3zlJUtXwH1jt2j5nLRiLZmfEn9i8bvNYnU6U/dz8C/F2xa8/qcy1G
 n5o+fwpRLOJMmTf9JallSoz5aF+zfHMOmZWjUHcHv33hk0K2VcYW8G3kgbBJHYJV
 obJbH5bRL6gMZj5zh7PWcBdwrnNtOeA49+t7zy6SeEWsalkludLgQgw5DGlog0wO
 fJKAI0B3jVRqs4XlLIIc5gop5PwLRpg13iPVbm/rQ5RBXUpzYSlFA==
X-ME-Sender: <xms:6j6IXLzhyHGWJQ-PmN_nE50Lyv2tLu5KWPD-VPtDY-NvGp2TMHSD8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrgeelgddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgurhgv
 ficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfu
 ihiivgeptd
X-ME-Proxy: <xmx:6j6IXHj6y689GrNDlbFYhwKNWxWUvWHCH5yFxrFbqwQCoNU2p_coDw>
 <xmx:6j6IXAViLNXQ4P-OtzVVIAmtEmF9WvS6piDfhddHzEMm1vULk_U4Fw>
 <xmx:6j6IXJ1DkWWGAQ36ado1hR4fpaOzMYM8SfEvFZaGvGguiWQlw5lkSw>
 <xmx:6z6IXGDv-tjijgU_461Imo1u_TwT1YiPc4tDHXEtNgsY5EpK2FsVng>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1673D7C4CE; Tue, 12 Mar 2019 19:21:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-925-g644bf8c-fmstable-20190228v5
X-Me-Personality: 52947553
Message-Id: <34738643-a98f-480b-8a76-afdc9cb478e5@www.fastmail.com>
In-Reply-To: <1552409402-15881-1-git-send-email-anoo@linux.ibm.com>
References: <1552409402-15881-1-git-send-email-anoo@linux.ibm.com>
Date: Tue, 12 Mar 2019 19:21:13 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Adriana Kobylak" <anoo@linux.ibm.com>, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [PATCH] ARM: dts: Aspeed: Witherspoon: Update BMC partitioning
Content-Type: text/plain
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Mar 2019 23:21:24 -0000



On Wed, 13 Mar 2019, at 03:21, Adriana Kobylak wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Add simplified partitions for BMC and alternate flash. Include these by
> default in Witherspoon.
> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

Yes please! Lets apply this so I can stop bashing my head against the desk when doing
kernel work on a Witherspoon.

> ---
>  .../boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi  | 18 ++++++++++++++++++
>  arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi | 18 ++++++++++++++++++
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts       |  3 ++-
>  3 files changed, 38 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi 
> b/arch/arm/boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi
> new file mode 100644
> index 0000000..9277599
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi
> @@ -0,0 +1,18 @@
> +		label = "alt-bmc";
> +		partitions {
> +				#address-cells = < 1 >;
> +				#size-cells = < 1 >;
> +				compatible = "fixed-partitions";
> +				u-boot@0 {
> +					reg = < 0 0x60000 >;
> +					label = "alt-u-boot";
> +				};
> +				u-boot-env@60000 {
> +					reg = < 0x60000 0x20000 >;
> +					label = "alt-u-boot-env";
> +				};
> +				obmc-ubi@80000 {
> +					reg = < 0x80000 0x1F80000 >;
> +					label = "alt-obmc-ubi";
> +				};
> +		};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi 
> b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi
> new file mode 100644
> index 0000000..0059ad1
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi
> @@ -0,0 +1,18 @@
> +		label = "bmc";
> +		partitions {
> +				#address-cells = < 1 >;
> +				#size-cells = < 1 >;
> +				compatible = "fixed-partitions";
> +				u-boot@0 {
> +					reg = < 0 0x60000 >;
> +					label = "u-boot";
> +				};
> +				u-boot-env@60000 {
> +					reg = < 0x60000 0x20000 >;
> +					label = "u-boot-env";
> +				};
> +				obmc-ubi@80000 {
> +					reg = < 0x80000 0x1F80000 >;
> +					label = "obmc-ubi";
> +				};
> +		};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts 
> b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index c51e3e8..058b9b7 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -191,7 +191,7 @@
>  		label = "bmc";
>  		m25p,fast-read;
>  		spi-max-frequency = <50000000>;
> -#include "openbmc-flash-layout.dtsi"
> +#include "aspeed-bmc-opp-flash-layout-ubi.dtsi"
>  	};
>  
>  	flash@1 {
> @@ -199,6 +199,7 @@
>  		label = "alt";
>  		m25p,fast-read;
>  		spi-max-frequency = <50000000>;
> +#include "aspeed-bmc-alt-opp-flash-layout-ubi.dtsi"
>  	};
>  };
>  
> -- 
> 1.8.3.1
> 
>
