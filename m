Return-Path: <linus.walleij@linaro.org>
Received: from mail-it0-x232.google.com (mail-it0-x232.google.com
 [IPv6:2607:f8b0:4001:c0b::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wBR5p2tyHzDq5W
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 22:50:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="Rs5ymOdg"; 
 dkim-atps=neutral
Received: by mail-it0-x232.google.com with SMTP id g66so58240660ite.1
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 05:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=6OoullcpTHOGm/pex4wUAZYDlWX3cf1Nw74Aw6NNpOU=;
 b=Rs5ymOdgqfX8WhL+qIxwSfJqyeYid0mJUZ+6fLNDT66xyXBGuOAZi4yAzxzFcMo8Lm
 ryQw8EkY3cfFZMAWkXo8xPEIyijYNhtNgucYBrshVfCeIoxtKaQsiPRzw4k3GJMPvtqS
 DlheohYAHcnfbHLWoukIRZhSrifcPvIsWxx10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=6OoullcpTHOGm/pex4wUAZYDlWX3cf1Nw74Aw6NNpOU=;
 b=s6ew599ecbCL6nP9/RXnY0A+0umEWfBCTlYuDByuFppuQSfUHBpSW1B5bbPFyxloyC
 zcfEeXTe/LiZ2eUjd1hqpItuYefe6J2K9YRu7EH026tvfN4nFfWeJWIEymZVypZyGslG
 xKRmdzJEp5Lke+de9hZsCtyWxF3akV5WNSuCZm4QQdqZj0NhlwwI0cDnRKlMahljrgqj
 yOBWwzlRAkqPlk/wE9P+SgRDogAjOwzCXqfInErJXjmQGSkfDOpZEdvRkuXZYmw0WXTx
 l3jt496yea3VISAzq8n7dyka+W0eJRcdkg+JXXTw79v+w3epwk6F1QWPoTXw9yMkcabh
 8PQg==
X-Gm-Message-State: AN3rC/4CkLVPIy3KSk9QK9Mwctcu486n83DRWGKebBKsV/U79kSS8Pri
 IM96ta+jUQl84pQsOKhoWLvlbSOtHlBI
X-Received: by 10.36.219.195 with SMTP id c186mr13598516itg.25.1493038236610; 
 Mon, 24 Apr 2017 05:50:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.76.210 with HTTP; Mon, 24 Apr 2017 05:50:35 -0700 (PDT)
In-Reply-To: <20170407125902.15960-4-andrew@aj.id.au>
References: <20170407125902.15960-1-andrew@aj.id.au>
 <20170407125902.15960-4-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Apr 2017 14:50:35 +0200
Message-ID: <CACRpkdYe7Wvc=stcTqyMXqggo-zpdJYMiK-9DXJfem+P-AWG-w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] gpio: aspeed: Add debounce support
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
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
X-List-Received-Date: Mon, 24 Apr 2017 12:50:38 -0000

On Fri, Apr 7, 2017 at 2:59 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> Each GPIO in the Aspeed GPIO controller can choose one of four input
> debounce states: to disable debouncing for an input, or select from one
> of three programmable debounce timer values. Each GPIO in a
> four-bank-set is assigned one bit in each of two debounce configuration
> registers dedicated to the set, and selects a debounce state by
> configuring the two bits to select one of the four options.
>
> The limitation on debounce timer values is managed by mapping offsets
> onto a configured timer value and keeping count of the number of users
> a timer has. Timer values are configured on a first-come-first-served
> basis.
>
> A small twist in the hardware design is that the debounce configuration
> register numbering is reversed with respect to the binary representation
> of the debounce timer of interest (i.e. debounce register 1 represents
> bit 1, and debounce register 2 represents bit 0 of the timer numbering).
>
> Tested on an AST2500EVB with additional inspection under QEMU's
> romulus-bmc machine.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied.

Yours,
Linus Walleij
