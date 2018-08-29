Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="WdrSK+6O"; 
 dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420qt06cZzzF32k
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 01:53:44 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id i26-v6so2449214pfo.12
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 08:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=qLuvqSST7lthMgHpuV4AE457gNhfQOJAAAikBS8gn8U=;
 b=WdrSK+6OFv/EP8tTfXqaTXpvTobXO+SWzbK/zFtmbz90YlOdTJr1X/kPi5P1wddzti
 EwamNWchYKGhjl+ISPfkNri7uC8XIo8wnHLwgJrsKrdKyP7EQn5PQobhDu4ittJdHxRz
 PuwUnMC21CXVQA03Akjao95OTC0l0u4LttSM2aSjNEG0V3hwktSCeURp67xAXbJWJYO6
 UiM1Erx8BeHEghYJeubHD9cxMG5sAMJcJpygMATnAo7wA1tb2v7iTu1PEsbMRJACVOEN
 4+JE78DHPxDSHi2rwTZWkWOFh5nsdgAj5VWU17wRAOl0MVKPat/iSRGuXZbii0inxL5O
 Yh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=qLuvqSST7lthMgHpuV4AE457gNhfQOJAAAikBS8gn8U=;
 b=ecNA9GfPkwDOd4wkIG1DSTJlAQ0ssv6Xz1eKTPkfhD8pHfHG5+Voi4OPEeqq3NkKX3
 332PoDmdLwOg5wuhFSSw6IaievH6igwLqifCpUEJAHRiDzoWvdU8ZBWCASj5rl80Xf4f
 h5VFR92WW76+jrdF2ABmoBOAr5YA9pCFm7NH7M+IuVT+WCIb2b/eLa2H4Wh2UwwLnxXG
 8+L4/aGLl8Ao/DqDrBgIoas6H2Wnb9c2SmIHFPPx1PVP/7rsTFik5AamW/9L5WZvChP7
 oanRU7V60EzdJE5Dfq3g14ot+MzKGBfcJCSRjKXAKUUmH9EoJtvSHuQR8GGtTAcTetwd
 4tRg==
X-Gm-Message-State: APzg51BzAPOEVC8Td5lVZGLBz2DjT7atRHWCPbWQ0MXYKPJIyyZIgits
 tNGfn8u0BxjqyBm+Ej0u4VpoJgPl56/42peWVsJu62N1kxQ=
X-Google-Smtp-Source: ANB0VdaX/6T2EF6KXI4zqDqyf05Ub00Wf5sI86hlxgwBfjLf2dSl6tht8nE8SwfRgMl9pITof/qIW5Fl8mrJudtpLNg=
X-Received: by 2002:a63:a5c:: with SMTP id
 z28-v6mr6074300pgk.209.1535558021845; 
 Wed, 29 Aug 2018 08:53:41 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 29 Aug 2018 08:53:30 -0700
Message-ID: <CAO=notxjhD7u8Gfa-D5zdJysuqzFMNqQM4fsfa3RmN5geudgrw@mail.gmail.com>
Subject: Single-Source
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 29 Aug 2018 15:53:46 -0000

Brad;

While working on updating the documentation, which holds a
clang-format example in it, within the markdown, I was curious if
there was a single-source of truth w.r.t configurations of this
nature?  I imagine it hasn't been an issue yet, but I'm going to
update clang-format files to use the header inclusion, once we settle
on the exact pattern, and it'd be useful to have a single-source file
where I could make the change, and copy that file out into places --
since I'm not sure of a reasonable automated approach.

Any suggestions or thoughts would be appreciated.

Patrick
