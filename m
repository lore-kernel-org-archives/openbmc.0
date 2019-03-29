Return-Path: <benjaminfair@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::142; helo=mail-it1-x142.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rpQ8UfJS"; 
 dkim-atps=neutral
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44W82r1B3szDqD3
 for <openbmc@lists.ozlabs.org>; Sat, 30 Mar 2019 04:33:07 +1100 (AEDT)
Received: by mail-it1-x142.google.com with SMTP id y63so5117415itb.5
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 10:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HocMLJBbVzAgBs+xylFVdouRdmxq8t5QzvhR7VCy7R0=;
 b=rpQ8UfJSC9Qw8PtpDH8b14HfCpHkxWOSORdBAJcAAaGHBHgoFwP6hPjHzhmDRAuUy+
 o/piIG+cgNvxXMLCQ2nxfDOFAVy8v+dK5mpOdNHRdCqDiD7zNxw00sGP8xB2dA3Bm2Sa
 H5xQqq55H0wL0dNeypSZWSXrOUU++mnY+wSXgf7FoTvbtw2pYfriEQAvjJ/SdQykCn1S
 lS00dk+C+psu60wqj++/+QExGlXmJ4gMAG3M3BEDMGxbZ4iNZZJTMq85ADNN2oDp16T7
 bNukb509DXrkM9g9chv0aifgfZjiTKQmD4Q6QOViPQJyy8AD6b0Muuj0Qefl83wYqzL8
 Ox6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HocMLJBbVzAgBs+xylFVdouRdmxq8t5QzvhR7VCy7R0=;
 b=iN+K/a5YWhBeFAhMMv3ysKKk0s02zwRjDlQue5LdeCoyqsqu5X3Hw0179zmEwukgIN
 MghwQDZiGehH6i6hJVlbaRBW9hurqYXNzYZoDWP465wGBjct7WT5yWJ0VNiBQ/ao8PVC
 nHItH5NpOQ17bl6f9RfGJMVT8r3kAAPD8mPpor4XqEwn5wBxqdYwEI6Wjfe9+QuO1DLO
 6fTZXckn7KtRl8jNIdVdVYarVdfiBath63KZW580BhsgX7qheZp2DUxOfa2yxwH0rxDm
 T8kTryuy3cpKV+VCwWim8b3g0QpCZS/bBD4NKRIrmpciZ0cyz71vRK0cvwkXxuMlbI7/
 lI1A==
X-Gm-Message-State: APjAAAWzvMigvZS4j1W4UnSz7r9WMfoWeWRvOiadhFj413OiVCX3tgH1
 yXuDbU1YFSdXQFosBPWCU29CDjtv/+wRoWIi2JY4Vw==
X-Google-Smtp-Source: APXvYqzN7owRmriALBZIhc6C4dp618i9IsQzYaOLotviCjw/82XtMd/iq3Bf2wPNG2LKiBh2rMkFZrZ4bW0DqGNa3Ec=
X-Received: by 2002:a24:2441:: with SMTP id f62mr5036919ita.155.1553880785756; 
 Fri, 29 Mar 2019 10:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190328235752.334462-1-tmaimon77@gmail.com>
 <20190328235752.334462-2-tmaimon77@gmail.com>
In-Reply-To: <20190328235752.334462-2-tmaimon77@gmail.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Fri, 29 Mar 2019 10:32:29 -0700
Message-ID: <CADKL2t5VuWA=Cx9q9Ddx+rZGbe1YoRKMWwfdFOCyxuGiMCOiPg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] MAINTAINERS: Add maintainer and replacing reviewer
 ARM/NUVOTON NPCM
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: joe@perches.com, avifishman70@gmail.com, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Brendan Higgins <brendanhiggins@google.com>, Tali Perry <tali.perry1@gmail.com>,
 akpm@linux-foundation.org, gregkh@linuxfoundation.org, 
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 29 Mar 2019 17:33:08 -0000

On Thu, Mar 28, 2019 at 4:58 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Adding Tali Perry as Nuvoton NPCM maintainer
> Replacing Brendan Higgins Nuvoton NPCM reviewer with
> Benjamin Fair.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Reviewed-by: Benjamin Fair <benjaminfair@google.com>

> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8b305d2f2a8a..4ece87fcc166 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1893,9 +1893,10 @@ T:       git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
>  ARM/NUVOTON NPCM ARCHITECTURE
>  M:     Avi Fishman <avifishman70@gmail.com>
>  M:     Tomer Maimon <tmaimon77@gmail.com>
> +M:     Tali Perry <tali.perry1@gmail.com>
>  R:     Patrick Venture <venture@google.com>
>  R:     Nancy Yuen <yuenn@google.com>
> -R:     Brendan Higgins <brendanhiggins@google.com>
> +R:     Benjamin Fair <benjaminfair@google.com>
>  L:     openbmc@lists.ozlabs.org (moderated for non-subscribers)
>  S:     Supported
>  F:     arch/arm/mach-npcm/
> --
> 2.14.1
>
