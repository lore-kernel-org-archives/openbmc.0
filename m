Return-Path: <ross.burton@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=ross.burton@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="JWtQJ/3/"; 
 dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43LGQF5YfBzDr1K
 for <openbmc@lists.ozlabs.org>; Fri, 21 Dec 2018 02:48:48 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id z13so1704165lfe.11
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 07:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9JrBiUtxrR6KulaL9O4CU3mTycbNg7YVNAN0ycPkEfU=;
 b=JWtQJ/3/qS0KDB2zsl3e0ZXAZuX+XboCvaQYpWrT7i/Qqtrxr6bFU8b8rGzW8N7nz/
 QZaJ3zhc2XAUM9VYz18TyA8p0+XjvTktSUJxAhH9a0cuRfONlN+xm61W+YL4Bgz2VNZf
 YQrCjfYAkB+99lNF2QjEGJa3yJ55Nsybw5ExzgQSrTGrosc8PkvoG5C596F95/pq5pNS
 vfP8qWnLkPaUPiWrDqUI8rSPWUAwHuDQX7IJo53xbNY3o5oQwKmlzoUIqhZdRNeAakYX
 aKol1eFpCIf95AXk20VbIltUfkugahVaSHwWkTwwCY33uDMGO1DD8Zomp+DL8Gwy3B+o
 xTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9JrBiUtxrR6KulaL9O4CU3mTycbNg7YVNAN0ycPkEfU=;
 b=dKqxAUvxlySpW/vCHNwEs+Ph9cN2HcPpTjCbAGLR/oEKN0rfcaCGlh4GRYG+5HUQiX
 nFcT8MHsCL313SIqM40KFD0g2mD5X4KBTdKrWzuUUXZ/tyeyU7RLPQ5LXzkEqjBKXohA
 gJ+ZSclYuLvMdN1G2+obWKemG6L70LWwyLo/bAx+dbvWH/yDadT169dUYNuu+gW2SuDU
 X8ye14dbwr4avjoEunKesy4Cb3s1eSonv/YriE2/VPw15zuQZ3ZJ9vLDdF+EAyx6tvmp
 bmBt2NJC8pSdak7a4boCw9Rle/Y1K0dwfuwK+LhPPK36nLmGONIn+ues+ODBs3Uya+2X
 c2uA==
X-Gm-Message-State: AA+aEWZ/DaBfjbDbo3Ok5/SjRPtIbHVORY5Cfg7URiHbF1ExWw40jXjb
 UnYOMW9WWk0g5N2PG5jC5U6kWYXem/ILCCTf5T5W6mDe
X-Google-Smtp-Source: AFSGD/VJl8LKrEOiK1AxAs1Oc+Z9PuceN++4sTwDDanZf3AeB6bpdgpjyJhzHqWyLUpo6NanVTn6bEnqb5Utix0gti4=
X-Received: by 2002:a19:22c2:: with SMTP id i185mr16641965lfi.2.1545320925898; 
 Thu, 20 Dec 2018 07:48:45 -0800 (PST)
MIME-Version: 1.0
References: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
 <E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
 <CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
 <CAMKF1sp1DLQwANi8sbHp4pP-YPPMbVOOsArUoxa286QAgTx-Lw@mail.gmail.com>
 <CAJTo0Lb1Vq7-UXWKZf5hs4L4HzKAu45HTOnxtFXkOCttA0BiiA@mail.gmail.com>
 <CAMKF1speLVxgZXojHO5ZBNO1LQXS4CMFvhK6VEbkeJL3giyMiQ@mail.gmail.com>
In-Reply-To: <CAMKF1speLVxgZXojHO5ZBNO1LQXS4CMFvhK6VEbkeJL3giyMiQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2018 15:48:34 +0000
Message-ID: <CAJTo0LZi9oF4cW815RP7XkHR6vj_qOgOb5LUrCGSCBK1oa1cfw@mail.gmail.com>
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
X-List-Received-Date: Thu, 20 Dec 2018 15:48:54 -0000

On Thu, 20 Dec 2018 at 15:37, Khem Raj <raj.khem@gmail.com> wrote:
> > Well, I built core-image-sato core-image-weston with AR=gcc-ar
> > RANLIB=gcc-ranlib globally and it worked fine.
>
> Please build a lot more. These images cover only handful of recipes
> there are problems like
>
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=77576
>
> which we might have to contend.

That bug from two years ago suggests that the gcc-ar wrapper isn't
required if GCC has been configured properly.  I guess we need a test
case.

Ross
