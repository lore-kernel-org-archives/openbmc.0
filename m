Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::241; helo=mail-oi1-x241.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="iSEHroYm"; 
 dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Gmxm4mczzDrNx
 for <openbmc@lists.ozlabs.org>; Sat, 15 Dec 2018 10:30:30 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id h25so5948237oig.1
 for <openbmc@lists.ozlabs.org>; Fri, 14 Dec 2018 15:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sGlDv9/mKgoV1WH+EYkpVmmz6kkahqJVT5cOChf7FP0=;
 b=iSEHroYm2T8KOX8I+49KZP8VPHNuXrAj0jPqKrZM17nAWV/3Q3tI0eePd0xDeLeoYv
 NtlPNYRrCu6C4NOL3h1os6Q0HsrHK2OjsErANUQUeTZ48az/AgGC06vWmYiaSNFXBPud
 LiI3ipJqBXiCfQ5SW4Ab+wpwShBPAqI+QAGPfSvrVWx5aM4sLiAgIPgartUvMZhktqwS
 aAMLDlRoidfVzeFnJEfdSd2zn3bKNb8EThuo2QpzQ3VP1XibonesA0wm0U0ZLGH4dupP
 VXlMQ7ht39yl3/ZZ+PuGm2hA7d93HlTyuSxtw9cj3qnfNfUaQj8kralMB/Q19ik6nm16
 7hCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sGlDv9/mKgoV1WH+EYkpVmmz6kkahqJVT5cOChf7FP0=;
 b=MEWqxI0ZwsViz4RxpphUYCH7LBOBAJLnUutFAvFMJdYa2khTCYeL6H5j5+yJLvbvJ3
 OYbfk9JsTmeiYt/MfQ8MwHinbpmwwD6UbPPlA3+zohlIdi/HeGuH1Sue1TyTBMHEJtrJ
 WCNLCGOIiUCND/Mzw/otKy/sG2dcsnZGYvmwBEBGJuxWuroic2ASYg3QUQwL/u2O+XLJ
 vn5SDxrlafq0Q5AlkzVue0GidMyfVdC0PwR/5uhZBJ6FuJrvFMGS3OGKPXkKr1bHV0T/
 1gEe9DKRBKQZsDeTMwhcvnwJHQW9lxt9H/RpRg7JnojCSXr75HXuGCwrXUM9OBJnk6M7
 A90g==
X-Gm-Message-State: AA+aEWZ7kmtk25DjKwRWQ2fG2fkirLJl8lQDrVpdt/gbtfZoSy5BRcJY
 Qxno8dxC4Aro2WYgox57jdQTTvrIuLqz2HD35xcIIA==
X-Google-Smtp-Source: AFSGD/VI3RLlk7QwbRZLvlcsDEgNJH3faTJN9cS8iJevW3Rz86HsVAofWxQH1Wg2+U5X5BgZnZ1cWiXUs6grVIWbB8M=
X-Received: by 2002:aca:a90f:: with SMTP id s15mr254887oie.137.1544830227794; 
 Fri, 14 Dec 2018 15:30:27 -0800 (PST)
MIME-Version: 1.0
References: <20181214221023.3878670-1-arnd@arndb.de>
 <20181214221023.3878670-6-arnd@arndb.de>
In-Reply-To: <20181214221023.3878670-6-arnd@arndb.de>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 14 Dec 2018 15:30:16 -0800
Message-ID: <CAFd5g45GxxhHuyHWDjd41_8xscYN6p5XJShnmg9Z2-DDGwaE4A@mail.gmail.com>
Subject: Re: [PATCH 5/7] [stable-4.19] i2c: aspeed: fix build warning
To: Arnd Bergmann <arnd@arndb.de>
Cc: Greg KH <gregkh@linuxfoundation.org>, Joel Stanley <joel@jms.id.au>,
 stable@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
X-List-Received-Date: Fri, 14 Dec 2018 23:30:38 -0000

On Fri, Dec 14, 2018 at 2:12 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Upstream commit 3e9efc3299dd ("i2c: aspeed: Handle master/slave combined irq events
> properly") reworked the interrupt handling and fixed a warning in the process:
>
> drivers/i2c/busses/i2c-aspeed.c: In function 'aspeed_i2c_bus_irq':
> drivers/i2c/busses/i2c-aspeed.c:567:1: error: label 'out' defined but not used [-Werror=unused-label]
>
> The warning is still present in v4.19.8 and can be fixed either by applying
> that original patch, or by adding a simple #ifdef.
>
> Here, I choose the second simpler option as the original patch seems too
> invasive for a stable backport.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks!

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
