Return-Path: <robherring2@gmail.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
 [74.125.82.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v3f253bC2zDqHT
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 07:38:37 +1100 (AEDT)
Received: by mail-ot0-f195.google.com with SMTP id f9so2299644otd.0
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2017 12:38:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WKfR1+xHzHt3dwFrL0/RXMd0oLVNyVr+7x5Ql+bHDyQ=;
 b=ZRE5r+pQ/a8xPfZ3mBNYtxnyPYI3vm54RQVJGRpD5OqShDsJs9DIctVNypW7cyomvx
 tokmcEONvfURPPS46SB8aS1CwpRKA3nTgqalEzSuNRAXJq1PXsAYmE3N/bdaCN2dyjJB
 OqbkaPyMzTmH5PraxBdjIwz3AEp+smfmTStpfrhzLg9T4GPWkzWarnqAKffN0DR28o/o
 yPIXsDmTw+QGsyPvXR87j5FepnhruclXTnQsQqB97tK8UCkih+ptrhMtEoXLG3vYxZ/m
 WTOACfJtdT9u0RXXLFQB8+oMipANKk3cRjwnooc6pvadV1qg6oRbnh5EL0lV1ZZv3Rr6
 bufg==
X-Gm-Message-State: AIkVDXIkhVi6ZuJzTO+px1KpEgJ3DTvyn1so+vqhh7pSFCpvaIelUeT7W+G4clguYMYcmA==
X-Received: by 10.157.38.162 with SMTP id l31mr2389791otb.58.1484771915719;
 Wed, 18 Jan 2017 12:38:35 -0800 (PST)
Received: from localhost (72-48-98-129.dyn.grandenetworks.net. [72.48.98.129])
 by smtp.gmail.com with ESMTPSA id
 r130sm695117oif.15.2017.01.18.12.38.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Jan 2017 12:38:34 -0800 (PST)
Date: Wed, 18 Jan 2017 14:38:33 -0600
From: Rob Herring <robh@kernel.org>
To: Cyril Bur <cyrilbur@gmail.com>
Cc: devicetree@vger.kernel.org, jassisinghbrar@gmail.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, joel@jms.id.au, mark.rutland@arm.com,
 openbmc@lists.ozlabs.org, andrew@aj.id.au, benh@kernel.crashing.org,
 xow@google.com, jk@ozlabs.org
Subject: Re: [PATCH 1/4] Documentation: dt: mailbox: Add Aspeed ast2400/2500
 bindings
Message-ID: <20170118203833.3htpccig67kpd6xl@rob-hp-laptop>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
 <20170112002910.3650-2-cyrilbur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170112002910.3650-2-cyrilbur@gmail.com>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
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
X-List-Received-Date: Wed, 18 Jan 2017 20:38:37 -0000

On Thu, Jan 12, 2017 at 11:29:07AM +1100, Cyril Bur wrote:
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
>  .../devicetree/bindings/mailbox/aspeed-mbox.txt    | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt b/Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt
> new file mode 100644
> index 000000000000..633cd534d91c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt
> @@ -0,0 +1,44 @@
> +ASpeed Mailbox Driver
> +=====================
> +
> +The ASpeed mailbox allows for communication between different
> +processors. The mailbox on the ASpeed ast2400 and ast2500 is a set of
> +16 single byte data registers along with interrupt and configuration
> +registers directly on the SoC. These are memory mapped on the aspeed
> +and can be accessed via the SuperIO registers on the other processor.
> +
> +Device Node:
> +============
> +This represents the mailbox on the Soc.
> +
> +As the mailbox registers sit on the LPC bus, it makes most sense for
> +the device to be within the LPC host node. See
> +Documentation/devicetree/bindings/mfd/aspeed-lpc.txt for more
> +information. This does not have to be the case, provided the reg
> +property can give the full address of the mbox registers.

This does have to be the case. I'd expect all devices on the LPC bus to 
be under a LPC bus node.

Drop the last sentence, and:

Acked-by: Rob Herring <robh@kernel.org>
