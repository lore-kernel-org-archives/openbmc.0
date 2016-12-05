Return-Path: <sjg@google.com>
Received: from mail-oi0-x22e.google.com (mail-oi0-x22e.google.com
 [IPv6:2607:f8b0:4003:c06::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tXF9r4sYPzDvjh
 for <openbmc@lists.ozlabs.org>; Mon,  5 Dec 2016 17:25:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jabJzNi7"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="W2l4izkr";
 dkim-atps=neutral
Received: by mail-oi0-x22e.google.com with SMTP id b126so328834310oia.2
 for <openbmc@lists.ozlabs.org>; Sun, 04 Dec 2016 22:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=fB8zsmnd/Ia5pe6MWtFAxcb+4p7NJhc5+E9h+MSnqts=;
 b=jabJzNi7mqFvv30JXjw2iF6WUmZPFVPy2sl83dGP7Kq3BgYsurjjWMUjC95zM0HR95
 8NmKvEJwC3tE7xCMlL1kbXoFBZAoy2JZCNy69ZH4FL+x/kWCpkPosjb9ASbYznD29Skw
 yYztzSRMXynwYDlmoaIMZBrESzYT+xnjGPph9XCw6Ymas04fPO/73VO4en/2JbcAPhTT
 /Kk14Cq8DPVY4tWGthhisnyGgPqCmi+Oq2W2796g257/v55+OAiQubQZy3ab7Aw+Yf6k
 t8Qbk5BzITnuhMcCI8iC8BHttAZzDiU2NwZpYCzfxRZCNNQx/+7Gss6BBYkq8UQuWJMw
 YW0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=fB8zsmnd/Ia5pe6MWtFAxcb+4p7NJhc5+E9h+MSnqts=;
 b=W2l4izkr5+Xqza7CbBhDHcIHc5Nxc7OqB+VYBmYNOfezf4QySiww9LHX9s0VFJd2VZ
 Jy6XjK3IWG8cPCiPMnx7hHRLK2q3rcHWHupZmAS6KHhFiFemieIsJdVJrEYDfV/5VlwV
 MBVhSo9O1ygyc1mnBriacQpty2D8DOJdsaIac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=fB8zsmnd/Ia5pe6MWtFAxcb+4p7NJhc5+E9h+MSnqts=;
 b=PTyOcKmf2E5mwbiZ4f5vzGTefRGgIZJXyHC5QkYOaBlzTp4EBKgjPqZ1H4yB8ksGw3
 E/8iyPdg/G38a80DgWBX350xMidv0T6NubcFKkHWYkgEG9bIyQXZA0gjfeFv2JKmnFkM
 Q5bw4rvoqshHbRXKisntuSAEZCEZqSVM8givhsvf3xPeppuJNRV5hUPbpdIUOBKv7Zml
 3r1wZJa0GMf1cVPJB9qavR6lx4zlm9MiV/keMtL2FAh8T2DvllvEtUR57HKHB5/vH+u3
 Eu0VMrmu7PJCFJhCVxUOaHIJi1bcU4nF/XsMNMM55CgdiI9YQZR9uT3eQSoKqVYOVOn1
 WKmA==
X-Gm-Message-State: AKaTC00MSv0Eac0ZXAE1WAfVQ2otjphEuGIK4fNjFw7irCDvaCjXRMdOjznsandDcOachaaf2b+zdzZVWe0AKCBM
X-Received: by 10.157.12.35 with SMTP id 32mr32081034otr.103.1480919118542;
 Sun, 04 Dec 2016 22:25:18 -0800 (PST)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.182.128.229 with HTTP; Sun, 4 Dec 2016 22:24:58 -0800 (PST)
In-Reply-To: <1480717624-24994-3-git-send-email-raltherr@google.com>
References: <1480717624-24994-1-git-send-email-raltherr@google.com>
 <1480717624-24994-3-git-send-email-raltherr@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 4 Dec 2016 23:24:58 -0700
X-Google-Sender-Auth: L8aOYB71MUB8nRIUHq4ZG8w4V-g
Message-ID: <CAPnjgZ0HHnneMeVM=6ZThS53GwYFgoQKxVnc_pbE42k3SLWpjg@mail.gmail.com>
Subject: Re: [PATCH u-boot v2 2/3] bootm: relocate ramdisk if
 CONFIG_SYS_BOOT_RAMDISK_HIGH set
To: Rick Altherr <raltherr@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 05 Dec 2016 06:25:21 -0000

Hi Rick,

On 2 December 2016 at 15:27, Rick Altherr <raltherr@google.com> wrote:
> In 35fc84f, bootm was refactored so plain 'bootm' and
> 'bootm <subcommand>' shared a common implementation.
> The 'bootm ramdisk' command implementation is now part of the common
> implementation but not invoke by plain 'bootm' since the original
> implementation never did ramdisk relocation.  Instead, ramdisk
> relocation happened in image_setup_linux() which is typically called
> during the OS portion of 'bootm'.
>
> On ARM, parameters to the Linux kernel can either be passed by FDT or
> ATAGS. When using FDT, image_setup_linux() is called which also triggers
> ramdisk relocation.  When using ATAGS, image_setup_linux() is _not_
> called because it mostly does FDT setup.
>
> Instead of calling image_setup_linux() in both FDT and ATAGS cases,
> include BOOTM_STATE_RAMDISK in the requested states during a plain
> 'bootm' if CONFIG_SYS_BOOT_RAMDISK_HIGH is set and remove the ramdisk
> relocation from image_setup_linux().  This causes ramdisk relocation to
> happen on any system where CONFIG_SYS_BOOT_RAMDISK_HIGH regardless of
> the OS being booted.
>
> Signed-off-by: Rick Altherr <raltherr@google.com>
> ---
>  cmd/bootm.c    | 3 +++
>  common/image.c | 7 -------
>  2 files changed, 3 insertions(+), 7 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

But why would you still be using ATAGS?

Regards,
Simon
