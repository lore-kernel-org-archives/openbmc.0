Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="FNVEYmzG"; 
 dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420GBg5XhtzF08L
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 03:36:11 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id h69-v6so1033232pfd.4
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 10:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8stl9web5fShPgQXpFw+BYi2og7hrCWBcKzxhHfeXxU=;
 b=FNVEYmzGaCi4lUW7BehWddxR2NLuSD5J0pW10avCDSsZc58nHpqU16BSL7gKX45+ri
 0rp1Bwv5prgUxAeOugQQYmBekcIB9TOwGSA0NqyJLoA/oakneCtt5G3A0wJxXV/kE5Ls
 hXSH7znq9goZjc97hL282RcRxl+dq2evptfm43MBBCft6sBTnI7fkLtGVcUHFnyp4jFV
 9ILuqt+juxeyjj+gjKcXwGI6Ba0EL28GlzIjXg6+CTmEIrLNGB6kxOU/S+Z2L3uzWc37
 Kq1oODw80Nm36yY5si/QhUA37ztRHM17CTSnhrwLzZFwvnR7pHQetxfXNrgv34jbBvyd
 YYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8stl9web5fShPgQXpFw+BYi2og7hrCWBcKzxhHfeXxU=;
 b=Cg8acXxEpvkW1N8l5PXeVuJy5z1bYvmOIRfhrpFKDKY62TsvfqPSsfOIgSS8GNRbtj
 6bc3zEvQm5LAlyETw9hwGEcO5FdNbtln1Gk4oSXKOT1paZYxtWQLra0sqFq6XaIjIaXV
 40vRwa/YURW+pbPdJ15fmOtdN+sKMq8DsSQiRx+Mn9BfTgfUOGapnpwWmuJMwOyT+e4m
 7nyJxvW34qTLGYFZTuLSOnXqhujjFiUCxfVFwZoHqQEDRqqHzRSBfjI2YHcQkV9CRUP6
 5bs/nUVftUOmgiiZRk3stsqEERniJUAc0fYl0OHO8S+NfTFA6slNI1pDsTpLYN+IpmUC
 oKHQ==
X-Gm-Message-State: APzg51AgII2WYNiX4mGcONBzVXBPD6ye1zT5FORKji6XUqgtlivPy2fc
 vXlhGQJysxQCuFIIcbYwj51PaLRyWUW+yczUgF2ff/S6820u3A==
X-Google-Smtp-Source: ANB0VdYmkg+8S1D25dIYCXi7vhqZIbDuM58Vrvvo4W/BAMpRCERTTGMS5aSylmhw5IxC65Aur59KpuwDxTwJiLZ7SgM=
X-Received: by 2002:a63:a309:: with SMTP id s9-v6mr2400550pge.90.1535477768671; 
 Tue, 28 Aug 2018 10:36:08 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 28 Aug 2018 10:35:57 -0700
Message-ID: <CAO=notzut2sd4GZvA3gMzoB+J7g48nXnXKONhnwNfJC8jPWPAg@mail.gmail.com>
Subject: Header inclusion ordering style addition
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 28 Aug 2018 17:36:13 -0000

Each file in each daemon attempts to order the headers in a consistent
way.  Typically, alphabetically.  However, I propose here a more
explicit ordering:

https://gerrit.openbmc-project.xyz/12180

As an example of the ordering:

https://gerrit.openbmc-project.xyz/11421

I feel that having a consistent ordering that deals with the various
types of header files included provides a couple benefits:
* header files are included where you expect to find them
* easily can see that there are c-headers included in a clean group
* defines that the phosphor library headers are treated as normal cpp
libraries and included in that grouping making the headers come across
as system libraries and not something different.

Please take a look.

Patrick
