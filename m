Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.218.66; helo=mail-oi0-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Qr7D31bLzF35V
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 06:21:11 +1000 (AEST)
Received: by mail-oi0-f66.google.com with SMTP id i12-v6so51655915oik.2
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 13:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3+EcO42eHSwURW9BdVynOKP7dUTLiwsDpUzIa7BzcDg=;
 b=f4POMFcsW7jCxdmdCKbJPjgW5J+P4fn8qHFqxLFbVd+JnrYDkYdCuZDXuxoJw1h7Sq
 7bdr91pq65Klasp0Of6ifYhynTeDlCYYGu7lqG55TyxeMDfL1ZNWz4AarmTT2HzS1ZZG
 SXK0qWsor2VKdslyJhDxWQJG/oEtClTt4ji0zD0OvHJmlykLZLUvAlHeZfls4/iAcnaq
 kN025gxq89ESJi6eoHVB5SeF3cm0TzaGsvTqY0h4nnTKOz0nA+47hHsjIU8XJZ96y0Pa
 2ILuX+xW5uRzTJOJY4JqGsBYhPlLDzyDH+tM1I67Ag8AzRYpNZ6P8RGqefSbdJjUhNZD
 IYzQ==
X-Gm-Message-State: AOUpUlHRRoqCS12AUI+CWrMG8mzMfaVz5FL85Uj86VCic+cpvjA1M2gm
 MFrs3bKa+0iWykT7MdiajA==
X-Google-Smtp-Source: AAOMgpfWq0r9sZLEOa2XSD89X+mjSbVuSZZKcRqpVHA9/LgbZerJN1SUbMPbwGnJ7SFwsN7O5WPGBA==
X-Received: by 2002:aca:4e4d:: with SMTP id c74-v6mr167144oib.16.1531340469035; 
 Wed, 11 Jul 2018 13:21:09 -0700 (PDT)
Received: from localhost (24-223-123-72.static.usa-companies.net.
 [24.223.123.72])
 by smtp.gmail.com with ESMTPSA id h124-v6sm25049635oif.15.2018.07.11.13.21.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Jul 2018 13:21:08 -0700 (PDT)
Date: Wed, 11 Jul 2018 14:21:07 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: mark.rutland@arm.com, arnd@arnd.de, gregkh@linuxfoundation.org,
 avifishman70@gmail.com, yuenn@google.com, brendanhiggins@google.com,
 venture@google.com, joel@jms.id.au, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH v1 1/2] dt-binding: bmc: Add NPCM7xx LPC BPC documentation
Message-ID: <20180711202107.GA29980@rob-hp-laptop>
References: <20180704091427.409971-1-tmaimon77@gmail.com>
 <20180704091427.409971-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180704091427.409971-2-tmaimon77@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
X-List-Received-Date: Wed, 11 Jul 2018 20:21:13 -0000

On Wed, Jul 04, 2018 at 12:14:26PM +0300, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM7xx BIOS Post Code (BPC).
> The NPCM7xx BPC monitoring two configurable I/O addresses
> written by the host on Low Pin Count (LPC) bus.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt    | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt
> 
> diff --git a/Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt b/Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt
> new file mode 100644
> index 000000000000..0832c9cbea32
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt
> @@ -0,0 +1,26 @@
> +Nuvoton NPCM7xx LPC BPC interface
> +
> +Nuvoton BMC NPCM7xx BIOS Post Code (BPC) monitoring two
> +configurable I/O addresses written by the host on the
> +Low Pin Count (LPC) bus, the capure data stored in 128-word FIFO.

s/capure/capture/

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>


> +
> +NPCM7xx BPC supports capture double words, when using capture
> +double word only I/O address 1 is monitored.
> +
> +Required properties for lpc_bpc node
> +- compatible	: "nuvoton,npcm750-lpc-bpc" for Poleg NPCM7XX.
> +- reg 			: specifies physical base address and size of the registers.
> +- interrupts	: contain the LPC BPC with flags for falling edge.
> +- monitor-ports : contain monitor I/O addresses, at least one monitor I/O
> +				  address required
> +
> +Optional property for lpc_bpc node
> +- bpc-en-dwcapture : enable capture double words support.
> +
> +Example:
> +	lpc_bpc: lpc-bpc@f0007040 {
> +		compatible = "nuvoton,npcm7xx-lpc-bpc";
> +		reg = <0xf0007040 0x14>;
> +		monitor-ports = <0x80>;
> +		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> -- 
> 2.14.1
> 
