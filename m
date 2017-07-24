Return-Path: <robherring2@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
 [209.85.192.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGTQj3nKFzDrJM
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 03:49:33 +1000 (AEST)
Received: by mail-pf0-f196.google.com with SMTP id q85so11010855pfq.2
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 10:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=L+87i+NpV1k2vcApRPjisy4EFREM+Mb1j60CznnpEoI=;
 b=YLo5cWREXTw55rhU7P151nVTZufq+IfdX3I52XCuvKdV1kgSMDp04ieLQeWYrZVL0X
 19KGybTYUdD6Ezs6uIdmkliwKcEHgqOeE/ECSP916If4jjzQ8ruAcmTSjyvTEtFm+pmt
 iQrNMnyAOgjieOv7WKSBoV2U6rkkRONnb4M9c2QqrWFaDhYwLbghO9FV0j62bKFo7V4E
 awP12nhPTxohdbcRxllcnuY6Iz0PzTrpTxjZKtYMtssr1cyPCP8g97asVEM7UIOKP5DI
 ugY0FfydzJsFRnh6W3U33Ubxjoas3Yt8+HdqMmgq6p/8MVNrY630IpC25ShNni4PS47A
 x5Mw==
X-Gm-Message-State: AIVw113+jjtMB6llKYro+d+Lwt1Q0DskoseZbiWVZQJbhCgR3E8/30Ve
 yxgTc/7gtjFE4Q==
X-Received: by 10.99.170.1 with SMTP id e1mr11860643pgf.411.1500918571163;
 Mon, 24 Jul 2017 10:49:31 -0700 (PDT)
Received: from localhost (24-223-123-72.static.usa-companies.net.
 [24.223.123.72])
 by smtp.gmail.com with ESMTPSA id k26sm22377920pfb.145.2017.07.24.10.49.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Jul 2017 10:49:30 -0700 (PDT)
Date: Mon, 24 Jul 2017 12:49:29 -0500
From: Rob Herring <robh@kernel.org>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: wim@iguana.be, linux@roeck-us.net, mark.rutland@arm.com, joel@jms.id.au,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v5 1/2] drivers/watchdog: Add optional ASPEED device tree
 properties
Message-ID: <20170724174929.wtf5ifjr2h7eixdc@rob-hp-laptop>
References: <20170717192539.7950-1-cbostic@linux.vnet.ibm.com>
 <20170717192539.7950-2-cbostic@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170717192539.7950-2-cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 24 Jul 2017 17:49:33 -0000

On Mon, Jul 17, 2017 at 02:25:38PM -0500, Christopher Bostic wrote:
> Describe device tree optional properties:
> 
>   * aspeed,reset-type = "cpu|soc|system|none"
>      One of three different, mutually exclusive, values
> 
> 	"cpu" : ARM CPU reset on signal
> 	"soc" : 'System on chip' reset
> 	"system" : Full system reset
> 
>      The value can also be set to "none" which indicates that no
>      reset of any kind is to be done via this watchdog.  This assumes
>      another watchdog on the chip is to take care of resets.
> 
>   * aspeed,external-signal - Generate external signal (WDT1 and WDT2 only)
>   * aspeed,alt-boot - Boot from alternate block on signal
> 
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> v5 - Removed aspeed,interrupt property - no plans at this point to
>      need this functionality in the driver.
> v4 - Add aspeed-reset-type and assign one of four values,
>      cpu, soc, system, none.
> v3 - Invert soc and sys reset to 'no' to preserve backwards
>      compatibility.  SOC and SYS reset will be set by default
>      without any optional parameters set
> v2 - Add 'aspeed,' prefix to all optional properties
>    - Add arm-reset, soc-reset, interrupt, alt-boot properties
> ---
>  .../devicetree/bindings/watchdog/aspeed-wdt.txt    | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
