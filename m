Return-Path: <sjg@google.com>
Received: from mail-vk0-x22f.google.com (mail-vk0-x22f.google.com
 [IPv6:2607:f8b0:400c:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vnpkd3HDDzDqZV
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 10:22:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Cb4zTjZY"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="VscJbcim";
 dkim-atps=neutral
Received: by mail-vk0-x22f.google.com with SMTP id d188so110266958vka.0
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 16:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=9SU7EJBlBWxpV+6Gycl4RDiZflkobZML1SU5HNxTrGI=;
 b=Cb4zTjZY810w0qgAFuiqrFe5/8g+zW6M26KGWHA1uznKmnaq6U7YULUTEnth17lyaF
 kgA6n8VItOmxfDFWz8PAD46jpB1VV+dqR+lEKk/IKZX9sWb178u7rX47JDNGBbMZBgXQ
 7auGBDMPBxC4rN739kU5k/QiziEy21/nnVm4j/yOV1R31tLmDDsc+0xuAeuEfnyGwji7
 Iwri83QMGaFwyGo5UPfplHJ7zAv9075o2nww7MptUE0uU2g8rVY9jZU1LNgORNb9pmyd
 eNLUWfC63vaSUZ9WInljQ7lz0CXhgf6QgYvLUciqy3tiyUqug6LJFOd8uTuOiXI88D8e
 xr0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=9SU7EJBlBWxpV+6Gycl4RDiZflkobZML1SU5HNxTrGI=;
 b=VscJbcimgw2gBQrZtxyUp35H2w1sJjl0GiWLJyzgeaETREJ3+T38iik1bPqSIJqQFi
 PDr2g6B5CgBlaG+v7Au8uOT60TlNmy+sYRMjEP2aLBsts6kny+SgHqZYWbpUaVehTRIp
 uHVjWtxfqMlO5r8pJ8re45cK7q5nCYrLBki80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=9SU7EJBlBWxpV+6Gycl4RDiZflkobZML1SU5HNxTrGI=;
 b=AMG5vUtSvitWW4cb48k9mhif+1RoUiNxNlbQTv7hjFnQVHWDDKfx/7w81bj6ZV/r2p
 uEUbnc3ruS6QOSXrUxQUayOERloXi5KqqkxrvUbOofcEZiDBScYA/do0lbiMjs7+FhSV
 j5n8JoLxY3kGDp8qaZd8eIkEcKDrn8TewZseA3je8uPnTJnBeTZEhkcenj7GyXdhO21W
 TbtgF4f7xuZaDm0t2Nj24Jc0IoorY+GBamWJtPsiLJWCEQqHUrjGgYpTdSY/RF60sQQn
 RrhY2woPpFqnKHoZibAgQgj55MEa8H9eJQod2Qbo/QQAZTTQY+ONVudARMdJ7cAamQz4
 NTmQ==
X-Gm-Message-State: AFeK/H1QHxbS0M6ca2e6/Xp7pG7vey0rmkUAX7QlKT5W3Q+5C3FJiOxAOOV23QsmXnAZ+F71x6p1HX7gcLO25MJK
X-Received: by 10.159.49.87 with SMTP id n23mr12695737uab.134.1490138551180;
 Tue, 21 Mar 2017 16:22:31 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.159.35.108 with HTTP; Tue, 21 Mar 2017 16:22:10 -0700 (PDT)
In-Reply-To: <20170316213624.140344-5-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-5-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Mar 2017 17:22:10 -0600
X-Google-Sender-Auth: E9k-HHnogA3S4QhYXP30d6dtYVU
Message-ID: <CAPnjgZ0gf0wVMoa=Z-qw=NmtLaAPPRvwk35P4eABwR4Wdqyt0A@mail.gmail.com>
Subject: Re: [PATCH 04/17] aspeed: Make SCU lock/unlock functions part of SCU
 API
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
X-List-Received-Date: Tue, 21 Mar 2017 23:22:34 -0000

On 16 March 2017 at 15:36, Maxim Sloyko <maxims@google.com> wrote:
> Make functions for locking and unlocking SCU part of SCU API.
> Many drivers need to modify settings in SCU and thus need to unlock it
> first. This change makes it possible.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
>  arch/arm/include/asm/arch-aspeed/scu_ast2500.h | 14 ++++++++++++++
>  arch/arm/mach-aspeed/ast2500/clk_ast2500.c     | 15 +++++++++++++++
>  drivers/clk/aspeed/clk_ast2500.c               | 18 ++----------------
>  3 files changed, 31 insertions(+), 16 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
