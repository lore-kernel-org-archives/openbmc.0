Return-Path: <sjg@google.com>
Received: from mail-oi0-x235.google.com (mail-oi0-x235.google.com
 [IPv6:2607:f8b0:4003:c06::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tRbhk1JxpzDvfQ
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 04:02:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="avLnkUkf"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="ncmxIZB0";
 dkim-atps=neutral
Received: by mail-oi0-x235.google.com with SMTP id b126so126935637oia.2
 for <openbmc@lists.ozlabs.org>; Sun, 27 Nov 2016 09:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=EgUqkL8GcK6HZOuYjJxrdAjJrGO16m0opYeVLO0xQPY=;
 b=avLnkUkf8rLUSbMKuDn7UNu2uAaao2We+MuOesz2D2LiFImfgfQOAcqcJuu4YTgeV2
 2j4KpjVSUF2A95g4w97eKVACaM8gsVfuO7henYcrzhcwXad9uS9Y+5kbBhG+8l0crAkC
 AJIPJK+d3IziMmxX5CYCrUQCJ0wXnqyPWJAZnr9Lg5jZbKTAc1pagGrUkC9xUIbnGlcq
 jnvr5S8Vl6/bg5QFjUWcn02OfMlow2zAjey/905JxWWqhlqMYon8KCMnNdQnEQQC4NIB
 oRy+r3C0BLrmmWPz4dhxkwzQ8FDO6ED69EQnc4IE8fy25MS7ooAGi43z5QwS3iaT+tod
 glfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=EgUqkL8GcK6HZOuYjJxrdAjJrGO16m0opYeVLO0xQPY=;
 b=ncmxIZB0WvdvoS1vg6QlmgViP9WrSfTBt68fbBkvCQqChDiDcvX99un0yzZ9HMA/pF
 HZX/ghAHFeXljEUXA7crqQKWcFMHHQLt7Rot7Ow6ZbNsQeVQ3NnS50Nd/v5e/JyK1NHc
 5F3D3Bg67Aduq15mjaU54EBWilBDFRXgDjRq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=EgUqkL8GcK6HZOuYjJxrdAjJrGO16m0opYeVLO0xQPY=;
 b=SnNjC4fMCWO/RZYJkpTQS90FbCddXWc8BkejKhIGEoXKlObiuFltoviyTWCaGPy1dQ
 ASnarItTdGFSWV3qASK9MOXFS3K3UjbZQgTEBovsHmgetufmV/KPc9HaMU0CHboaqoNc
 86nk27FA8TQP0/zu9+oKPhQi1GS7mlibc/Kz9KhbXDC1VR8cqPk8OKP/WSaD9wkiVuED
 dJIBC4eLSbJOzDxxkAVvm/+OvQAhI/Y+0mkz8IcSkLK0q+h6OzV6JyNZnFsVf+bU3SHP
 c7afA+S8rOQV5l6A/9RFP0O5Neajqj/T0Lu3jZ8me9Lzb7mlMFb4XFtZ+/LqksbanN6K
 ytkg==
X-Gm-Message-State: AKaTC01k0h+k7Rp/euFON08m0WlSYd6m7rsDNA4FVX2BttZsjVGs3Mw08UYZu5E/gSljzOZkN8DFE1qbGTzxnOAB
X-Received: by 10.157.5.209 with SMTP id 75mr11062727otd.229.1480266148288;
 Sun, 27 Nov 2016 09:02:28 -0800 (PST)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.182.78.1 with HTTP; Sun, 27 Nov 2016 09:02:07 -0800 (PST)
In-Reply-To: <1479947292-121635-6-git-send-email-maxims@google.com>
References: <1479858976-139210-1-git-send-email-maxims@google.com>
 <1479947292-121635-1-git-send-email-maxims@google.com>
 <1479947292-121635-6-git-send-email-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 27 Nov 2016 10:02:07 -0700
X-Google-Sender-Auth: kv03_xwsM0vOrVTYqU5GQZrMvM8
Message-ID: <CAPnjgZ2GVVJyVMweHXoLMV05pNnmFnAYofiKNazxD6E-+4-bBg@mail.gmail.com>
Subject: Re: [PATCH u-boot v2 6/6] aspeed: I2C driver
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
X-List-Received-Date: Sun, 27 Nov 2016 17:02:30 -0000

On 23 November 2016 at 17:28, Maxim Sloyko <maxims@google.com> wrote:
> The driver is very limited: only single master mode is supported
> and only byte-by-byte synchronous reads and writes are supported,
> no Pool Buffers or DMA.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
> Changes for v1:
>         - Style fixes: blank lines, line formatting, dropped inline from definitions
>         - More documentation for CONFIG_SYS_I2C_AST
>         - Use standard ETIMEOUT error
>         - Documented struct ast_i2c
>         - Documented get_clk_reg_val function
>         - Rewritten get_clk_reg_val to use register masks and shifts defined in ast_i2c.h
>         - Dropped AST_ prefix from AST_I2CD_ defines
> Changes for v2:
>         - More style fixes for things missed in v1
>         - Return error from ast_i2c_xfer on deblock failure
> ---
>  drivers/i2c/Kconfig   |   9 ++
>  drivers/i2c/Makefile  |   1 +
>  drivers/i2c/ast_i2c.c | 335 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/i2c/ast_i2c.h | 130 ++++++++++++++++++++
>  4 files changed, 475 insertions(+)
>  create mode 100644 drivers/i2c/ast_i2c.c
>  create mode 100644 drivers/i2c/ast_i2c.h

Reviewed-by: Simon Glass <sjg@chromium.org>
