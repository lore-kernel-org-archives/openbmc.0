Return-Path: <robherring2@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vxZ0n5yF4zDq7Z
 for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2017 00:16:41 +1000 (AEST)
Received: by mail-oi0-f66.google.com with SMTP id f193so19829398oib.0
 for <openbmc@lists.ozlabs.org>; Mon, 03 Apr 2017 07:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IIMEbBc1P9/5Vt1bijKVnUMSQURECnTtSnrJCeTazYI=;
 b=PRIYSi3gL6Go6s0aUoqYkCx9Qjr+aMR/P9ecXcK4IdLs3VGhT9txpIv73R6NjTOzA2
 sBKyt65+WD/1ePAMW8mCA1L4wiEorct2w8urDC9Z12/br1vtybZL9qoLM0kQ+liYIlbn
 2eqm4ptgzZrfwir9Dyh+SfUxlpCi9sEXogWK/TdtuoxLoDdKNZEgveKwFV4vSplLTZ2H
 AE1C8mIsI+FIecWa4c1npQLceWlGD7ORCv/ADUt+g6FNyRsmWFJ+2gi3kKBVxcInFzgF
 cUFaV6A/27IR4YUf0PR0h7y2TAkyNORUmQI9EeNVAbGGKF7NUhjqKJHt4YmKtvJxijQd
 cXlQ==
X-Gm-Message-State: AFeK/H1P/M4XJN+hYDWy5+ngkpCo+hYJSBNyt3eCq0yCVUBrzGIVOutEnjZFlHImdpM8Mw==
X-Received: by 10.202.0.215 with SMTP id 206mr8892358oia.111.1491228999459;
 Mon, 03 Apr 2017 07:16:39 -0700 (PDT)
Received: from localhost (66-90-148-125.dyn.grandenetworks.net.
 [66.90.148.125])
 by smtp.gmail.com with ESMTPSA id f2sm2193480ote.24.2017.04.03.07.16.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Apr 2017 07:16:38 -0700 (PDT)
Date: Mon, 3 Apr 2017 09:16:38 -0500
From: Rob Herring <robh@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: wsa@the-dreams.de, mark.rutland@arm.com, tglx@linutronix.de,
 jason@lakedaemon.net, marc.zyngier@arm.com, joel@jms.id.au,
 vz@mleia.com, mouse@mayc.ru, clg@kaod.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 benh@kernel.crashing.org
Subject: Re: [PATCH v6 1/5] irqchip/aspeed-i2c-ic: binding docs for Aspeed
 I2C Interrupt Controller
Message-ID: <20170403141638.fki7s3obmt63wl7g@rob-hp-laptop>
References: <20170328051226.21677-1-brendanhiggins@google.com>
 <20170328051226.21677-2-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170328051226.21677-2-brendanhiggins@google.com>
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
X-List-Received-Date: Mon, 03 Apr 2017 14:16:42 -0000

On Mon, Mar 27, 2017 at 10:12:22PM -0700, Brendan Higgins wrote:
> Added device tree binding documentation for Aspeed I2C Interrupt
> Controller.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
> Added in v6:
>   - Pulled "aspeed_i2c_controller" out into a interrupt controller since that is
>     what it actually does.
> ---
>  .../interrupt-controller/aspeed,ast2400-i2c-ic.txt | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt

Acked-by: Rob Herring <robh@kernel.org>
