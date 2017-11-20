Return-Path: <robherring2@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.218.67; helo=mail-oi0-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
 [209.85.218.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yghBV5tDCzDrMM
 for <openbmc@lists.ozlabs.org>; Tue, 21 Nov 2017 08:07:46 +1100 (AEDT)
Received: by mail-oi0-f67.google.com with SMTP id n16so7121849oig.3
 for <openbmc@lists.ozlabs.org>; Mon, 20 Nov 2017 13:07:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Fcy+saHSsmJ0aHXEGbisa+TSTvNtxmntK5L4yeeEuJg=;
 b=jiHyIwV/8A5sCKk0Afye52r1ubcTXSKFn5gbY9x3PO6T4a38JbQsHTn00TfIbD8Rl0
 p+OTvbhTifj9pZc01yZKaqxXsEbrpiG2VdpAaJIFiU67+k1FfvCLBMgH7xpgFK9XPV/X
 EEcdNjIZ5D+72UzaKk+UIBj0ded4QtgnhBoZfzxQUJDlnLA1KM6kx6IvfbgQ0omAG5Gh
 25sYMkosVCoMvd78tQJ5EfCjz+vom0HPhimQa4oDM8dLsdVPS1XzEt24IcLUTcNO28fq
 gTlt/7JXmiqwSQG/lWI/xzaLNuXhwUVxGvEKnf0MoKCoYlYXitVfdUP/zmtK2xZZHUQd
 oNDg==
X-Gm-Message-State: AJaThX5llBNl/QhAfvCJNZtMXDfX0EFuo7eEg6WZPmsFBgIE2HwA/2ES
 Z/G9OvAzEeI0PirdjuERUQ==
X-Google-Smtp-Source: AGs4zMZKz02837CIaGK3DupBedtRSRQmzzlSXX4Jx1e3Y0Xb72Fxf+2lzKbbu7+h5h3O3t275sMjZQ==
X-Received: by 10.202.56.65 with SMTP id f62mr2821792oia.285.1511212063714;
 Mon, 20 Nov 2017 13:07:43 -0800 (PST)
Received: from localhost (24-223-123-72.static.usa-companies.net.
 [24.223.123.72])
 by smtp.gmail.com with ESMTPSA id p184sm4888927oig.31.2017.11.20.13.07.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 Nov 2017 13:07:43 -0800 (PST)
Date: Mon, 20 Nov 2017 15:07:41 -0600
From: Rob Herring <robh@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: linux@armlinux.org.uk, mark.rutland@arm.com, tmaimon77@gmail.com,
 avifishman70@gmail.com, raltherr@google.com, f.fainelli@gmail.com,
 julien.thierry@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH v8 2/3] arm: dts: add Nuvoton NPCM750 device tree
Message-ID: <20171120210741.vi6hq3x7xiowd6zh@rob-hp-laptop>
References: <20171117190747.21642-1-brendanhiggins@google.com>
 <20171117190747.21642-3-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171117190747.21642-3-brendanhiggins@google.com>
User-Agent: NeoMutt/20170609 (1.8.3)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Nov 2017 21:07:47 -0000

On Fri, Nov 17, 2017 at 11:07:46AM -0800, Brendan Higgins wrote:
> Add a common device tree for all Nuvoton NPCM750 BMCs and a board
> specific device tree for the NPCM750 (Poleg) evaluation board.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
> Reviewed-by: Avi Fishman <avifishman70@gmail.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Tested-by: Tomer Maimon <tmaimon77@gmail.com>
> Tested-by: Avi Fishman <avifishman70@gmail.com>
> ---
> Changes since v7:
>   - Added arm,shared-override to l2 cache
>   - Cleaned up node names
>   - Cleaned up ranges properties
>   - Fixed address for nuvoton,npcm750-timer
>   - Dropped watchdog nodes for now since the properties in them are wrong
> ---
>  .../arm/cpu-enable-method/nuvoton,npcm7xx-smp      |  42 +++++
>  .../devicetree/bindings/arm/npcm/npcm.txt          |   6 +
>  arch/arm/boot/dts/nuvoton-npcm750-evb.dts          |  44 ++++++
>  arch/arm/boot/dts/nuvoton-npcm750.dtsi             | 171 +++++++++++++++++++++
>  include/dt-bindings/clock/nuvoton,npcm7xx-clks.h   |  39 +++++
>  5 files changed, 302 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm7xx-smp
>  create mode 100644 Documentation/devicetree/bindings/arm/npcm/npcm.txt
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm750.dtsi
>  create mode 100644 include/dt-bindings/clock/nuvoton,npcm7xx-clks.h

Reviewed-by: Rob Herring <robh@kernel.org>
