Return-Path: <sjg@google.com>
Received: from mail-vk0-x229.google.com (mail-vk0-x229.google.com
 [IPv6:2607:f8b0:400c:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vnpks31bbzDqZR
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 10:22:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Bs4AVgqC"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="D+kDtb8q";
 dkim-atps=neutral
Received: by mail-vk0-x229.google.com with SMTP id z204so53495266vkd.1
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 16:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=CvBZMtJ7OS4jp+A1rptnuCjBOGMeqEtdRF2+Y6a36D4=;
 b=Bs4AVgqC0wCjCWnU3mIPJUZhEEzNuZ0z3xFan610Q/1taRuTum3mCFY0vijSJMcXsx
 SEshs6r8W9PmDqk7a1cDU6r9cVmrTE1+CFUUJoNzlixLxgMcfcq6rFCOkVr3ZeKNFUYc
 i6C+2GuK2RvE7/V0+1lscNFkd5QhJAGx0ZwAkFUJ7s44GtSNchAXer+Eojgj3Y89ed0P
 KNJZsV4VcFagDWivNcqX+3M+9ZEueudOES1YZGjywPjLalQbP/zCieq+1nEQUNc4yqEY
 QuXei2Bq23RaapAvQYcj/jVvobz1rGWV9lt9eU78e7bc6j43qijAmgXEcEKnjDQBt9m0
 WtVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=CvBZMtJ7OS4jp+A1rptnuCjBOGMeqEtdRF2+Y6a36D4=;
 b=D+kDtb8qEghqAKoTghsX4tJlTWL7lplBlvzaRcpbIgnuEQSETGELlgpz2/P8K1mBP5
 4TOUnaYFBVsEJr5BHJ6Qzmgak+KEkjwdK2TSqCJfSBkVzcvw4wMZVvKuP20yM4yOBHXu
 QMLRkEHPPkkNBgm0puNpkEWlCy69aX9TI5NK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=CvBZMtJ7OS4jp+A1rptnuCjBOGMeqEtdRF2+Y6a36D4=;
 b=Yc8C3o/aFbWRjlK0+hrqBVP7x06oq2BezkMFUcQ9NW63trv1Q1Xxk81wrEnVKLHZFn
 9NMn9Fkzjpi8JFbz86F9oBGWPyFuc0TSZuFUofOuBstAetRMfmlZmslorXMAeOK1lQi0
 JuHqL8UoQmljCc6ZudjAB/+4QFNZkoDeHa5117FIRwqQEfk8VMUQ8BLCrVDrW4pa+6gq
 It782wGN10C9/TqdAjQMQ4vUVJFdq7t+6TDfT1KxUTFZyGbQMBW1Ag8P02djXX24tr9k
 9LCQJmG4ev2YMTbNMHx0DC04gVHiOKnO8oYP+coHZxtpK+k6YkIQjQPtHW+avr7iFzOy
 unAw==
X-Gm-Message-State: AFeK/H3bBB7t1XxOQ9pn+rmw8nIz65H34s72pfkqIVxERwJnKIE7HB9DUcoWGmhg/hjQNtjokTHsNNvri939eHOV
X-Received: by 10.31.114.79 with SMTP id n76mr12285658vkc.30.1490138563153;
 Tue, 21 Mar 2017 16:22:43 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.159.35.108 with HTTP; Tue, 21 Mar 2017 16:22:20 -0700 (PDT)
In-Reply-To: <20170316213624.140344-8-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-8-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Mar 2017 17:22:20 -0600
X-Google-Sender-Auth: ZTWopjrTMC_kppfMfuCpL3s2hBo
Message-ID: <CAPnjgZ369b7rV2asMMitEqCALEih7Af7soNkAraMCaaPuX9Mtg@mail.gmail.com>
Subject: Re: [PATCH 07/17] aspeed: Refactor AST2500 RAM Driver and Sysreset
 Driver
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
X-List-Received-Date: Tue, 21 Mar 2017 23:22:45 -0000

Hi Maxim,

On 16 March 2017 at 15:36, Maxim Sloyko <maxims@google.com> wrote:
> This change switches all existing users of ast2500 Watchdog to Driver
> Model based Watchdog driver.
>
> To perform system reset Sysreset Driver uses first Watchdog device found
> via uclass_first_device call. Since the system is going to be reset
> anyway it does not make much difference which watchdog is used.
>
> Instead of using Watchdog to reset itself, SDRAM driver now uses Reset
> driver to do that.
>
> These were the only users of the old Watchdog API, so that API is
> removed.
>
> This all is done in one change to avoid having to maintain dual API for
> watchdog in between.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
>  arch/arm/include/asm/arch-aspeed/wdt.h       | 39 ---------------------
>  arch/arm/mach-aspeed/Kconfig                 |  8 +----
>  arch/arm/mach-aspeed/ast2500/sdram_ast2500.c | 12 +++++--
>  arch/arm/mach-aspeed/ast_wdt.c               | 51 ----------------------------
>  configs/evb-ast2500_defconfig                |  2 ++
>  drivers/sysreset/sysreset_ast.c              | 24 ++++++-------
>  6 files changed, 24 insertions(+), 112 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

OK, ignore my earlier comment on removing ast_wdt.c as I see you do it here.

Regards,
Simon
