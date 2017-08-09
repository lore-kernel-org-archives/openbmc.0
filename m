Return-Path: <linux@roeck-us.net>
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xRySN5G3tzDqy9
 for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2017 14:08:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="aPGRinrG";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IF5LUxh7vXI8Yh0KiCaGYhldbpv4E//ZI/hNEkJ6yTg=; b=aPGRinrGQkBC8T8LWAjRtJO8aF
 1W0UnlvdSFMg5tx0B3EMzEHXLa7O42e6irfKUm3w8D/60KqF64H3sWOf2CG+EDxn3qfisiD+fmf3Q
 ZjVy7wClBrc0HXGURvRyGsSAG1bcZS3hH6+7Sq43byyUhcGpaXCfmOn805XmXb7J8XDW4K1ogsGit
 x+5LU40NhiKhKYC5X/0RD2fAlYZzXt1Slq94gneqQW69xn90pJk7JZh677PuVlXlkLPieuwqvp5DF
 smcsidSJPU3kP8F8ULjBjXO6rnvFpp85hn41rzBi2aYOjQoYV7rD+Bn/TFIK9HEyS4JQPID9jsyUe
 bYxYAfKQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:50834 helo=server.roeck-us.net)
 by bh-25.webhostbox.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.89) (envelope-from <linux@roeck-us.net>)
 id 1dfIIb-002ugN-LB; Wed, 09 Aug 2017 04:08:50 +0000
Subject: Re: [patch v3 resend] Documentation: dt-bindings: aspeed-pwm-tacho
 cooling device.
To: Mykola Kostenok <c_mykolak@mellanox.com>, Rob Herring
 <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 openbmc@lists.ozlabs.org, Patrick Venture <venture@google.com>,
 Vadim Pasternak <vadimp@mellanox.com>, Ohad Oz <ohado@mellanox.com>
References: <20170803084650.22298-1-c_mykolak@mellanox.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <3c427ddd-aab6-13d4-bfb2-ae22848c0d13@roeck-us.net>
Date: Tue, 8 Aug 2017 21:08:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170803084650.22298-1-c_mykolak@mellanox.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
X-List-Received-Date: Wed, 09 Aug 2017 04:08:53 -0000

On 08/03/2017 01:46 AM, Mykola Kostenok wrote:
> It's add support for cooling device creation to
> aspeed-pwm-tacho.
> Cooling device could be bound to a thermal zone
> for the thermal control.
> 
> v1 -> v2:
>   - Fix commit message.
> v2 -> v3:
>   Pointed out by Rob Herring:
>   - Put cooling-levels under fan subnodes.
> 
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>

Did Rob ever Ack this patch ?

Note you didn't copy the hwmon mailing list, which doesn't exactly help
to keep track of it, and I may have lost Rob's Ack. My apologies if that
is the case.

Guenter

> ---
>   Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> index cf44605..367c820 100644
> --- a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> @@ -11,6 +11,8 @@ Required properties for pwm-tacho node:
>   
>   - #size-cells : should be 1.
>   
> +- #cooling-cells: should be 2.
> +
>   - reg : address and length of the register set for the device.
>   
>   - pinctrl-names : a pinctrl state named "default" must be defined.
> @@ -28,12 +30,17 @@ fan subnode format:
>   Under fan subnode there can upto 8 child nodes, with each child node
>   representing a fan. If there are 8 fans each fan can have one PWM port and
>   one/two Fan tach inputs.
> +For PWM port can be configured cooling-levels to create cooling device.
> +Cooling device could be bound to a thermal zone for the thermal control.
>   
>   Required properties for each child node:
>   - reg : should specify PWM source port.
>   	integer value in the range 0 to 7 with 0 indicating PWM port A and
>   	7 indicating PWM port H.
>   
> +- cooling-levels: PWM duty cycle values in a range from 0 to 255
> +                  which correspond to thermal cooling states.
> +
>   - aspeed,fan-tach-ch : should specify the Fan tach input channel.
>                   integer value in the range 0 through 15, with 0 indicating
>   		Fan tach channel 0 and 15 indicating Fan tach channel 15.
> @@ -50,6 +57,7 @@ pwm_tacho_fixed_clk: fixedclk {
>   pwm_tacho: pwmtachocontroller@1e786000 {
>   	#address-cells = <1>;
>   	#size-cells = <1>;
> +	#cooling-cells = <2>;
>   	reg = <0x1E786000 0x1000>;
>   	compatible = "aspeed,ast2500-pwm-tacho";
>   	clocks = <&pwm_tacho_fixed_clk>;
> @@ -58,6 +66,7 @@ pwm_tacho: pwmtachocontroller@1e786000 {
>   
>   	fan@0 {
>   		reg = <0x00>;
> +		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
>   		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
>   	};
>   
> 
