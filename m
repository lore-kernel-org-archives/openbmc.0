Return-Path: <lee.jones@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=lee.jones@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="LZZN6Wad"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43pm6d3GrkzDqQn
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jan 2019 23:30:13 +1100 (AEDT)
Received: by mail-wm1-x344.google.com with SMTP id t200so17708453wmt.0
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jan 2019 04:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=oE8Qm9PdZluCUZkLGWY+ZFIppoNu/D2qntGj/3XiAXQ=;
 b=LZZN6Wadr4cjXRY+8dG1EeZk5m/TdVcTfpOsZ5V3GC5hu0tCP6jbbMPBh03ne5P1zy
 ghlKYErOvpXI91DIeGX1ODR8VvIyaDe5KPQSfDOG6AzBpYuhi+79EKFNQFSSbLM68h6D
 95Z/d7mkgz/UENS2zkiIHBphbNV6BRLo8vu6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=oE8Qm9PdZluCUZkLGWY+ZFIppoNu/D2qntGj/3XiAXQ=;
 b=OM5/A4bMEnw8toNljCLZkIuWB7JRLSQT/nikH2c7h6/aX818b4BurTuhriW5acxfiv
 5FmUv1eKE98U+M7+Fw9GAtS9/CTMciKtkt7pVLSrF6GYUyt3zydIyzeP7a4pjDOxplAf
 3T3KqP4zbvbG6dKk7lelCTJFbylvF4hV24puuSRRBlS/lSgGzy+o3kebrjHCzu3X8UD7
 G0NSqZ6kN1qnm9E5C2wlat9G5MqIqwua52zh9yOenmkwwf+zOpaNF26/2wudIPmnpT+L
 GXNZ50YZFKtXKP3+ndtN5KjlmXux8dzH/eEZbpDvqtQ44SWNxUpG3isM/uJlMurt0F3A
 jmxg==
X-Gm-Message-State: AJcUukeWnodKrw/rdVqi2di0wEiYL2UqFRSyysoGCCNpR+avIgzQov9J
 yJm9iOLXhqC8qBf/D+fKz1IvIQ==
X-Google-Smtp-Source: ALg8bN6Dv5bto48uf2VZhK8Y3t2maUaWJp3mSF942fyW3hxN7qnMGNqU1ppDG+NKI3dclarAXzygsA==
X-Received: by 2002:a1c:a755:: with SMTP id q82mr21799557wme.6.1548765010759; 
 Tue, 29 Jan 2019 04:30:10 -0800 (PST)
Received: from dell ([2.27.35.198])
 by smtp.gmail.com with ESMTPSA id l19sm2852142wme.21.2019.01.29.04.30.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 29 Jan 2019 04:30:09 -0800 (PST)
Date: Tue, 29 Jan 2019 12:30:08 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v2] dt-bindings: aspeed-lpc: Make parameter optional
Message-ID: <20190129123008.GC24070@dell>
References: <20190118201547.640173-1-vijaykhemka@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190118201547.640173-1-vijaykhemka@fb.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2019 12:30:18 -0000

On Fri, 18 Jan 2019, Vijay Khemka wrote:

> Memory-region and flash phandle is not a required parameter, it is
> optional to describe in device tree and needed only use basis.
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> ---
>  Documentation/devicetree/bindings/mfd/aspeed-lpc.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> index 34dd89087cff..d28c4e117611 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> @@ -135,6 +135,9 @@ Required properties:
>  - clocks:	contains a phandle to the syscon node describing the clocks.
>  		There should then be one cell representing the clock to use
>  
> +Optional properties:
> +These below properties are optional to define.

This line is superfluous.  Please remove it.

> +
>  - memory-region: A phandle to a reserved_memory region to be used for the LPC
>  		to AHB mapping
>  

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
