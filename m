Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="mqZ3RaxG"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43q81d0tGYzDqS5;
 Wed, 30 Jan 2019 14:27:16 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id c21so12909363qkl.6;
 Tue, 29 Jan 2019 19:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tryZkG1b0OOMU3opyrQRs9lUM6ZpHAug1gUo09Q4LbQ=;
 b=mqZ3RaxGJf0I6S7YH0+BCdWmnKDFwLMul6X9xVIEypnqwSfbwGSp9QWYk8oomNbtN2
 m4PA2GKRHGi1JlJP+R+QZFMc/WfcEZmlMxXZjL66bii4v7atS+PNbbEhB3m8j+vyrZft
 waIM029yT8Ydg5gZoWqaxUS/NTCBB81jNTxRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tryZkG1b0OOMU3opyrQRs9lUM6ZpHAug1gUo09Q4LbQ=;
 b=KjqPUbRl9MVTwLF0Yn8OVRyQ+NcXZGL/eJjhiK7b851izecIvk0lq6SASalAXCF5fo
 CDCVT7AMHo9GdI0euaYX/lhpxa+fNTZ75B3BCAoHp8kjXiKpAbFr0mmbKnNEg7q1EIKU
 rmCEJG3h8PM/zludgY0HojlpFz48GBlriYynDhczsq9xMdyERTBQ6xZmhakU+qyvS9Lx
 1D1RQ22mHJnm2lsPkYSQgNXt4xNAzbjrojDwwW05+Eo9qqsChUNqfHwOfD9kp47FgGcB
 WENwEcz6/+fMTMSfwsOsWaabXNOgGL7fnUCMP0XktLKNHOoZ1ktZg6z13tGmGr/RIGS2
 jJew==
X-Gm-Message-State: AJcUukewJojxrucVsGwqQtywQx7XaenZmsRdUtgCH6OGXjZeBvQm4awn
 BO4kYLSCSCYZp3qCDtEof2PINII/AlxLbonGFgw=
X-Google-Smtp-Source: ALg8bN6VVbtR7psR0gbQFYO2JTPBCIwNB7xYBro8ejws2cyBvtvwN+ijOPde+6LF7jy35U4UFbgeqiZfgZfhQG8X6hg=
X-Received: by 2002:a37:a391:: with SMTP id m139mr25487860qke.11.1548818832043; 
 Tue, 29 Jan 2019 19:27:12 -0800 (PST)
MIME-Version: 1.0
References: <20190123230733.1821501-1-vijaykhemka@fb.com>
In-Reply-To: <20190123230733.1821501-1-vijaykhemka@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 30 Jan 2019 14:27:00 +1100
Message-ID: <CACPK8Xc91m9TWoRSgDCT7bVJC=C=w7mse8xbdCgw5vMVgMXM=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: Add peci and lpc for Facebook
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Andrew Jeffery <andrew@aj.id.au>, devicetree <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 30 Jan 2019 03:27:18 -0000

On Thu, 24 Jan 2019 at 10:07, Vijay Khemka <vijaykhemka@fb.com> wrote:

> index 73e58a821613..d60dbb019f82 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts

>
> +&peci0 {
> +       status = "okay";
> +};

I don't think we have an upstream tree that contains a node called
peci0. Therefore this does not build.

I have dropped this hunk from your patch. Please make sure you test
before sending patches.

Cheers,

Joel
