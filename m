Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c06::22d; helo=mail-io0-x22d.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Rmyyf67k"; 
 dkim-atps=neutral
Received: from mail-io0-x22d.google.com (mail-io0-x22d.google.com
 [IPv6:2607:f8b0:4001:c06::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41zm4g6V2VzDrJ7
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 07:59:14 +1000 (AEST)
Received: by mail-io0-x22d.google.com with SMTP id 75-v6so402957iou.11
 for <openbmc@lists.ozlabs.org>; Mon, 27 Aug 2018 14:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IOcGvNiuFMEabvFDZOJgQkBZZUHSSJlXipDxJswO0Sk=;
 b=Rmyyf67k3dQoiehHYIfsYpMiL3w4QM2U+PxrYR8bD07jMhNveCdsYnqUdIHu7e3u0Y
 jnp0Hdsig50nT2/RGJNG4KBNJGEQD2o5URUrlhG+1PnK+mLYq4bWrJYaSBy623zftxc3
 eD3fh5j5P8tuwP0ExPFR25qbKkW31VpDS7HudTEubX3tJghKtX7xL7P0FazdoLgaepS9
 qw+OYlGWlcHOAaV+eSIYkTKRLZ2t5ydNpIMNLDLq5DhnkfH633zHBThEjv9u81kxUmZH
 gQ0oI4JiTOV8Y7/WM7z4L1au5YpOSz8i25tJlB71Wnnxl8Y6teHdO8/YJ/gJHGKPErn+
 AzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IOcGvNiuFMEabvFDZOJgQkBZZUHSSJlXipDxJswO0Sk=;
 b=J/zpf5ZRaFGLIkDNwTWfk5EAQKEgt0dvjfGjEpIYVBaV5iNApyz4BJ4JEUbcuC9oUF
 2cwipFGCPtVH3Q4HV2CUotMyWfn5Gn6xY4G9q6nEh4UpaiXpOS5/gFdkkafQZh6OAwEO
 fG3QyynVpzdDmhtcX9y29BjvOivsiMep8D8WyROjK/MK8CydW+5Cxg0odlTQee5ji8gZ
 FSIekjXfnVRuG4IVz0Xl39NNqj2C5NndPFUhLvvFz2OfWDNTNLOO9xbwUdJw+zoOSqXp
 lfVOQuJKPH8uozzatHc5tAjK0m57Whe04FDXhZR2J9HXz2cSE+8fU+VBk7xfaDoUt7RX
 JHCQ==
X-Gm-Message-State: APzg51AbIX5Q2OBoCQWipYEzUOgAFKShLWoZwNj3rIXTO/cvvNIQB45e
 ylWPC0brPVm8Wwzs9z1HyxlxgAGb15aEW+DBs8dcuQ==
X-Google-Smtp-Source: ANB0VdY3U+Rmy3Av/FUcy3QopoGjZQ0dinrLjc9dEySmZTt7NmSCvVWjz/69bma4CPyTlRpukkUOZFCjgqnZ0nf+s1M=
X-Received: by 2002:a6b:c8ce:: with SMTP id
 y197-v6mr11869861iof.295.1535407149472; 
 Mon, 27 Aug 2018 14:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAPnigKkG1C-80T-7c18oSAC_s5CpEN2XbaCOY2u9g1jqVv_fmg@mail.gmail.com>
 <CAO=notwK9fhqSTjHpMZYMmUrJZFKfNKW9m83KiT9Vun-rY3R3g@mail.gmail.com>
In-Reply-To: <CAO=notwK9fhqSTjHpMZYMmUrJZFKfNKW9m83KiT9Vun-rY3R3g@mail.gmail.com>
From: Kun Yi <kunyi@google.com>
Date: Mon, 27 Aug 2018 14:58:43 -0700
Message-ID: <CAGMNF6UdPH89t=eyqG=O0bOh63DtXbfkxLqRWSOhXeXuikLv3g@mail.gmail.com>
Subject: Re: Announcing gpioplus
To: Patrick Venture <venture@google.com>
Cc: William Kennington <wak@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000bb5fd9057471d5ce"
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
X-List-Received-Date: Mon, 27 Aug 2018 21:59:17 -0000

--000000000000bb5fd9057471d5ce
Content-Type: text/plain; charset="UTF-8"

Great effort! I think it would be more effective to remind people to
convert to these new libraries during code reviews. The recently under
review x86 control daemon would be such an example:
*https://gerrit.openbmc-project.xyz/c/openbmc/x86-power-control/+/11746/
<https://gerrit.openbmc-project.xyz/c/openbmc/x86-power-control/+/11746/>*

On Wed, Aug 22, 2018 at 7:02 AM Patrick Venture <venture@google.com> wrote:

> On Tue, Aug 21, 2018 at 8:21 PM William Kennington <wak@google.com> wrote:
> >
> > Yet another c++ wrapper in a series of changes I've been working on to
> > make ergonomic c++ abstractions for commonly used library functions.
> > This project intends to provide a simple c++ interface around the
> > existing linux userspace gpiolib syscalls. The functionality is
> > complete and the tests cover the entire interface.
> >
> > As usual, please let me know what you think of the project. It currently
> > resides at https://github.com/wak-google/gpioplus. This should find
> > a new home at https://github.com/openbmc/gpioplus if it receives
> > good feedback.
>
> +1 to this.
>
> >
> > Thanks,
> > William
>


-- 
Regards,
Kun

--000000000000bb5fd9057471d5ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Great effort! I think it would be more effective to remind=
 people to convert to these new libraries during code reviews. The recently=
 under review x86 control daemon would be such an example: <font color=3D"#=
1155cc"><u><a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/x86-powe=
r-control/+/11746/">https://gerrit.openbmc-project.xyz/c/openbmc/x86-power-=
control/+/11746/</a></u></font></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr">On Wed, Aug 22, 2018 at 7:02 AM Patrick Venture &lt;<a href=3D"ma=
ilto:venture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Tue, Aug 21, 2018 at 8:21 PM W=
illiam Kennington &lt;<a href=3D"mailto:wak@google.com" target=3D"_blank">w=
ak@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Yet another c++ wrapper in a series of changes I&#39;ve been working o=
n to<br>
&gt; make ergonomic c++ abstractions for commonly used library functions.<b=
r>
&gt; This project intends to provide a simple c++ interface around the<br>
&gt; existing linux userspace gpiolib syscalls. The functionality is<br>
&gt; complete and the tests cover the entire interface.<br>
&gt;<br>
&gt; As usual, please let me know what you think of the project. It current=
ly<br>
&gt; resides at <a href=3D"https://github.com/wak-google/gpioplus" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/wak-google/gpioplus</a>. Th=
is should find<br>
&gt; a new home at <a href=3D"https://github.com/openbmc/gpioplus" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/openbmc/gpioplus</a> if it =
receives<br>
&gt; good feedback.<br>
<br>
+1 to this.<br>
<br>
&gt;<br>
&gt; Thanks,<br>
&gt; William<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"m_7027219626207293915gmail_signature" data-smartmail=3D"gmail_sig=
nature"><div dir=3D"ltr">Regards,<div>Kun</div></div></div>

--000000000000bb5fd9057471d5ce--
