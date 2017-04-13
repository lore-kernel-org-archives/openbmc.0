Return-Path: <robherring2@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w3rzj3sD5zDq5b
 for <openbmc@lists.ozlabs.org>; Fri, 14 Apr 2017 05:52:33 +1000 (AEST)
Received: by mail-oi0-f65.google.com with SMTP id t14so4810021oif.1
 for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2017 12:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=D0qM4kli021Cc9UpAq0mm3SJjhaXtjR1W3tNZ+AMggg=;
 b=fqmCqRUxU9xthAeM9AzmoZ1PLQGKPbYl9Gi643jsGx/eF8x4/Gd+0a14FtynS8iGJY
 Gwf8/XeSqZY2Q2rayUqmQNlrHI8aW2knFUJHAgwz7VAz46IW/f29VkbtO2iFPK/RD6gO
 yRtoHDFsWyAd5vzPmhYv/dK7N9H3gshb89yGshzzPa4lQ9qNcrgWAIQPLY0onC9s2vvI
 9e3Ccp1diOUzt0FrRmUVHTUILL5spbxHvQ1SZ3Tga4U2rNcgEDoDQ6xCJqQ/P2hcShiU
 VBaR67XIETVeuhkTcrU3OBcOgX1HjTVm1631UE4KIETag5xtcwQ5JBIp48EiplolscO/
 EvAg==
X-Gm-Message-State: AN3rC/7qNeutd/he4bZAkHo28a+aryxIyWsXwxjH126n9FV3V8U1qxla
 aOf5rkTkQEoBOQ==
X-Received: by 10.157.82.171 with SMTP id f43mr3091634oth.27.1492113151852;
 Thu, 13 Apr 2017 12:52:31 -0700 (PDT)
Received: from localhost (66-90-148-125.dyn.grandenetworks.net.
 [66.90.148.125])
 by smtp.gmail.com with ESMTPSA id t37sm2154068ott.9.2017.04.13.12.52.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Apr 2017 12:52:31 -0700 (PDT)
Date: Thu, 13 Apr 2017 14:52:30 -0500
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 2/4] gpio: aspeed: dt: Add optional clocks property
Message-ID: <20170413195230.oze5qsyunckajbk7@rob-hp-laptop>
References: <20170407125902.15960-1-andrew@aj.id.au>
 <20170407125902.15960-3-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170407125902.15960-3-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 13 Apr 2017 19:52:34 -0000

On Fri, Apr 07, 2017 at 10:29:00PM +0930, Andrew Jeffery wrote:
> We need a reference to the HPLL to calculate debounce cycles. If the
> clocks property is not supplied in the GPIO node then the consumer
> should deny any debounce requests.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-aspeed.txt | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
