Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="O6YOuPxe"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43g6dv1J5szDqkL;
 Thu, 17 Jan 2019 12:57:22 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id d19so9630119qtq.9;
 Wed, 16 Jan 2019 17:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8hf+ofgSsRS5t45iZYlUrALq0LlHYKreLgUYHny3V58=;
 b=O6YOuPxeg9LSor66Vb6PPawvMjF+bLGkWqJ3eH1LliKIo+5jbgmzK2QN7P8qPI0ykA
 6kCu17SfTW+GGVNd7oTN4WLLpejkNd5bWVBcf4ug947rp4wz+SnMhnBCEcdun09QRJBu
 Loe9vvYMEdeOypnNyLG6ZUkq4x2KJPrNiAm8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8hf+ofgSsRS5t45iZYlUrALq0LlHYKreLgUYHny3V58=;
 b=ffh0OtpgTw3E0bxH7VzhzxX3fIuto1DnxvifwrC/lDukd6XXvK9Uec127aoFQFN+06
 BBoY8cd3A5LEHudYULsTmqJadQ+bYlbdP0K7Xb2qbWA71duBm+hIIF7MlroPqrb61lvt
 6jp5qN1FUVKaGzy9h0DXZ/e+UsNtp3cKJ5Q6AI4GnRNlmq8kg9QGA/g/nVuutIuB9AXp
 v8AlCHN44WB1niDkGTkmCpmWV9gKm21OCON9RzAnGPdO9ZjIUZ346IoiGW2gS7pmzgjo
 gHyGJo2RZKAmmisWO2N8pfLNffM67JMxbUxpyrWLFcfO5bZTI1yvm1JaxpY6Qco8H+rh
 9xpA==
X-Gm-Message-State: AJcUukc9G/lUHdlTKakEf9So7bB1gUwFXCgxLLfDppsiZUmEx/1sB9Qk
 KROeJzdGWzdhXscROM7aUYmq2FlWM9xap4m/sVI=
X-Google-Smtp-Source: ALg8bN61lhbNxFwc1ARjGAmnrnKs2Mbk9pynH7KNswSOG0TKqsaJVyiLI67+wVdcAgOc5AHNnQAx9H4f84v7bYQVm4M=
X-Received: by 2002:a0c:e789:: with SMTP id x9mr9533669qvn.245.1547690240331; 
 Wed, 16 Jan 2019 17:57:20 -0800 (PST)
MIME-Version: 1.0
References: <cover.1546918172.git.xiaoting.liu@hxt-semitech.com>
 <a7b5fa54198e7fd0def33de3e7db36239a2e3da7.1546918172.git.xiaoting.liu@hxt-semitech.com>
In-Reply-To: <a7b5fa54198e7fd0def33de3e7db36239a2e3da7.1546918172.git.xiaoting.liu@hxt-semitech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Jan 2019 12:57:08 +1100
Message-ID: <CACPK8Xdj1Cas8E+141f=ke99REhm-H-pgWE0GBwxXaZ996tCeQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] ARM: dts: dps650ab: add power supply
To: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>, 
 shunyong.yang@hxt-semitech.com, linux-aspeed@lists.ozlabs.org, 
 dongsheng.wang@hxt-semitech.com, Andrew Jeffery <andrew@aj.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2019 01:57:24 -0000

On Thu, 10 Jan 2019 at 13:29, Xiaoting Liu
<xiaoting.liu@hxt-semitech.com> wrote:
>
> Add Delta Electronics power supply DPS-650-AB.
>
> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
> ---
> v3:
>   Modify patch subject and commit message.
>   Add delta to compatible property.
> ---
> v2:
>   No change.

I tweaked the commit message to mention the board you were applying
to. Applied to the aspeed tree for 5.1.

Thanks,

Joel
