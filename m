Return-Path: <linux@roeck-us.net>
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vy85H4CQ0zDq5W
 for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2017 22:52:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="ugjOfIdh";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kW2iYLZPCJA5tHFfVybhDcznGwLQKzKdtFjR8kej7qo=; b=ugjOfIdhMfalDEmx0afrI6DZOi
 Hi67tcrHOmbvFL5UHt9lRbmB+AzE60PNO6E39ca0dhElAUUsKrrJljmcnQ1Lyo+c4iO6bh8pOlb+G
 nI3fjZ2NuVlZXWZMHQE+7Czhg/D+5ga+7lR4zKvJtxCKV0oEgqbXYffX6zCSPSfoPhxDFCqTF3E1o
 ZlHCDkClo9eUFqpXNP560d0a7YPz+lnInacnX6u+PtdZzd8U1v3VYAZE7NKx7dYtJdCaWnwSfrGRQ
 tK9m9fgXaASTaWeEXj6AC/vyUxDThoY8bcnofvPCCZ8h+tbxsp7tpdW+Y7mUcjn46EIMALB0bDKuh
 8Yvqlhkg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:45216 helo=server.roeck-us.net)
 by bh-25.webhostbox.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.87) (envelope-from <linux@roeck-us.net>)
 id 1cvNwk-003Wp4-Mh; Tue, 04 Apr 2017 12:52:31 +0000
Subject: Re: [PATCH linux v6 1/2] Documentation: dt-bindings: Document
 bindings for ASPEED AST2400/AST2500 PWM and Fan tach controller device driver
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 joel@jms.id.au, jdelvare@suse.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, corbet@lwn.net,
 linux-doc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org
References: <20170403233025.26952-1-jaghu@google.com>
 <20170403233025.26952-2-jaghu@google.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <2a7035fe-25ac-e0da-4f18-958eb20a1dc8@roeck-us.net>
Date: Tue, 4 Apr 2017 05:52:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170403233025.26952-2-jaghu@google.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated_sender: linux@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
 linux@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: linux@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
X-List-Received-Date: Tue, 04 Apr 2017 12:52:36 -0000

On 04/03/2017 04:30 PM, Jaghathiswari Rankappagounder Natarajan wrote:
> This binding provides interface for adding values related to ASPEED
> AST2400/2500 PWM and Fan tach controller support.
> The PWM controller can support upto 8 PWM output ports.
> The Fan tach controller can support upto 16 tachometer inputs.
>
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>

Applied with Acked-by: From Rob (for v5 with the requested changes made).

Thanks,
Guenter

> ---
>  v6:
> - Changed to aspeed,fan-tach-ch
>
>  v5:
> - Changed the naming scheme to aspeed,ast2400/2500-pwm-tacho
> - Removed gpio pin muxing
> - Added aspeed vendor prefix for fan-tach-ch
> - Changed to fan@0/1
> - Changed reg to 32 bits
>
>  v4:
> - Used 'reg'
>
>  v3:
> - Made the structure more common
>
>  v2:
> - Removed '_' in node and property names
> - Gave some explanation for the properties used
>
>  .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
>
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> new file mode 100644
> index 000000000000..ac0a69ab0755
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> @@ -0,0 +1,68 @@
> +ASPEED AST2400/AST2500 PWM and Fan Tacho controller device driver
> +
> +The ASPEED PWM controller can support upto 8 PWM outputs. The ASPEED Fan Tacho
> +controller can support upto 16 Fan tachometer inputs.
> +
> +There can be upto 8 fans supported. Each fan can have one PWM output and
> +one/two Fan tach inputs.
> +
> +Required properties for pwm-tacho node:
> +- #address-cells : should be 1.
> +
> +- #size-cells : should be 1.
> +
> +- reg : address and length of the register set for the device.
> +
> +- pinctrl-names : a pinctrl state named "default" must be defined.
> +
> +- pinctrl-0 : phandle referencing pin configuration of the PWM ports.
> +
> +- compatible : should be "aspeed,ast2400-pwm-tacho" for AST2400 and
> +	       "aspeed,ast2500-pwm-tacho" for AST2500.
> +
> +- clocks : a fixed clock providing input clock frequency(PWM
> +	   and Fan Tach clock)
> +
> +fan subnode format:
> +===================
> +Under fan subnode there can upto 8 child nodes, with each child node
> +representing a fan. If there are 8 fans each fan can have one PWM port and
> +one/two Fan tach inputs.
> +
> +Required properties for each child node:
> +- reg : should specify PWM source port.
> +	integer value in the range 0 to 7 with 0 indicating PWM port A and
> +	7 indicating PWM port H.
> +
> +- aspeed,fan-tach-ch : should specify the Fan tach input channel.
> +                integer value in the range 0 through 15, with 0 indicating
> +		Fan tach channel 0 and 15 indicating Fan tach channel 15.
> +		Atleast one Fan tach input channel is required.
> +
> +Examples:
> +
> +pwm_tacho_fixed_clk: fixedclk {
> +	compatible = "fixed-clock";
> +	#clock-cells = <0>;
> +	clock-frequency = <24000000>;
> +}
> +
> +pwm_tacho: pwmtachocontroller@1e786000 {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	reg = <0x1E786000 0x1000>;
> +	compatible = "aspeed,ast2500-pwm-tacho";
> +	clocks = <&pwm_tacho_fixed_clk>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
> +
> +	fan@0 {
> +		reg = <0x00>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +	};
> +
> +	fan@1 {
> +		reg = <0x01>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x01 0x02>;
> +	};
> +};
> --
> 2.12.2.715.g7642488e1d-goog
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
