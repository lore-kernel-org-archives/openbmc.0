Return-Path: <robherring2@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
 [209.85.192.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xStV728ytzDqs4
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 02:13:35 +1000 (AEST)
Received: by mail-pf0-f195.google.com with SMTP id t86so1081952pfe.1
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 09:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DvYfxP/yk54n/8ivTWaL4Bj0RpvHEwiJBFI0eotkjCk=;
 b=ufkJY0ohYK6VuhUCxVxtA5vCnLecvkgYvcYg939d0aLYADkgaWjIcOg3VLuTw30LB2
 UvhIvxbGjyCYSYtq3ZkTzDhXpwbsXCr81AOyDOHwCyokwv2DCEr5noWbAUJJ+QLHyHNl
 9xbGMak2sh4QXinFFo1Wp5d2XqtdEo4mkji3kNYHJj4+eyCje0p5mWuSdOWpIi0Yy1Mm
 zs+BdK3ABENmMxVwlh7ZQ7nWtFhbB5ix+ZRbXl7pqGvP8NmAWqJwGadf5Rl7UciLnFME
 q/DjA1kgsyUDsDeLHX9eQjLUfuuxceFM7YtRy3MRGGSC5Ts+wyc5EeFWf0e+onkqe7CX
 SWNg==
X-Gm-Message-State: AHYfb5gsxEZjwP/IV2LpgxiD49nhmVdYjkYzCqKPvbVv76XVMPTPtNNl
 UcS7tJUgl63SsQ==
X-Received: by 10.84.231.139 with SMTP id g11mr14243111plk.34.1502381613492;
 Thu, 10 Aug 2017 09:13:33 -0700 (PDT)
Received: from localhost (24-223-123-72.static.usa-companies.net.
 [24.223.123.72])
 by smtp.gmail.com with ESMTPSA id n12sm14055167pfa.148.2017.08.10.09.13.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Aug 2017 09:13:32 -0700 (PDT)
Date: Thu, 10 Aug 2017 11:13:31 -0500
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux@roeck-us.net, linux-hwmon@vger.kernel.org, mark.rutland@arm.com,
 jdelvare@suse.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@jms.id.au,
 mspinler@linux.vnet.ibm.com, msbarth@linux.vnet.ibm.com,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 1/4] dt-bindings: hwmon: pmbus: Add Maxim MAX31785
 documentation
Message-ID: <20170810161331.ygoevpqmb4l3rvsy@rob-hp-laptop>
References: <20170802071541.3121-1-andrew@aj.id.au>
 <20170802071541.3121-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170802071541.3121-2-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 10 Aug 2017 16:13:35 -0000

On Wed, Aug 02, 2017 at 04:45:38PM +0930, Andrew Jeffery wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  .../devicetree/bindings/hwmon/pmbus/max31785.txt   | 126 +++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt b/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
> new file mode 100644
> index 000000000000..8ddc4ea1958d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
> @@ -0,0 +1,126 @@
> +Bindings for the Maxim MAX31785 Intelligent Fan Controller
> +==========================================================

This is the second fan controller binding I've seen recently. The other 
being hwmon/aspeed-pwm-tacho.txt. I think some of this needs to be 
common. There's only so many types of fans, right?

And we have the thermal binding which you don't appear to tie into.

> +
> +Reference:
> +[1] https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
> +
> +Required properties:
> +- compatible     : One of "maxim,max31785" or "maxim,max31785a"
> +- reg            : I2C address, one of 0x52, 0x53, 0x54, 0x55.
> +- #address-cells : Must be 1
> +- #size-cells    : Must be 0
> +
> +Optional properties:
> +- use-stored-presence    : Do not treat the devicetree description as canon for

Is this maxim specific? If so, needs a vendor prefix.

> +                           fan presence (the 'installed' bit of FAN_CONFIG_*).
> +                           Instead, rely on the on the default value store of
> +                           the device to populate it.
> +
> +Capabilities are configured through subnodes of the controller's node.
> +
> +Fans
> +----
> +
> +Only fans with subnodes present will be considered as installed. If
> +use-stored-presence is present in the parent node, then only fans that are both
> +defined in the devicetree and have their installed bit set are considered
> +installed.
> +
> +Required subnode properties:
> +- compatible             : Must be "pmbus-fan"

What defines a pmbus-fan? Sounds generic, but then you have all these 
maxim specific properties.

> +- reg                    : The PMBus page the properties apply to.
> +- maxim,fan-rotor-input  : The type of rotor measurement provided to the
> +                           controller. Must be either "tach" for tachometer
> +                           pulses or "lock" for a locked-rotor signal.
> +- maxim,fan-lock-polarity: Required iff maxim,fan-rotor-input is "lock". Valid
> +                           values are "low" for active low, "high" for active
> +                           high.
> +
> +Optional subnode properties:
> +- fan-mode               : "rpm" or "pwm". Default value is "pwm".
> +- tach-pulses            : Tachometer pulses per revolution. Valid values are
> +                           1, 2, 3 or 4. The default is 1.
> +- maxim,fan-no-fault-ramp: Do not ramp the fan to 100% PWM duty on detecting a
> +                           fan fault
> +- maxim,fan-startup      : The number of rotations required before taking
> +                           emergency action for an unresponsive fan and driving
> +                           it with 100% or 0% PWM duty, depending on the state
> +                           of maxim,fan-no-fault-ramp. Valid values are 0
> +                           (automatic spin-up disabled), 2, 4, or 8. Default
> +                           value is 0.
> +- maxim,fan-health       : Enable automated fan health check
> +- maxim,fan-ramp         : Configures how fast the device ramps the PWM duty
> +                           cycle from one value to another. Valid values are 0
> +                           to 7 inclusive, with values 0 - 2 configuring a
> +                           1000ms update rate and 1 - 3% duty respective duty
> +                           increase, and 3 - 7 a 200ms update rate with a 1 -
> +                           5% respective duty increase. Default value is 0.
> +- maxim,fan-no-watchdog  : Do not ramp fan to 100% PWM duty on failure to
> +                           update desired fan rate inside 10s. This implies
> +                           maxim,tmp-no-fault-ramp
> +- maxim,tmp-no-fault-ramp: Do not ramp fan to 100% PWM duty on temperature
> +                           sensor fault detection. This implies
> +                           maxim,fan-no-watchdog
> +- maxim,tmp-hysteresis   : The temperature hysteresis used to determine
> +                           transitions to lower fan speed bands in the
> +                           temperature/fan rate lookup table. Valid values are
> +                           2, 4, 6 or 8 (degrees celcius). Default value is 2.
> +- maxim,fan-dual-tach    : Enable dual tachometer functionality
> +- maxim,fan-pwm-freq     : The PWM frequency. Valid values are 30, 50, 100, 150
> +                           and 25000 (Hz). Default value is 30Hz.
> +- maxim,fan-lookup-table : A 16-element cell array of alternating temperature
> +                           and rate values representing the look up table. The
> +                           rate units are set through the fan-mode property.
> +- maxim,fan-fault-pin-mon: Ramp fans to 100% PWM duty when the FAULT pin is
> +                           asserted
> +
> +Temperature
> +-----------
> +
> +Required subnode properties:
> +- compatible    : Must be "pmbus-temperature"
> +- reg           : The PMBus page the properties apply to.
> +
> +Optional subnode properties:
> +- maxim,tmp-offset      : Valid values are 0 - 30 (degrees celcius) inclusive.
> +                          Default value is 0.
> +- maxim,tmp-fans        : An array of fan indexes whose fans are controlled by
> +                          the current temperature sensor. Fans are indexed from
> +                          zero. The valid values are 0 - 5 inclusive.

Why not use a phandle here.

> +
> +Example:
> +	fan-max31785: max31785@52 {
> +		reg = <0x52>;
> +		compatible = "maxim,max31785";
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                fan@0 {
> +                        compatible = "pmbus-fan";
> +                        reg = <0>;
> +                        mode = "rpm";
> +                        tach-pulses = <1>;
> +                        maxim,fan-rotor-input = "tach";
> +                        maxim,fan-dual-tach;
> +                };
> +
> +                fan@1 {
> +                        compatible = "pmbus-fan";
> +                        reg = <1>;
> +                        mode = "rpm";
> +                        tach-pulses = <1>;
> +                        maxim,fan-rotor-input = "tach";
> +                        maxim,tmp-hysteresis = <2>;
> +                        maxim,fan-lookup-table = <
> +                        /*  Temperature    RPM  */
> +                                 0        1000
> +                                10        2000
> +                                20        3000
> +                                30        4000
> +                                40        5000
> +                                50        6000
> +                                60        7000
> +                                70        8000
> +                        >;
> +                };
> +	};
> -- 
> 2.11.0
> 
