Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="L0UWYVa6"; 
 dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44VS6X4GqczDqQw
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 01:33:55 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id y5so5041728plk.8
 for <openbmc@lists.ozlabs.org>; Thu, 28 Mar 2019 07:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OSBlzAjWqJ5lMGwUYLpJ9uY8KWAQqs3vPY03yX3So/8=;
 b=L0UWYVa6ROpaC0jpNM9l36EMmMdNRuDgR5dR/oc62/CmZGPnTLZLqZgUh/gB8OXROx
 j0VBD0wOSjhUWK9AWWgU1cl64gWL84RfgWutMjb73zQgLQEWZa8DndXF/qEX0hxldi1k
 giawJVfT/Q37IGvko3WKqSFBiUifs223z6Hiy3GaaBx2/moRaGTZVlJU7QaF0afxeCb0
 7eus3Gwh8k22T/kHHmGARqe7BCq4PiW/ybkYyVTwujQHm01NgXcEYroGkiSq+gDiOgQw
 +jW7wri0PXRqNBErVnsG34N6g9AEhM7ioY8kScasKeAlQVkZU3U/DEaydI6Ar7nDaFtI
 f07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OSBlzAjWqJ5lMGwUYLpJ9uY8KWAQqs3vPY03yX3So/8=;
 b=d04bYN5+JAc5n1DjIqB53NQcXJHoPq0Jh5/3o53uVFiicskNNVQl/vQJDCt/knp/Af
 T0G2w7GkNlnvfk4r2PTx88uW31+mpaqmkDd33/ZHAsGjLp4yGC5mwtPsLRMNvRg6j72h
 ORkI22VUh3k61UjBH0gqoRagRlM3f3kAT08ltSm1O6wVJdPJxKSwvsn+NlJvHki6/pIK
 x6fSnLErw/h2g94sg1n7wZ7mmG1kfVmxPCf3tMq1CrgmcstDIWFSiuAXy0OhF7fHVE8p
 C9iZ/0clh3xjVSuEmnmwGLdB0RN0alTcB9cA6+KDsO+eNdE2fYfqQn2I1+uzAbqpHu6c
 TQUg==
X-Gm-Message-State: APjAAAXD2GD2o9aiI19Q1z5shhy2HkFpKZcpcBr6x7nyOTNh2lBQaOzE
 Caa0s6bBcvgfkCewzDR+y6Lhj5D5QTIQN4pJWkLADdeIHxw=
X-Google-Smtp-Source: APXvYqyUQLgh3+mWoYWXCHqFkph9pAxsuU+vmx/evCEtcizrglZMmdrjjWROZaDOVHnRej6HF46DXlMjbPokX/ky1k8=
X-Received: by 2002:a17:902:864b:: with SMTP id
 y11mr12404791plt.1.1553783631664; 
 Thu, 28 Mar 2019 07:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <1f94cb30fe624740b2ad67438b643266@quantatw.com>
In-Reply-To: <1f94cb30fe624740b2ad67438b643266@quantatw.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 28 Mar 2019 07:33:40 -0700
Message-ID: <CAO=notwyQLfY2tEMfydPD9Ku7+e3GJuPguAro0rr_xMJcAmm7g@mail.gmail.com>
Subject: Re: [phosphor-pid-control] scaling issue
To: =?UTF-8?B?SGFuayBMaW91ICjlionmmYnnv7Ap?= <Hank.Liou@quantatw.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 28 Mar 2019 14:33:57 -0000

On Thu, Mar 28, 2019 at 3:55 AM Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0) <Ha=
nk.Liou@quantatw.com> wrote:
>
> Hi All,
>
>
> This issue is related to the repository phosphor-pid-control.
>
>
> It is in commit dbuspassive: allow scaling that one added scaling mechani=
sm. However when it comes to pid.cpp, it may encounter scaling mismatch. Th=
at is to say, (in fan control stage) the pid takes the scaled values as inp=
uts, but it utilizes unscaled setpoints resulting wrong error terms. Or jus=
t change the setpoint value?

Can you share your configuration?  That might simplify the conversation.

>
>
> Thanks,
>
>
> Hank Liou
>
> Quanta Computer Inc.
