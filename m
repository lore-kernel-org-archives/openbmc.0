Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.161.195; helo=mail-yw0-f195.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
 [209.85.161.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40xDcs4pQkzDrYf
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 14:14:37 +1000 (AEST)
Received: by mail-yw0-f195.google.com with SMTP id v68-v6so6753131ywd.3
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 21:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=k5yUT05pAeV5WDoYd2HBpVpByybGAYnML/Qlv6gIqY0=;
 b=FMx5SYKgmO7paUiRYuqrzcgeOKAX9sFwHDmKx+IFKJo+yCgIn7+wsHDBN5RSONJwxO
 i9vrKKOKZhD4EpK9JEsM2RsWqZ+bAmXXVWukvkDtG7Y+61IOYhqjRG1hGmO7czAgoaBE
 jE4wSS9FsRUtQf+yhSDyfTo4sAuR9cjpbKFJzs8nwfEyaO1/bvOvkYuUGz03U9SYbbwA
 SgI/gQHD5SEtJxquzddn+CnuBwSEk3o6e7BwNiiEfizlSJOMLvfqRZH6do9S3aGhMuVI
 ISPE0UCgjwqQkSe3cVcnPLPIn481J1eIZkKI1lKVOwDZREGDINXh1aCZjT27Wmxk6cVy
 xXuQ==
X-Gm-Message-State: ALKqPweMz7mJNiNYsWPpCxxU8EECA1r0MY3QIfkJz5o995ePVL6DEaNn
 Xcsdb90uugoXEDH/7BJDAw==
X-Google-Smtp-Source: ADUXVKIHHYkrd8uT/Ig3FLzib2PNSwo8RSbOHOeLBHikESr5vZ0JmbmByc/WBLZBcA339AIIYD5iVg==
X-Received: by 2002:a81:6846:: with SMTP id
 d67-v6mr2968658ywc.386.1527740074652; 
 Wed, 30 May 2018 21:14:34 -0700 (PDT)
Received: from localhost (24-223-123-72.static.usa-companies.net.
 [24.223.123.72])
 by smtp.gmail.com with ESMTPSA id t18-v6sm3397092ywg.32.2018.05.30.21.14.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 30 May 2018 21:14:34 -0700 (PDT)
Date: Wed, 30 May 2018 23:14:30 -0500
From: Rob Herring <robh@kernel.org>
To: avifishman70@gmail.com
Cc: gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
 tmaimon77@gmail.com, venture@google.com, yuenn@google.com,
 brendanhiggins@google.com, mathias.nyman@linux.intel.com,
 bjorn.andersson@linaro.org, jhogan@kernel.org, albeu@free.fr,
 chunfeng.yun@mediatek.com, tony@atomide.com,
 baolu.lu@linux.intel.com, elder@linaro.org, digetx@gmail.com,
 kstewart@linuxfoundation.org, hdegoede@redhat.com,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 openbmc@lists.ozlabs.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org, davem@davemloft.net,
 mchehab+samsung@kernel.org, akpm@linux-foundation.org,
 rdunlap@infradead.org
Subject: Re: [PATCH v1 2/3] USB: DT probing support to ehci-npcm7xx
Message-ID: <20180531041430.GA2862@rob-hp-laptop>
References: <1527582935-31175-1-git-send-email-avifishman70@gmail.com>
 <1527582935-31175-3-git-send-email-avifishman70@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527582935-31175-3-git-send-email-avifishman70@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 31 May 2018 04:14:38 -0000

On Tue, May 29, 2018 at 11:35:34AM +0300, avifishman70@gmail.com wrote:
> From: Avi Fishman <AviFishman70@gmail.com>
> 
> Device Tree documentation for Nuvoton npcm7xx EHCI driver.

Bindings are for drivers, but for h/w.

> 
> Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/npcm7xx-usb.txt | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/npcm7xx-usb.txt b/Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
> new file mode 100644
> index 000000000000..628692dff7e4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
> @@ -0,0 +1,18 @@
> +Nuvoton NPCM7XX SoC USB controllers:
> +-----------------------------
> +
> +EHCI:
> +-----
> +
> +Required properties:
> +- compatible: "nuvoton,npcm750-ehci"

And usb-ehci? Though I would just drop it. It is pretty useless.

> +  that services interrupts for this device

This line goes below.

> +- interrupts: Should contain the EHCI interrupt
> +
> +Example:
> +
> +	ehci@e1800000 {
> +		compatible = "nuvoton,npcm750-ehci", "usb-ehci";
> +		reg = <0xf0806000 0x1000>;
> +		interrupts = <0 61 4>;
> +	};
> -- 
> 2.14.1
> 
