Return-Path: <raltherr@google.com>
Received: from mail-vk0-x22d.google.com (mail-vk0-x22d.google.com
 [IPv6:2607:f8b0:400c:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xbsXj48jfzDqhB
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 10:55:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ZAACVchr"; 
 dkim-atps=neutral
Received: by mail-vk0-x22d.google.com with SMTP id r199so54892432vke.4
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 17:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=RDU9I+qwLopKMrmFJMvWRAUXzI3hMCRK9LBQsp7Y6Vc=;
 b=ZAACVchrPyV80ym3ZT1UY/1/tFDAk4DQHncyehfhb1EfI3SNrrqB4smWtUZVuX7Nlg
 U0MBVXJwQYgO121cGEKm7BEw/apcrXH3/Nb9178UjlpJEksIOwDHsAw4NzBbJqq9MPK6
 JYeJkFfS4+0mIkA6HbIgMx+Aa8To8nu62ERtMftYr0LBFg/S9xLndwleBWQFIjtB+g+D
 8a39OOOlQDOifMVqlDXSgHuKtxngm4F9kN77nUfCL2XK6YtY5gH5Vp7B8we2pZLLK/Ew
 VKiLwiBSk7jqFuSTWyCZChbNzDSL3AAhqfTCiC/U/jgOEqRzaEXRpbsFRGdURWnqCppY
 prIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=RDU9I+qwLopKMrmFJMvWRAUXzI3hMCRK9LBQsp7Y6Vc=;
 b=DRbq+qo3MwYQPzLZ/nyBJ2iWaC0Pp03/lxePyv7RB/lsmo2ErbnpBegwYn/6v3EYa0
 VdNuA6eqwtfiAeoJzXxHEJizSeHm4iLVYt+7FRrd7tNxCspvcZ5dpmu6ZIO7v7MJrC+f
 4B5SI4iySzxfN8mVHucVwH3YigXVFXv6XLIKVKLTt/p27rFV5566zhl17+4N3kvK5KzQ
 b4bll1j3zLdkgrquaHoNIzcW7996Ps+Q5y0ybToXWERz462oULuWqaBxMWA4Sho0Mf++
 ubHCDiw6BsJpvOIsn75G5eQpYasAH9ml+9Z9Rv8F1AusuOkEFOk6Y7+YcTTCjk5EUndC
 Wlvw==
X-Gm-Message-State: AHYfb5iwFJ1H/9dWfZT7Y7vJ8VGLnuN7Y2vqP6UiFHCl76ZGIwZyWBfs
 T7mycpJiFrF5xBP0ELB+DH9E9r3fUZHo
X-Received: by 10.31.242.69 with SMTP id q66mr4137798vkh.66.1503363298177;
 Mon, 21 Aug 2017 17:54:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.169.139 with HTTP; Mon, 21 Aug 2017 17:54:57 -0700 (PDT)
Received: by 10.31.169.139 with HTTP; Mon, 21 Aug 2017 17:54:57 -0700 (PDT)
In-Reply-To: <CALFfRJOvnOYdj72UfMhFQoF9CH8nZKTYQuxQNEYd7VoSENw_MQ@mail.gmail.com>
References: <CALFfRJOvnOYdj72UfMhFQoF9CH8nZKTYQuxQNEYd7VoSENw_MQ@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 21 Aug 2017 17:54:57 -0700
Message-ID: <CAPLgG=k80akAf-GyqffDagTpfB80x-ip5jQWZL+r4i7hVf6ofw@mail.gmail.com>
Subject: Re: BMC chip
To: sachin naik <sacnaik@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="94eb2c149df05ba40605574d0b75"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Aug 2017 00:55:02 -0000

--94eb2c149df05ba40605574d0b75
Content-Type: text/plain; charset="UTF-8"

Currently only Aspeed is supported although Nuvoton attended the Developers
Congress earlier this year. Are there any other BMC manufacturers you'd
like to see supported? In general Joel and I are willing to help any BMC
manufacturer get onboard.

Rick

On Aug 21, 2017 5:35 PM, "sachin naik" <sacnaik@gmail.com> wrote:

> Hi All
>
> Other than Aspeed what other BMC chip is supported by openBMC?
>
> Thanks and regards
> Sachin
>

--94eb2c149df05ba40605574d0b75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Currently only Aspeed is supported although Nuvoton atten=
ded the Developers Congress earlier this year. Are there any other BMC manu=
facturers you&#39;d like to see supported? In general Joel and I are willin=
g to help any BMC manufacturer get onboard.<div dir=3D"auto"><br></div><div=
 dir=3D"auto">Rick</div></div><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On Aug 21, 2017 5:35 PM, &quot;sachin naik&quot; &lt;<a href=
=3D"mailto:sacnaik@gmail.com">sacnaik@gmail.com</a>&gt; wrote:<br type=3D"a=
ttribution"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi All<div><br>=
</div><div>Other than Aspeed what other BMC chip is supported by openBMC?</=
div><div><br></div><div>Thanks and regards</div><div>Sachin</div></div>
</blockquote></div></div>

--94eb2c149df05ba40605574d0b75--
