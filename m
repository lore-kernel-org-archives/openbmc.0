Return-Path: <sjg@google.com>
Received: from mail-vk0-x229.google.com (mail-vk0-x229.google.com
 [IPv6:2607:f8b0:400c:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vnplD0PPgzDqZl
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 10:23:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="QP8UIUmo"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="hM/7FN+d";
 dkim-atps=neutral
Received: by mail-vk0-x229.google.com with SMTP id r69so319041vke.2
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 16:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=oIuSeH0im0GGOKwyvXSCfMbg5qEI5vc0UgbDL5NiP18=;
 b=QP8UIUmot5wmAVnGXRsoVVtJN1gsXyjLJMSDEICyK5Ly7y7f/LV4svQUZ3A/Z+QEYj
 fURdqiotIOg35ZsKW6PMfAz7e/DDqNe2U5A/WStWFcD67DLcF4N9mXB+kW8QVIF2INZ/
 XGuFLwPIuuNiv57M1UqE4DApy5L4t3q5Z2xcXL9vESGwZnbJzysuzkq+MQsjzJk5sd4M
 7lKcf2MYaWSUKCs1qscvTVlMPYREfh1o8BILlq7xHXShYyO0LcNbHOQj5qy8oWm35X0D
 2/xqdobbuxREKUAs92PPQ9Spqq+GLPj2aus6XBpnl3UDlszBlhTABSsnY5FuRTzKBkiS
 NDVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=oIuSeH0im0GGOKwyvXSCfMbg5qEI5vc0UgbDL5NiP18=;
 b=hM/7FN+dPaY6g9uQsgPkC5jIkchs2f8QilbXfnO/VCAPV12aoiEdSsJY0KHVpl3WmE
 bInISdfUihaf3awdhvwRVb2xXVGZTUJLTuy1L3aYgXs3wYU+tzImtg9Ht1J06g4XxDE5
 jkUDW6Z75PAQniRJOYzasbzIrxjQNb3wEbeyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=oIuSeH0im0GGOKwyvXSCfMbg5qEI5vc0UgbDL5NiP18=;
 b=uDVie6g1igE8CHG/KrugMjdZjGhi5wG7U+SzyhqfA7tjgwOI72X54CZGyx/Ovbbul5
 mCKbWSypm5pRsADb0VEDEJXRh3+A2aSKroZtf6Nz+ZIBkiUi31rJjmLdtE+qaEkQAu7Y
 7kJGdfWFvy4mzUI2KesI1Kv9BCHgBZqUpq5Pb6saMe5rmfJPxVm9Dn3HtizyH9z5k17v
 oT7qkbWA/hFKlGIPP5ZdLqLsDuei2i0SWd8EcZoBPXy4HfMXI2gaVwFfypsBrp98Wj/F
 cH2SS94t4BU0reYoF/gc1iJWDJVqKRohDddKAumes6XSLT4+4qFCWD2L64t95iZ/YDlF
 tN0Q==
X-Gm-Message-State: AFeK/H1rhpeSKL/y60lcBl1k1EJCv+cMROzY+JJSnvuaRGehx2x+4qT0ryavRdhqLXOq7P2Sd0O86DNxklDysBVZ
X-Received: by 10.159.32.79 with SMTP id 73mr10913322uam.121.1490138581866;
 Tue, 21 Mar 2017 16:23:01 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.159.35.108 with HTTP; Tue, 21 Mar 2017 16:22:41 -0700 (PDT)
In-Reply-To: <20170316213624.140344-15-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-15-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Mar 2017 17:22:41 -0600
X-Google-Sender-Auth: NZ-ksBmAqTfTCrFLAOxhEC0SV5s
Message-ID: <CAPnjgZ25L8-RyJ8+c2WMC92Bzs=Jm5xkDUWxBv0c8oSNj9QEjw@mail.gmail.com>
Subject: Re: [PATCH 14/17] aspeed: Refactor SCU to use consistent mask & shift
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
X-List-Received-Date: Tue, 21 Mar 2017 23:23:04 -0000

On 16 March 2017 at 15:36, Maxim Sloyko <maxims@google.com> wrote:
> Refactor SCU header to use consistent Mask & Shift values.
> Now, consistently, to read value from SCU register, mask needs
> to be applied before shift.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
>  arch/arm/include/asm/arch-aspeed/scu_ast2500.h | 12 ++++----
>  arch/arm/mach-aspeed/ast2500/sdram_ast2500.c   |  5 ++--
>  drivers/clk/aspeed/clk_ast2500.c               | 39 +++++++++++++-------------
>  3 files changed, 27 insertions(+), 29 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
