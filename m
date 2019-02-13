Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="AWUL/5xY"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="BojaazZd"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 440F1C0slDzDqVh
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 09:43:26 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 54191231BB;
 Wed, 13 Feb 2019 17:43:24 -0500 (EST)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Wed, 13 Feb 2019 17:43:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:mime-version:content-transfer-encoding
 :content-type:subject:in-reply-to:references:date; s=fm2; bh=f8a
 PEkHGf6Kr5UdFaf8XWUPK0xFca3Sy45EPMzk2Ohs=; b=AWUL/5xY3wnnBiVJAH0
 Mkh2Dbpszw+zN972hNC8/sJvOtZpf+JGY8jY+umHGZ80KFaGTMoL+a+lnEWA7EaI
 D2ISfpmj9ma91/eM0J/ZT9taoem4vQfs8NkF9fqSajsz/kMCzvMO4FKyqNdu14uu
 95f5UnUR42VCvdxVYZjMKC1IjMhuqTxjVg5c7Exa/pFZuAW5lO1i8VhjnuuswLxw
 z5o0lbcGmosKk/gEIPcwRV7Y2seWItowFCi8ASi7hhhrsLCa7/5Sp2kceweJjnRi
 cx4omQxqo+ZEI9ISZpnC6D4Ft9aVWW6ZYT0qN8lbDMeYvvUmWwhCIG3CmQS6y3ks
 Duw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=f8aPEkHGf6Kr5UdFaf8XWUPK0xFca3Sy45EPMzk2O
 hs=; b=BojaazZdGBoXDGPtbsMMsJFQaREVYAroIspBI/0KaOrcs6AkojZLAmfck
 Onu7lyKsai3nzuAEs2Ojh5+O0G1WhWd9dssJlEt1n9PEdG+9ZZJU4LsxPmgz9Qjj
 rhV5ciBv87gWhpdbnf63FQLCeNoSJ9TLibzIGBsITqZ5CbNF4ATQdrbeLaSAZMXw
 d947qIWOIfpgESEWTi5A++8+vOKN+cI+hLYJGv2U7EvuYVWe/Th3Ao5SkZT3i+lu
 rPjduKOU1iQbqvQ+lKgQrNm4buu1arbIRUPOvY8YNc/ZPLNAG5xpYJjZu9WpS/1N
 DJneWRnVZpqR4xF8+Wbdz4yDlZTIw==
X-ME-Sender: <xms:jJ1kXIvlevkc2tE0p6YJzPVhdyodZYBUw_hJMLQVR_i-OZyIOAhtbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledruddtfedgudeiiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecu
 fedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkffhvfgggf
 gtoffujghfffesthejredtredtjeenucfhrhhomheptehnughrvgifucflvghffhgvrhih
 uceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:jJ1kXMxueKvzjQKTovtlCO9w-BPRXuf2QSuCHO_fL1D_83CLxpBPMQ>
 <xmx:jJ1kXIcxkhzfxJMJjpgdt-UEA1qOHBeciE3llGaI-CcbCiQTUNbWCQ>
 <xmx:jJ1kXENP0lKM9XQVMn7oa0YLFSvWJfZMDHg3figVeQro7Iuk8gNWnA>
 <xmx:jJ1kXNgvvhPtdrKmhbHkZzHmXtbGkQpkeuU1jXOBQsO5ZfwHSbg1Jw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id E9498942D4; Wed, 13 Feb 2019 17:43:23 -0500 (EST)
Message-Id: <1550097803.1007491.1657535928.051F6319@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: AKASH G J <akashgj91@gmail.com>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-e97eb308
Subject: Re: Unable to read or write from system SPI flash memory.
In-Reply-To: <CAE33tLGC==CvoJLBV+jUnp=RiFph7wxa0q2o6ZfhrqaNMZtBCQ@mail.gmail.com>
References: <CAE33tLGC==CvoJLBV+jUnp=RiFph7wxa0q2o6ZfhrqaNMZtBCQ@mail.gmail.com>
Date: Thu, 14 Feb 2019 09:13:23 +1030
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
X-List-Received-Date: Wed, 13 Feb 2019 22:43:30 -0000

On Wed, 13 Feb 2019, at 19:24, AKASH G J wrote:
> Hi all,
> 
> We have a test board containing BMC Aspeed AST-2500. It contains BMC flash
> memory, SPI1 flash memory and SPI2 flash memory. we are using zaius machine
> configuration for building Linux. When I am trying to write to SPI1 flash
> at address 30000000 using pflash tool, the modified data is not reflected
> after reboot. Same with SPI2 flash. With pflash tool I am able to write
> data permanently to BMC flash memory. The device tree for SPI devices is
> following.
> 
> &fmc {
>     status = "okay";
> 
>     flash@0 {
>         status = "okay";
>         label = "bmc";
>         m25p,fast-read;
>         spi-max-frequency = <50000000>;
> #include "openbmc-flash-layout.dtsi"
>     };
> };
> 
> &spi1 {
>     status = "okay";
>     pinctrl-names = "default";
>     pinctrl-0 = <&pinctrl_spi1_default>;
> 
>     flash@0 {
>         status = "okay";
>         label = "pnor";
>         m25p,fast-read;
>         spi-max-frequency = <100000000>;
>     };
> };
> 
> &spi2 {
>     status = "okay";
>     pinctrl-names = "default";
>     pinctrl-0 = <&pinctrl_spi2ck_default
>              &pinctrl_spi2cs0_default
>              &pinctrl_spi2cs1_default
>              &pinctrl_spi2miso_default
>              &pinctrl_spi2mosi_default>;
> 
>     flash@0 {
>         status = "okay";
>     };
> };

How are you invoking pflash? You should not be using the /dev/mem backend
when you have the flash controller and devices enabled via the devicetree. You
should be using the mtd backend instead.

Andrew
