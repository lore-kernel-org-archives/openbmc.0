Return-Path: <linux@roeck-us.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=roeck-us.net
 (client-ip=208.91.199.152; helo=bh-25.webhostbox.net;
 envelope-from=linux@roeck-us.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="f/s6OuIq";
 dkim-atps=neutral
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wMGR3qj9zDr43
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 04:10:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OCZdEQGnSoqU+WlKWC9w1bPmFq6sAKNV1Vte1YWXrPI=; b=f/s6OuIqjUQipDaCBXXRU6RErB
 sjjYN8Co6UAl9qFstvqwaPI9cQmkM0i83nuSMlyq2MkbPaZvhdnDt1WVM41PwtvzxKuSWVy6Az1LH
 OfC4U9oOtjvRNMBmOYzKVjnuMczN4wZ09+XeIibtyoLjBaiBICauObhFitF7LWTuTLGTR9+Tn/kuY
 GdxyQm4fV9iGT8g0LA2XtVzEBNAGVrCWZfjknxJfj7JJi79nNrXkhpVT16GkfzSaSxK4aZs7eWwMw
 uQgOQhj0V4QGa/+PO1Km58MFa86QyC98bWoGLmuNu2IHnh7Wy5Tcj0JvsE5hZqNmVjAujaxqZQGP+
 To40ZDhQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:35852 helo=localhost)
 by bh-25.webhostbox.net with esmtpa (Exim 4.89)
 (envelope-from <linux@roeck-us.net>)
 id 1fNhwN-002Q40-6P; Tue, 29 May 2018 16:57:43 +0000
Date: Tue, 29 May 2018 09:57:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, jdelvare@suse.com,
 avifishman70@gmail.com, yuenn@google.com, brendanhiggins@google.com,
 venture@google.com, joel@jms.id.au, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH v1 1/2] dt-binding: hwmon: Add NPCM7xx PWM documentation
Message-ID: <20180529165742.GE2162@roeck-us.net>
References: <1527588141-18639-1-git-send-email-tmaimon77@gmail.com>
 <1527588141-18639-2-git-send-email-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527588141-18639-2-git-send-email-tmaimon77@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
 guenter@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
X-List-Received-Date: Tue, 29 May 2018 18:10:40 -0000

On Tue, May 29, 2018 at 01:02:20PM +0300, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM7xx Pulse Width Modulation (PWM) controller.
> 

As mentioned in the other commit, this should be a pwm driver,
not a hwmon driver.

Guenter

> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../devicetree/bindings/hwmon/npcm7xx-pwm.txt      | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/npcm7xx-pwm.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/npcm7xx-pwm.txt b/Documentation/devicetree/bindings/hwmon/npcm7xx-pwm.txt
> new file mode 100644
> index 000000000000..2d8a7ccdc8cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/npcm7xx-pwm.txt
> @@ -0,0 +1,25 @@
> +Nuvoton NPCM7xx Pulse-width modulation (PWM) controller device driver
> +
> +The NPCM7xx has two identical PWM controller modules,
> +Each module has four PWM controller outputs.
> +NPCM7xx PWM controller module 0 outputs PWM0-3 and NPCM7xx PWM controller
> +module 1 outputs PWM4-7.
> +
> +Required properties:
> +- compatible	: "nuvoton,npcm750-pwm" for Poleg NPCM7XX.
> +- reg		: Offset and length of the registers set for the device.
> +- clocks	: phandle of pwm reference clock.
> +- pinctrl-names	: a pinctrl state named "default" must be defined.
> +- pinctrl-0 	: phandle referencing pin configuration of the PWM ports.
> +
> +pwm:pwm@f0103000 {
> +	compatible = "nuvoton,npcm750-pwm";
> +	reg = <0xf0103000 0x50
> +		0xf0104000 0x50>;
> +	clocks = <&clk NPCM7XX_CLK_APB3>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pwm0_pins &pwm1_pins
> +			&pwm2_pins &pwm3_pins
> +			&pwm4_pins &pwm5_pins
> +			&pwm6_pins &pwm7_pins>;
> +};
> -- 
> 2.14.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
