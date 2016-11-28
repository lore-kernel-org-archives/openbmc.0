Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x243.google.com (mail-vk0-x243.google.com
 [IPv6:2607:f8b0:400c:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tRxFP076gzDsgy
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 17:13:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hLPHNPTM"; 
 dkim-atps=neutral
Received: by mail-vk0-x243.google.com with SMTP id w194so4457636vkw.3
 for <openbmc@lists.ozlabs.org>; Sun, 27 Nov 2016 22:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=pXkYm9E/LHA/8XlXGmne71TLMQ0W3841kATZT1bqA6w=;
 b=hLPHNPTMxTZQdj3BLpNhrM30Rg39eqO7eF0bbzPfc52yrxGQK3GC8JmN0ZvsA0HOgZ
 VhG4tmCxhcP5fNWal4mwXRFcM05/k61YOUmdcIyc+dggUNPMgfE1p65rT5OnV/kA8uNN
 c+Hg0zKX9ffwocKY/nOrH2H6hAaoWd6xGLGp2b9SwTlRb3LAOaYYUIOWDsG5P0l8Qzoy
 Qc2ehR3ccozh6+qusuSKFHPHJBGySHGhNCPFgfKQOmR1UK8t6ATGvx0peKmZ4YUEpL7N
 6CNCo5U25yDB6ItN3ioHdQc19eX2gt+SaOXtIOAsUdOqVXDc9vFxNMro4vnldWk543kR
 Tf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=pXkYm9E/LHA/8XlXGmne71TLMQ0W3841kATZT1bqA6w=;
 b=JD+S+IO+i+h1Ib6dVvXnu3yaFx5Ie8mTw3n+Pg5yf09OWimwMhkI4oDf3WcqwgKAJ4
 roIf1JwjbhSSwmn6jEG2YY1eXkp/prEoz0LSGAb8otXXLVU3uS0FhvST8wWIbMpsxEYl
 zm5vg3rGZ5lDLydVzSnv7bfDTUEVbS2RQUl785B5CephhZAkecHRNub6gXy99tUWHFaB
 x8YMSnWed1ORpHFZ0aeWs5G52uvLPsmlC6ybIW6idF/fevqyH/aHpGkPWHy0s7WOsehL
 CXOsef370Dogf8YBoSAOWyLyN2YjeL0r4BcphPVV8hWQqlRLbyFP5FJYG3gs08vXlf7L
 Hmxg==
X-Gm-Message-State: AKaTC03bTtWLAyqrDXmPIvJl2/ud0k8HGsFLyrwxBGmDKS6rHj10SHZzJ1uEutzOrT/+yVhtlrh5u3YUf6d/UQ==
X-Received: by 10.31.130.20 with SMTP id e20mr5744747vkd.149.1480313606495;
 Sun, 27 Nov 2016 22:13:26 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.0.193 with HTTP; Sun, 27 Nov 2016 22:13:06 -0800 (PST)
In-Reply-To: <1479979610-2958-2-git-send-email-jaghu@google.com>
References: <1479979610-2958-1-git-send-email-jaghu@google.com>
 <1479979610-2958-2-git-send-email-jaghu@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Nov 2016 16:43:06 +1030
X-Google-Sender-Auth: tbW4jbC7iov2hLv3J_W0ujC6_ZU
Message-ID: <CACPK8XeupDp2_1wKZEJ7hyU5eLi-KYKJ28haUALHV+2fNPMVdA@mail.gmail.com>
Subject: Re: [PATCH linux v3 1/3] Documentation: dt-bindings: Document binding
 for ASPEED AST2400/2500 PWM support
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Mon, 28 Nov 2016 06:13:29 -0000

Hello Jaghu,

This is the first time I've had a close look at the binding document.
Note that I'm not a device tree expert. I do have some suggestions
below that you might want to look at before we send this upstream.

On Thu, Nov 24, 2016 at 7:56 PM, Jaghathiswari Rankappagounder
Natarajan <jaghu@google.com> wrote:
> This binding provides interface for adding values related to ASPEED
> AST2400/2500 PWM support.
> The parent node indicates a PWM controller. The parent node can have
> upto 8 child nodes. Each node indicates a PWM output port.
> PWM clock types M, N and 0 are three types just to have three independent
> PWM sources. Each port can be assigned a different PWM clock type.
> Each port can have the duty-cycle set to a different value.
>
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
> ---
> v2:
> - Made binding documentation update as a separate patch.
> - Included AST2500 in the description.
> - Changed format to "aspeed,ast2500-pwm".
> - Included explanation for types M ,N and O and calculation example to
> -  determine L, H, and period bits.
>
> v3:
> - Included struct clk and phandle reference to clock node.
> - Removed clock calculation description from the bindings document.
> - Added some whitespace and improved style of binding document.
>
>  .../devicetree/bindings/hwmon/aspeed-pwm.txt       | 104 +++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm.txt
>
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm.txt
> new file mode 100644
> index 0000000..11a007c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm.txt
> @@ -0,0 +1,104 @@
> +ASPEED AST2400/AST2500 PWM device driver
> +
> +The ASPEED PWM controller can support 8 PWM outputs.
> +PWM clock types M, N and 0 are three types just to have three
> +independent PWM sources. Each could be assigned to the 8 PWM port
> +with it's own settings.
> +
> +Required properties:
> +- #address-cells : should be 1.
> +
> +- #size-cells : should be 1.
> +
> +- reg : address and length of the register set for the device.
> +
> +- pinctrl-names : a pinctrl state named "default" must be defined.
> +
> +- pinctrl-0 : phandle referencing pin configuration of the ASPEED PWM ports.
> +
> +- compatible : should be "aspeed,ast2400-pwm" for AST2400 or
> +  "aspeed,ast2500-pwm" for AST2500.
> +
> +- clocks : phandle reference to clocks. upto three fixed clocks providing
> +  three different input clock frequencies. each clock frequency indicates a
> +  desired PWM frequency.
> +
> +   the first PWM frequency in combination with type M PWM period value
> +    (described below) and source clock frequency will be used to calculate the
> +    type M PWM clock division high and low values.

I can't see where you describe what a "type M PWM period value" is.
Can you teach me?

> +   the second PWM frequency in combination with type N PWM period value and
> +    source clock frequency will be used to calculate the type N PWM clock
> +    division high and low values.
> +   the third PWM frequency in combination with type O PWM period value and
> +    source clock frequency will be used to calculate the type O PWM clock
> +    division high and low values.
> +
> +  Since atleast one PWM frequency or one PWM clock type(type M PWM clock type)
> +  is required, the first clock is required. the other two are optional.
> +
> +- pwm_typem_period : indicates type M PWM period. integer value in the range
> +  0 to 255.
> +
> +Optional properties:
> +- pwm_typen_period : indicates type N PWM period. integer value in the range
> +  0 to 255.
> +
> +- pwm_typeo_period : indicates type O PWM period. integer value in the range
> +  0 to 255.
> +
> +Each subnode represents a PWM output port.
> +
> +Subnode Format
> +--------------
> +Required properties:
> +- pwm_port : indicates the PWM port. values 0 through 7 indicate PWM ports
> +  A through H respectively.

Should we instead use a reg cell to indicate this?

> +
> +- pwm_enable : option to enable the PWM port indicated above. 0 is enable
> +  and 1 is disable.

It looks like you're using this as a boolean. I don't think that
upstream will accept this use of the device tree. What does "enable"
mean? Can we use the device tree convention of status =
"disabled"/"okay" to indicate if the driver should bind to this device
and enable the hardware?

> +
> +- pwm_type : indicates the clock type for the PWM port. value 0 is type M
> +  PWM clock. value 1 is type N PWM clock. value 2 is type O PWM clock.

Could we instead indicate this type in the compatible string?

> +
> +- pwm_fan_ctrl : pulse width modulation fan control. integer value
> +  in the range 0 to 255. 255 is max or 100%.

> +
> +Additional details are available in the detailed datasheet for the device
> +AST2400/AST2500.

I don't think this comment is useful, as anyone reading it will not
necessarily have access to the data sheet.

> +
> +Examples:
> +
> +clocks {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       pwm_typem_clock: fixedclk {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <25000>;
> +       }

This is not what I meant about the clocks. See my comments in patch 2.

It does raise a separate point. Does the clock frequency value (25000)
describe a property of how the hardware is configured? If so, we might
want to keep it in the device tree, just differently.
