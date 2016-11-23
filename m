Return-Path: <sjg@google.com>
Received: from mail-oi0-x230.google.com (mail-oi0-x230.google.com
 [IPv6:2607:f8b0:4003:c06::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tPDQf2MgCzDw01
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 07:27:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fU3DR2O3"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="oGnc9p48";
 dkim-atps=neutral
Received: by mail-oi0-x230.google.com with SMTP id y198so28757063oia.1
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 12:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=XHdnkZZneh9ocH9U4lvG6r/uPiW1KQD5mKptbyurzcI=;
 b=fU3DR2O3VLjdbNla1WFiyandeftH857yu8qBn+xuZ1b57mG5O2Lw+hIDCQbnddpwII
 k4gtyuwBh/h9WDjihB3ZdwiXUJrxP1WSxBQh2ay0Os5qcCISbDm0cjoauP4+G5P4zyeO
 l+pSe0e/0ptmHC7lSX5+IrsiDiQMUJcLrhvR58hMJA80mbSijoiM+LjwRpKMhUFhHybB
 xAqoHc9Se7ReykLjmfxE86AUpaxf7t/41EJpKI9vmtdrkWRtLZIzOp7vwYojbk2xFs3T
 tJbRDkxnHi66GuX/4hP78YYVVyga6U6PXceyiT98cZx/mg3v0sVFWWi9awgFWRxL+xzn
 3CbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=XHdnkZZneh9ocH9U4lvG6r/uPiW1KQD5mKptbyurzcI=;
 b=oGnc9p48n+nlycqA4SGiMiP0X20UDw4DqeoivoS/Ik6zCGIjCnhpMzJ6KT+/cVBf1d
 TI3z9650LySK7JGEo1XLUGBBZLxiwkEHmDviUzm/n1PRdNqwhvYS2AK/H2kM4WbO8KCv
 1uB0YZNN9QV/jd6VYP91b9z0MKhsrRaUyclGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=XHdnkZZneh9ocH9U4lvG6r/uPiW1KQD5mKptbyurzcI=;
 b=ELW3fNIeCpTe7pwIBkkX9g7XkzNBdkTqQDKGUNtsLb/ZpJlrDYGUdIfQxkj2AK5jyK
 dBnA+UTtRwfTJGsGoccO1KOb5g71vTtU3Sb6sfmqaECgYRrJW4KJF9s8nIgQPpylxpD/
 iTiNATKrKVAd/A3uEF2MQ6zZCacxoznjVV+jFJO73cMNl5i39uG9N3/3uWFUaJzOIJvJ
 4SQhRQWuHRoYIiGFvBJnhGSMTh8T52fJ7qJiCo2EalPM+nrkQSoDjMTm/vnE77K+8jcH
 NTZt6uwttAzHdNqf/NFiZqewKtNKdhDTtcvKb9SK2qTSPVc0Ykjhgyl8T2o08oCmuC8C
 ObXQ==
X-Gm-Message-State: AKaTC012NC2OC9InazaGVB485OBNJ8WEUQpPKiituhIG0o4oA4yzMR2qBgprdeazqkUAlv4GxaHzTUpg5lOE1jYy
X-Received: by 10.202.4.194 with SMTP id 185mr2515364oie.106.1479932824139;
 Wed, 23 Nov 2016 12:27:04 -0800 (PST)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.182.78.1 with HTTP; Wed, 23 Nov 2016 12:26:43 -0800 (PST)
In-Reply-To: <1479930602-91012-2-git-send-email-maxims@google.com>
References: <1479858976-139210-1-git-send-email-maxims@google.com>
 <1479930602-91012-1-git-send-email-maxims@google.com>
 <1479930602-91012-2-git-send-email-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 23 Nov 2016 13:26:43 -0700
X-Google-Sender-Auth: kbpz5xAiI_KupxYm1AlFlJjZqIc
Message-ID: <CAPnjgZ1WrMe6S7x7paNjUX179RhyA=iPgP43rUdPS8TGBiGVqg@mail.gmail.com>
Subject: Re: [PATCH u-boot v1 2/6] aspeed: Fix FUC/FUN typo in SCU
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
X-List-Received-Date: Wed, 23 Nov 2016 20:27:06 -0000

On 23 November 2016 at 12:49, Maxim Sloyko <maxims@google.com> wrote:
> Change FUC to FUN in SCU registers naming, which was a typo that go out
> of hand
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>  arch/arm/include/asm/arch-aspeed/regs-scu.h | 64 ++++++++++++++---------------
>  arch/arm/mach-aspeed/ast-scu.c              |  2 +-
>  2 files changed, 33 insertions(+), 33 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
