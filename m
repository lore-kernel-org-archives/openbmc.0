Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::241; helo=mail-lf0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="E/gQiesK"; 
 dkim-atps=neutral
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com
 [IPv6:2a00:1450:4010:c07::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y9WT919jJzDqlv
 for <openbmc@lists.ozlabs.org>; Mon,  9 Oct 2017 18:04:44 +1100 (AEDT)
Received: by mail-lf0-x241.google.com with SMTP id a132so18083597lfa.7
 for <openbmc@lists.ozlabs.org>; Mon, 09 Oct 2017 00:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to:cc;
 bh=TAsWP7utENtScdQBt7MAP4SNL+vjuqeHMwrIAdZWDaY=;
 b=E/gQiesKAQi5IXPQDe3cyKlfDX8iV3VzhdmQjou4IUQAyLZgQLpciRHNRh1btRjvf8
 MNG/ND4LqroXqfViiPL1NDphgc/tbNqwT4UivhMMB+9dgNTQBwaZqEc7Zxb8wmQ2uAIX
 68bRlEk7UpPvCvDRse78fgGjbXSanh8TQ6WEH5N9zZb9iZzWdP73NXF1RfGo/ZTSJVnt
 sSMEJhHM1lKtdkBuObv4iAd/mJLXjqL0vkDpJDKsvjIlhS2jl5iDpgCpxTCEVf6vO2fo
 /4kA0OvCCGGxDedXa0HjvNQBzHLPM5h2SNzkV7e9qah85FubuIoOPcNWon6tXq8sfSHM
 +IvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to:cc;
 bh=TAsWP7utENtScdQBt7MAP4SNL+vjuqeHMwrIAdZWDaY=;
 b=VyGciz6WSw4ClTW6V6q5Vg55X0xcymdgUgPmGkLeXG7g/Cu6HjYPyCaS8+lNnpxrXQ
 +tSjWkhfdYw3nuMR+2XQrZWq5lMenSYtk0HVyrxvWPK3+Ph8qZCM2xbnsciMo2d21pmr
 KuQsqyr8toL1AkUYkSMFjs3F0PZHaJEreLeiCIm8JhHydc2GGRv4Tdhk3z9ADvcvv7Xc
 4TPUAF1pFRjaoWry3M59BPonsC0TVKyI6G28hBkdEjC1cMk/0VbnF2SoAGtrI/VoftFg
 koEGXF9zltDe93YFffSlrPmMJsC/B1U9OueqYdpR7zJh5ry9Pc00XxL+GeVyhqqb0G7T
 7mhQ==
X-Gm-Message-State: AMCzsaX4/Im815drCnJcLme3H3KyoHEkDjYTtriqe/b3zbqEM8abRJlJ
 bzkFTK+Pfu07xQqk7BN6JgPf9IEHLE+hcu8paG3hhpyE
X-Google-Smtp-Source: AOwi7QAxnr0xv2n0IQWpUG2OD6IGLrLAQI5u0hU9L0Pr/Tnu7BB3VOBaKLCUXg/rsrMLPhwslol9r38yIuL+TyDPbFA=
X-Received: by 10.25.99.216 with SMTP id v85mr1885816lfi.257.1507532678400;
 Mon, 09 Oct 2017 00:04:38 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.195.6 with HTTP; Mon, 9 Oct 2017 00:04:17 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 9 Oct 2017 16:34:17 +0930
X-Google-Sender-Auth: EOt37AKu5G4ZFRYtB_MgmgAenxI
Message-ID: <CACPK8XdfxO5y3DHfBeZgvK=jUCM4noh2YFmX4w0GxEH8UDD+9A@mail.gmail.com>
Subject: Moving to kernel dev-4.13
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Eddie James <eajames.ibm@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
 Xo Wang <xow@google.com>, tomer.maimon@nuvoton.com
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
X-List-Received-Date: Mon, 09 Oct 2017 07:04:45 -0000

Hello OpenBMCers,

I've pushed a new branch to the OpenBMC kernel repository. It's called
dev-4.13, and is based on the latest stable release from the 4.13
branch (4.13.5).

There are currently 40 patches on top of the upstream release that
include the patches sent upstream since 4.13 was released. In
addition, there is the new Aspeed clk driver that is out on the
upstream lists for review.

If you wish to have your non-upstreamed patches added to this tree,
please send them to the list with the [PATCH linux dev-4.13] tag.

If you have any questions or concerns then please use this thread to
kick off a discussion.

Cheers,

Joel
