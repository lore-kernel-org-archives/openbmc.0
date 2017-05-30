Return-Path: <robherring2@gmail.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wcn1l1SwwzDq5x
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 07:34:34 +1000 (AEST)
Received: by mail-oi0-f53.google.com with SMTP id w10so128488790oif.0
 for <openbmc@lists.ozlabs.org>; Tue, 30 May 2017 14:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LZ/7OJEAXmrFJYM2nT+JkIZB7qUUzlQpqj9hWjIyFOo=;
 b=axSZxa/6evjsC9oaQd4G7So3p0b6mYh/2mmXfdbtDNto+JlW34Tdz8hziuteZNmHbx
 Sd1VUdFOBnrWNGNOLKNXiu9Cjgc8j4vYcKXeeR6AuXkAEyvkM0aQn8Tku+MkzufMhEpE
 gbn4NYsS7qkpqrtJABwe+9aEPxMkaEKUjXLyHh/uzvlPBsme87T2H9iPoIMl0nDec0gJ
 vfxaXhcXsNbYJCrEncrCoU+JnI2p3jkpeqoWM0PAOeUlKZmJDHX2qzzFEtA6aNSDR+C7
 Gc5knWLwhYg+IehHYmpjogWFfRgZ4rBtXMHAMrRHXa4p7g/2OpDYn/KtOcNCLlcJgbjE
 wOsA==
X-Gm-Message-State: AODbwcDT5s62V45+fzNTZ2vA0WOyNxQi76zMLjssAUZgd2srR7Oe6uAO
 Ct08Us6XHlBM3A==
X-Received: by 10.202.104.36 with SMTP id d36mr10880901oic.61.1496180071704;
 Tue, 30 May 2017 14:34:31 -0700 (PDT)
Received: from localhost (66-90-148-125.dyn.grandenetworks.net.
 [66.90.148.125])
 by smtp.gmail.com with ESMTPSA id m188sm6502422oig.22.2017.05.30.14.34.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 30 May 2017 14:34:31 -0700 (PDT)
Date: Tue, 30 May 2017 16:34:30 -0500
From: Rob Herring <robh@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: wsa@the-dreams.de, mark.rutland@arm.com, tglx@linutronix.de,
 jason@lakedaemon.net, marc.zyngier@arm.com, joel@jms.id.au,
 vz@mleia.com, mouse@mayc.ru, clg@kaod.org, benh@kernel.crashing.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v8 1/5] irqchip/aspeed-i2c-ic: binding docs for Aspeed
 I2C Interrupt Controller
Message-ID: <20170530213430.vlxioxzzuzbjojhj@rob-hp-laptop>
References: <20170525064925.16867-1-brendanhiggins@google.com>
 <20170525064925.16867-2-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170525064925.16867-2-brendanhiggins@google.com>
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
X-List-Received-Date: Tue, 30 May 2017 21:34:35 -0000

On Wed, May 24, 2017 at 11:49:21PM -0700, Brendan Higgins wrote:
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
> Changes for v8:
>   - None

I already acked this. Please add acks when posting new versions.

Rob
