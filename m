Return-Path: <jaghu@google.com>
Received: from mail-pg0-x22f.google.com (mail-pg0-x22f.google.com
 [IPv6:2607:f8b0:400e:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vthsJ1nL2zDqJk
 for <openbmc@lists.ozlabs.org>; Thu, 30 Mar 2017 09:15:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BAXQiJ8c"; 
 dkim-atps=neutral
Received: by mail-pg0-x22f.google.com with SMTP id 81so19782862pgh.2
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 15:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=MkwYEVSgg3GRS4NaTlA2O/qZtNt9jhFyxrhg95yd54c=;
 b=BAXQiJ8cDsrdRBh9T7DoozuMezHxhXMOYOUDMtvqttqdiDoxKohmn9tlhf7SjYS5Bz
 faPaQE3rR5IZ8YviqU4GZNewNbAfrcVfsc86SB5LYErMR6AePVpwXDQu63YnXgoxOCIU
 Jw72y9/ID7XNy2mvItta4lXa4Ul9dc/n2pU5hbdXxYDyXWwz9RN/WI2AY6vtm/ZMrCwL
 2ZX2/umE7v1SrRWwt03INnr97TE3oUievdLC4VHBbXT+IsJkY8li+lXRN9a37VeuBhBL
 QKj8422gXinGIN/mkB3cT1uOHHPJjB6NY2AOFcRN/a6Og712LNL8uCbgHz8qpnM+wpBp
 1iEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=MkwYEVSgg3GRS4NaTlA2O/qZtNt9jhFyxrhg95yd54c=;
 b=nnYgRTYhlMraowaQCPvhCVIAqDJylw+sCKsE3hi+l2kcIagjsd/Nx6ljlIaoAY1CaM
 FJaI4uajVZ/ELthNiKBBuJgsAW8F3/5Q4F3PGP023Fz1uNyTieMlcWeMC1FyklpBgKuI
 9S3wo4Lv+cMQfbRwXtJn0cyKYpfker/+Q0a7alFhJ/N0BYkb7RxYSpb1ETLQwnY6JubU
 OH9dHmSZVbOsbN2VOCLSof2oyf84mCb+C/m+tIZZ+IhgNRNTH4+Xb3e7jfuVz8dsxZGz
 KmQAAXJmGGl/TCXWczp5ibiGgPbnoFJ90yfS8KbcD+le/iB4aQMRwhE53f56RSnqdJwX
 unQw==
X-Gm-Message-State: AFeK/H3zK61G13D42WbmYpIH1p2mvw35RYMB18yFiQsg8QlldRhjXN+/lwIvyeEMw6S4yzuwSWThlwIg/NXicKDK
X-Received: by 10.84.215.23 with SMTP id k23mr3163865pli.58.1490825713578;
 Wed, 29 Mar 2017 15:15:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.189.11 with HTTP; Wed, 29 Mar 2017 15:14:53 -0700 (PDT)
In-Reply-To: <20170324181723.29379-2-jaghu@google.com>
References: <20170324181723.29379-1-jaghu@google.com>
 <20170324181723.29379-2-jaghu@google.com>
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Date: Wed, 29 Mar 2017 15:14:53 -0700
Message-ID: <CANsWYUX-8TKGwsBDH_cWANbniJPOgxnUo6gcp2mq-Py1NELj1w@mail.gmail.com>
Subject: Re: [PATCH linux v5 1/2] Documentation: dt-bindings: Document
 bindings for ASPEED AST2400/AST2500 PWM and Fan tach controller device driver
To: Joel Stanley <joel@jms.id.au>, jdelvare@suse.com,
 Guenter Roeck <linux@roeck-us.net>, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, 
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
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
X-List-Received-Date: Wed, 29 Mar 2017 22:15:17 -0000

Please provide review comments.

On Fri, Mar 24, 2017 at 11:17 AM, Jaghathiswari Rankappagounder
Natarajan <jaghu@google.com> wrote:
> This binding provides interface for adding values related to ASPEED
> AST2400/2500 PWM and Fan tach controller support.
> The PWM controller can support upto 8 PWM output ports.
> The Fan tach controller can support upto 16 tachometer inputs.
>
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
> ---
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
> index 000000000000..f96d32bfcdfa
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
> +              "aspeed,ast2500-pwm-tacho" for AST2500.
> +
> +- clocks : a fixed clock providing input clock frequency(PWM
> +          and Fan Tach clock)
> +
> +fan subnode format:
> +===================
> +Under fan subnode there can upto 8 child nodes, with each child node
> +representing a fan. If there are 8 fans each fan can have one PWM port and
> +one/two Fan tach inputs.
> +
> +Required properties for each child node:
> +- reg : should specify PWM source port.
> +       integer value in the range 0 to 7 with 0 indicating PWM port A and
> +       7 indicating PWM port H.
> +
> +- aspeed-fan-tach-ch : should specify the Fan tach input channel.
> +                integer value in the range 0 through 15, with 0 indicating
> +               Fan tach channel 0 and 15 indicating Fan tach channel 15.
> +               Atleast one Fan tach input channel is required.
> +
> +Examples:
> +
> +pwm_tacho_fixed_clk: fixedclk {
> +       compatible = "fixed-clock";
> +       #clock-cells = <0>;
> +       clock-frequency = <24000000>;
> +}
> +
> +pwm_tacho: pwmtachocontroller@1e786000 {
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +       reg = <0x1E786000 0x1000>;
> +       compatible = "aspeed,ast2500-pwm-tacho";
> +       clocks = <&pwm_tacho_fixed_clk>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
> +
> +       fan@0 {
> +               reg = <0x00>;
> +               aspeed-fan-tach-ch = /bits/ 8 <0x00>;
> +       };
> +
> +       fan@1 {
> +               reg = <0x01>;
> +               aspeed-fan-tach-ch = /bits/ 8 <0x01 0x02>;
> +       };
> +};
> --
> 2.12.1.578.ge9c3154ca4-goog
>
