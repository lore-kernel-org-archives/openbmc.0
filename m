Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jEaYmHml"; 
 dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42KNmG4bbVzF0dq
 for <openbmc@lists.ozlabs.org>; Wed, 26 Sep 2018 00:31:10 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id x26-v6so1324812pfn.4
 for <openbmc@lists.ozlabs.org>; Tue, 25 Sep 2018 07:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=L5/otc/mkZPa+VvZvOV/EIh5pPMTDmEcUIZR59Oz18Q=;
 b=jEaYmHmlSMGZFTvJO6DAqD4diq5RFCWvKcxbZj7wbcHbBdqsp2/EVoerHf0/CLg9Td
 A+EBb+7IR2AotJePTj5kbdJru8JD3jwk+3GHwP/uq+o8H7uZSo4dHHB/W3WtdZQbUddT
 8p3jIczoF28M/fRSscML9yZ2h86tClsJJ/S0wBL7gVF6FGXUJsmQpUu5bjkt2SloOEg2
 HpvSM8Onp4ZbvLFGJQWKxi6TwrM6TaOmNsggUoeCYD9Kr89mXcWdy2VNvQoyos9FmaNK
 lhuyxg/4dbBRNLFj8TfB26ZmaH37I6JhnWeKBSeHeYfX4ExdWTQWWR9hxld2bKEZstGz
 SWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=L5/otc/mkZPa+VvZvOV/EIh5pPMTDmEcUIZR59Oz18Q=;
 b=ZuchgR9Klmo3y5QLJXdaaWLP24tHKRi5xOlvqR5qEZ+yfId9y79Mi1AOepB8r9b6Yc
 doKjX1HQM4I4QBvyBcX4whe2ccA6PfVhKye599dYs4bzGfZ97Xumd4LbzOhPdSbs/CiP
 15FvfPunO7nfNxyahW+kTHmF6Yu2II0J954ObgorFwxRw1hl0d/Jm2EuQAVWwZENbGRk
 FXN8SSyVi5724IJawyPBMxpn/H9yr8tTUzlUHUOcIOjBvYpCofLsbEo76w2KbZzkW0co
 VumrY3bjKWgLPn+k729CpLBty1/FlzrVA5eVTNb2SGMY4cTgUqY26Z1fxK5zldhcr1mH
 30zQ==
X-Gm-Message-State: ABuFfojQuZb8MCVGwk1e86BWaHe0xawo/zXnFNBphVeZOiSNeqpfJ1G0
 a4hECKvBYqi7VglMJJ54J8+GVcZDsYI2dXXK4FliUYLOOgn54g==
X-Google-Smtp-Source: ACcGV63q6F7FTQ/OJK/LMWpbj9nm1jK/0aSQVBeQK98f/fjApQ+4Hj5kB8aWh/B9u8I6qGEpJK/WGlv4QPVpR5Q6hjs=
X-Received: by 2002:a63:a44:: with SMTP id z4-v6mr1321490pgk.209.1537885867336; 
 Tue, 25 Sep 2018 07:31:07 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 25 Sep 2018 07:30:56 -0700
Message-ID: <CAO=notyQzzzq_dyNQZuSJagBn56Z4gjaz6JmOKvAGo_J_f--YA@mail.gmail.com>
Subject: c++ phosphor-objmgr
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>, 
 "Tanous, Ed" <ed.tanous@intel.com>
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
X-List-Received-Date: Tue, 25 Sep 2018 14:31:12 -0000

I see a lot of open patches
https://gerrit.openbmc-project.xyz/q/project:openbmc%252Fphosphor-objmgr,
and I was curious, are they things I should dig into for reviewing,
what is the general status of the c++ mapper?

Patrick
