Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.214.65; helo=mail-it0-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
 [209.85.214.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lHVn6WYXzDqRM
 for <openbmc@lists.ozlabs.org>; Wed,  8 Aug 2018 00:50:09 +1000 (AEST)
Received: by mail-it0-f65.google.com with SMTP id g141-v6so23300058ita.4
 for <openbmc@lists.ozlabs.org>; Tue, 07 Aug 2018 07:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5fcEFOPNeXboPGPaD1NnV9lHx//zzsS7yAB6xC3Makc=;
 b=r9/LZsICXwFm9w3SE1lZcYsiOgXrbb/PSavKd9+1GTY5kbqwlOdfaKyejkgPihTojl
 yPv1DgkBwSwAw+6DQf2rgNOiRcOAdWcIrDUE96PGzhKZBxm3zE9kM6r5dr6xzU0Ti/G1
 cpf7pbpnJxTk8dVWwlYFxT5JG7PkqpKZL4+ePIzq8QHk767Mjv4Z6crIRcved5gBoU+X
 K8DTv3xpAvldtkr+6RjUBBf1/YW4FIljyyDqe9eESl6IjeyxC8awuJaTgc9xWDmgLQx5
 Yfq8liCrCiNPBuMJadN2jISu8N7u/uc8g9ufxR42OnjY7tKrveyym1DnrR5Q4a8G/tXz
 yQ8w==
X-Gm-Message-State: AOUpUlFjdpSieFfB7ugqHIdIvT3V78zZ0rdvA9ojOc0U7NN+3ek69mqX
 cyUA23kyi2s0A7ACz99fXg==
X-Google-Smtp-Source: AA+uWPw/5tjgFO0AF/v2RlZBYykCNy30mgWDbdfzaQbTmrvbGYZr4q0gaKsvb9Jpghl/cT6DOsBkCQ==
X-Received: by 2002:a24:3ec3:: with SMTP id
 s186-v6mr2164396its.73.1533653407263; 
 Tue, 07 Aug 2018 07:50:07 -0700 (PDT)
Received: from localhost ([24.51.61.72])
 by smtp.gmail.com with ESMTPSA id z195-v6sm659072ioe.38.2018.08.07.07.50.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Aug 2018 07:50:06 -0700 (PDT)
Date: Tue, 7 Aug 2018 08:50:05 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: linus.walleij@linaro.org, mark.rutland@arm.com, yuenn@google.com,
 venture@google.com, brendanhiggins@google.com,
 avifishman70@gmail.com, joel@jms.id.au, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-binding: pinctrl: Add NPCM7xx pinctrl and GPIO
 documentation
Message-ID: <20180807145005.GA25679@rob-hp-laptop>
References: <20180806152354.340380-1-tmaimon77@gmail.com>
 <20180806152354.340380-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180806152354.340380-2-tmaimon77@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2018 14:50:10 -0000

On Mon, Aug 06, 2018 at 06:23:53PM +0300, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM750/730/715/705 pinmux and GPIO controller.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt   | 216 +++++++++++++++++++++
>  1 file changed, 216 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt

Please add acked/reviewed-by's when posting new versions.

Rob
