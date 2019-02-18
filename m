Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="of1/bEGF"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="5OlEc1XP"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 442p953DVjzDqLN
 for <openbmc@lists.ozlabs.org>; Mon, 18 Feb 2019 13:44:09 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BF0A721E32;
 Sun, 17 Feb 2019 21:44:05 -0500 (EST)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Sun, 17 Feb 2019 21:44:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:date:in-reply-to:subject:references; s=fm2; bh=pdz
 kbjUXa9O+7r3i92SCkJjuL7SVip2fn8mvgvdf8d4=; b=of1/bEGF5jpw7o8bqQk
 sDY3RB8GJfvSfBdRwvf6ctMKVqeFGQNqtAYKyE/qA6B3mnHDEeJqrz25KwhkdlXO
 qGy6yzIqeZFIOtZPDzZvHme4uzPEEYEfpamGPl/6RIaHIdkrsnU+IxE4pYkkK8f7
 wm2szC2u+pzJSfXdCHXniU66V8ShX8NZve3OcqbQ35EiMZuEInEWcdxQ0/pzTB7l
 jnHLyfNwQd+ldCZHIDGp3BASq3qntnyYCJmkndqLYrBADVRB8BBpuDeK+3BjrGaD
 wcdWa9oWKGi3OcUQ0sOEpzexEIcalOxiOlbXNwHo5X9GXtTaPEsuRZ7yc3g2/j2F
 5mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=pdzkbjUXa9O+7r3i92SCkJjuL7SVip2fn8mvgvdf8
 d4=; b=5OlEc1XPCIxV55cFIgAGjuwHPSIp64swvGEKdRdqL/adf3Y82pUFEXkty
 4Dd/Et28Mllglq6uq4SnXSxsLP5dmHk87na/l1flaoPCYuMujewUvXywgCjRgfPo
 lAbWKC0WixerB4X96AiiGAYODvBG6XhaKQAPaXm3d/jm7jYZhCsHwWPyuVO2EGJs
 UP2UeH/Rj3XrJCjmLz8sQPFaHZTs97TZEScK3aMwYcncF+pgI5q893FjcQM4MMxy
 MrzPkyTfDacNq57OuN4gySmzAVfZEAgCFKVwBxMqPyIxpPaHjN3qFKy6QI6BsHAZ
 P6ZRvlMX+atdvhwP9FQqTsl0g5eIg==
X-ME-Sender: <xms:9RtqXA1rPL_D8oNdi1leVghlPauUqfsBdloevqo75YWh0p16Hjxx5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrudduvddgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
 tddtnecunecujfgurhepkffhvfgggfgtofffjgfufhesthejredtredtjeenucfhrhhomh
 eptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluh
 hsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:9RtqXNbm3Ed0TMLTcJP9FZvhSvD7TTAPU96fAZ31TRthjyyayQ8_ZQ>
 <xmx:9RtqXHnqjY4FrRhAxAw5vDVWf59OtCYHolCOh7wPMZMwBJeffIlA-A>
 <xmx:9RtqXGyhzsH5FWK_aBdhgY5cVNNK9rE0oABRc8RBwhP6SQ4PiRTtvQ>
 <xmx:9RtqXG0NylFWeEtBAIKhOLf5BnjL5YNRVxRqgxAyRc0YDNpJp1Cldg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id E0C93941EB; Sun, 17 Feb 2019 21:44:04 -0500 (EST)
Message-Id: <1550457844.2789624.1659886200.097ABDDD@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Lei YU <mine260309@gmail.com>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-e97eb308
Date: Mon, 18 Feb 2019 13:14:04 +1030
In-Reply-To: <1550216841-57006-1-git-send-email-mine260309@gmail.com>
Subject: Re: [PATCH linux dev-4.19] ARM: dts: palmetto: Fix flash_memory region
References: <1550216841-57006-1-git-send-email-mine260309@gmail.com>
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
X-List-Received-Date: Mon, 18 Feb 2019 02:44:09 -0000



On Fri, 15 Feb 2019, at 18:17, Lei YU wrote:
> The flash_memory region was incorrect and exceeds AST2400's RAM range.
> Fix it by putting it before coldfire region, and aligned with 32MiB.
> 
> Signed-off-by: Lei YU <mine260309@gmail.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/
> boot/dts/aspeed-bmc-opp-palmetto.dts
> index 9285b90..50c9178 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -32,9 +32,9 @@
>  			no-map;
>  		};
>  
> -		flash_memory: region@98000000 {
> +		flash_memory: region@5c000000 {
>  			no-map;
> -			reg = <0x98000000 0x01000000>; /* 16MB */
> +			reg = <0x5C000000 0x02000000>; /* 32MB */
>  		};
>  	};
>  
> -- 
> 2.7.4
> 
