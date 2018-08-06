Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c0d::22f; helo=mail-qt0-x22f.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Ypd29bsb"; 
 dkim-atps=neutral
Received: from mail-qt0-x22f.google.com (mail-qt0-x22f.google.com
 [IPv6:2607:f8b0:400d:c0d::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41khpV0sxFzF3HK
 for <openbmc@lists.ozlabs.org>; Tue,  7 Aug 2018 01:46:34 +1000 (AEST)
Received: by mail-qt0-x22f.google.com with SMTP id c15-v6so14356111qtp.0
 for <openbmc@lists.ozlabs.org>; Mon, 06 Aug 2018 08:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E5jfnrRz2FfN/1znyicwnpLsVOrFbpeD1LTgo5I20T0=;
 b=Ypd29bsbQnwMitkqooWiUx2QqOZgiMBZZUivjmEr8djBnEGJL2nvrfLdjY3zmzX9Aq
 4AoSiyfBCqlDRuRjl9DvhXG3SbFBUGZoNrNYZb9ibZjCKKwoIcx0OOo+kwxPNwLsAY8t
 5/+dYdQ/2k3zowHwcTFoEFHUPbMlQdAnXXQr2Dq8p894SpKRO5f90KOB0FGk3B0AXrHZ
 LcfBbBWNu+DU+Y82gv7It/aYmvPZt8450kk3eQJrEyt+9T98digBFlt/2zgyvKZnQ3eT
 DlG8fODM5z0iTyFE9HgefJy0072Br4r0ZO9A2ZnH9vkfDBdOTSq8K+TtsXSudqnHukdi
 JTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E5jfnrRz2FfN/1znyicwnpLsVOrFbpeD1LTgo5I20T0=;
 b=e2Ye7TST2rNeOWWOPUsDQu0vhVVdtFO/0jVAVqWwBWve5KmNvJLHZVF2OHpcegY/ri
 gn2wwtUhVQhD8GfV2y8Wrm0pzLXc3rmWGMqNSedXuuK2MZNDMHRoOtfpgNzSEPN3kKts
 pbv1aNStylFdzFR+OELKP9Zx3q2Yn95ik7ugcpOUJeXteZ5ihDh1D5jRK3gB9VLKvErc
 w8F1EgZlXd+a5r7h77EGa72Qh2qbdRNk25mH6taTVTR3PRd6dKaUUru3pz9Qb9uzDWfN
 w2+tfy1P/jqYNgUNzcgJzpz+juVy77b39xRAuAUV67M8STB49jLdIfIRCexEtpg5IALQ
 H5PQ==
X-Gm-Message-State: AOUpUlGxrhVy4maYm08mKg9HfA8KwkFZ42hj8LxiTs22MxBC0rDu+UOn
 k/KxXqcbvORKANyiVOG0C7SXdiINGbUTFqIiSSJkhQ==
X-Google-Smtp-Source: AAOMgpeivbvQfS+gJ1z5M+anAtSNyzFVBs3Jm7xufPwRqKKbZpEUTgkfgmVgfyhm2DIhTY9jlWCMBxmf1OCMt3tIz/w=
X-Received: by 2002:ac8:2ef6:: with SMTP id
 i51-v6mr1900996qta.391.1533570392128; 
 Mon, 06 Aug 2018 08:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAE33tLFWffT5wd9La+zU-ATkbrqa4-aRH=C+t_OBnWgsSgwNdg@mail.gmail.com>
In-Reply-To: <CAE33tLFWffT5wd9La+zU-ATkbrqa4-aRH=C+t_OBnWgsSgwNdg@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Mon, 6 Aug 2018 08:46:21 -0700
Message-ID: <CAJoAoZ=VzAUp2Jg6nPy8UKBvqBw+s=xWwuMK4VG-p=t7QTwdkA@mail.gmail.com>
Subject: Re: Temperature Sensor and its Reading not Showing Up.
To: AKASH G J <akashgj91@gmail.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000007686840572c62ee5"
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
X-List-Received-Date: Mon, 06 Aug 2018 15:46:43 -0000

--0000000000007686840572c62ee5
Content-Type: text/plain; charset="UTF-8"

Hi Akash,

Have you configured your temp sensors to report over dbus already?

Emily

On Mon, Aug 6, 2018 at 4:58 AM AKASH G J <akashgj91@gmail.com> wrote:

> Hi Team,
>
> I tried to list sensors and its reading using the command "ipmitool -I
> dbus sdr elist full". But temperature sensor and its reading is not
> displayed. Please someone help to resolve this problem.
>
>
>
> Thanks and Regards,
>
> Akash
>

--0000000000007686840572c62ee5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Akash,<div><br></div><div>Have you configured your temp=
 sensors to report over dbus already?</div><div><br></div><div>Emily</div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Aug 6, 2018 at=
 4:58 AM AKASH G J &lt;<a href=3D"mailto:akashgj91@gmail.com">akashgj91@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"l=
tr"><div>Hi Team,</div><div><br></div><div>I tried to list sensors and its =
reading using the command &quot;ipmitool -I dbus sdr elist full&quot;. But =
temperature sensor and its reading is not displayed. Please someone help to=
 resolve this problem.</div><div><br></div><div><br></div><div><br></div><d=
iv>Thanks and Regards,</div><div><br></div><div>Akash<br></div></div>
</blockquote></div>

--0000000000007686840572c62ee5--
