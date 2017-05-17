Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wSG5v2d99zDqQ8
 for <openbmc@lists.ozlabs.org>; Wed, 17 May 2017 10:53:39 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3wSG5v0Md5z9s7M;
 Wed, 17 May 2017 10:53:38 +1000 (AEST)
Subject: Re: [PATCH] witherspoon: leds: Use underscore in led names than hyphen
To: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <1494407411-2614-1-git-send-email-vishwa@linux.vnet.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <dcb1228b-6c75-4c5d-ff6f-b44f72c56b24@ozlabs.org>
Date: Wed, 17 May 2017 08:53:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1494407411-2614-1-git-send-email-vishwa@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 17 May 2017 00:53:39 -0000

Hi Vishwa,

[reply-to-all this time, sorry for the duplicate, Vishwa]

> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -50,15 +50,15 @@
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		rear-fault {
> +		rear_fault {
>  			gpios = <&gpio ASPEED_GPIO(N, 2) GPIO_ACTIVE_LOW>;
>  		};

This is somewhat contrary to device-tree convention, where nodes (and
properties, and compatible values) are generally hyphen-separated.

Can we deal with this another way? Perhaps we can use the '%I' specifier
in the systemd unit file, which bypasses the escaping?

Cheers,


Jeremy
