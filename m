Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="FzCzCAPA"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43g90x3RClzDqkL
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jan 2019 14:44:00 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id w204so5260585qka.2
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 19:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l7TmUl7mYPX2SznCweP5vFmci47ZWaWU8mEmrrziVDI=;
 b=FzCzCAPA9/ecxBjb/HXAQFEterjdY1YET4geUk5pwoc6Af1ZwhnxSsAn5kQE5QZ4bI
 cndHe+/W0B2VPJ2KucjoK3fixKTPYS7nDGwyCSz5OA29d+hQ7TTT0+/G4ba99d5DsS9L
 XRPFHrnVLbepW/9yO+nBkNpwBBoxBsqlbmlJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l7TmUl7mYPX2SznCweP5vFmci47ZWaWU8mEmrrziVDI=;
 b=nztklQtNVePyg9zLlDGGTiHG30CCtEKn+E5BKy2BKlJ6vXzin/v3vZnYTLMpi6FvNr
 e4NH3ks376W4WJmErFHRmMkR3xOkYoFZKowHe9+aQiENJ1QI/3i5P7oJ5HSbtekWsLmm
 z82ndIGSom7xmFyxLiN0DH187MqwK8eWgjrzoi6HQ7HxmRKLoSEJbkY0LsZojo13dtco
 2Kfy5qkI+AQORoB8boSMtN33+qZyZTjE6hWMiUgivHiFpsRGu4N7eJQBjFCJRh5sIdJ2
 Wl80igOdypP/9efWqLIHSfsl1Sl4ENIXqx+U/ACpZIttX7JZzkrz3AD2ZhrqfFYRESms
 nrvg==
X-Gm-Message-State: AJcUukcPXhf6fLToVwSOnSB/p0ts1JzHz7u9xORe/LGNW/FZLEQpalsG
 81JGBGTbAv7XKOHtLSXcMgCF17GVagH7FuUCyR4=
X-Google-Smtp-Source: ALg8bN4PpIeXIseFaJFSLuNtcvULoWazkCrX6QNZGdMwapUzbP1trcjgwuyzhhwaDkiLU73vhVxuYFg+CzxHgy6tMMo=
X-Received: by 2002:ae9:dec5:: with SMTP id s188mr9293044qkf.127.1547696638313; 
 Wed, 16 Jan 2019 19:43:58 -0800 (PST)
MIME-Version: 1.0
References: <378621543319425@iva8-f16495710718.qloud-c.yandex.net>
In-Reply-To: <378621543319425@iva8-f16495710718.qloud-c.yandex.net>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Jan 2019 14:43:46 +1100
Message-ID: <CACPK8XdgLPd5r5MZX4sX2sqtRCwxgsSKrUrJFoX9sXxHznvFvQ@mail.gmail.com>
Subject: Re: [PATCH dev-4.18] ARM: dts: aspeed: Fix gpio interrupt controller
 description
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2019 03:44:02 -0000

Hi Konstantin,

On Tue, 27 Nov 2018 at 23:05, Konstantin Klubnichkin
<kitsok@yandex-team.ru> wrote:
>
> Missing #interrupt-cells in gpio controller DTS  description causes OF subsystem to ignore it
> as an interrupt controller, so one can't use gpio external interrupts. This patch fixes it.
>
> Signed-off-by: Konstantin Klubnichkin <kitsok@yandex-team.ru>

Apologies for missing your patch. Someone else sent a similar one that
I applied today, so this should be fixed both upstream and in the
dev-4.19 openbmc tree.

Cheers,

Joel
