Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vtBf35DfkzDq93
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 13:33:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gXwwrkKc"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id k13so286152ywk.2
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 19:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=iH6+LcFIYPefUgVBPLKYxFiucO66n0i/ZEHQaTpHTdw=;
 b=gXwwrkKceiLIhC1ueQCRc+F/PMZFy+1TkaIDunFqgCBehxdBv8PuxA6rScdOmNmHjh
 bx7/qjZInyztYOT5kkCdt8xXD7av6pdzKcnxevP4Cr0V71oaIWaG2zemxnugM89KzHaY
 f9Vkqmr3rcgAdn9bXs/kZ4w+KY7jD0p/ryLbFDR8TXIC/cRyFNLZcFgZu9QyQBmIdqaL
 iug+kz+TYA8ZggCSYE9Q/6x3l/nsfagh5uAb89UXm39hRAJjUgqPZth+VyWszYi+W8lG
 CUmGit8zN+/S1GLKKw5962YSsotegt5+KHmqWobFbJtBXCmd9sI+xzf6+lbbazjrL4y7
 gc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=iH6+LcFIYPefUgVBPLKYxFiucO66n0i/ZEHQaTpHTdw=;
 b=O9tq+x0LLvukDR/MQzaG1F2OoNYJ6A/hWYlnz3CyAiDr+7XIDblJB+iZgygaTnuQw8
 44nnDfYrapaurhAlrHLcAIIypJpXaDc0fW6CtbYq+JOCXh2HFg8ouW9a5EIyOGmPDKTU
 cBg0YgteXb9ioRSdkfPGM4NBuarl31EHqu0e4OdAp+2jSKtCvXZVaa2oOGjr2A2aM6Kv
 KSeWvRvV5IKBTip3P5Ie+gtTlqeQ25WfTvZSPENGE1SBAD9b+EGkIRZlrMt1uL0C7Xq8
 ydOgsQdgwMY9rJWe4EiNlQfSXteMJ1sP9IZE61y6Y/LVaPFA2SjwI9qwVRxbkBAZ2DXl
 UACQ==
X-Gm-Message-State: AFeK/H1DKqrKslAhGO989fWyvj2P8QlgKzW7OBqIV0fEfOBZS1Fzz0cMiH0dpX9M0qis0uq2GNjzUPIKBpHq/g==
X-Received: by 10.129.116.214 with SMTP id p205mr26468667ywc.268.1490754825525; 
 Tue, 28 Mar 2017 19:33:45 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.59.17 with HTTP; Tue, 28 Mar 2017 19:33:25 -0700 (PDT)
In-Reply-To: <20170328215259.31622-1-raltherr@google.com>
References: <20170328215259.31622-1-raltherr@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 29 Mar 2017 13:03:25 +1030
X-Google-Sender-Auth: VvRzc8LaPvJLiyLoqRX-RMabL9g
Message-ID: <CACPK8Xcf2A8RMy7cthJrdi2CA0L_Hfi+2Hy3JBCzLTsofjhEuA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] Documentation: dt-bindings: Document bindings for
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
X-List-Received-Date: Wed, 29 Mar 2017 02:33:48 -0000

On Wed, Mar 29, 2017 at 8:22 AM, Rick Altherr <raltherr@google.com> wrote:
> Signed-off-by: Rick Altherr <raltherr@google.com>
> ---

Acked-by: Joel Stanley <joel@jms.id.au>

>
> Changes in v5: None
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
> 2.12.2.564.g063fe858b8-goog
>
