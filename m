Return-Path: <robherring2@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
 [209.85.218.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wcn4r0bY3zDq5x
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 07:37:16 +1000 (AEST)
Received: by mail-oi0-f67.google.com with SMTP id v80so17889239oie.2
 for <openbmc@lists.ozlabs.org>; Tue, 30 May 2017 14:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VYyjjrVEfbiBqbH8nYEraYOVF14VDcBKUtdwG1If7P4=;
 b=OLMyvb30nzUCOuE+u0GsgU6LBkornr68YkiMGdMv0T6YkBmduiHZyXDThO42KKWSSn
 aEEzyzyhxyVVO2WNB4AXeW3xsZ6d6qUwBPp7P3DdNQUH2aJzsmvUkpGzn9vl+qSuFL5I
 OfkYzLEthmPhhsVP5dQBV9wH+ft+npYHSg3Mzqfy+GGlnVqgNACIxi9NrirkLDenbxDW
 0APvAeB7YRTJtYRnSOuXhgPsUBu7GC0QykU8Kd6JR+DGzfwqBq5SlZGnw57+x61GLFUN
 7RZDdDl87XpUdTYhbAxhQMrqDDNzzuPJDoWNUctB7/IHQ2IWcQsdfDoLogJT5EOXyg1c
 Emig==
X-Gm-Message-State: AODbwcCMlbT7FU+FoD0/EiblDxR66h6nH20XkgV+JIT/E0jJUHSklKAW
 sQ1zm5FQUDwoug==
X-Received: by 10.202.107.195 with SMTP id g186mr9876740oic.214.1496180234035; 
 Tue, 30 May 2017 14:37:14 -0700 (PDT)
Received: from localhost (66-90-148-125.dyn.grandenetworks.net.
 [66.90.148.125])
 by smtp.gmail.com with ESMTPSA id b9sm51124oth.4.2017.05.30.14.37.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 30 May 2017 14:37:13 -0700 (PDT)
Date: Tue, 30 May 2017 16:37:12 -0500
From: Rob Herring <robh@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: wsa@the-dreams.de, mark.rutland@arm.com, tglx@linutronix.de,
 jason@lakedaemon.net, marc.zyngier@arm.com, joel@jms.id.au,
 vz@mleia.com, mouse@mayc.ru, clg@kaod.org, benh@kernel.crashing.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v8 3/5] i2c: aspeed: added documentation for Aspeed I2C
 driver
Message-ID: <20170530213712.sspigq7xtrdcfabb@rob-hp-laptop>
References: <20170525064925.16867-1-brendanhiggins@google.com>
 <20170525064925.16867-4-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170525064925.16867-4-brendanhiggins@google.com>
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
X-List-Received-Date: Tue, 30 May 2017 21:37:16 -0000

On Wed, May 24, 2017 at 11:49:23PM -0700, Brendan Higgins wrote:
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
> Changes for v8:
>   - Added multi-master property to device tree
> ---
>  .../devicetree/bindings/i2c/i2c-aspeed.txt         | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt

Acked-by: Rob Herring <robh@kernel.org>
