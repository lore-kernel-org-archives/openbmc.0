Return-Path: <sjg@google.com>
Received: from mail-oi0-x22b.google.com (mail-oi0-x22b.google.com
 [IPv6:2607:f8b0:4003:c06::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tPDQY3Hd5zDw3K
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 07:27:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="NSvh95m2"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="IPYG24U9";
 dkim-atps=neutral
Received: by mail-oi0-x22b.google.com with SMTP id b126so28571525oia.2
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 12:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=kU3T8lZRBt1xf4yaOrySjwbVBjL/Y+9KVCcDV2Hooac=;
 b=NSvh95m2Xhv9/Vs65cJ9W0Rg3/NzV3r+WT1qajYdT3wjZgLwJFqT0VMxShOE0+ASma
 xnhxhPgAINpPmodo/T13VTNHhikz2JFV4+Bcy6u7BH5R4ZE2oGpIHu/LyWV2tK3Nsl6X
 3eew770txmL2iR5eMQZDfQ3mDql6H/8aeDqryDc5XF2R+wx2IKxLcX5DoNx9yOgQJ395
 aeT2/YAEDC7PIcDwhw6zdUpt7IDsdhU6Iyk7rJI+1WdCR6qAm2jolbd35QzKBVqr+qhk
 qscW5XoQGepy8caUwa/WAhK+Vy1VDLvIXrTR0/vCPNVsUaAEle6ruEL+jMo4zhKee8pi
 gy0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=kU3T8lZRBt1xf4yaOrySjwbVBjL/Y+9KVCcDV2Hooac=;
 b=IPYG24U9nNgmR3250Avu0Z1nGr5rzcuYhcpP1Bd630mlA+BfJE748hUrJu3G9bXqpU
 /QNbn13sUqnQdBg8Hf3HLcqiXqdDS3cdxbTj9ed+6hfqBENa2lT6EP0XuauHMrNiCysu
 1tKYCB5TjVChxEYgdEsg8XPQqpskVarWzdmjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=kU3T8lZRBt1xf4yaOrySjwbVBjL/Y+9KVCcDV2Hooac=;
 b=ZHpNO1NqyeI8Ls3EoX+lutaOLeLACPstml9Lcbs4qskgh0zW7Y2Hd7sdhn9AdQP0q9
 JdT5H9Zp/z+kl3akDXgNg5j/WgXKwlNNjh8SOH1w28b2AAlA6HdGH+sIyWrhMlCHCgAx
 0FuTt0O+6Cc90pJmClDYiRvDn8Exs/2fDWEJEKxoVf7cBQQDRlikqbev38mhQJSPlFAv
 S+cfKskYsE6pBSw+rkrO+J0jpZ2ohBZwMwyFiNjPRcODHKQdia+d98tLwkEkRTmrvOAM
 EWJwfyVbnabxdwmkxwparHHMbvzz2Jf7pucnEKQD8PcrJgnPwIWEILwPBNihi3Grz5WE
 lIwQ==
X-Gm-Message-State: AKaTC03DcQPvqPhBeOqp0CC0SFO/5xk9nvRCv9ROXd4ORTgfOdhmEqLmon6c7dXjNnPJFY6U+AWh+MCtdeyxipvS
X-Received: by 10.202.104.80 with SMTP id d77mr2447379oic.107.1479932819245;
 Wed, 23 Nov 2016 12:26:59 -0800 (PST)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.182.78.1 with HTTP; Wed, 23 Nov 2016 12:26:38 -0800 (PST)
In-Reply-To: <1479930602-91012-5-git-send-email-maxims@google.com>
References: <1479858976-139210-1-git-send-email-maxims@google.com>
 <1479930602-91012-1-git-send-email-maxims@google.com>
 <1479930602-91012-5-git-send-email-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 23 Nov 2016 13:26:38 -0700
X-Google-Sender-Auth: MyojFflcVajKKqT6eLaoRpPEphM
Message-ID: <CAPnjgZ1+WAbkGFnS3MfND7=tg6RzHCyoiC4SvR_XTb7UL=yQYA@mail.gmail.com>
Subject: Re: [PATCH u-boot v1 5/6] aspeed: Add function to configure pins for
 I2C devices
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
X-List-Received-Date: Wed, 23 Nov 2016 20:27:01 -0000

On 23 November 2016 at 12:50, Maxim Sloyko <maxims@google.com> wrote:
> In the absence of pinmux driver, I2C driver will be
> configuring pins directly.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>  arch/arm/include/asm/arch-aspeed/ast_scu.h |  6 ++++++
>  arch/arm/mach-aspeed/ast-scu.c             | 28 ++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>

(should be a pinctrl driver when this gets to mainline)
