Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Yc+dA1rK"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Y9xZKhct"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 448skp42YWzDqHW
 for <openbmc@lists.ozlabs.org>; Thu, 28 Feb 2019 10:45:54 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 32E5B231CD;
 Wed, 27 Feb 2019 18:45:52 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 27 Feb 2019 18:45:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:cc:subject
 :content-type; s=fm2; bh=GBRGlKeOCKln3lXOLnOdWjn0rdeSiD1/42rdPBz
 //oc=; b=Yc+dA1rKmePdBDdES6XSVR7e4cWCzW/Xj9UV/bLEyPNj7Su0flVM79L
 yk4xTkEFcGcuDlyUtl8IdLkFj8Pbmyvf62tyPuTJ6QpFDxILWAsfcHyyiZOzLISZ
 o3g2pz9wln1ehy6rDCYfOxH+2nBvoCD9l8SoeFL1kUebr3rtM5pvrcoVAj7GvdRV
 U7fgoKBWyE3Kd7hzEyG6+5NpgMGzy7sWIGr81RyXpUJ6MbnFagksY5T74ixSdjuU
 NxoPAzVWTU1lGEwL7rJvp/8/e97P1f1CRBCUenQI651mmeDv09hbUV5oA5bIKWDD
 tb51T/y8a5I5cUXJOaZIR6CUiFk7AKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GBRGlKeOCKln3lXOL
 nOdWjn0rdeSiD1/42rdPBz//oc=; b=Y9xZKhctwRbJaIpJkJ7ZCndNpJO/TQMJx
 Dmgm3cvYMQnfNbNHfFvRVr3o5gOVtdd8vcR9cycMpltFjIw7wW7E0npSfaR1lmz/
 2uYbM64L0XWE6Yj1kwhJ+TyND4l3D0uWPXxovHUUz0bgeZ/HgaK3apnBbb1Ncfhs
 0l/4WmC5TMgUOuTVw8a5BYsFXpj/jAGO9dv8RUqbh1lbOycqZQzHlxoKvavoFHRD
 CRY3KoFz6Hjj+OLgJ9Rv9f17mcqJ5wnhVYiqzKue0RU2CV48C/2DR/nAtJxlOKXl
 yAo3gha/TiwWqe03mGZmbHIZp/n9VJmrmJHG90eDJZrjVNWVFw6+A==
X-ME-Sender: <xms:LiF3XIrkv1vMhxzzOVB2a3yEG2A5SUhOIEHSbKF7oYCdFu55wxsngQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrvddvgddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgurhgv
 ficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfu
 ihiivgeptd
X-ME-Proxy: <xmx:LiF3XIpoKUiZ28orY8nh7lrt4ydyeYVixFyoLyvDdrDHSU9wGRqbHw>
 <xmx:LiF3XD0NBCE-4sDNfYsCIpbPHFH3K0ibwi0PhFjewVkxIKzGgInSXw>
 <xmx:LiF3XOFukq1PF_wEpvkVYWyYs3NKlI_nckVl1BUIu1eeXBYuStH5uA>
 <xmx:MCF3XJIOhuRlHMh-XoyhavOmnAM_am6hWIquhh1w-NupCN48E2xZjQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3AF017C1EB; Wed, 27 Feb 2019 18:45:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-895-g0d23ba6-fmstable-20190213v1
X-Me-Personality: 52947553
Message-Id: <3b16cffb-c442-4b1e-aed0-7c45157967e7@www.fastmail.com>
In-Reply-To: <20190227095233.6655-1-fran.hsu@quantatw.com>
References: <20190227095233.6655-1-fran.hsu@quantatw.com>
Date: Wed, 27 Feb 2019 18:45:48 -0500
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "fran.hsu" <fran.hsu@quantatw.com>, "Joel Stanley" <joel@jms.id.au>,
 "Benjamin Fair" <benjaminfair@google.com>,
 "Emily Shaffer" <emilyshaffer@google.com>
Cc: openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_dev-4.19_v3]_Fix_the_name_of_the_include_file._It_i?=
 =?UTF-8?Q?s_a_typo._Signed-off-by:_FranHsu_<Fran.Hsu@quantatw.com>?=
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
X-List-Received-Date: Wed, 27 Feb 2019 23:45:55 -0000



On Wed, 27 Feb 2019, at 20:26, fran.hsu@quantatw.com wrote:
> From: FranHsu <Fran.Hsu@quantatw.com>
> 

Missing the Signed-off-by line.

However, this patch should be squashed into patch 1. Please
do so and send a v2.

Cheers,

Andrew

> ---
>  arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts 
> b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> index 411387ee2f62..998a7d451b7d 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> +++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> @@ -3,7 +3,7 @@
>  
>  /dts-v1/;
>  #include "nuvoton-npcm730.dtsi"
> -#include "nuvoton-npcm733-gsj-gpio.dtsi"
> +#include "nuvoton-npcm730-gsj-gpio.dtsi"
>  / {
>  	model = "Quanta GSJ Board (Device Tree v2))";
>  	compatible = "nuvoton,npcm750";
> -- 
> 2.21.0
> 
>
