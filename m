Return-Path: <robherring2@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.67; helo=mail-pl0-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
 [209.85.160.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zczNy370lzF18x
 for <openbmc@lists.ozlabs.org>; Fri,  9 Feb 2018 13:22:42 +1100 (AEDT)
Received: by mail-pl0-f67.google.com with SMTP id 36so803540ple.13
 for <openbmc@lists.ozlabs.org>; Thu, 08 Feb 2018 18:22:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zSKuMDPFAJY+LAyjkCLzKBhAv89fhLtSLzq0LEg2s4Y=;
 b=dUxZ3VLQVv9lToJ8agaCZXhLBjc8FA0ILS9SolC0CZlyaOkDdEpd2OQ3TXqabXQ9gk
 xtYrX92CM8+FZ5zIbvrOcPkCh4/19/7QptlkZcZd+AZv7btW9xYLmKW19i8whg01N1fm
 1Ou8+dr4inl1MEhpAdoybma+94bYfM1AsiTgWm7nUw3zW2VAdrUi8zXex1Q8xaBcBwUQ
 du+Bu8IgH1avmjYBYT+9/ZlAdiiKl9XwpGPqybqfgIbb39LNosWQxQBBGBJsEr8eFCSn
 8FQYWa9fPllTuEo1dDSFIPhXrtKTy74A2uT6mLOY1J9Ad57YnvQKtDmtuX2OlQIP+jbl
 UOxA==
X-Gm-Message-State: APf1xPBLjXvTMWAlk/XoT45sOt4Bk1Iyvv5NcspQOcgJsTShXPM0+sAz
 mZW9JaWd9KoEVnu0bapIeA==
X-Google-Smtp-Source: AH8x226CuGSDpGWaCK9vLVJrw9OgR0hpqXGxk+S4l7UmcviSoZy+/EEybehhqorDfY7zrLojzxOVmQ==
X-Received: by 2002:a17:902:6a89:: with SMTP id
 n9-v6mr1008297plk.212.1518142959821; 
 Thu, 08 Feb 2018 18:22:39 -0800 (PST)
Received: from localhost ([199.36.244.13])
 by smtp.gmail.com with ESMTPSA id c8sm1848071pfl.160.2018.02.08.18.22.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 08 Feb 2018 18:22:39 -0800 (PST)
Date: Thu, 8 Feb 2018 20:22:38 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, mark.rutland@arm.com,
 tali.perry1@gmail.com, avifishman70@gmail.com,
 brendanhiggins@google.com, joel@jms.id.au,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v1 1/2] dt-binding: clock: document NPCM7xx clock DT
 bindings
Message-ID: <20180209022238.v52rw5filxcig6mg@rob-hp-laptop>
References: <1517818975-11427-1-git-send-email-tmaimon77@gmail.com>
 <1517818975-11427-2-git-send-email-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1517818975-11427-2-git-send-email-tmaimon77@gmail.com>
User-Agent: NeoMutt/20170609 (1.8.3)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Feb 2018 02:22:42 -0000

On Mon, Feb 05, 2018 at 10:22:54AM +0200, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton NPCM7xx clocks.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/clock/nuvoton,npcm7xx-clk.txt         | 84 ++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,npcm7xx-clk.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm7xx-clk.txt b/Documentation/devicetree/bindings/clock/nuvoton,npcm7xx-clk.txt
> new file mode 100644
> index 000000000000..1ba1945d3616
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/nuvoton,npcm7xx-clk.txt
> @@ -0,0 +1,84 @@
> +* Nuvoton NPCM7XX Clock Controller
> +
> +Nuvoton Poleg BMC NPCM7XX contain integrated clock

s/contain/contains/

And your line break is strange.

> +controller, which generates and supplies clock to all modules within the BMC.

s/clock/clocks/

> +
> +Required Properties:
> +
> +- compatible: should be one of following:
> +	- "nuvoton,npcm750-clk" : for clock controller of Nuvoton
> +	  Poleg BMC NPCM750
> +
> +- reg: physical base address of the controller and length of memory mapped
> +  region.
> +
> +
> +- #clock-cells: should be 1.
> +
> +All available clocks are defined as preprocessor macros in
> +dt-bindings/clock/nuvoton,npcm7xx-clock.h header and can beused in device tree

This file should be part of this patch.

> +sources.
> +
> +External clocks:
> +
> +There are several clocks that are generated outside the BMC. All clocks are of
> +a known fixed value that cannot be chagned. Therefor these values are hard coded

s/chagned/changed/

s/Therefor/Therefore/

> +inside the driver and registered on init.
> +
> +The clock modules contains 4 PLL, 20 dividers and 11 muxes. All these settings
> +are set before Linux boot and are not to be altered by the Linux. This driver is
> +used only to read the values clocks, not to set them.
> +
> +In addition to the clock driver, there are 3 external clocks suppling the

The binding describes h/w, not a driver.

> +network, which are of fixed values, set on on the device tree, but not used by
> + the clock module. Example can be found below.
   ^
extra space

All this description belongs at the top of this doc.

> +
> +Example: Clock controller node:
> +
> +	clk: clock-controller@f0801000 {
> +		compatible = "nuvoton,npcm750-clk";
> +		#clock-cells = <1>;
> +		clock-controller;
> +		reg = <0xf0801000 0x1000>;
> +		status = "okay";
> +	};
> +
> +Example: Required external clocks for network:
> +
> +		/* external clock signal rg1refck, supplied by the phy */
> +		clk_rg1refck: clk_rg1refck {

Use '-' rather than '_' in node names.

> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <125000000>;
> +			clock-output-names = "clk_rg1refck";
> +		};
> +
> +		/* external clock signal rg2refck, supplied by the phy */
> +		clk_rg2refck: clk_rg2refck {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <125000000>;
> +			clock-output-names = "clk_rg2refck";
> +		};
> +
> +		clk_xin: clk_xin {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <50000000>;
> +			clock-output-names = "clk_xin";
> +		};
> +
> +Example: UART controller node that consumes the clock generated by the clock
> +  controller (refer to the standard clock bindings for information about
> +  "clocks" and "clock-names" properties):
> +
> +	uart0: serial@e2900000 {
> +		compatible = "Nuvoton,s5pv210-uart";

s/Nuvoton/nuvoton/

> +		reg = <0xe2900000 0x400>;
> +		interrupt-parent = <&vic1>;
> +		interrupts = <10>;
> +		clock-names = "uart", "clk_uart_baud0",
> +				"clk_uart_baud1";
> +		clocks = <&clocks UART0>, <&clocks UART0>,
> +				<&clocks SCLK_UART0>;
> +	};
> -- 
> 2.14.1
> 
