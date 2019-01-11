Return-Path: <linus.walleij@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="XFuA0lIH"; 
 dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bcLK2zK3zDqtp
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 20:01:43 +1100 (AEDT)
Received: by mail-lf1-x136.google.com with SMTP id z13so10255976lfe.11
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 01:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F6MzI9R4UU5ZaXFtVjjLB9wagaiPAW55WyGknazm5AI=;
 b=XFuA0lIHiYqa86OrM4Zracxc1qopPZaZM6HoXbCyUgrvdf2VTxTKIwA6PXsot6P7pG
 8RgCIgekRHRKYixRkYu/fD7DO1A4cDNr0Sm27SeNW/1JocJZ2E0MnjuMRConENhCr14V
 ESsK9kGWtomsCaSVJA0+rhrY0TYuZyNK+wDT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F6MzI9R4UU5ZaXFtVjjLB9wagaiPAW55WyGknazm5AI=;
 b=Ma226kCUq/NdavsREn4z1k9TdCulQV6iF8elZCpzsrr+BLvJIE4o/xCquc4b7Cbb1L
 vQ8s+ZWk7igVo4h2jkpBRjqXycbvsLRjrRS1+UDa7hBN41KFKrdsyhss+CPEA8kua45G
 8C5l+n623HdYG5X2Ng3KbNxP2Ax5R9+K1Ly6T4Cxhu1eSgIpONgRYAf0jXatxNdK+3AH
 u48/++MJqZoudBtI1glKhUmq9zKaFlWrNj0Sq9kV9MK/ntWtByRbhzeYAplvVewmBXVI
 4v0L9qBSicJl94HoWkbVMlBbGaj5mzwszt44Ak6Ex00ezwDOJbp75ugE1G3BEbGq8EkN
 UwYw==
X-Gm-Message-State: AJcUukfauB8gOi+pqIzUzcut6hwE0THu6anCd8G7gqsUYA8faa+xP4cT
 Mj0D3chdFFLk5YU3+803dATQ2MTzkLcxvMVt6tJmKg==
X-Google-Smtp-Source: ALg8bN6VJXKgGH7nihc9Vm8sdki1nNAo7OwxrHBJXaHEeP/WWF9Sf0lkHnCD6cC+ec6/d7fjTE8rm3mqKNGn4mt8efY=
X-Received: by 2002:a19:41c4:: with SMTP id o187mr8030416lfa.32.1547197300519; 
 Fri, 11 Jan 2019 01:01:40 -0800 (PST)
MIME-Version: 1.0
References: <959CAFA1E282D14FB901BE9A7BF4E7724E41D8EE@shsmsx102.ccr.corp.intel.com>
 <CACPK8Xf_oEuG0=_-bRiaTAWpiw_qNEVVsW9_dtamwGcUM0JtRQ@mail.gmail.com>
In-Reply-To: <CACPK8Xf_oEuG0=_-bRiaTAWpiw_qNEVVsW9_dtamwGcUM0JtRQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jan 2019 10:01:29 +0100
Message-ID: <CACRpkdbz0uqyDH9BJ9T7DvvPPomjh2BY2c=Wcd4zQF-7wSP7bw@mail.gmail.com>
Subject: Re: Enable buttons GPIO passthrough
To: Joel Stanley <joel@jms.id.au>
Cc: kuiying.wang@intel.com, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 vernon.mauery@intel.com, james.feist@intel.com, 
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>
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
X-List-Received-Date: Fri, 11 Jan 2019 09:01:46 -0000

On Thu, Dec 13, 2018 at 2:21 AM Joel Stanley <joel@jms.id.au> wrote:
> On Tue, 11 Dec 2018 at 18:32, Wang, Kuiying <kuiying.wang@intel.com> wrote:
> >
> > Hi Joel/Andrew,
> >
> > I write a drive to enable GPIO passthrough for buttons (like power/reset/id button) as
> > following attached patch.
> >
> > Do you think it is acceptable?
> >
> > Or we could do it in pinmux and extend gpio driver? Design passthrough state
> > except in/out.
>
> I think that this direction would be better than a misc driver. I've
> added Linus, the maintainer for these subsystems, and the linux-gpio
> mailing list to cc.

I am sorry but I'm confused about this. It's a very terse explanation
of the problem and a bunch of code.

Can you folks please define what exactly you mean with a
"GPIO passthrough" and what you are trying to achieve with
this on these buttons?

Yours,
Linus Walleij
