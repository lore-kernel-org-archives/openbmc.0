Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="A4KNvBID"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rJMC4XtjzDqGq
 for <openbmc@lists.ozlabs.org>; Sat, 27 Apr 2019 01:46:47 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id w20so1145084plq.3
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 08:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fkZDNMl48bhuKCu8fZsi++eLu1CLKJKoSkWeS7jrhbI=;
 b=A4KNvBIDADS+IBP3PI3hvVV+wOOSdefP93foOkeFOka5SO9fhlvCWVEx74pNi9W9B1
 50myPCFMTVIpq9srOScYZU8x763ChJ+1IUKAV+UVViFyvClmfdTddBSf53uXh0fqanj2
 Ga1sM2C8CwJltXhbHUK1aEA0uQ8oMmhcXsRIF6ywBvfI77vd0rB4rdhfl1Urqhh1b/jJ
 5KPzt0Ekly6MMs6XvG8sLcWXrOqlItJAzuIWX/7AK4aYpBGugP5SpeJYn3U1AQmPzy91
 IjY+eTBJNjyEfDQybWRbC4RaTMpY0fG2tDEqlQslWOx/m+9S8lZvTSd5pro2vwtDgtbZ
 CEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fkZDNMl48bhuKCu8fZsi++eLu1CLKJKoSkWeS7jrhbI=;
 b=XXm4B580QmuYkprrBqLhwk9dnmXvf9UrJbh4ylr+naTQRC6P9nc+buHkJlh8FqFHBg
 Ry6mMGlldvlcPtHtEgvOO7Pjhw1bvQx5ZnvjcgMZzTwZs71zxBhxUgB5Y8tcTAmNsysR
 GDBtDK4lKNePssjP7jRLSlZAfKn7LAlGT6imq10eeUGX0NiiC1Z4cEzTh1uCrJrhxP8n
 YAmUG5U6++kf8p3ge1k4whm/K3six/ttfmCciPpkM967RjR19N9n5nsafhObwOHQMGNr
 IKR8YlUhtUYpHBSF3XBhG9UNDOBn1PczpZ8Ufnpcj3TZDytu45VCLe2l5J1utnBMSMYw
 zvVg==
X-Gm-Message-State: APjAAAVJQcvM5jdT8Pya0nuHbU2YVIUon4FK0u7EpabTobroWlwBtUZ5
 08Qn9WNvfTi36nXoOYxM97bCgEIJjc+zhGf96327dA==
X-Google-Smtp-Source: APXvYqzRkFqsWK3HVynb/1E4UinbD6OVLQRgDqdzN4I953ohLPvzNpVQlRZlskWseaUAD09DPDTM483eqiqZFFLXFYk=
X-Received: by 2002:a17:902:7895:: with SMTP id
 q21mr9626817pll.197.1556293603827; 
 Fri, 26 Apr 2019 08:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxyVAx=LY+5tCUWaezZP67JKy7z3NT3SAUcKR64W8Pk_w@mail.gmail.com>
 <d4abbc06-a4ea-4cd0-95f7-b32cd388293e@www.fastmail.com>
In-Reply-To: <d4abbc06-a4ea-4cd0-95f7-b32cd388293e@www.fastmail.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 26 Apr 2019 08:46:32 -0700
Message-ID: <CAO=notx9iWQoOLPxKiHm-V=B5b99XZhLQE5PkgNEPg-J_9apiQ@mail.gmail.com>
Subject: Re: linux kernel compiler warnings ignored
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Fri, 26 Apr 2019 15:46:48 -0000

On Fri, Apr 26, 2019 at 8:14 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Fri, 26 Apr 2019, at 08:01, Patrick Venture wrote:
> > I'm getting feedback from a patchset I sent upstream that there are
> > compiler warnings.  Which surprised me because my OpenBMC builds with
> > those patches don't complain.  I imagine therefore we have them
> > silenced and was curious where we silence them.
>
> How are you building the kernel?
>
> I strongly recommend you build kernels directly from the kernel source tree rather than using bitbake, if that's what you're doing.

I'm building the kernel via bitbake as you surmised.

>
> In the kernel source tree, do:
>
> $ export ARCH=arm
> $ export CROSS_COMPILE=arm-linux-gnueabi-
> $ make aspeed_g5_defconfig
> $ make W=1 -j$(nproc)
>
> This exports are from memory, ymmv.

Thanks. I've fired off a complete build of the kernel to catch this.
I don't have the openbmc SDK toolchain installed at the moment, but
that's not a difficult task.

>
> In addition to giving you more output than Greg is after, it has a much lower write/compile/test latency.
>
> Hope that helps,
>
> Andrew
>
> >
> > Patrick
> >
