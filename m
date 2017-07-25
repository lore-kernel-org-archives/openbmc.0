Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGtrM4SMkzDqm2
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 19:54:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="iNUlkzA1"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="JJSqrL2J"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7816C20BAF;
 Tue, 25 Jul 2017 05:54:41 -0400 (EDT)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Tue, 25 Jul 2017 05:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=DL6t2s9mi1wpT8oy6lJp9vnSA0KuQ
 lxtLOZMsAFUGIg=; b=iNUlkzA1pOUikW25mutrjyLSr3a2dNTRy5Mpirq54KXc5
 nhA3nzrhMx5R9/2ThaOl75Fb+UqDYC4V2u1z+sYO7ILilyoA+MRBE3hFf6Eyiokw
 R/RvUY3FU2fIJ6LGhZSrRHVDiIjWyhNGiETo8JgQEhkTDlrHZhZTfzP1GzY6VExL
 r5B1oOsXaeOqjOfJNOuBWwIGyDJ7H6J7+1qkHyHGGYONdcXFmC6xQJjVUjyyVtAK
 e/dssmnxemdnUYFmY4vOavmqndu20/B5JFGSyraigvtNJenraYujxHCNkSqlBCZX
 amqPC93ycNkhIb85UwhF2nO96B2uDAIP+Dg/fJLVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=DL6t2s
 9mi1wpT8oy6lJp9vnSA0KuQlxtLOZMsAFUGIg=; b=JJSqrL2J8nzvN9tnG7qb0v
 q9BZcDmAInvqnO6HCriSMqj1RQLUq23wgdZmCUIeA5uZh795oTqJHReCP4aCiwOg
 4rr5izlSPsPP1ufZp1xt6XEwtoL/EV/eER4w/x8K3TCvLpaVBS7ph3RxefJs5q/+
 viBQC+AmAxH5490NInV/VDkuXK8syrqAzX3NLM9AQkf4aJv2aje9vtx0VsUnW5S6
 gdUxBTICxm5GpkaSdsBo6KKG74FI88d3q7TZQNicELnPuoVwzCSlfI7glHrECMZa
 vZ6mhEcCB0bKlTT3xshtGPLwAnmsdMZaM1MBwIDfu+zc/HvDfjUhaSt9UR2bTquA
 ==
X-ME-Sender: <xms:YRV3WfkRn0dENxTalgPtdUjnve0w6oO3J6ROu-AFAxj-6bQqDX8TUw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 4ADEA9477D; Tue, 25 Jul 2017 05:54:41 -0400 (EDT)
Message-Id: <1500976481.2257375.1051777576.34CF7DAC@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-c8af44bc
Subject: Re: [PATCH linux dev-4.10 v2] ARM: dts: aspeed: firestone: Fix i2c
 addresses
References: <20170725072447.1947-1-joel@jms.id.au>
Date: Tue, 25 Jul 2017 19:24:41 +0930
In-Reply-To: <20170725072447.1947-1-joel@jms.id.au>
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
X-List-Received-Date: Tue, 25 Jul 2017 09:54:44 -0000


On Tue, Jul 25, 2017, at 16:54, Joel Stanley wrote:
> With the 10 bit addresses we fail to probe.
> 
> After this change, the drivers correctly probe on a Firestone system with
> this
> kernel.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> v2:
>  - match node names to addresses
>  - fix tpm address
>  - add ucd, found this was present while browsing datasheet
> 
>  arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 33
>  +++++++++++++++-----------
>  1 file changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> index 794e8fafbd3e..3d4232975b7f 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -142,9 +142,9 @@
>  		reg = <0x50>;
>  	};
>  
> -       tmp423@98 {
> +       tmp423@4c {
>  		compatible = "ti,tmp423";
> -               reg = <0x80000098>;
> +               reg = <0x4c>;
>  	};
>  };
>  
> @@ -157,9 +157,9 @@
>  		reg = <0x50>;
>  	};
>  
> -       tmp423@98 {
> +       tmp423@4c {
>  		compatible = "ti,tmp423";
> -               reg = <0x80000098>;
> +               reg = <0x4c>;
>  	};
>  };
>  
> @@ -189,31 +189,36 @@
>  &i2c11 {
>  	status = "okay";
>  
> -       leds@c0 {
> +       leds@60 {
>  		compatible = "pca,pca9552led";
> -               reg = <0x800000c0>;
> +               reg = <0x60>;
>  		// led9 - led_fault_n
>  		// led10 - pwr_led_n
>  		// led11 - rear_id_led_n
>  	};
>  
> -       rtc@d0 {
> +       rtc@68 {
>  		compatible = "dallas,ds3231";
> -               reg = <0x800000d0>;
> +               reg = <0x68>;
>  	};
>  
> -       si5338a@e2 {
> +       si5338a@71 {
>  		// SiLabs clock generator
> -               reg =<0x800000e2>;
> +               reg =<0x71>;
>  	};
>  
> -       idt@d6 {
> +       idt@6b {
>  		// IDT 9DBV0641 clock buffer
> -               reg = <0x800000d6>;
> +               reg = <0x6b>;
>  	};
>  
> -       tpm@a3 {
> -               reg = <0x800000a3>;
> +       tpm@57 {
> +               reg = <0x57>;
> +       };
> +
> +       ucd@64 {
> +               compatible = "ti,ucd90160";
> +               reg = <0x64>
>  	};
>  };
>  
> -- 
> 2.13.3
> 
