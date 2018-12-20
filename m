Return-Path: <ross.burton@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=ross.burton@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="jUyH5d63"; 
 dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43LGNb4ssTzDr1F
 for <openbmc@lists.ozlabs.org>; Fri, 21 Dec 2018 02:47:26 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id v5so1712351lfe.7
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 07:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q07xltA2elmqykK1jzoNSl+3vdBvATAbeYQqt+XUXbg=;
 b=jUyH5d63hWe6zeVMEuANx92VU1oUiK++EHSyaGu3l1MK4FytQwvctSbg0G1xINQfYs
 3tC2lktVY3r9+9qK8oRuH9W27sw0V7Aku1XFt9pY8oGEd0jRGCiEtMnODC/KYToHgbOe
 tzVDIdlQ3RKjZNI5ALCYpVUQHBblEI4DmBguHCChEG82+C8Vo+nH9DyYnrVg+2+n/ttp
 JyEJ4gUSYb/Bx97tUWRKqdj7ldrJrjG0XzVCLCjVzEup/g7KhsyB5TAarxPpQrIPdn/k
 uuyrpllzqt6yzxMQJZlZtY4S2VWdJv2fhMsa5+aGzO/evZnoiWj41v7Ii5HVAw57ceMb
 PJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q07xltA2elmqykK1jzoNSl+3vdBvATAbeYQqt+XUXbg=;
 b=I+2xcXENHz5u0WVe+H6bhwH+neZnX/l7DSyN2tXmWGURtTlzANClM2tk4kNCSpO3Ue
 +rHQecBWxTvc37O9aL5AEnQCJBgyoeUd6eMuifvteit2DsNOvuP3qlGoAjMJGPIWgGyi
 Ix8X26F/ljeYa5b8O1G/0S98blEvvCq8HbpNw0zh15xWgNFtJT14HeSd+xfC2jzV4Pf7
 lUGPRiqHHsh7eg4DEY43hX6EoSSFcT+hE4f05T2Lhqs3tM9kw3nUU9WXN5Tgj2R8dc8+
 wrv0Qx/m1AkzfhhO2GgHNby2WHiY1SKl+oamujcJW7Xgkjjqhy249g3HemGk+op5hpJA
 gBOA==
X-Gm-Message-State: AA+aEWZCvPniYRbveqMYSJ5TB676cItjUkLv5apr/oi9x0j6rPyXPYBB
 v3reiH05GFL/+9+T3MYO5lnX0w2O3NRPB6sd4Hhznw==
X-Google-Smtp-Source: AFSGD/XHBug5qXlSpSnX39zpfHGYSCCueUV3I0L8d8Ysz/6gpJ4h/+G5LhDZt127NzbicpGbHv/cR5N8rvi63lbKrNs=
X-Received: by 2002:a19:641d:: with SMTP id y29mr15249620lfb.14.1545320842771; 
 Thu, 20 Dec 2018 07:47:22 -0800 (PST)
MIME-Version: 1.0
References: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
 <E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
 <CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
 <CAMKF1sp1DLQwANi8sbHp4pP-YPPMbVOOsArUoxa286QAgTx-Lw@mail.gmail.com>
 <CAJTo0Lb1Vq7-UXWKZf5hs4L4HzKAu45HTOnxtFXkOCttA0BiiA@mail.gmail.com>
 <CAMKF1speLVxgZXojHO5ZBNO1LQXS4CMFvhK6VEbkeJL3giyMiQ@mail.gmail.com>
In-Reply-To: <CAMKF1speLVxgZXojHO5ZBNO1LQXS4CMFvhK6VEbkeJL3giyMiQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2018 15:47:10 +0000
Message-ID: <CAJTo0LZUEDT48YAEGc=+XPW9b-+qJU_RYAzw85hQLwYm-J2AVQ@mail.gmail.com>
Subject: Re: [OE-core] flto automake
To: Khem Raj <raj.khem@gmail.com>
Cc: Bradley Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC <openbmc@lists.ozlabs.org>, james.feist@linux.intel.com, 
 OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 20 Dec 2018 15:47:29 -0000

On Thu, 20 Dec 2018 at 15:37, Khem Raj <raj.khem@gmail.com> wrote:
> > As we build the cross gcc we know what is in it.  Other toolchains be
> > they clang, ICC, or external GCCs, can override AR just like they do
> > the other variables.
>
> Yes they can, but what doe this buy us ? except we make Core toolchain
> gcc dependent one step more.

The core toolchain is currently GCC dependent already by definition.
I'm actually about to start working on abstracting the core so it
doesn't make any assumptions, like how there's no hard assumption of
glibc in the core.

Ross
