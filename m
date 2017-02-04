Return-Path: <linus.walleij@linaro.org>
Received: from mail-it0-x22c.google.com (mail-it0-x22c.google.com
 [IPv6:2607:f8b0:4001:c0b::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vG59D483kzDqBm
 for <openbmc@lists.ozlabs.org>; Sun,  5 Feb 2017 07:35:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="DoMr9ot6"; 
 dkim-atps=neutral
Received: by mail-it0-x22c.google.com with SMTP id c7so33119718itd.1
 for <openbmc@lists.ozlabs.org>; Sat, 04 Feb 2017 12:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=5QyZmskpQHC5jNyf4wMUMtf2fMG3KcMBIS9Yd94DoyM=;
 b=DoMr9ot6QOxOgdJTtU+cXRZ66Jh1ys2lFTmw9fhb3LZH71/Vl+IO3eKH0nKmq2dmn2
 wiX1hi/AFRG4fZ90X1KH2pwKCXo4ioH6Dh3g0a0sI/7UTfKVhM/Qbeo9JZAgySlqmiiL
 S0P9n3BIh/gV8BTHl/Q8qpzFxYyLo4YogrkWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=5QyZmskpQHC5jNyf4wMUMtf2fMG3KcMBIS9Yd94DoyM=;
 b=MlIgUEFUgHEC1B3MpJ2EZCUm6dTXkSiOBsUPreWvoFqD4PAFRqgrkpE3a4bUPG0Ojo
 h5b/99JmyWNtmQBLEabVbwgIuv61Xt++brtXJoLf3cilit6JnJ2dek0j0YcFJQe6YGs2
 kfoJ4vBTjpypoUsM4PoAXXdaU2jWv8hXWkz/1nnkUMc8YB6QqPbFmzr7WaIY0vpul3RO
 EA3sDSq5KEMEaAJBguo8eaX/90dHewABEIwucOGK2oJsCIWAPnV2EAIrcbyCvV8uEEXS
 BPlfAwv/KgSfJp7GrYxm+LqdZXSqvCACURvGcxuVerGwwDPkJ9Ky2nmnAYs/2RdfFLCf
 DaIg==
X-Gm-Message-State: AIkVDXIvowrQOOSuBaua5xQSC1X6vAjHE0Q2bV8DILtgkGzoL3Oz2VwGQtuanctShdl+Wdw2ylu4JAJsIyIB9v/x
X-Received: by 10.36.14.20 with SMTP id 20mr2359040ite.56.1486240556421; Sat,
 04 Feb 2017 12:35:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.169.75 with HTTP; Sat, 4 Feb 2017 12:35:55 -0800 (PST)
In-Reply-To: <20170202042817.8033-1-andrew@aj.id.au>
References: <20170202042817.8033-1-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 4 Feb 2017 21:35:55 +0100
Message-ID: <CACRpkdbbXGuE2u3H0W7XLmaq1VLNnVrGCZYgCC=3_odkifvaaQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: aspeed: Remove dependence on GPIOF_* macros
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
X-List-Received-Date: Sat, 04 Feb 2017 20:36:02 -0000

On Thu, Feb 2, 2017 at 5:28 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> 1736f75d35e47409ad776273133d0f558a4c8253 is a (v2) patch which had
> unresolved review comments[1]. Address the comments by removing the use
> of macros from the consumer header (this patch represents the diff
> between v2 and v3[2]).
>
> [1] https://lkml.org/lkml/2017/1/26/337
> [2] https://lkml.org/lkml/2017/1/26/786
>
> Fixes: 1736f75d35e4 ("gpio: aspeed: Add banks Y, Z, AA, AB and AC")
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied with Joel's ACK.

Thank you for just tirelessly fixing my mistakes, I owe you one.

Yours,
Linus Walleij
