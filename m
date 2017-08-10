Return-Path: <robherring2@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSssg0yd0zDqs4;
 Fri, 11 Aug 2017 01:45:27 +1000 (AEST)
Received: by mail-pg0-f66.google.com with SMTP id y192so917886pgd.1;
 Thu, 10 Aug 2017 08:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DhWRkq00rmmGW2/XzHcAAt4UjzRohUdcQFuJ4j1xvpU=;
 b=M6YnbcXc/l4P2B9uZn0s+mh9InMkqViRUhqzIvz3dfSbwB6c2V6mOACIgC+DQrdYD8
 ZbNqe5zukcQrArtdC9cnuc1F5K39NvoniJ3BCm/d7U7zyTM1yL7jhDGRmkPMAn/Fhe9q
 AUAB9289c48DCF1agnB/cfD4uLcIo5ll3WnW/oQolJeo4uv38+CwZRv/ZqhGDBIT7QLQ
 vaBDYmqr3uRcIQqSPrr2C8S27Sgk0g+IVUgBHDIOg//RYqxEYY5glQlUJY779yR4oWwS
 O9dx0xner6J1PU610kcOZ2brm5+FXOigMSoUkWen3IvdSowWylUzd1NSuSHPOKEA9lUN
 Od9g==
X-Gm-Message-State: AHYfb5irG1GANagqcuVzxiKLrw0yaPCmS0YGPW41xcBDd0s0G/Dg5Zub
 +rv3LZETR2kmNA==
X-Received: by 10.98.212.13 with SMTP id a13mr12442544pfh.131.1502379925115;
 Thu, 10 Aug 2017 08:45:25 -0700 (PDT)
Received: from localhost (24-223-123-72.static.usa-companies.net.
 [24.223.123.72])
 by smtp.gmail.com with ESMTPSA id q3sm13241757pfl.89.2017.08.10.08.45.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Aug 2017 08:45:23 -0700 (PDT)
Date: Thu, 10 Aug 2017 10:45:22 -0500
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-watchdog@vger.kernel.org, wim@iguana.be, linux@roeck-us.net,
 mark.rutland@arm.com, joel@jms.id.au, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: aspeed: External reset signal
 properties
Message-ID: <20170810154522.7br6ta3f6plf7ytm@rob-hp-laptop>
References: <20170802044529.30032-1-andrew@aj.id.au>
 <20170802044529.30032-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170802044529.30032-2-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 10 Aug 2017 15:45:27 -0000

On Wed, Aug 02, 2017 at 02:15:28PM +0930, Andrew Jeffery wrote:
> For the AST2500 and compatible watchdog controllers the external reset
> signal can be configured for push-pull or open-drain drive types, and in
> the case of push-pull driving, active low or high.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
