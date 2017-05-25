Return-Path: <sjg@google.com>
Received: from mail-vk0-x22c.google.com (mail-vk0-x22c.google.com
 [IPv6:2607:f8b0:400c:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wY8gB6S7rzDqL5
 for <openbmc@lists.ozlabs.org>; Thu, 25 May 2017 10:05:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GJZIyMUG"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="DmV1ndnM";
 dkim-atps=neutral
Received: by mail-vk0-x22c.google.com with SMTP id y190so84280821vkc.1
 for <openbmc@lists.ozlabs.org>; Wed, 24 May 2017 17:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=3mxU8mOhu0EYho8AB7fB1aveFC9IPF498E0Ffzs5SZw=;
 b=GJZIyMUGgJXPdgsDgy63hew0wW3npD1iwoalSNvDRtOBRyTbsQOX6TkKBEoYmeH5Em
 GJRrc2bOgUS91LHWgq9VahvgAVu2swHIKFv86ZuSLLWqWCHkc4eOKFy0ssKcUyzMIowQ
 wOGumUXo84npWaKm0ahKLdQWtISbWTcKD6+RIv/04xkVmdDss1rXWTPB4ghHqR50jn8M
 3bisKI4oi86YDSVk+Yb/qKP9SerBydKWhLdeuTSM5562Z0e9at+Xv+kdH86+pgT6j2Qs
 299/9BCaNOWUxdjeuPx5U4z543qgOAGWbrOqbccE3q+KsjfEa2m/Xjm0jeDIuKK4eAiW
 mScQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=3mxU8mOhu0EYho8AB7fB1aveFC9IPF498E0Ffzs5SZw=;
 b=DmV1ndnMQN6NAVYxWqrHPmJnU+ChrvN0DcwME0ZD++yO4DJOUeK7YxMK4+Rgv+sdaJ
 a9NKwPveSG7Q9ptbD2rStBw15XLaetSi9DRjqG6PMsqDgL03SxZzyIXXXblJAh8sNDIF
 OsdfIZrLcpi/EqwPBs8AOSRhYnaoYYeKejGE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=3mxU8mOhu0EYho8AB7fB1aveFC9IPF498E0Ffzs5SZw=;
 b=Q5C0lUBoMCa78GIRopJmW00fWnuyyH/qqeZy5rfgK1VpjmWQKFT/Z6WmIHJP8RZZLZ
 MQgbqcBitAxe1oVtAly0lcDitrZucaElqirL7bkT9MSNuYWdhivC5D2r0MTjEe1qjfMU
 HHudtMJqbXT+SqMng0YN//E7GwosMntkf1C7BT6q1Cq2EPmzRcK5y2dF9Y45oe7loFfN
 ypWL4j05kHH4knQCaa60D2S61Ktl98B8M1Ds6VZ6VpJYw1kjUTBLdSr5Ukr7bb+vzGEV
 bMMCu1S+Fx7WRkS12AioDHxJu4t08F+ylKTvLKURiJ/VG7lWIgEiXMHFNtDk4VLA8Qy6
 BFPA==
X-Gm-Message-State: AODbwcBxz+pnQMvcc2i/8pFu4XHAR3OIvFCxa0pkXVy6O+I+1tHpCM3n
 MdptQ85uuqV7HVHyLGmo9H/lTD+JpobG
X-Received: by 10.31.79.65 with SMTP id d62mr6840568vkb.54.1495670756062; Wed,
 24 May 2017 17:05:56 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.176.78.39 with HTTP; Wed, 24 May 2017 17:05:34 -0700 (PDT)
In-Reply-To: <20170523113410.192036-1-c_mykolak@mellanox.com>
References: <20170523113410.192036-1-c_mykolak@mellanox.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 24 May 2017 18:05:34 -0600
X-Google-Sender-Auth: _AsMRchnXcDy0BJ6mdeccB8MiWg
Message-ID: <CAPnjgZ3aBHLDd9AXSpy5PZVnY9WAstFjGCpMSCLfCx7su7_bRA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] Add extended configuration
 for ast-g5 board
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 25 May 2017 00:06:00 -0000

Hi,

On 23 May 2017 at 05:34, Mykola Kostenok <c_mykolak@mellanox.com> wrote:
> Add defconfig extends ast_g5_ncsi_defconfig with the number of options:
> It allows 2-nd  boot partition, memory testing, boot, image info option,
> extra filesystem and environment commands.
> Add WATCHDOG_RESET macro support for aspeed g5 boards for cases when
> HW watchdog is configured.
>
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> ---
>  board/aspeed/ast-g5/Kconfig         |  1 +
>  board/aspeed/ast-g5/ast-g5.c        | 17 +++++++++++++++++
>  configs/ast_g5_ncsi_2boot_defconfig | 36 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 54 insertions(+)
>  create mode 100644 configs/ast_g5_ncsi_2boot_defconfig

Are you targeting mainline U-Boot with any of these changes? There is
a watchdog uclass in mainline that probably should be used here.

Regards,
Simon
