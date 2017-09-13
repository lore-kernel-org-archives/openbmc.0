Return-Path: <xow@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c05::22c; helo=mail-pg0-x22c.google.com;
 envelope-from=xow@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fPrIwlAi"; 
 dkim-atps=neutral
Received: from mail-pg0-x22c.google.com (mail-pg0-x22c.google.com
 [IPv6:2607:f8b0:400e:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xsxrX46wVzDqMh
 for <openbmc@lists.ozlabs.org>; Thu, 14 Sep 2017 08:57:32 +1000 (AEST)
Received: by mail-pg0-x22c.google.com with SMTP id d8so3029143pgt.4
 for <openbmc@lists.ozlabs.org>; Wed, 13 Sep 2017 15:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=YY3GHAmxqvfvA/IJfCj+rIaO5BdkLgenExRYd9xMZtQ=;
 b=fPrIwlAiJnH6/aHV+QnkCt8Y5m2bG2g9Socv471Z6KmjOys+C7ayOglj9AqI999w83
 Gkwn9JOfjoFWKDHsPdDgJeZALKYeFHyDdp38KDb723y3q++TIG4PTOA7LSY6dFrTMvX/
 XqLX1R2/KTI9ftZ2pn9xImBHioc2gfCFtnanSt1LM9pWEEgjrdqFloW/cMCLDqrcyQQp
 69ED2Uh8EN1tybE2rryWi9oPXtRTpgS0zwHoy4Lv5kXm7l5H+UB3v0xVvpZT9fCeMm/4
 ABQlQThkDDBQIHYnq4nNzerUWer3pWbdk+KybKlvKXuL8/RNbtxmOg3tO92tL/WdgA4I
 fH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=YY3GHAmxqvfvA/IJfCj+rIaO5BdkLgenExRYd9xMZtQ=;
 b=pMeEBYce4YnCkllh2RtscZNKCC2oVG1P5yp1ushqRbTRE0xumMuoeAhKJbdPCHyxpB
 QFjEaLQ4NF5bV/KabKU+AKGF6nUudbhEc+VPoKTCc+eVjB7ESHIQA8PpdKHlfbiV54ua
 dw7D8xBdKNgppAYl7DF9lW6FTp/uVKMG5AiItgcY2s+kBQ8vXBg4IzU91ogNrYbWUWPx
 lcYW+uZIKto89yIhOrX6XdWHAU7Y9f1o3kUHC3cReyxGbU6gmsOpDJfX6ycnjeecsNRu
 MHhMVZCK3N8eeyulzVSnFcWy+jYvNea2NEtzmqwVXB04L3qJnhjQG08ucqaQIddZiA/i
 cokQ==
X-Gm-Message-State: AHPjjUhS0W6hOdTguVkne+JDQmWfW1xDnGhSrPKmSc+ROTHEteBCqYPo
 3vj1oM8jXtquYms4eZXcjbklH4/cFC0IFBaR+A6K2w==
X-Google-Smtp-Source: ADKCNb5xlGv4GAP87z6gVezWI8cvSN2oTpFiSwcUHAllavQ+gOQJJ6Drf8l47izObB0ezJv6Tv0GN8t3e3RXB0ooX58=
X-Received: by 10.159.218.75 with SMTP id x11mr22111398plv.29.1505343449782;
 Wed, 13 Sep 2017 15:57:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.168.229 with HTTP; Wed, 13 Sep 2017 15:57:29 -0700 (PDT)
In-Reply-To: <CACPK8XfDQuabtVxjh7BoiE-1xSCAG1C8ZUcNho=VVEbepMKwZw@mail.gmail.com>
References: <20170908215728.115818-2-xow@google.com>
 <CACPK8XfDQuabtVxjh7BoiE-1xSCAG1C8ZUcNho=VVEbepMKwZw@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Wed, 13 Sep 2017 15:57:29 -0700
Message-ID: <CAPH-5w7fEmJzG6aD3XyPsqaQFX-4q1NjenAKDExSjr6CEvxe-g@mail.gmail.com>
Subject: Re: [linux,
 1/5] ARM: dts: aspeed: zaius: Use LM5066I driver for hotswap
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Sep 2017 22:57:33 -0000

Acknowledged. Thanks for the review and cherry-picks.

xo
