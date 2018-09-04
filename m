Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.218.68; helo=mail-oi0-f68.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
 [209.85.218.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 424SY21YHzzF3Qm;
 Tue,  4 Sep 2018 23:36:37 +1000 (AEST)
Received: by mail-oi0-f68.google.com with SMTP id p84-v6so6718091oic.4;
 Tue, 04 Sep 2018 06:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:date:status:lines;
 bh=KM5oqrFfgUO/Zdaz5dYqjCS5NW0u4AaxvKo9TB6UIKg=;
 b=k42sxJIF3SGLBr35wUk3qeqYgBoD/b9/AJsxduI6O7zjw+gDoEqvgw726v8/WTvv8d
 un9cncBKPolID+/Hwr4mnPqA7hM+Nz8smUCNxBbRaWS8ITaw4/3PSNDtit2s2igcT/Q5
 X//UbxK/AjkH2mBTkaxfxCWCT16NNu8nnmpxUQ0JDVaMselC2iOUoEOKi/Bmd8MoPIFJ
 1bkKI7xdw0+yIf9gRzjIC6RH2Xn2n/HLwcuKHxbl+ezn77MrRl1NxL8ag1df5XXSbKTx
 /xWNo/mo6MBOcLI4T0Px4mZmTGjktFyIx2sGuyqleDwmeX7/XbXADjCWw4p35E8j+pfq
 hwuA==
X-Gm-Message-State: APzg51Bn+GtTwWpblPDqhz3I2OGxeWDW6BIMC8kAB6vvUqQg0Eix8fL6
 96WRN1YHY6ZqNbq+Dlg3JA==
X-Google-Smtp-Source: ANB0Vdaejk1D5yTudyKkWwxBGb+fJ4aVsMPgszGc5z8HgEtKuY6tpU7w6kEmfiPycGWbR3XWVnic+w==
X-Received: by 2002:aca:afcc:: with SMTP id
 y195-v6mr25413223oie.322.1536068196053; 
 Tue, 04 Sep 2018 06:36:36 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c9-v6sm25315057oia.1.2018.09.04.06.36.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Sep 2018 06:36:35 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 andrew@aj.id.au, mchehab@kernel.org, joel@jms.id.au,
 mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] dt-bindings: media: Add Aspeed Video Engine binding
 documentation
Message-ID: <20180904005015.GA5214@bogus>
References: <1535576973-8067-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1535576973-8067-4-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1535576973-8067-4-git-send-email-eajames@linux.vnet.ibm.com>
X-Mutt-References: <1535576973-8067-4-git-send-email-eajames@linux.vnet.ibm.com>
X-Mutt-Fcc: ~/sent
Date: Mon, 3 Sep 2018 19:50:18 -0500
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2018 13:36:38 -0000

On Wed, Aug 29, 2018 at 04:09:32PM -0500, Eddie James wrote:
> Document the bindings.
> 
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---
>  .../devicetree/bindings/media/aspeed-video.txt     | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/aspeed-video.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/aspeed-video.txt b/Documentation/devicetree/bindings/media/aspeed-video.txt
> new file mode 100644
> index 0000000..58c056a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/aspeed-video.txt
> @@ -0,0 +1,23 @@
> +* Device tree bindings for Aspeed Video Engine
> +
> +The Video Engine (VE) embedded in the Aspeed AST2400 and AST2500 SOCs can
> +capture and compress video data from digital or analog sources.
> +
> +Required properties:
> + - compatible:		"aspeed,ast2400-video" or "aspeed,ast2500-video"

Maybe "video-engine" or "ve" would be more specific than just "video". 
Use what is closest to the name of the block.

> + - reg:			contains the offset and length of the VE memory region
> + - clocks:		pointers to the the "vclk" and "eclk" of the syscon

No pointers in DT. "Clock specifier"

> + - clock-names:		"vclk-gate", "eclk-gate"

Is that the name at or in the module? The fact that it is gated is 
really outside the block and a property of the clock controller.

> + - resets:		pointer to the VE reset of the syscon
> + - interrupts:		the interrupt associated with the VE on this platform
> +
> +Example:
> +
> +video: video@1e700000 {

video-codec@...

> +    compatible = "aspeed,ast2500-video";
> +    reg = <0x1e700000 0x20000>;
> +    clocks = <&syscon ASPEED_CLK_GATE_VCLK>, <&syscon ASPEED_CLK_GATE_ECLK>;
> +    clock-names = "vclk-gate", "eclk-gate";
> +    resets = <&syscon ASPEED_RESET_VIDEO>;
> +    interrupts = <7>;
> +};
> -- 
> 1.8.3.1
> 
