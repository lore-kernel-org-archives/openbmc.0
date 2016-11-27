Return-Path: <sjg@google.com>
Received: from mail-oi0-x22e.google.com (mail-oi0-x22e.google.com
 [IPv6:2607:f8b0:4003:c06::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tRbhf4kJTzDvfQ
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 04:02:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="D8gUgvAd"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="dW0niKiy";
 dkim-atps=neutral
Received: by mail-oi0-x22e.google.com with SMTP id w63so127298181oiw.0
 for <openbmc@lists.ozlabs.org>; Sun, 27 Nov 2016 09:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=6mVRIAdaIFPnEjIfo7+DGtvFqLeQU5vWUEXzwtRN2JQ=;
 b=D8gUgvAdkatCdWkVQJMqnPVzNVGP0rD64mGqzoQBHyi8r3LO2oocgOAJydTka5ShVD
 3toYLZC45+Vc7ooNUbPcsGIiVzp1xEF37KxU2kRu8SNTdljdS+3e36KtTxMbe5/Q459A
 LW9B/CTk7w66yXc1PXZPkhYtKMKVT+yQJ4LnHznUM/hjyQnIqmM0OZDwpB4/c7q/lzj/
 ln/Z2CnXb8wvGC/KzPPcuTUkGhI1tq9dNVtWJ31nJDIbxx6hk3Tb3ESmOZiUkY+sD/Pa
 7atKQrwcUFALeS/oPaUGh5pIsnKV3Czmx0kLiS6/nXtLssElRmOrQWyLFOtfRuFZ3p03
 S/Ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=6mVRIAdaIFPnEjIfo7+DGtvFqLeQU5vWUEXzwtRN2JQ=;
 b=dW0niKiyrjs5NlDOt0x/CzViWVq99g95+NQbKgV5Lo+GvYRKxoM4u7miorGZpH64zb
 +U+xpaD+MKGEK0t+L0pdn36gBD/6w5KuItJRUi6aprAPzknwJrn+5b3oNcEcFlvtLqC5
 9i1SuyINYQKrFnWD4tOWay089pn1zlROq0Kpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=6mVRIAdaIFPnEjIfo7+DGtvFqLeQU5vWUEXzwtRN2JQ=;
 b=YIx+B0N91J40UHAMEwoCSjSWlE0PbUFBsgVb4RyVxaxuqktyXY6uBdoyiuyz0QSvy/
 WZWbKs3umwkLcNAEk36+eVmvLmr0PxF6rucwEzjWkoYwXBf7OVRD2oP70YWr1+8gGRwi
 RR5jSxH6mhp5GjvGeuOl5Z1U11Ns/2M6WWSKyjr8GLAV+lav3B9+99JB0YkC5sz6Llzh
 CpyG5CM9k2WG8WbRygmONo8iihsZV3pXZin50R6KBA/hPCWnwACovsr50oC0C4XF0In1
 bYMovrC7gwsM7Z3aFNpOnmp1ShcDR5xV8rNt2IFINUgiFPd/l3dyVZVevTsEsgSs5NOV
 2jxQ==
X-Gm-Message-State: AKaTC02b/g10iv0MrOtDdLhOl55qmr1m/WO6j69XcsU9VWRLWBWWWUdEIV2el5WcAVrqcxHmaoRrbn59NhRJaE1e
X-Received: by 10.157.16.14 with SMTP id h14mr10717637ote.120.1480266144800;
 Sun, 27 Nov 2016 09:02:24 -0800 (PST)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.182.78.1 with HTTP; Sun, 27 Nov 2016 09:02:04 -0800 (PST)
In-Reply-To: <1479947292-121635-4-git-send-email-maxims@google.com>
References: <1479858976-139210-1-git-send-email-maxims@google.com>
 <1479947292-121635-1-git-send-email-maxims@google.com>
 <1479947292-121635-4-git-send-email-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 27 Nov 2016 10:02:04 -0700
X-Google-Sender-Auth: uihPN4XioMraPJzICAM_iLJ79i0
Message-ID: <CAPnjgZ0KMEeN=m-zr6dEVvL7JFJDkHJOu2iu2e2PaxGBeY32NQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v2 4/6] aspeed: Add function to calculate APB Clock
 frequency
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
X-List-Received-Date: Sun, 27 Nov 2016 17:02:27 -0000

On 23 November 2016 at 17:28, Maxim Sloyko <maxims@google.com> wrote:
> This is needed by I2C driver.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
> Changes for v1:
>         Add function comment.
> ---
>  arch/arm/include/asm/arch-aspeed/ast_scu.h |  4 ++++
>  arch/arm/mach-aspeed/ast-scu.c             | 13 +++++++++++++
>  2 files changed, 17 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>

(for mainline you would want to add @param and @return to your
function comment. See other exampes...

- Simon
