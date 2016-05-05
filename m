Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r0wbW1whqzDq5y
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2016 23:23:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=dtmowmnf; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=gEGnKqux; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id i2so13698532oib.3
 for <openbmc@lists.ozlabs.org>; Thu, 05 May 2016 06:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=q4Q/O3szVLHk4+yHm0xhPfgS5mc7meaUZGhsyq8zCJo=;
 b=dtmowmnf00D3MyIc3Fe4jB5c8d2jCXm4aMtUQW6OfN88ryq/ftn5lrr+WJZkGJKEfd
 HEX8P9vKxKWO6M944+x/HFZRg1rETukV1tEygtZbhSnn6NrwS5HTd4HzjTaLeraUp6rQ
 +oMoQFAkWU/PYiguGu+kdXy31d/M4JjcUrEtRDvcdoT/yLy49p/Mhd3sK9z58pe77MGp
 Fr9qkpSorSySMVCapjXoq+ve5nXRp6N37ZFzDcF/trw9SQ1mlaYS9BTTPDVtsBo+jYdD
 twrZIuVioZZYRgkxxBt6cmwBUFQHLOAh2uOFE1AgwFgOt6ipGK3783+N0MkL9J7HpOn6
 jSbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=q4Q/O3szVLHk4+yHm0xhPfgS5mc7meaUZGhsyq8zCJo=;
 b=gEGnKquxdeQLrsl/sZzUoioHUSYstFfDNNZ/13fJIGPgqWfD8Ruvb9r2Uj31XVleWE
 7dKpVciKNlFdgGE1R5BSRP/pMNtrCRFEgYmUICqQktW1B0Hn4cWoaso1JrEKCuyqEewa
 EymmgIHZslqQ8gXckg1w1NHUo3+QrjY2Eh0fQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=q4Q/O3szVLHk4+yHm0xhPfgS5mc7meaUZGhsyq8zCJo=;
 b=aW4BhdJcJH1P2fA40Tkd7zj0g30OEUGg9uoDga2y5X5lyqMhftkYR65HjXXvkerwvt
 m8za8a+qcpJ6xj+b+5aWIBWiA8zYt8PEHyk5LrGHnqzSNXCvLP1owdz+/YgFLspcF3Ep
 8zhoK46JBsXtuXg5zc05rcy9o+1alT7BWPUa1D3PAWc1OOYmE2pITCEC3FPQCWMbbG/z
 AHyVV0aCcE5LjcJrtldi1x5BEXlOz73ULekvH9b5d5lWqorxaUTE/+rjlo3+gP/rgTZg
 HUeUQeav3n7YKwo6q8bOQ9ncE2+RIk+kQ/Sm47YU/tWILroX0mf9TsSEKQLL1YEigJyc
 /alw==
X-Gm-Message-State: AOPr4FVFEfvv80cgsfv8vrbg7pRkNJAHGIc1lTikkZvDOHkS4ee2vapk5aqB89ebdR8gkV1pIu43wf2eB/hunA==
X-Received: by 10.157.41.202 with SMTP id g10mr7205210otd.122.1462454629344;
 Thu, 05 May 2016 06:23:49 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.79.200 with HTTP; Thu, 5 May 2016 06:23:29 -0700 (PDT)
In-Reply-To: <1462411636-7225-2-git-send-email-cyrilbur@gmail.com>
References: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
 <1462411636-7225-2-git-send-email-cyrilbur@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 5 May 2016 22:53:29 +0930
X-Google-Sender-Auth: ovzSNMahvDWvgJbLafXUX3j09T4
Message-ID: <CACPK8XcdrVKtq==hH7-FCPowMWvnxVfgL4eyx+08x-qjW6NZ_Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] phy/broadcom: Add support for the BCM54210E
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 05 May 2016 13:23:51 -0000

On Thu, May 5, 2016 at 10:57 AM, Cyril Bur <cyrilbur@gmail.com> wrote:
> From: Joel Stanley <joel@jms.id.au>

Are you happy that this is correct? I will submit it upstream if so.

>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
>  drivers/net/phy/broadcom.c | 13 +++++++++++++
>  include/linux/brcmphy.h    |  2 ++
>  2 files changed, 15 insertions(+)
