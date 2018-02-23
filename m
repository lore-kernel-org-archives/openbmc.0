Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="P1+jzD01"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QdgXFcl9"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3znXtQ3FlrzF1m7
 for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2018 11:59:25 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E4BF221623;
 Thu, 22 Feb 2018 19:59:22 -0500 (EST)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Thu, 22 Feb 2018 19:59:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=JqlJ0zA5P240+nS8yNlp9HITeIG6h
 52hsiOz3SynKps=; b=P1+jzD01MVNHLADdAPsIxnEsL0N1zQHSlLQ0GrgTNh0K+
 f94sEyDtizR2El/lQglUIaiRVuEPpElaJFFA4mGInUox5O6iOlg1z7LNp512R6rm
 JX5/WTEJiWPhaBH6oK+niGD0Cppm/8DNiCXYxUWnUij52SqFy6vYaI2uIj73B7mr
 yTGZJOGfRA2GP14r5br2TvcYex5o50GsUXY/IKypmaoxZfsyxoKrB+lh3raYrhrS
 biH45BsvMhWSEWyZzlztG88BqfrkT+gtxTrOWRJMhWwDVx7dp5jKxLU1fMV2PpwO
 eF+gT07xQNgu+MX3mGl3Zs7ktB/wQ4bJiSlrYoNSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JqlJ0z
 A5P240+nS8yNlp9HITeIG6h52hsiOz3SynKps=; b=QdgXFcl9KVZBomQ5pbTswS
 B/cH7e7Pv7JSFBp4cZfBgIU/04SJvnS5aZtjcPon/xhuvV5gSYbrqGwqVxQrdi+E
 yV/q037+E6338PKbbv3YQ4IJgBVuETLXqAoYlhpFn/+y9OzLU6riwoIsaedYUu0l
 UeiIPDPliTCs5+64mKtC2Tqj40QBi/mf1UGREN4ZWYRL77jRR8eQ7x1oPCiiB1ai
 3mEwYyX2B3pWjlOEJusFwqx7TlfbfyBDI+17ZYodhlxk8HFx0xcHkr8W5akIBn2o
 WiX/UpoCzxzmTEB6jEm/RuVIyV4+tE/nTZwkeyhL08KoMCVKAcLP67HJylmKhT+A
 ==
X-ME-Sender: <xms:amePWvUfCXpaIGw39bwdUe88MGDnL8QUoBVMYgb1hn4ge-CccHVtxg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id B5F97BA43B; Thu, 22 Feb 2018 19:59:22 -0500 (EST)
Message-Id: <1519347562.1046507.1280382832.30C6065A@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-efbb3405
In-Reply-To: <1519162059-7210-2-git-send-email-eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH linux dev-4.13 1/2] Revert "ARM: dts: power9-cfam: Update
 OCC hwmon compatible"
References: <1519162059-7210-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1519162059-7210-2-git-send-email-eajames@linux.vnet.ibm.com>
Date: Fri, 23 Feb 2018 11:29:22 +1030
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
X-List-Received-Date: Fri, 23 Feb 2018 00:59:27 -0000

On Wed, 21 Feb 2018, at 07:57, Eddie James wrote:
> This reverts commit f370fa626a127aec50801dafcd595a2b5a47e482. The
> dts properties were correct for the OCC driver.
> ---
>  arch/arm/boot/dts/ibm-power9-cfam.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ibm-power9-cfam.dtsi b/arch/arm/boot/dts/
> ibm-power9-cfam.dtsi
> index e0e738f..c110417 100644
> --- a/arch/arm/boot/dts/ibm-power9-cfam.dtsi
> +++ b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
> @@ -113,7 +113,7 @@
>  			#size-cells = <0>;
>  
>  			occ@1 {
> -				compatible = "ibm,p9-occ-hwmon";
> +				compatible = "ibm,p9-occ";
>  				reg = <1>;
>  			};
>  		};
> @@ -205,7 +205,8 @@
>  					#size-cells = <0>;
>  
>  					occ@2 {
> -						compatible = "ibm,p9-occ-hwmon";
> +						compatible =
> +							"ibm,p9-occ";

A bit petty, but can we fix the whitespace here? Maybe Joel can fix it when it's applied.

Otherwise,

Acked-by: Andrew Jeffery <andrew@aj.id.au>

Cheers,

Andrew

>  						reg = <2>;
>  					};
>  				};
> -- 
> 1.8.3.1
> 
