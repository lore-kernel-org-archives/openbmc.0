Return-Path: <sjg@google.com>
Received: from mail-vk0-x22f.google.com (mail-vk0-x22f.google.com
 [IPv6:2607:f8b0:400c:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vnpl251dPzDq7Z
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 10:22:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Af0uXUJS"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="Kq3MslPr";
 dkim-atps=neutral
Received: by mail-vk0-x22f.google.com with SMTP id r69so316537vke.2
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 16:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Utli6e5A5nkTrXPvP+CH2/Ksj+itfxqM5dfWwDH1+Xk=;
 b=Af0uXUJSiTZcuaw7a4RkvMmYMfSsKCbrQAOhOnIIRfJHq8kqj8JmqOscpDAT3RnCFo
 49Io8w22lPY2NEp/tH6gRWd7zv+yqGT5zpRK6JZA0TxQl8XwWAfsMsx8scYt7NWhRhvo
 ECHAxUrnqzLHCIr5z5gyeySd6yvmmTbEY4T5PfTFrUN+BjQtmjrutNs81Keqv5momg51
 T+P7STg9cdoNv9LRYBAEe8+tqlsB09hsP5gKIUqOi4Z0HwAOWLmlm0d9MLw6WL4D03sb
 rf+zFgW2aD1ml7HXaSxt1D7b/ECTYI69Woyj9C7r1Ln99CZcanJqZjBnGQFVeMcwrpNc
 po9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Utli6e5A5nkTrXPvP+CH2/Ksj+itfxqM5dfWwDH1+Xk=;
 b=Kq3MslPrh9tl/XHcavKrt82LMT4tt6pJ6NzPMDZANxULFUwbsO3l5KwP8LtfN4Jq55
 7pTqEznJ5J2er7mQ+elF5y+8a1br5Mn1mRxWE8YuLPMUkALOCrUvtXxkWYeLOUljQUQf
 isLiXn6/p6KY/TeYyV1uSbb9skGLZG8E7Ti0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Utli6e5A5nkTrXPvP+CH2/Ksj+itfxqM5dfWwDH1+Xk=;
 b=bIjuy01opMh2OU39IEGjlgRH2JGWlyuXUfY+F89FFXp/ADxSzCL4TJRIXvFcDOvO0K
 mAQ1G9uyPwsXuN4Fr3nDsD4cjT7NRajEyrEy/Ck/0imDrpnMlWuoIx9W9t3ZeFhLMP0e
 3ICAkBhbBXGV7G+WbSbWH1/zds9Crm1hgMJCVbd44Jqhj+HD/+s9ZrKDSqEpWedGchof
 R2d0DHmXVn/kfuQ0mNbhiPVOkvah6yC8KBM4gKsPtpWzF5gBTieQaKBIuzwTWiveoUtO
 K4N2KGHlPwElv8JHD3vr5csOic82d8qRCMAhfye4lWiMZbi7e471ZdDKnzNX0Yffoaov
 9Ftg==
X-Gm-Message-State: AFeK/H0WQOlL23ToOk2uubguY4Dey86Op8ZlLL27GtjdyLpQrAfy9fwGZq/q2f4JQBoB/JMzfsbVVt/M4VNTB8b3
X-Received: by 10.31.175.74 with SMTP id y71mr9566616vke.34.1490138572451;
 Tue, 21 Mar 2017 16:22:52 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.159.35.108 with HTTP; Tue, 21 Mar 2017 16:22:32 -0700 (PDT)
In-Reply-To: <20170316213624.140344-11-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-11-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Mar 2017 17:22:32 -0600
X-Google-Sender-Auth: 1dR1LseKTN68Y8-sd_bDgbhVJ8o
Message-ID: <CAPnjgZ15acYVf1dbg54qpvXM7nmFXwnqKwGU7HysiqrJTUBY3g@mail.gmail.com>
Subject: Re: [PATCH 10/17] aspeed: Add P-Bus clock in ast2500 clock driver
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Albert Aribaud <albert.u.boot@aribaud.net>
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
X-List-Received-Date: Tue, 21 Mar 2017 23:22:55 -0000

On 16 March 2017 at 15:36, Maxim Sloyko <maxims@google.com> wrote:
> Add P-Bus Clock support to ast2500 clock driver.
> This is the clock used by I2C devices.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
>  arch/arm/include/asm/arch-aspeed/scu_ast2500.h |  3 ++-
>  drivers/clk/aspeed/clk_ast2500.c               | 11 +++++++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
