Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="fGckE1ub"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dWht29kBzDqTn
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 22:39:26 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id c21so10294654qkl.6
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 03:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=834xKIynk/o9voPxmczwLTwxDuUNC859N0LEpxFn33I=;
 b=fGckE1ubOKS2i7PI1U6t15AhGAXoHSA7giv/EiFhEyjjygpSABxFbKwNCFZxNpTYfz
 mX9O/mFN5/jXh8fWVhT7pK09L4/aXwnsM+YkudiGypNCYuJph0LmcokztBkVn30UBpjr
 FE4c6Kf84kEzGOiR3Ue61Xe4theNyKyUYOC4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=834xKIynk/o9voPxmczwLTwxDuUNC859N0LEpxFn33I=;
 b=g+DpDumqS5UKSQsfGsEfGCwVbE1ipAs1MkgtkJKS9/cBDMWvrg8YPHz24IZG/iMIHH
 +BVuq+9MQCkGgGI18EyVKlhnAV18w5RkbADVsYv2KSa5j6E6I0MmXU4ReFSOO1LakP7E
 oQd4QcZzrojxwma2w7Np7dPkb2+Lqv9fpE6f64Dbqgt9bILhiXQiy/w8PL+gS8/LcDN6
 DlcKzKg28LtFEnHsDcRgvmeMqsAL1oiqZMblKyG7x6zmV76umj8/Rn1mrUuskc5DZXCc
 j/7ZYLOexoq/IEZg8GOunmXbzfBpbczT59FEQmiHN8qjAKGd2y/ToAVJLhcD34R4Sp7a
 4Fsw==
X-Gm-Message-State: AJcUuke2/k6jm5F30sJN+WgcrM5D3YU5eeepBDdIu+ES1ejB8OeUDSdJ
 fCw//Ss0L2Ad16WDSuNXcDsjBlk9jZyfZIZvDUw=
X-Google-Smtp-Source: ALg8bN66R1hiIVUdRwNQToedgoHpv4ikmM+/P0uly/Kr6mguPbP+HegorMajkTCWHXRu/PyoLr4sDjlaU8Jl5hgzNCE=
X-Received: by 2002:a37:bc06:: with SMTP id m6mr22843777qkf.336.1547465964198; 
 Mon, 14 Jan 2019 03:39:24 -0800 (PST)
MIME-Version: 1.0
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com>
 <20190107214136.5256-8-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190107214136.5256-8-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Jan 2019 22:09:12 +1030
Message-ID: <CACPK8XcBKnN=CJy+pVruZh=8qZNdr4pNt=hV50Ev1k6YgYtAKQ@mail.gmail.com>
Subject: Re: [PATCH v10 07/12] dt-bindings: mfd: Add a document for PECI
 client driver
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>, 
 Jason M Biils <jason.m.bills@linux.intel.com>, 
 Vernon Mauery <vernon.mauery@linux.intel.com>, Rob Herring <robh@kernel.org>
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
X-List-Received-Date: Mon, 14 Jan 2019 11:39:26 -0000

On Tue, 8 Jan 2019 at 08:11, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> This commit adds a dt-bindings document for PECI client driver.
>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: James Feist <james.feist@linux.intel.com>
> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Vernon Mauery <vernon.mauery@linux.intel.com>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
