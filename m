Return-Path: <linus.walleij@linaro.org>
Received: from mail-io0-x234.google.com (mail-io0-x234.google.com
 [IPv6:2607:f8b0:4001:c06::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v8NR73bJfzDq62
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jan 2017 00:43:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="DQK0EYvL"; 
 dkim-atps=neutral
Received: by mail-io0-x234.google.com with SMTP id j18so36588804ioe.2
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jan 2017 05:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Eph12QXavS7xUh3SqVa/9vJLJyJNPIFMbdUuq58Km/E=;
 b=DQK0EYvLSzUiNE1IqAOm3FOybfK1/A9ExZ77VwUNJa0nP98erERSF12svTfcnE7Piu
 PZheZTtULHMfrhMfr30KJRKsk257vsn/2wBoGAH5cCMG4Vh4zcXVmC9nF+cNixrUylaR
 sWNSoctwkdZzvoZSyvLyblIPIlgvSMUgik6BE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Eph12QXavS7xUh3SqVa/9vJLJyJNPIFMbdUuq58Km/E=;
 b=e1Ezpobit9jmgF2Ph6R5n41d1rxoXnUiUCC3L18sLwAaKCHvnCqn/xhANxEoHuoXRW
 w0PYBq+u+Zuq7ePCUAmdm4ajtkhPu3WmT/XTCihBtcO3Q4wSvLlhrlfKwfI9LnFmW80N
 7n/RJlmcawIxlCacrnluEFwMQDcs2oNzSR6kgtxboCu7QW1LIMTkKbG4rctNHqkkun7b
 HlbWHKDxs3oaU41lpS90pHI7AV2R4SWVr4ohC2RK1hfl62WBrTzS0oxLDaO+N3f0Q1TP
 u0RXIDsYkZLOYE3jlesNz6NmdVKTH49pR0Vy8KlLqYsILn2bIWJlvj+dfBQsMSbEZvHJ
 gUBw==
X-Gm-Message-State: AIkVDXL60BtcpQ1R71OKcQxG23VA03/VUk4duay/Uf8/DqHLttsYtdCY1e87oWZnbgp098HAdaaGVkUrv3mZizKG
X-Received: by 10.107.146.139 with SMTP id u133mr3024063iod.173.1485438192352; 
 Thu, 26 Jan 2017 05:43:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.169.75 with HTTP; Thu, 26 Jan 2017 05:43:11 -0800 (PST)
In-Reply-To: <20170123052717.9528-1-andrew@aj.id.au>
References: <20170123052717.9528-1-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 26 Jan 2017 14:43:11 +0100
Message-ID: <CACRpkdZvgOGqNMArExNoc3EJLSnydpF6TAXsvWD5ubPLA12dNA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: g4: Fix mux configuration for GPIOs
 AA[4-7], AB[0-7]
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, 
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 26 Jan 2017 13:43:16 -0000

On Mon, Jan 23, 2017 at 6:27 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> Incorrect video output configuration bits were being tested on pins in
> GPIO banks AA and AB for the ROM{8,16} mux functions. The ROM{8,16}
> functions are the highest priority for the relevant pins and also the
> default function, so we require the relevant video output configuration
> be disabled to mux GPIO functionality. As the wrong bits were being
> tested a GPIO export would succeed but leave the pin in an unresponsive
> state (i.e. value updates were ignored).
>
> This misbehaviour was discovered as part of extending the GPIO
> controller's support to cover banks Y, Z, AA, AB and AC (AC in the case
> of the g5 SoC).
>
> Fixes: 6d329f14a75f ("pinctrl: aspeed-g4: Add mux configuration for all pins")
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied.

Yours,
Linus Walleij
