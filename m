Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="M51Z107M"; 
 dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 434jGJ1bHnzDqwf
 for <openbmc@lists.ozlabs.org>; Thu, 29 Nov 2018 01:09:58 +1100 (AEDT)
Received: by mail-ot1-x329.google.com with SMTP id v23so18175444otk.9
 for <openbmc@lists.ozlabs.org>; Wed, 28 Nov 2018 06:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=KtDX0HLiQ3WvW7F9nOrMFN98p16iMHQLoKYUkNUwLZU=;
 b=M51Z107MEC5EdztU10873Edc8mxIrMT0rNoO54yKJ0R7IkyyVm3BQJ0qlAeqvtHKgp
 FmPyD0av34hpJebYg3gD4pHIgOs392AAYpWmfNqgi2cfn4MeEZpGtJixk18Fsl/kSGPk
 iOIwZztgi+KUw+cMMkD1jGGu0EOD60EpEL8Fia8e3k8DxQ7Y1LvNvNfvkT9IQ3cFHqfZ
 YkD44PMM6yHsNaJhXPKByLRgFlZ9Gf87DAr11oDPeUGWkmlzLZ9b1+Zlj9Z8P268jWtk
 dnJCPLDiWzLobtXhDuQpvKL1KmePefvdIhB+LlGanO4xuZUo9CEPtUD7Hk2KjuTgWkdA
 MU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=KtDX0HLiQ3WvW7F9nOrMFN98p16iMHQLoKYUkNUwLZU=;
 b=PsvqPwZrjc/KbYq4Vcihghfnl8g1Jqw6yzG/k3ZJNqPz+yyvvPcGsNH28n3c0MfvKU
 nzr6iu0293Tf/oGRkXyXdFTuz+lz4kyOMhifA7mqlR4Y6ts796ZVEP9Vrjz7LL1QbjLH
 hIPgNrmHgUQJ3Zcc26j93TV5b1JMvWQNHLYcjDWQO/p1wLceOpKtNm+WWth0QP4nwqnK
 ziVt2ir0S9R22SUbB93UlRa0zdKBYhs6qVpwOvW+AY/5A1UnYNTtRbvAXS08yfwvgv8C
 oSvEB59HQ9N4DGjChToA1KtP1mOeRNWmVHZ5bRNMP9x6OhEPI6/B+bTBiPWcd2ktY0vl
 hK+A==
X-Gm-Message-State: AA+aEWa9W8e/2M3UfRCr9zIWeMGCZVZE6OzQ3ZrEX0IYwWrRAo1g8S0U
 fnapEWPlfFS9WnaWYlXiImx35AEoyI+xCHiVUxDdhMbg
X-Google-Smtp-Source: AFSGD/VPN5OF4/DvlSmvyfmVDNf7kMZ+b1yBmoVqnCIDop91z60O2fqUPHbG9TrOQdOoOe4mhw/ABI4JhdJCB97W2qM=
X-Received: by 2002:a9d:2269:: with SMTP id o96mr22186260ota.45.1543414196367; 
 Wed, 28 Nov 2018 06:09:56 -0800 (PST)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 28 Nov 2018 08:09:40 -0600
Message-ID: <CALLMt=qGE0RyMfSPLQZ+Cm85fz-3umVwU2F3yeoxD-B1hibh2A@mail.gmail.com>
Subject: Infrastructure Workgroup - first meeting today at 3:00pm CT
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 28 Nov 2018 14:10:01 -0000

Just a friendly reminder we'll be kicking off the infrastructure
workgroup today at 3:00 pm central time.

Agenda:
https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup

All are welcome.

Andrew
