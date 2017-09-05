Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::22f; helo=mail-io0-x22f.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KFvfQWIw"; 
 dkim-atps=neutral
Received: from mail-io0-x22f.google.com (mail-io0-x22f.google.com
 [IPv6:2607:f8b0:4001:c06::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xmWpb0ZtkzDqh5
 for <openbmc@lists.ozlabs.org>; Tue,  5 Sep 2017 13:07:01 +1000 (AEST)
Received: by mail-io0-x22f.google.com with SMTP id i200so8865566ioa.2
 for <openbmc@lists.ozlabs.org>; Mon, 04 Sep 2017 20:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=obhgMJexv8bIE4/LOArOnXYr3ndQ/hc6S2ZXLfpwmSQ=;
 b=KFvfQWIw6OD81DccqMpweurzyXElklMJF/3LPYg1O7P3qkUEfM78J1lXaxH+5C4R6G
 aWPKMFCLZnGvEaA81eWB6lZBLhcRO7s8R3VvbOhUNg+2XEIyS52PTe02rZ+hXaVN4Tra
 WgbcmFltsypFoQ/tvhUS0UJstYuXa0z74rkcevkCxZwEnLeXMaRJgsoiRn6lUQ7CKq7Q
 hTIQCYJdNl3kXaQKrK12LR/RxI32m1rfqLV54ja/43bjRwR7/mHErcY2LI8GhYa3nnVd
 YZF3TX+Ri4eAGpGpVeaLd6jG5p+YYCUXzFSxGtWmJZCQuyD4BXXWWUrH/WBRCMNcag9Z
 0yhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=obhgMJexv8bIE4/LOArOnXYr3ndQ/hc6S2ZXLfpwmSQ=;
 b=JM+S4JTsnNRpqoD8ntg2zMNP+jPP803VmTLT8WFrfrObD7gHKMmBqj+AcWK6PYZSlx
 F20HVPsuaULdFPUaEAgdqfqhJf3MGJ/DTB8A0+ujLRm9ERNcbTSEPZMbA8fxI9C23ihZ
 XvQy7YTku6cyM0dttsNpGzpo/LYz1eIrx9hDP8HFXwojiKUMV6UMSezvrNZtRdkHOLqq
 hMcsyJqsdKyb59YeWYSNvQr7BEohh+wqiVodQ5bNcHm9l0imBN3XdD94G8b/FgEBwqEN
 SzDPa7szoKGOMdAtlq3MWfKOuTo0daZITRMLUP7kmhXUQ/EYS81Ea+ZCGq7/i6nHYzUC
 QRtw==
X-Gm-Message-State: AHPjjUjOXGEuTW3RyHyOH/LPya5M8Spm6RXB+9wk4XGrzHsc85olXVeB
 TmO+96EyipyHMZCUZxLw1HwSdhRyyQ==
X-Google-Smtp-Source: ADKCNb4QFQMNPh1RLSyg7ioc9bg+oAnfqLMS1gQkBy3IPhsQX4ZzQ5qie7/PIFaYyALKmO7widHGqQdY5W4CKK1cfbE=
X-Received: by 10.107.69.20 with SMTP id s20mr2347102ioa.99.1504580819916;
 Mon, 04 Sep 2017 20:06:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.30.129 with HTTP; Mon, 4 Sep 2017 20:06:59 -0700 (PDT)
In-Reply-To: <4393fb7b-38e2-6121-d172-c8ce5c14a82b@yadro.com>
References: <4393fb7b-38e2-6121-d172-c8ce5c14a82b@yadro.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 5 Sep 2017 11:06:59 +0800
Message-ID: <CAARXrt=wFi-TVvYS19KAmCxiYL7LT+LPvwMP=n-kP=_3oR7Npg@mail.gmail.com>
Subject: Re: meta-vesnin architecture
To: Anton Novikov <a.novikov@yadro.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 05 Sep 2017 03:07:03 -0000

Hi Anton,

I have been working with Felix in MSI on this system and I'm glad to see
meta-vesnin is coming to OpenBMC.

I did not find the change in gerrit. Could you kindly show us the link?

One general practice for submitting changes is that we prefer a series
of smaller
commits to a single huge commit. Each small commit does one thing.
E.g. you can have an initial commit to add meta-vesnin and its config files;
then a series of commits to add recipes in recipes-kernel or recipes-phosphor.

Thanks!

--
BRs,
Lei YU


On Mon, Sep 4, 2017 at 7:54 PM, Anton Novikov <a.novikov@yadro.com> wrote:
> Hi everyone,
>
> I'm from YADRO company, and we develop a new architecture.
>
> We have openbmc support code by MSI, and I'm assigned to promote it to
> openbmc mainline.
>
> Meanwhile, there's no confirmation email from Gerrit, so I'll send current
> version of the patch here.
>
> Please look at it and give me recommendations on organizing it into smaller
> commits.
>
> Thanks,
>
> Anton
>
