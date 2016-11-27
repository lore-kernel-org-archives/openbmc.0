Return-Path: <sjg@google.com>
Received: from mail-oi0-x22a.google.com (mail-oi0-x22a.google.com
 [IPv6:2607:f8b0:4003:c06::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tRbhc68yXzDvfQ
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 04:02:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="TJiM/n6Z"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="J44mX7+M";
 dkim-atps=neutral
Received: by mail-oi0-x22a.google.com with SMTP id w63so127297348oiw.0
 for <openbmc@lists.ozlabs.org>; Sun, 27 Nov 2016 09:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=KWVGjuLsVKDWk2patwmko2S/i5JctScqU/FXtiQTJLw=;
 b=TJiM/n6ZIkBj5NUrF2dRgrFLLpWf2brx3VHOU38a0nVeXBtPi7fudOg3PbVeoSfvt9
 KFYhtmpCAUR1fHOJOABHLWNDfIGG7bKIb84fi3JVGgVLSckju2TTgkBfYZ1CO01ZbKsR
 oSjxNhTZjfCjuJ8CZsCN3OSjwoDB84RAa9ftJ2ClTcsE8SzNpc/4+o5OCVzE8FKANkFA
 d8NkFYXxjuQoDK0/g2Jq6M4jn0ENoiDKaVhpXO9gKB6dkOWLJkm+3G20PKIjRgMw1tKd
 XHBSiQolcUXEdEA9mppdiMnesG1K1B2ukZwLrA5UZB+JbLiup/+J9Jd/t8jyYV4Q1zwH
 WEAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=KWVGjuLsVKDWk2patwmko2S/i5JctScqU/FXtiQTJLw=;
 b=J44mX7+ML8cnZNNuf5O1iIDaWdvYebkSuA/j97/P5vIv54kSFM8m3pBdDt0OOPuFM4
 cEIfY8CrPVJfMPO5CamaKpG7JmEPfeTh8ZYXOs5ZXaQHdkNI2uyqz5fpy1DRHHDx9hga
 X50LBMKJW1IZn7GG+ns1O6cHvrbuMfORxGw4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=KWVGjuLsVKDWk2patwmko2S/i5JctScqU/FXtiQTJLw=;
 b=Pm7F0S0POfBC4ZC9UJaC8rIWIh+0PeW1P9PcdDNVVQo+EULPzJPauwvXTObr1H1PdE
 MAcU2/pXg+6c4uVNulNIUhQZJAxxQA2TCZkuNt/SDa5Zy+SwEQsJ1K8mvrplqMrrjobf
 InA9DanyOjiiMQBDeIlqSeZMJyRUls8Qiwi6nPLFkHyDimsJ8jB/km+bLyM+Vr2NHb9v
 4rWzzokrH8hOVdh6CsJnluAPmfzht3VUa5Tcs1WNKkiKwMNcaca7+GhCHN+CSSPhhmUX
 +Ey2ZY918nIid2CZbR+GNLPTsN/RgEMEne8HepFkY+vzSXZ/oY7ouYNcLyDiYlRObLSK
 6vxQ==
X-Gm-Message-State: AKaTC03UnZUD1tys1sSIwzR5f6Tq1MNwRmr2ZVh9cmP2oOsQryxdpjeVyL6fwgdELPtTiGrWgw+WK6UcPk1+d2fW
X-Received: by 10.202.177.65 with SMTP id a62mr8984096oif.52.1480266141594;
 Sun, 27 Nov 2016 09:02:21 -0800 (PST)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.182.78.1 with HTTP; Sun, 27 Nov 2016 09:02:00 -0800 (PST)
In-Reply-To: <1479947292-121635-3-git-send-email-maxims@google.com>
References: <1479858976-139210-1-git-send-email-maxims@google.com>
 <1479947292-121635-1-git-send-email-maxims@google.com>
 <1479947292-121635-3-git-send-email-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 27 Nov 2016 10:02:00 -0700
X-Google-Sender-Auth: dxeJ310aW6mJWA0DsJNofAl5FYA
Message-ID: <CAPnjgZ1W7k440uEiY1OP-C9-J4f_xmtN+X-_702rAeaUKkx12g@mail.gmail.com>
Subject: Re: [PATCH u-boot v2 3/6] aspeed/scu: Add definitions needed to
 configure pins for I2C
To: Maxim Sloyko <maxims@google.com>
Cc: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Sun, 27 Nov 2016 17:02:26 -0000

On 23 November 2016 at 17:28, Maxim Sloyko <maxims@google.com> wrote:
> Add missing definitions for configuring I2C pins
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
> Changes for v1:
>         Split patch into two with this part adding definitions.
> Changes for v2:
>         Dropped redundant parens.
> ---
>  arch/arm/include/asm/arch-aspeed/regs-scu.h | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
