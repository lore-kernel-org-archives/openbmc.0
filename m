Return-Path: <robherring2@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w3rxW5k2WzDq5b
 for <openbmc@lists.ozlabs.org>; Fri, 14 Apr 2017 05:50:39 +1000 (AEST)
Received: by mail-oi0-f66.google.com with SMTP id t63so14219085oih.0
 for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2017 12:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=usoeeV9XVLSh+avB5DtjXtBWGKzaDjNfDb4eULG0bA0=;
 b=GPVUucZfG8bh9lZjpXYfxghnCkTOGjAfk34bEbhutqXJjMbC5NoUM/vxIQJHw72mcv
 mkQaz8rOvJrQPyX84DMzTdSXSM4xBr/RgIobUTPvCx3zCK0+eY/vzUGq0j+bTmfHOHuC
 b7Jz8HsyHQVAhABxAJ1hVeFOK2JuFeBelOmRkyQ20lW9qEo5WYco4sFlepAIV8Uzt0ES
 r1aWYtwM67QmqKQpqHqptoIrtpYPl67V80qmgmXYo7lMkSztcahamUqX2IXLPIpjrDXE
 0cfk6q29f8jyOZx14gaP12ECngT8+xpVTd331+ugCPI9+5S9M+kk+l6nANyjubkP5ATb
 BCFQ==
X-Gm-Message-State: AN3rC/7WmqRwqb6r86sjyyOc3RsckDueSkAwHt9REFUIeij6IKSlTJON
 4L4OKrcPlgfPrQ==
X-Received: by 10.202.235.199 with SMTP id j190mr2656199oih.206.1492113037824; 
 Thu, 13 Apr 2017 12:50:37 -0700 (PDT)
Received: from localhost (66-90-148-125.dyn.grandenetworks.net.
 [66.90.148.125])
 by smtp.gmail.com with ESMTPSA id c60sm10933013otb.21.2017.04.13.12.50.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Apr 2017 12:50:37 -0700 (PDT)
Date: Thu, 13 Apr 2017 14:50:36 -0500
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 1/4] gpio: aspeed: dt: Fix description alignment in
 bindings document
Message-ID: <20170413195036.eu5wqx6bgpx2f7ok@rob-hp-laptop>
References: <20170407125902.15960-1-andrew@aj.id.au>
 <20170407125902.15960-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170407125902.15960-2-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 13 Apr 2017 19:50:40 -0000

On Fri, Apr 07, 2017 at 10:28:59PM +0930, Andrew Jeffery wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-aspeed.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
