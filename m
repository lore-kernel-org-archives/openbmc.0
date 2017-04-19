Return-Path: <sjg@google.com>
Received: from mail-ua0-x22c.google.com (mail-ua0-x22c.google.com
 [IPv6:2607:f8b0:400c:c08::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w72Vj1lDZzDqBN
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 10:11:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kI0fwmt3"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="TwkMhnc6";
 dkim-atps=neutral
Received: by mail-ua0-x22c.google.com with SMTP id a1so5217168uaf.3
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 17:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=eOXfDpXRE4Gt3D9Bdnc/IGw1YCzDEyBnee6YN1eLhwM=;
 b=kI0fwmt3ZlJAaWNxrb2QBqDtFT+zXV98/EBWgG5LKmwPwzmKL/NHcf0jlamz8tTNu3
 Hq0e2KWlqbaivXhnwLrlK+B+hSOLpmY3yQlgw0OmIBoQmQcGn0DWNdofPYhQkVYAg6yb
 4W12kS0uTU77Mlb7N+UpXRb9KauQH3OW++8I9m1vf89Ady4cHeyj91vgI5rK4+CVGY69
 /ZCR06pO/HyMExfSCYXlNfI7jiH0KiEzewcPqW8zNliVZOa9UiDN7orRvxkJy6DG9DmW
 7+cv+/YDfhyZDJAU3l+glFyGCW4ETlgF9HEdUx6T8ajsvzIRQVoS4Oqzi9ThRjz1PkKd
 Rwlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=eOXfDpXRE4Gt3D9Bdnc/IGw1YCzDEyBnee6YN1eLhwM=;
 b=TwkMhnc6Yhaq3i8nUpG9M+MdJNzNEDNNxI9eRhsrIU7tRUALv1yQcxLvmCD1tvxxit
 vfkUwbRDBkYUL+RAtpHMqXi+nZA9/+Sfyrk/SUI5X0PKJbMshILkLE0OgoBVXY+McqWk
 9V3jGu6Ah1xXDOlWMBryxdhdA45BxlKPAGukc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=eOXfDpXRE4Gt3D9Bdnc/IGw1YCzDEyBnee6YN1eLhwM=;
 b=LV1hESregmYA1oOUtrmsJa9kJBYYQyVpOVECppi9lT7BJKhKHPMafmOAoVOTYqln20
 1yBtLMSWqmuucGqZJwE/KiqhtlMjPczL0ysRwM1zTM5Lc7fISlEhBZHQiBgPyfwpW+bG
 OFW2cTxbrcgimjk/oQ/OwfNz/kF9O4ml1WMzV5gb85BCtGaafAzD6frp0nmcVTlplnuU
 b/1DWX5augU4cUUtaothlikXO9TG4e/JPhZgQ1YOEM/dxzFarGUASAMRPitZhzhPkXBi
 8vT0AL/Hyej+8OKYv6t3e3+Cu+QbzYNHcwrrnvfIVQ+k9pUamDBnB90bk7Dzi4dYxOuA
 8Qkg==
X-Gm-Message-State: AN3rC/6HKzNL2vAH4ZYVyw/QBZcFrn7O6De/DRTwEZ2enxWbEsrqCKI/
 oWqceDd67Uk32sk+gK+7U8t14969Mhtd
X-Received: by 10.176.9.129 with SMTP id x1mr42927uag.96.1492560715106; Tue,
 18 Apr 2017 17:11:55 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.176.17.106 with HTTP; Tue, 18 Apr 2017 17:11:34 -0700 (PDT)
In-Reply-To: <20170417190034.71945-5-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170417190034.71945-5-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 18 Apr 2017 18:11:34 -0600
X-Google-Sender-Auth: ghcTCiUEoWAblwcMyLIGK-LfUyM
Message-ID: <CAPnjgZ0q-2r8Z+G4Pp0Es+ynwvYczar-FwyNFpx6grqQgFXf9w@mail.gmail.com>
Subject: Re: [PATCH v1 04/15] aspeed: Make SCU lock/unlock functions part of
 SCU API
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
X-List-Received-Date: Wed, 19 Apr 2017 00:11:57 -0000

On 17 April 2017 at 13:00, Maxim Sloyko <maxims@google.com> wrote:
> Make functions for locking and unlocking SCU part of SCU API.
> Many drivers need to modify settings in SCU and thus need to unlock it
> first. This change makes it possible.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
> Changes in v1: None
>
>  arch/arm/include/asm/arch-aspeed/scu_ast2500.h | 14 ++++++++++++++
>  arch/arm/mach-aspeed/ast2500/clk_ast2500.c     | 15 +++++++++++++++
>  drivers/clk/aspeed/clk_ast2500.c               | 18 ++----------------
>  3 files changed, 31 insertions(+), 16 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
