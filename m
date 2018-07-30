Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.214.68; helo=mail-it0-f68.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
 [209.85.214.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41fZx962WzzF18l
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jul 2018 09:08:13 +1000 (AEST)
Received: by mail-it0-f68.google.com with SMTP id g191-v6so1717569ita.0
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jul 2018 16:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bDWDHS0jUQSEq+jgGJGFL2bynC2J89infDELFlmNaVQ=;
 b=jg0Z3NQ2kHGPwEk7rwkMYZZ30x7gZwLqHic38bigJRzRsZVXj/4SHfdgUK9EsSHamu
 6wGNe+4fXAX28Y1nsChM1LLHPvgQszWFYqED041NrGk6LlcekGMP96hKA+9fIYg6OL7E
 Lgbt0/nzpH4ePoHTWoe2RzSESqg3RW0MfIwEJnke/yxpg4mY7paJyU5SndJCcEH5pWtu
 vnA3d1jAMwUF3/50+iTi/h7Fn+Pf3N3c0EixOBJmrKH+6F6YVvH93Qatzna7VHgOgzHw
 bVWgZ1LokbhD9lZ8Rj6MKL33qmzaUOYnrzIiXWKUgPY7QyKhHEyN5L4y7emhjZrpAW6b
 ZY8A==
X-Gm-Message-State: AOUpUlErb0F58Fi+uqYVcsFeSpigPgfX50txZxX6dCyOlqQOg9PYgho6
 7pGXL8tqq78sQuEeAAf0KA==
X-Google-Smtp-Source: AAOMgpc66qJaLbdkJrAs/cU3EVvKVgn8VteIFlC3isXwjvmPGHyQtvox1u+dRmM+UwJgW9iKGXb2Eg==
X-Received: by 2002:a24:5f92:: with SMTP id
 r140-v6mr1115984itb.95.1532992091268; 
 Mon, 30 Jul 2018 16:08:11 -0700 (PDT)
Received: from localhost ([24.51.61.72])
 by smtp.gmail.com with ESMTPSA id m23-v6sm706494iti.27.2018.07.30.16.08.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Jul 2018 16:08:10 -0700 (PDT)
Date: Mon, 30 Jul 2018 17:08:09 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: linus.walleij@linaro.org, mark.rutland@arm.com, yuenn@google.com,
 venture@google.com, brendanhiggins@google.com,
 avifishman70@gmail.com, joel@jms.id.au, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-binding: pinctrl: Add NPCM7xx pinctrl and GPIO
 documentation
Message-ID: <20180730230809.GA20470@rob-hp-laptop>
References: <20180730110406.132729-1-tmaimon77@gmail.com>
 <20180730110406.132729-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180730110406.132729-2-tmaimon77@gmail.com>
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
X-List-Received-Date: Mon, 30 Jul 2018 23:08:14 -0000

On Mon, Jul 30, 2018 at 02:04:05PM +0300, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM750/730/715/705 pinmux and GPIO controller.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt   | 216 +++++++++++++++++++++
>  1 file changed, 216 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt

Reviewed-by: Rob Herring <robh@kernel.org>
