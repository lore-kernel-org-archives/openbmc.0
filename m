Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="XEwJqCHJ"; 
 dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4292yy3tFMzF3CY
 for <openbmc@lists.ozlabs.org>; Wed, 12 Sep 2018 10:41:29 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id f66-v6so82127plb.10
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 17:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=cisuYx6G25i233fVyGKrrgBRQ4OdHTqkCFsO3dZRkIY=;
 b=XEwJqCHJg+rOdsGc+kA/RhlhQ7zTh70rLnfaAkmOO7cDCQsn6iz9zFeB7s/aTPE3Pk
 uCzcwmD81ORsxl1IkKJaOJs9NOi4g92g6aOSeqzELv7zqxG0+0B8+c+uQDG4LJLwmJIh
 Ya2BXNuNkOp8M/LhdUeTGn7pMrqLMvsl/97dkbkps8wyQ091Vl0Rr9RnnCx4+/wPLVQ/
 i4PaGv0OCA/hD2xyJqMW/Qug6tcD5ONT2t0tAieEd9UngxUbtli8hg4N571ku9RJYOVY
 M5NfkaMx/5Gag7QH4FfvPMCDfmtPIaS7yI6FEDvgjoymow8/e2UG/hl/XQNAShg4ATiH
 gEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=cisuYx6G25i233fVyGKrrgBRQ4OdHTqkCFsO3dZRkIY=;
 b=VbyXjZEgmvbw/ZhC2z8ncVQO+XWzxAJHJVZN99CpF27I8ix5zF4rvdAlLO1k3eq6ym
 DBHAmceG3DIXVNF6O4QRPu2UqT+tMkhTnypRo7QzdJMdZ2mm73O9H99jKgX7i5GalMPD
 LRua2PUvR6zW3C7AUSGfVeTJRL6AtG5WhfOktb+wAHtwsEzCsRn3CO2Ap4hdJY67f44x
 I5xrYjvMJW88uIn2BPSLCOs2pdzEMBM1k8R5tWx0wnkO9I15dsGzucEw9kk6Tc7hXlMR
 nlbr3u+0/G1ZVyAvoBRavwEs2xneRFkuEaIIRLjXqjlA99/t1JmGIiqHhsX2MQCttdhh
 vP0g==
X-Gm-Message-State: APzg51Afhgu27ErShVOc+QJs0I4Kh2esQ53TVS8hvdOhCW1OzLwe85DY
 rG/aTdF2giqiSJgXmEYRWzHv+oEUfQ6Mj6MZvxARJYWA
X-Google-Smtp-Source: ANB0VdYl8hHm7Nga9Z4ASeXSf4KH6l7gv9EJwkJ33UYe9jseZ3Npa40DEuEgSl2boU/VzIzjqOqSXaVecxAPrMRRIyY=
X-Received: by 2002:a17:902:6907:: with SMTP id
 j7-v6mr29901544plk.323.1536712887205; 
 Tue, 11 Sep 2018 17:41:27 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 11 Sep 2018 17:41:15 -0700
Message-ID: <CAO=notyNQDxqa_DZtfLJxO2NE04gqgpzZGi0Q_HHgCKkRDVSgw@mail.gmail.com>
Subject: New Library SOP
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2018 00:41:31 -0000

Brad;

William contributed two libraries by building them as a repo under his
personal work account first, and then presumably you mirrored from
them.  Is this the process you prefer?  I'm looking to do some
cleanup-by-library and wanted to take off in the right direction.

I plan to grab some code and fixup three of the daemons to then use it.

Patrick
