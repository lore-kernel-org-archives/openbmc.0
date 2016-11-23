Return-Path: <sjg@google.com>
Received: from mail-oi0-x22e.google.com (mail-oi0-x22e.google.com
 [IPv6:2607:f8b0:4003:c06::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tPDQQ2WRYzDvyt
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 07:26:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Zk6SbMv3"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="XU2OBh4G";
 dkim-atps=neutral
Received: by mail-oi0-x22e.google.com with SMTP id v84so28570549oie.3
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 12:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=H2QaxsJJk3CyuxPCVFUbeJFBCXg2M1SzC6qtQfZ+5PQ=;
 b=Zk6SbMv3ODaVgWGEwNg22PmqHf3eMZ8BTkBhyX/66SIDa4GsbFcFLDyPy/QQTp9nNt
 1QRx92l+deHvqFvmpdY+oiLkbhQ+4j1DP744AMFs6BbwrtPeTR6PFcdWbuxjZcO9DjtB
 /KDB1QDLRg5GmtbHv88jGCZSWrI09WX9d8GgxeEwkabHQ6Exeno7hWZ/TShLQsYu3b3c
 LcISTF6CremdMlXcS8GWzgG1EhZjYQmRIMjjxgUstHKTw0PUz8EmScg8OZWxmyjheVzs
 IKGMbWkudVCNcmGLzKwEAPX9Y5HhhLN+vpPDaFkwPzhBfWknQPjA8SemTndlOxIRv5rv
 LjjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=H2QaxsJJk3CyuxPCVFUbeJFBCXg2M1SzC6qtQfZ+5PQ=;
 b=XU2OBh4GIcvQBVNxn0C53QAzNern5NJkHDqXWF+0LWusruEJDHY0lS7qqBgmMxCURf
 BrjjgFlyfUmZ7ae/TpW0wPvWmV5H3vddL7jOHahxeoREElBOruWirPL3RmxC+GMbwezL
 WWQojwY8iHVBTdHU45f5dVglYEakCWzVbkwKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=H2QaxsJJk3CyuxPCVFUbeJFBCXg2M1SzC6qtQfZ+5PQ=;
 b=JroI4WgiZU1A2tasgLhYfxkiqDyIDkA7bYDJUNB5wv2nYaFDSBNXSky3fiw+qiriXC
 xftrze+C8e7UaLoVfT1JOz4aWsXKOSqdxIt5LB8exXitDcsaLaKPifLt3AbhR1biW2VL
 wZ4Zdxhj6s851kOJXAah90+wxLebucucWW3XIZANzS8FobnMv80Kj45A5ZO6K1dwMCF3
 JLz0cd0myhcwZ6A0URL3A5Cx6B9jzUWSzpnj6IDQxRjFzBHPKQ1VXmHuWe/ffeUZJoxR
 cXm4i7F9sR/rHQIbHd27moKisDG4AQA6M9w00TrGEa9J+iHYgKnSDQQCmKgOGFpCrsfE
 SWng==
X-Gm-Message-State: AKaTC03Z1CrIvVOFYEYvQ0ffV0dzormchfDTuRi7hFQ2F7/uzlNrH28t9Yy50fewz5oH1Dmqr0u4EYai2WxPlwE/
X-Received: by 10.157.8.46 with SMTP id 43mr2976316oty.54.1479932811841; Wed,
 23 Nov 2016 12:26:51 -0800 (PST)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.182.78.1 with HTTP; Wed, 23 Nov 2016 12:26:31 -0800 (PST)
In-Reply-To: <1479930602-91012-1-git-send-email-maxims@google.com>
References: <1479858976-139210-1-git-send-email-maxims@google.com>
 <1479930602-91012-1-git-send-email-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 23 Nov 2016 13:26:31 -0700
X-Google-Sender-Auth: -l5PdRp-esCNuOgF96lO3274klE
Message-ID: <CAPnjgZ2D=NMJaNHYeZPRiKGYi5qCPN4qRmWS-fauq=bMgsbxQA@mail.gmail.com>
Subject: Re: [PATCH u-boot v1 1/6] aspeed/g5: Device Tree for ast2500, copied
 from openbmc/linux (include file),
 plus minimal device tree configuration for ast2500 eval board
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
X-List-Received-Date: Wed, 23 Nov 2016 20:26:55 -0000

On 23 November 2016 at 12:49, Maxim Sloyko <maxims@google.com> wrote:
> aspeed-g5.dtsi include file is copied from
> https://github.com/openbmc/linux/blob/c5682cb/arch/arm/boot/dts/aspeed-g5.dtsi
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>  arch/arm/dts/Makefile          |    2 +
>  arch/arm/dts/aspeed-g5-evb.dts |   28 +
>  arch/arm/dts/aspeed-g5.dtsi    | 1278 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 1308 insertions(+)
>  create mode 100644 arch/arm/dts/aspeed-g5-evb.dts
>  create mode 100644 arch/arm/dts/aspeed-g5.dtsi

Reviewed-by: Simon Glass <sjg@chromium.org>
