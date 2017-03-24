Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vq8wj4gPYzDq7d
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 15:05:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rf/fAlDS"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id d191so347146ywe.1
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 21:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=qOT32RyBLLJb+HhyAf29DXqKLGXVz7CNEpXT4fxfiVI=;
 b=rf/fAlDSuLKxnZSNZFdZzPVZ8VmySoGuu6qdlqKkZPawjNuKDXkdggHcpkxbbfSm5y
 hWWzJLjD4+Tjw1uNP2nZ8Y84rMMZUNLBbCsJkPY7yi4cWEuvCUTjV+55ImwNEqL3fhx1
 qB3iPhtSu/hgZaandgQRCuuagtK3w1tiqpCOElPJOcSWVEESY8Th1J+/8IYHdJibKCQ4
 LhbBGBnVlLCsGv0C8RCYHzWRImqh10kELmxz76Pa8MK5KexELYOa5beX6cXS9mDznNDL
 vS6KxwyRvQf0Z3xHC+tcGUZuScuwI9et17ZJS/OVoZ41vSvvsYKk6DhCeu0AN/DjZUTe
 mAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=qOT32RyBLLJb+HhyAf29DXqKLGXVz7CNEpXT4fxfiVI=;
 b=Hedh55Vl4o5P8j0FyKOMzFugqI9ffuid2bWTQI4BPdR0OBXE5xgr5tsK/19ZvbIkcP
 CAOzTXzgdqGzd5pcByG2w2Wl7ykJgzVYW9mrUdTpQCSFYCmrEmm67hPsJp3YbzcX+STg
 BXjxgVnjmozIwcf+94MSy/dOqkkowTqxmKy6SweKub9jvCQkzZMFbkxymwFCNB3yZGT2
 hHVXLZd1sfBLYnA/npIuMHxWzd3butWRnLsBHw5wBgs+wtCjhBbUtDybYgsvwaUt4j1W
 1T/b8I+zuKCXqXqT35gNZq73qcNLHkr1+rg27zDQZEm1l5/5Xn6XSCxBf32MK9+GWyYq
 T4dg==
X-Gm-Message-State: AFeK/H0e8iCXFOk4KiLVHplv32v1o7LupUtO2HiiBIMR8+ZlTlK3OTBhWg2uO6Ie/r/gm8WUh3ogMrR4rzdIYQ==
X-Received: by 10.129.91.86 with SMTP id p83mr4318958ywb.50.1490328354507;
 Thu, 23 Mar 2017 21:05:54 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.37.197 with HTTP; Thu, 23 Mar 2017 21:05:34 -0700 (PDT)
In-Reply-To: <20170323184136.7349-1-raltherr@google.com>
References: <20170323184136.7349-1-raltherr@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Mar 2017 14:35:34 +1030
X-Google-Sender-Auth: 1QfGmKVI5Q7VytqqEh7w1WrGXuk
Message-ID: <CACPK8XfCH0jLDncU4ZtxV_Xxe9k=9y-gf4OvZc5opmNNKdTiCQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] Documentation: dt-bindings: Document bindings for
 Aspeed ADC
To: Rick Altherr <raltherr@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, 
 linux-iio@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, 
 Rob Herring <robh+dt@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jic23@kernel.org>, 
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 24 Mar 2017 04:05:58 -0000

On Fri, Mar 24, 2017 at 5:11 AM, Rick Altherr <raltherr@google.com> wrote:
> Signed-off-by: Rick Altherr <raltherr@google.com>
> ---
>
> Changes in v4: None
> Changes in v3:
> - Consistently write hex contstants with lowercase letters
> - Drop model numbers from description as same IP is used in every generation
>
> Changes in v2:
> - Rewritten as an IIO ADC device
>
>  .../devicetree/bindings/iio/adc/aspeed_adc.txt       | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
>
> diff --git a/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt b/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
> new file mode 100644
> index 000000000000..674e133b7cd7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
> @@ -0,0 +1,20 @@
> +Aspeed ADC
> +
> +This device is a 10-bit converter for 16 voltage channels.  All inputs are
> +single ended.

You could mention that the vref is a fixed depending on the SoC generation.

Otherwise, lgtm.

Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

> +
> +Required properties:
> +- compatible: Should be "aspeed,ast2400-adc" or "aspeed,ast2500-adc"
> +- reg: memory window mapping address and length
> +- clocks: Input clock used to derive the sample clock. Expected to be the
> +          SoC's APB clock.
> +- #io-channel-cells: Must be set to <1> to indicate channels are selected
> +                     by index.
> +
> +Example:
> +       adc@1e6e9000 {
> +               compatible = "aspeed,ast2400-adc";
> +               reg = <0x1e6e9000 0xb0>;
> +               clocks = <&clk_apb>;
> +               #io-channel-cells = <1>;
> +       };
> --
> 2.12.1.500.gab5fba24ee-goog
>
