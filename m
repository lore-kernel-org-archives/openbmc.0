Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="N4hrUqxw"; 
 dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42XcrG1sCDzF39j
 for <openbmc@lists.ozlabs.org>; Sun, 14 Oct 2018 08:13:33 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id v133-v6so7388850pgb.2
 for <openbmc@lists.ozlabs.org>; Sat, 13 Oct 2018 14:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SOJQG/7tfrk+F/RmjizyIOHHnmJm3HRQ0srQOhb+gLI=;
 b=N4hrUqxweDpPP3naccPueAstnZCcV42GYs/t20ndiJzedyS42nmaSQXQ52MNTlompj
 +jNKTMLEUczMmDm1FykO+msy5JMKzNPdXqpCobdIiw84FIz2QBI25jPgzloTLtXeVUvX
 FZ4kkoklzG+5EUuTlKRI7ZkxFYoh6Cs5K6RCdhBAT8ZhEuS2QOsQcWOfyknogUU1Z1j1
 bC3S/q+0Kppt57gaHUWDCIWsZTiAJEOjAXr/7GBKDrWyi1EBaYrcK6EeDD2E5NltM/cT
 iKPHhAthW7v/KbnfA7vMXpW9s9dUVWQPazwRWrRm4uOwSNx+ZdT4xOZBlMwd8aWwyuQl
 CZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SOJQG/7tfrk+F/RmjizyIOHHnmJm3HRQ0srQOhb+gLI=;
 b=DyEW9wqmOn8CspSnyuxZhA+3IWtavHuXEHa1Cp25hTLh37x5OruwXCOvwAoPlo+JbE
 6KCy+67n9c0IDjlHCaoVYFXfaaTr6roYudNBgFxj1sA4wtB9/8kYwo8/ijDkgqXjv44n
 gyf0nXn5TFEUMpZAVeGDN4Twzgtmb/mJSNHjdT+6eMGok5p/UFx1UjdAaZcLAc/mjayL
 8MuunIB8HlgiUw+VXNpzb0a/wWFIkVO8/XG5s/cxHE5o1bjAOO3KIv9N84ulmtFYlvim
 w4G1vNilbvLYHfRVHi0Gk/BlbX1xargtlXBVdn0M934QNG+47lI3rL8FlKiT5YX6ENkY
 sBQw==
X-Gm-Message-State: ABuFfojRmXuYcYFasTMSvjDLXJTzG5SMHCL5ZG62bRVl0oghY9oTp4O0
 WumRer0YVonnI9mZ7tlE5X9d3GpU0YYluB64Z5GFuVaV
X-Google-Smtp-Source: ACcGV61eOanYCW7Hu90m8ewhZWLzhqPncAmmAUn58yXLPPr4BLPjdrToOeLMDMM4d1PQc3bpJh161f97ZozQU+Lmdrs=
X-Received: by 2002:a63:9507:: with SMTP id
 p7-v6mr10525982pgd.449.1539465211758; 
 Sat, 13 Oct 2018 14:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <b955c4bf-7605-945d-c7dd-ac3669809cee@linux.vnet.ibm.com>
In-Reply-To: <b955c4bf-7605-945d-c7dd-ac3669809cee@linux.vnet.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Sat, 13 Oct 2018 14:13:20 -0700
Message-ID: <CAO=notwRaJcdiD8KnbB_pe3k=v6BFZXGnrEcxBH-29LZ=pGL6A@mail.gmail.com>
Subject: Re: Should we tag master?
To: gmills@linux.vnet.ibm.com
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
X-List-Received-Date: Sat, 13 Oct 2018 21:13:35 -0000

On Sat, Oct 13, 2018 at 2:09 PM Gunnar Mills <gmills@linux.vnet.ibm.com> wrote:
>
> I think we should tag in the next week or two with a v2.4. I know it is
> pretty arbitrary when we tag, but I have heard several companies use it.
> The last time we tagged was July 12th and there have been over 600
> commits since then. The last few tags have been every ~3 months, so we
> are due by that schedule. The Release Planning Group is planning a 2.6
> release in January but until then I vote we continue to tag every 3
> months. There was some discussion on the mailing in August about this:
> https://lists.ozlabs.org/pipermail/openbmc/2018-August/012922.html

My only thought is, it might benefit to wait until the great renaming
is done or closer to done so that when downstream distros (like ours)
rebase, they will be rebasing onto a more stable version.  I expect
Brad and I will be done in a couple weeks, so I'm not anticipating
needing a long delay on this.

>
> Thanks,
> Gunnar
>
