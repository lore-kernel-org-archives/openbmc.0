Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="SmSZV4cC"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44gLgQ4GMNzDqSQ
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 11:59:45 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id z76so4737735qkb.12
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 18:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2+LC7kTgPwzE9tUKedmT5UvDjj2PfqWU0tTwz6osczs=;
 b=SmSZV4cCf3uQkcMQQ0ZQ91SMzfIoHlqBlqCpBpbd8n5FzKSTRMu+3cYD1bIPhEFxHv
 jBQaDFIF+zVmXH3JjlYlEM+tMqj1BEqVyPpRqydz+AM6zsuhj/DQ717PgoL8Xsvk6IYL
 Swispf5sq8ZCLlKmSF9+5UYFLxNEsUJ3DubKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2+LC7kTgPwzE9tUKedmT5UvDjj2PfqWU0tTwz6osczs=;
 b=GS6RONHI8PKJ7svNy0U2kBdBrs2MFUAnCDW+cLRvIyur2kOwwOnB9XWqEk/9x2Kzu1
 RxDDQJQyUVR5ehZhTtsiEXen+2r1LoG1svW9W2HxOYENmjJPmo0GT5m0Bz5D52fj6q1v
 Yu6W+sizQeq17OY2CRkoZi93Vy+m5Zhe83fvOVkD9TntGMsU8VLbU1EgeUnxeLnqfVu4
 ZdNLm/gmwDOk8mx+nLDBj4R3ajRj/0EPDtuNudNzpxT4EAtgAR0MVUoQc0+rP70D7HS8
 0mSxl/LByn7P7jTfHHyHMl4lj7/ECbUpr9kcrUfJeHZ+I0UZh+bt6JJ0Ll45MHS9IZgC
 iv3w==
X-Gm-Message-State: APjAAAVQgKSEjAOEvDwJlX1XY0HuaxvEnV2KXfRQj6/tIYqVQtBl6EX/
 3d4eWtH37CagiDfZ7V6HXyHYwYjlr7U4UQFjifY=
X-Google-Smtp-Source: APXvYqxMdoGsHFxPjR/I1EJXOs4TNtE47BAkuFalIT80Ynhddg04N1jnZ/v8NS2WeDzPIMzr9CFfqBzU9IYUvrIqEGA=
X-Received: by 2002:a05:620a:16aa:: with SMTP id
 s10mr40770111qkj.305.1555034381877; 
 Thu, 11 Apr 2019 18:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190411194557.65574-1-venture@google.com>
In-Reply-To: <20190411194557.65574-1-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Apr 2019 01:59:30 +0000
Message-ID: <CACPK8XfYDpjxWu_=AN2yetZCbFSLM_3GxWPUz5r-8tG7T0cXww@mail.gmail.com>
Subject: Re: [PATCH dev-5.0] hwmon: (pmbus/ir38064): Add driver for Infineon
 IR38064 Voltage Regulator
To: Patrick Venture <venture@google.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, Maxim Sloyko <maxims@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 12 Apr 2019 01:59:47 -0000

On Thu, 11 Apr 2019 at 19:46, Patrick Venture <venture@google.com> wrote:
>
> From: Maxim Sloyko <maxims@google.com>
>
> Add the pmbus driver for the Infineon ir38064 voltage regulator.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>

Applied to dev-5.0.

Cheers,

Joel
