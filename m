Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ng8UcRvb"; 
 dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43FbFS4QljzDqVb;
 Thu, 13 Dec 2018 12:10:04 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id i7so377975qtj.10;
 Wed, 12 Dec 2018 17:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4NUXph6sewKAF+Apf1FNRprvzsnumssa+ieZdO5X5ig=;
 b=ng8UcRvbK0jA0sVddxz9JoZN5d+fO5P9VO91aj7IV9eXZu1Cp4MhapTcjqFFLORoT1
 DwFNp3Uki8xpvMGTc3iUbh1+EkPvkkyhkIljNF/xC17BCCF1xhqaYHmFGgOJzphul/uL
 bKESJTjQAnULgPKYAtXFStMhf0MxVlQJ099ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4NUXph6sewKAF+Apf1FNRprvzsnumssa+ieZdO5X5ig=;
 b=O+4MjDhSF23Ojg0OeyMN32A5XczFIQ8ym4ZvQ+FOnIYbuorI5vHqtklxLWUH3OLtD/
 feho2suLPpuA1qx3objcp1D47Xo3GHCnfiMXe5hDr53cxEEFxkhqNNXU2hPLtB+M/eSu
 o/1xcO4disVEh99a+pinHVzar0tNYsPpUST2wuRSzFv+5tBXsZdXAg3sBYbuV33JawQ4
 7fn5FlAXY/xE6PNjVTBv4taWXYA1OmtWgFZf5Pbde85M7mtf/lTbtDQPCkC5wLBXCW9L
 BaBoGU1R4p04hsTuHvzVv2/zIZm2l9uitZfJ5N1VE47/xdGHj0Mp40FtqQPs+Oz0mPNy
 AEyA==
X-Gm-Message-State: AA+aEWZjeZJfJwRoR5PVEAVikF7nUE8maV8vG7gMGv8k4yBVEht9mPly
 uS8Z8zhH3e9LyYtCdcIDlFLjLKr8Oj5Q6ccezYc=
X-Google-Smtp-Source: AFSGD/UA2uv6C0lcuruKpIf2RhbZzybNULof2IpPd7ZmIoT47JeDFYvYL9EdwGuPrndoew8T2SukoqpDgcYH9Uj8iVE=
X-Received: by 2002:a0c:c927:: with SMTP id r36mr21779472qvj.51.1544663401828; 
 Wed, 12 Dec 2018 17:10:01 -0800 (PST)
MIME-Version: 1.0
References: <20181212215305.3852170-1-taoren@fb.com>
In-Reply-To: <20181212215305.3852170-1-taoren@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Dec 2018 11:39:50 +1030
Message-ID: <CACPK8XcHN07D5vtoAZ2BnaFzc55P+XEhzsTajOm1S2fvcrrm5Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: aspeed: remove duplicated statement
To: Tao Ren <taoren@fb.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 linux-gpio@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed@lists.ozlabs.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 13 Dec 2018 01:10:05 -0000

On Thu, 13 Dec 2018 at 08:24, Tao Ren <taoren@fb.com> wrote:
>
> Remove duplicated assignment statement from aspeed_gpio_probe() function.
>
> Signed-off-by: Tao Ren <taoren@fb.com>

Acked-by: Joel Stanley <joel@jms.id.au>

Thanks Tao!
