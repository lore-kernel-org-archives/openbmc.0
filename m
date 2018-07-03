Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.213.195; helo=mail-yb0-f195.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
 [209.85.213.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41KvNG5Z9LzF1Pn;
 Wed,  4 Jul 2018 05:30:22 +1000 (AEST)
Received: by mail-yb0-f195.google.com with SMTP id s1-v6so1175684ybk.3;
 Tue, 03 Jul 2018 12:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=govFaCUAkXDHcAEjqP1ViIrA+6B34oGffj+jrOOt/80=;
 b=Gah3Ke6xk0JIrx4uGuKpFcCPVetM8P1NxU4EXkPYj0aGX1A9No3ePX5CBc7ccYBHZD
 scR5bUd2zodxBjfxXZemPW/HlWen8Gy0SaVXe9HppgFS8x3hbQo5ktdQTgbJZOaC1Gqj
 QGVY18mPBufhCMS+PrSVPA3Do4e6YiSwVMxCNTSP+DBV2K56VHMCgptYdMCHOdjaWbk3
 8HHv78m18WCYVuUsEYw9VXzwmjmTUDagacRj8d6RNvfByXNMg4z2hVohsB5H5TOdEjmm
 3x6hXSWCTGDzewYdGTB21pMQ9Wh7ch21auLP7HoOZA5L4o4mfRG+7H3tHYr1HaDh1BBV
 GIag==
X-Gm-Message-State: APt69E16JFnBQ8ShiEglH/yhj7nHvWY8TVYB0OMIXjxJ5ZFP5/NTfPyN
 cFSeWr5SHnpz0M2+CfTxYJdasD8=
X-Google-Smtp-Source: AAOMgpfSm8zsvyjJrLnHlrGWvlWEo8q9NV3wecQ869Y8dqn523zwdEZqQOXdiAl+7n9EO9zBHG58CA==
X-Received: by 2002:a25:fc01:: with SMTP id
 v1-v6mr3865659ybd.406.1530646219857; 
 Tue, 03 Jul 2018 12:30:19 -0700 (PDT)
Received: from localhost (24-223-123-72.static.usa-companies.net.
 [24.223.123.72])
 by smtp.gmail.com with ESMTPSA id u126-v6sm607845ywa.99.2018.07.03.12.30.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 03 Jul 2018 12:30:18 -0700 (PDT)
Date: Tue, 3 Jul 2018 13:30:17 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 1/2] dt-bindings: fsi: Add optional chip-id to CFAMs
Message-ID: <20180703193017.GA23230@rob-hp-laptop>
References: <20180622043756.21158-1-benh@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180622043756.21158-1-benh@kernel.crashing.org>
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
X-List-Received-Date: Tue, 03 Jul 2018 19:30:23 -0000

On Fri, Jun 22, 2018 at 02:37:55PM +1000, Benjamin Herrenschmidt wrote:
> This represents a physical chip in the system and allows
> a stable numbering scheme to be passed to udev for userspace
> to recognize which chip is which.

I'm sure you're aware, stable numbers is generally not something the 
kernel guarantees...

In the cases where we do have them, we've used aliases.

> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>  Documentation/devicetree/bindings/fsi/fsi.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/fsi/fsi.txt b/Documentation/devicetree/bindings/fsi/fsi.txt
> index ab516c673a4b..afb4eccab131 100644
> --- a/Documentation/devicetree/bindings/fsi/fsi.txt
> +++ b/Documentation/devicetree/bindings/fsi/fsi.txt
> @@ -83,6 +83,10 @@ addresses and sizes in the slave address space:
>      #address-cells = <1>;
>      #size-cells = <1>;
>  
> +Optionally, a slave can provide a global unique chip ID which is used to
> +identify the physical location of the chip in a system specific way
> +
> +    chip-id = <0>;
>  
>  FSI engines (devices)
>  ---------------------
> @@ -125,6 +129,7 @@ device tree if no extra platform information is required.
>              reg = <0 0>;
>              #address-cells = <1>;
>              #size-cells = <1>;
> +	    chip-id = <0>;
>  
>              /* FSI engine at 0xc00, using a single page. In this example,
>               * it's an I2C master controller, so subnodes describe the
> -- 
> 2.17.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
