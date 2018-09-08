Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ISoaMadC"; 
 dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 426zZD0tB9zF3Ry
 for <openbmc@lists.ozlabs.org>; Sun,  9 Sep 2018 02:01:22 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id l9-v6so8416231pff.9
 for <openbmc@lists.ozlabs.org>; Sat, 08 Sep 2018 09:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=VTvfUn0+iA6RBk2CFvl4a0krRNdTIhH3g6hXC4GZ/Jw=;
 b=ISoaMadC1QhV9jWget6EsgXsebRm4Fie16CScfctjnemOSg0BU5h7dlyl7SDB2RU/N
 W4IBUhrOT70sYurCetfzUgcIhaW1h5xlLTvIJEdPP0uuvSkqAD8x0Pn2ErOEUQqCf7ef
 Y0i0ROKmysCk2lvwRh+UR1bS/4di1E1y+E6sr0JMj/jpG8nh+Du7iUpZERqY/fHiar3M
 FHon2rrtSSmDYJ5QgcHcHIUoHFhsoUPPevStLii5etGiHMZfVlaI1zQ1A/OoshT0TXZ6
 CBHTFihX9HJ+N1y9v6gcHlr8J4bQuJ+rb8UP9iy08Elp/iWzblTL5ECeH+CR55kznFGN
 FA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=VTvfUn0+iA6RBk2CFvl4a0krRNdTIhH3g6hXC4GZ/Jw=;
 b=bhyAAVH1c6pugequQNM4LtJ7ya+nA3kGXpxo+UQDTHY0Buxs6CmKiGdQv6r6CBgTPI
 +NWhLRVavZlPdXlF59j1D0nzZXrRKpGUh+etaKne3o8i2BVRbkNw3qgAFq8jScwhs/xY
 E3+07w47F4KO1oPzhgyvHUoTN9QeTPrmCo4kY0pswk7n4+vycpe4sZAucAwT1PVMgYr1
 pPLzfsq+vz1pMQ2deU+65+7KKv+lbVOOVQW/04+goeviHH7/ZQjPr1yOLosTF8mY1xQn
 hqxo4lUahl9nbxOZiUJ1qpifL5aVSQWCepnOax3xkuffo8nzeteQjGRIcC12th9zaf+0
 Y8yw==
X-Gm-Message-State: APzg51DkCYNbu6UVscnydpxlji7HwkQ/jmyiTV+hXX7NOxQMnrwCK8Qo
 mFhTW/67p8qT1QNbIltLHM86XYmHXwdK56asbKgftg==
X-Google-Smtp-Source: ANB0Vdbih/1RECpuSZWEYNA/hL2xHNHDd9NXxDtCtrQw1nwV26vd9TJVUHW+dgXqjCqyeit3gTCG9tipWyYic5YxqY0=
X-Received: by 2002:a63:a5c:: with SMTP id
 z28-v6mr13586413pgk.209.1536422480074; 
 Sat, 08 Sep 2018 09:01:20 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Sat, 8 Sep 2018 09:01:08 -0700
Message-ID: <CAO=notxW6Yq+uct7quRtNjFfp0DeyrsqXuYJh1uuBx-cDEa_MQ@mail.gmail.com>
Subject: tiny package --
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Nancy Yuen <yuenn@google.com>
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
X-List-Received-Date: Sat, 08 Sep 2018 16:01:25 -0000

Brad;

I was looking at publishing a single-header file from a package
containing only that header file.  In this case, "oemgoogle.hpp" into
the same place that phosphor-host-ipmid installs its headers so that
any google-ipmi-* packages could store their OEM numbers in one file
(upstream).

Downstream we store that file in our phosphor-host-ipmid mirror.

The advice I seek is -- it doesn't seem worth creating a separate
repository for one file, but I know it's a frowned upon practice to
store code in the bitbake repository -- but in this case, I feel like
it may be appropriate.  Does that make sense?

I'm thinking:
meta-google/recipes-google/ipmi/google-ipmi-header.bb
meta-google/recipes-google/ipmi/google-ipmi-header/configure.ac
meta-google/recipes-google/ipmi/google-ipmi-header/Makefile.am
meta-google/recipes-google/ipmi/google-ipmi-header/oemgoogle.hpp

Patrick
