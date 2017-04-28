Return-Path: <robherring2@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
 [209.85.223.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wF2CX3MqszDqBQ
 for <openbmc@lists.ozlabs.org>; Sat, 29 Apr 2017 04:19:35 +1000 (AEST)
Received: by mail-io0-f195.google.com with SMTP id h41so13062022ioi.1
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 11:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rDX0qZgBdDON5sy1mIN5jhsh/Tn3EBHDF3RBV5m/84c=;
 b=ATQnf0WCDzydgTqO+yfQ5MJEU1sll6n1sEuYj/j8WfK23HWEi/yw8H/Tk4xnrSuecp
 Rpz6K2n2+iLj1MulNR79j4L99ThH99UblpHDrbiovwZbvBqC+acOEyuNEkkd38WigyAE
 t+uvyierLS6NKaMkmp979vy+5RXXyLVpka2K3zF2DV1jggZNvCdKuC2AE/HmNfYr3Qn2
 zCEGDDB2AY8j6BJgzuPT3TUt8QziyCEw8jBFJWHPgB8IC/EZNDSMU34ZirK1zYCLWc6F
 plSuRDB3Ae6eIH6fviCfRZQE50GVtHXvvQ/nr/qHF32JD0SfKxZy1TjWqFacnYCyM6Y7
 7l/Q==
X-Gm-Message-State: AN3rC/6oZ51x+Tp/YVw3F3KGlb8Gz9yv3oNSs9p8Y3nruXSrQME8HC93
 5E5UWsGlXDKB/A==
X-Received: by 10.202.169.9 with SMTP id s9mr4679974oie.38.1493403573010;
 Fri, 28 Apr 2017 11:19:33 -0700 (PDT)
Received: from localhost (66-90-148-125.dyn.grandenetworks.net.
 [66.90.148.125])
 by smtp.gmail.com with ESMTPSA id r55sm3023249otr.41.2017.04.28.11.19.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 28 Apr 2017 11:19:32 -0700 (PDT)
Date: Fri, 28 Apr 2017 13:19:31 -0500
From: Rob Herring <robh@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: wsa@the-dreams.de, mark.rutland@arm.com, tglx@linutronix.de,
 jason@lakedaemon.net, marc.zyngier@arm.com, joel@jms.id.au,
 vz@mleia.com, mouse@mayc.ru, clg@kaod.org, benh@kernel.crashing.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v7 1/5] irqchip/aspeed-i2c-ic: binding docs for Aspeed
 I2C Interrupt Controller
Message-ID: <20170428181931.ddbm2sm3laeruszo@rob-hp-laptop>
References: <20170424181818.2754-1-brendanhiggins@google.com>
 <20170424181818.2754-2-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170424181818.2754-2-brendanhiggins@google.com>
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
X-List-Received-Date: Fri, 28 Apr 2017 18:19:37 -0000

On Mon, Apr 24, 2017 at 11:18:14AM -0700, Brendan Higgins wrote:
> Added device tree binding documentation for Aspeed I2C Interrupt
> Controller.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
> Added in v6:
>   - Pulled "aspeed_i2c_controller" out into a interrupt controller since that is
>     what it actually does.
> Changes for v7:
>   - None
> ---
>  .../interrupt-controller/aspeed,ast2400-i2c-ic.txt | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt

Acked-by: Rob Herring <robh@kernel.org>
