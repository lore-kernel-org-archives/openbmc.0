Return-Path: <robherring2@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
 [209.85.218.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xYK3q2mrJzDrD2
 for <openbmc@lists.ozlabs.org>; Fri, 18 Aug 2017 07:24:39 +1000 (AEST)
Received: by mail-oi0-f68.google.com with SMTP id e124so7603706oig.0
 for <openbmc@lists.ozlabs.org>; Thu, 17 Aug 2017 14:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0JRmNkMmNv/Y6U50f4+Si6EBDnz546UBVNKAy/JZJ0c=;
 b=uQC7RFtzT8HmLOhVI7Z6l5IaDGOk/5/5n7/SE1aklf82GaUCcSmHeKlyqAjpjF2Om3
 p4xJfVfWnfGw/ZP15n0d1Pc+IU8iTYSetvNlz2eKMTLvmAYXojXV+cqdh2elpXyKUhjg
 buPkliS/GKBnvYLCMc5NEWuBQvnf3QeAeDzJ1dRsPFPE1F6WjAis5PdAwRhKcYA8WWQC
 Xp4GNzcCzaGGL1SOHEIjHEQzv2zQrgEYXnIQglOU53CU18kA/FnP0TX6ocvYtT87MlkL
 4qtMQpNiAiyj7cgYXdZ6pJMLvQnb4k7pMj72PoAIQUD34iQYEA5I6rz4FtNDGfqlugo0
 bMkQ==
X-Gm-Message-State: AHYfb5inKvLzVUHo8fV8IV5JRZvmIi7Obz4RfJxfJcXUj0BWlK95H4MW
 vZ1Xn9qh8JNA5Q==
X-Received: by 10.202.184.8 with SMTP id i8mr8822839oif.266.1503005077298;
 Thu, 17 Aug 2017 14:24:37 -0700 (PDT)
Received: from localhost (mobile-166-173-60-17.mycingular.net. [166.173.60.17])
 by smtp.gmail.com with ESMTPSA id p65sm4499888oia.49.2017.08.17.14.24.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Aug 2017 14:24:36 -0700 (PDT)
Date: Thu, 17 Aug 2017 16:24:35 -0500
From: Rob Herring <robh@kernel.org>
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: gregkh@linuxfoundation.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, joel@jms.id.au, jiri@resnulli.us,
 tklauser@distanz.ch, linux-serial@vger.kernel.org, mec@shout.net,
 vadimp@maellanox.com, system-sw-low-level@mellanox.com,
 openocd-devel-owner@lists.sourceforge.net, Jiri Pirko <jiri@mellanox.com>
Subject: Re: [patch v3 3/3] doccumentation: jtag: Add bindings for Aspeed SoC
 24xx and 25xx families JTAG master driver
Message-ID: <20170817212435.ypzsc3e6x2m4owyc@rob-hp-laptop>
References: <1502791207-26951-1-git-send-email-oleksandrs@mellanox.com>
 <1502791207-26951-4-git-send-email-oleksandrs@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1502791207-26951-4-git-send-email-oleksandrs@mellanox.com>
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
X-List-Received-Date: Thu, 17 Aug 2017 21:24:39 -0000

On Tue, Aug 15, 2017 at 01:00:07PM +0300, Oleksandr Shamray wrote:
> It has been tested on Mellanox system with BMC equipped with
> Aspeed 2520 SoC for programming CPLD devices.
> 
> Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
> Signed-off-by: Jiri Pirko <jiri@mellanox.com>
> ---
> v2->v3
> Comments pointed by Rob Herring <robh@kernel.org>
> - split Aspeed jtag driver and binding to sepatrate patches
> - delete unnecessary "status" and "reg-shift" descriptions in
>   bndings file
> ---
>  .../devicetree/bindings/jtag/aspeed-jtag.txt       |   19 +++++++++++++++++++
>  1 files changed, 19 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/jtag/aspeed-jtag.txt
> 
> diff --git a/Documentation/devicetree/bindings/jtag/aspeed-jtag.txt b/Documentation/devicetree/bindings/jtag/aspeed-jtag.txt
> new file mode 100644
> index 0000000..4743d6d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/jtag/aspeed-jtag.txt
> @@ -0,0 +1,19 @@
> +Aspeed JTAG driver for ast2400 and ast2500 SoC
> +
> +Required properties:
> +- compatible:		Should be one of
> +      - "aspeed,aspeed2400-jtag"
> +      - "aspeed,aspeed2500-jtag"
> +- reg			contains the offset and length of the JTAG memory
> +			region
> +- clocks		root clock of bus, should reference the APB clock
> +- interrupts		should contain JTAG controller interrupt
> +
> +Example:
> +jtag: jtag@1e6e4000 {
> +	compatible = "aspeed,aspeed2500-jtag";
> +	reg = <0x1e6e4000 0x1c>;
> +	reg-shift = <2>;

Still here...

Otherwise,

Acked-by: Rob Herring <robh@kernel.org>

> +	clocks = <&clk_apb>;
> +	interrupts = <43>;
> +};
> -- 
> 1.7.1
> 
