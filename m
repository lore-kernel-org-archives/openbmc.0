Return-Path: <robherring2@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGXkG3h7WzDrCs
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 06:18:14 +1000 (AEST)
Received: by mail-pg0-f66.google.com with SMTP id y129so12621949pgy.3
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 13:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/ga2FgPoc+HVfanMCA6sIqdkebg14OyI7rKW6QezmGQ=;
 b=b+PSTQzBGd4kXKoCo+6TcJF1LEC15hQsyXyHkd1BdW1jct7GP/DPxuqSu/NJ2UK44y
 EDmCirIxTafxK8T3gXaqddJQxJtwX/Ao7FQC19p2MN2NK3wfQaegWLslSG/mc2d3+toX
 8Ca4YWJppvTN48pqxAEAAog103LiaiVuCN7zGVJ8aTNiNsjJ7y7Dkwd6DW62sb13zKlY
 klrn3DZyKkeqbMPtnvn5EaJj4JbwYduh+d1DWH5spWAwbLD/ApL8ql1moNxDqsncW+BV
 Md3QG0faROjcs4YMmLpsD8k50sZhX/Sbo5bCsJlGmUqolcaNToHQNF9ggidyjVVAZIKg
 MLPw==
X-Gm-Message-State: AIVw1115IRVHyDRenw4ec07PsiNlyQaIdTQBZsJkJ0/nY9z6VTtjAJHf
 PjYd9svtgHv1Ig==
X-Received: by 10.99.105.201 with SMTP id e192mr16950529pgc.158.1500927492401; 
 Mon, 24 Jul 2017 13:18:12 -0700 (PDT)
Received: from localhost (24-223-123-72.static.usa-companies.net.
 [24.223.123.72])
 by smtp.gmail.com with ESMTPSA id r62sm25027874pfl.45.2017.07.24.13.18.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Jul 2017 13:18:11 -0700 (PDT)
Date: Mon, 24 Jul 2017 15:18:10 -0500
From: Rob Herring <robh@kernel.org>
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 openbmc@lists.ozlabs.org, Patrick Venture <venture@google.com>,
 Vadim Pasternak <vadimp@mellanox.com>, Ohad Oz <ohado@mellanox.com>
Subject: Re: [patch v2] Documentation: dt-bindings: aspeed-pwm-tacho cooling
 device.
Message-ID: <20170724201810.qws2drb3aknyefom@rob-hp-laptop>
References: <20170720143039.821-1-c_mykolak@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170720143039.821-1-c_mykolak@mellanox.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
X-List-Received-Date: Mon, 24 Jul 2017 20:18:15 -0000

On Thu, Jul 20, 2017 at 05:30:39PM +0300, Mykola Kostenok wrote:
> This controller supports fan tacho channels and pwm channels.
> Without this change only tachometer channels can be configured.
> Add extra level of hierarchy - for tachometer channel
> with fan subnodes and pwm channels with pwm subnodes.
> 
> It's add support for cooling device creation to
> aspeed-pwm-tacho.
> Cooling device could be bound to a thermal zone
> for the thermal control.
> 
> v1 -> v2:
>  - Fix commit message.
> 
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> ---
>  .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 56 ++++++++++++++++++----
>  1 file changed, 47 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> index cf44605..df85aa7 100644
> --- a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> @@ -23,9 +23,18 @@ Required properties for pwm-tacho node:
>  - clocks : a fixed clock providing input clock frequency(PWM
>  	   and Fan Tach clock)
>  
> +tach-channels subnode format:
> +===================
> +Under tach-channels subnode there can be fan child nodes.
> +
> +Required properties for tach-channels node:
> +- #address-cells : should be 1.
> +
> +- #size-cells : should be 0.
> +
>  fan subnode format:
>  ===================
> -Under fan subnode there can upto 8 child nodes, with each child node
> +Under fan subnode there can be upto 8 child nodes, with each child node
>  representing a fan. If there are 8 fans each fan can have one PWM port and
>  one/two Fan tach inputs.
>  
> @@ -39,6 +48,24 @@ Required properties for each child node:
>  		Fan tach channel 0 and 15 indicating Fan tach channel 15.
>  		Atleast one Fan tach input channel is required.
>  
> +pwm-channels subnode format:
> +===================
> +Under pwm-channels subnode there can be pwm child nodes.
> +Required properties for tach-channels node:
> +- #address-cells : should be 1.
> +
> +- #size-cells : should be 0.
> +
> +- #cooling-cells : should be 2;
> +
> +pwm subnode format:
> +===================
> +- reg : should be <0x00>.
> +
> +- cooling-levels      : PWM duty cycle values in a range from 0 to 255
> +			which correspond to thermal cooling states.
> +
> +
>  Examples:
>  
>  pwm_tacho_fixed_clk: fixedclk {
> @@ -55,14 +82,25 @@ pwm_tacho: pwmtachocontroller@1e786000 {
>  	clocks = <&pwm_tacho_fixed_clk>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
> -
> -	fan@0 {
> -		reg = <0x00>;

The 0 here was the "pwm channel". Otherwise, the reg value is just 
some made up index with no correlation to the h/w. So why can't you 
accomplish the same thing adding cooling-levels here?

> -		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +	tach-channels {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		fan@0 {
> +			reg = <0x00>;
> +			aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +		};
> +		fan@1 {
> +			reg = <0x01>;
> +			aspeed,fan-tach-ch = /bits/ 8 <0x01 0x02>;
> +		};
>  	};
> -
> -	fan@1 {
> -		reg = <0x01>;
> -		aspeed,fan-tach-ch = /bits/ 8 <0x01 0x02>;
> +	pwm-channels {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		#cooling-cells = <2>;
> +		pwm@0 {
> +			reg = <0x00>;
> +			cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
> +		};
>  	};
>  };
> -- 
> 2.8.4
> 
