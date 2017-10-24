Return-Path: <geissonator@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22e; helo=mail-it0-x22e.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pR/RSzT4"; 
 dkim-atps=neutral
Received: from mail-it0-x22e.google.com (mail-it0-x22e.google.com
 [IPv6:2607:f8b0:4001:c0b::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yLYyl3dDTzDqfh
 for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2017 11:28:14 +1100 (AEDT)
Received: by mail-it0-x22e.google.com with SMTP id l196so8060245itl.4
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 17:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=gt0097sdkDNXzP5Bdw6q/tQQiyL4JeyEI7LQfgczLpE=;
 b=pR/RSzT4BqYm3xpu15v19aRga6mcDNml+mXXDN+zsl5FQ5R52iNPkeoXuCWxqgAagw
 4RP1Gkl26Z2IMmfV10jyP6FOQSrm39ThOpbtlkNkM7+sr+vj6LyxcXT4POVUs1W1ux6o
 RCkR2HVuKNDRzYtfyH1GjNEh+vWlK7vPldu5X0nIQPPsKFBQf2dcdhmePt4WNeeA7o8H
 oMxhFRLOWlLh+yAXofEF6tdoiUDJaVEs21s06ZolHiYNro7L1ScIyBGEajxjmBjfpzeS
 fp5OpQ2u32qiaX0xRfKIY7MKep9o5/vqfSThOV9jBERzBTAR0CxrW3tc5IELnEJY8Hn9
 LzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=gt0097sdkDNXzP5Bdw6q/tQQiyL4JeyEI7LQfgczLpE=;
 b=n4V6fhkWgKM1wpusqE8zTZZVVoPIKKL+gp8V2wDuonpttSvpI+7fChtVq4buk4jFwJ
 s2HeqUOAfJHgFVGS6/n85t1ofouRgIAzQTtj/4QCuzEkQyv7DMBpnOg9pTeWXcCKnvEZ
 QIZADIhNrM8dZE5ei58T2lhtX5hHKuC9Z1ifZNw1IPisjj2p9Jz1Agqi1ph812u4c6Zv
 R7KaZeVR2dQhVF65bAA/j9T4R378pttRdV6gu2TmFr3p/5csIRz1lj2VzreuMSaH/swx
 742Qvst1Wiz5ywGDfsojzQq3R/hdFzfv7z0/NMTj74c0Y/TDBRdkEyLY8XglMh9dNUTM
 K+kQ==
X-Gm-Message-State: AMCzsaU7M5CV1Cv8EnlBGQc6NB08yOLDOYsuK/uR45o4Lxg+mlAaXXGR
 cu00PhRe+4kTyZl+kVipJ0TL+CfhLtY2IAuZ8LR28Q==
X-Google-Smtp-Source: ABhQp+Tf+lCTvO/xJ/RvB0dOg0ihcm9kHo9vzkKQJ/pqztC6SqgZqiL3BuN1qm8+ccAQeW3BN5jIYykfldSMVbz8FfE=
X-Received: by 10.36.39.214 with SMTP id g205mr12154736ita.23.1508804891743;
 Mon, 23 Oct 2017 17:28:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.150 with HTTP; Mon, 23 Oct 2017 17:28:11 -0700 (PDT)
In-Reply-To: <1E8E7FFC-C42E-4FBE-A7FE-89FD7B90DF24@fuzziesquirrel.com>
References: <1E8E7FFC-C42E-4FBE-A7FE-89FD7B90DF24@fuzziesquirrel.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 23 Oct 2017 19:28:11 -0500
Message-ID: <CALLMt=rFpdUB910QX8A1OoCU=UNra=xuaT8CZF6L_-ceL4=F3A@mail.gmail.com>
Subject: Re: OpenBMC 10/23 community telecon - call for topics
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Oct 2017 00:28:16 -0000

There's been some discussion in my change to persist the journal which
may be good for a broader discussion -
https://gerrit.openbmc-project.xyz/#/c/7196/

Andrew

On Mon, Oct 23, 2017 at 9:25 AM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
> Call for topics for the first call, today - 10/23.
>
> I apologize for the short notice - going forward I will
> send out the call and agenda earlier.
>
> -brad
