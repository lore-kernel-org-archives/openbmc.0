Return-Path: <robherring2@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
 [209.85.223.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wF2G71J3KzDqBQ
 for <openbmc@lists.ozlabs.org>; Sat, 29 Apr 2017 04:21:51 +1000 (AEST)
Received: by mail-io0-f195.google.com with SMTP id h41so13073732ioi.1
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 11:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3cn+dTQcHZ8PWP28TfRHOI4QDJ1FVPu7hfngF/uyfWs=;
 b=cLM4w2/VHzEVjqoDpMqLPUimY5Ilv0kIvNrvq57mdZmAaGenHOyYTOTMmILiwaQa32
 WitgAXwYFIoFFPfGUxGd3uMNbKnZ2UoedIRYkY4gsR+EIL7yp4RKfgNV0fsZbWDRg2Kw
 wtHTWjaNs/p/MxIC3a1zhfcU4BCWaAaaRARjZSh91O4RCBicmM9591aOtIH5xDOce8q3
 FwrT1BUZ2AUPLzadGdhtJGmfyqQzsCgdAL2h5F2rF6WBlDee9ZLvhL3mK/UJzqXD8Yy2
 wJ1f/yA9iV7kOUQ8QXycCM2O3/f51M16gMqaXABHKucWrL+YgiIRMfp/OC1kwj3qwOH3
 8aig==
X-Gm-Message-State: AN3rC/5oUmL6c4QzUhQlCyzem1VDk1Y6rCOTOKEvpg4ZbRjT5Qoiydbx
 wTGSF+x8CRUb7w==
X-Received: by 10.157.50.33 with SMTP id t33mr5192493otc.232.1493403709493;
 Fri, 28 Apr 2017 11:21:49 -0700 (PDT)
Received: from localhost (66-90-148-125.dyn.grandenetworks.net.
 [66.90.148.125])
 by smtp.gmail.com with ESMTPSA id j21sm1620281oih.24.2017.04.28.11.21.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 28 Apr 2017 11:21:48 -0700 (PDT)
Date: Fri, 28 Apr 2017 13:21:48 -0500
From: Rob Herring <robh@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: wsa@the-dreams.de, mark.rutland@arm.com, tglx@linutronix.de,
 jason@lakedaemon.net, marc.zyngier@arm.com, joel@jms.id.au,
 vz@mleia.com, mouse@mayc.ru, clg@kaod.org, benh@kernel.crashing.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v7 3/5] i2c: aspeed: added documentation for Aspeed I2C
 driver
Message-ID: <20170428182148.tbpsgnhxssortq3u@rob-hp-laptop>
References: <20170424181818.2754-1-brendanhiggins@google.com>
 <20170424181818.2754-4-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170424181818.2754-4-brendanhiggins@google.com>
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
X-List-Received-Date: Fri, 28 Apr 2017 18:21:51 -0000

On Mon, Apr 24, 2017 at 11:18:16AM -0700, Brendan Higgins wrote:
> Added device tree binding documentation for Aspeed I2C busses.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
> Changes for v2:
>   - None
> Changes for v3:
>   - Removed reference to "bus" device tree param
> Changes for v4:
>   - None
> Changes for v5:
>   - None
> Changes for v6:
>   - Replaced the controller property with and interrupt controller, leaving only
>     the busses in the I2C documentation.
> Changes for v7:
>   - Changed clock-frequency to bus-frequency in device tree
> ---
>  .../devicetree/bindings/i2c/i2c-aspeed.txt         | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt

Acked-by: Rob Herring <robh@kernel.org>
