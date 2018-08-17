Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::22a; helo=mail-it0-x22a.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="LdIowtT4"; 
 dkim-atps=neutral
Received: from mail-it0-x22a.google.com (mail-it0-x22a.google.com
 [IPv6:2607:f8b0:4001:c0b::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41sT9y4CJmzDr5p
 for <openbmc@lists.ozlabs.org>; Sat, 18 Aug 2018 02:27:01 +1000 (AEST)
Received: by mail-it0-x22a.google.com with SMTP id s7-v6so12018115itb.4
 for <openbmc@lists.ozlabs.org>; Fri, 17 Aug 2018 09:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jznEH3z3jDVmHK2gmYHd5oXX4wEAHT8W+bAwt6A4RzQ=;
 b=LdIowtT4By7LwWcMHSOpQz5hpmWL23thlBYRQoYpMvoKRsQO0D92GJeEhOF0OPvRMn
 nGa0cRtjj2aN3xEHDHiJCzV/20uwx/7vClvzHjWKq0NvrPxg18H48hNap4oSt1r9K3GB
 3/Rb9uOQ4OjrC5XnXRK6peH0WgK4VtpQ6/vUh678+sAShGPfIQhSZDYSgS1DnABPLwzw
 CHZqeKd3zcJLKuWL6ctxOTgOCnQfXajs3clQStZPveQWN2g/vHv+Q/57GALsLnuC0rkq
 C6oXN8agsNho1+Tk2Vy9HyX2nbWRRBTMPaSkoWDoPuRgYJUOAHUJg3C9FVgogumfZkfC
 hApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jznEH3z3jDVmHK2gmYHd5oXX4wEAHT8W+bAwt6A4RzQ=;
 b=lTZf2vrIBZoRs4yGEqivgje02+xyGlATTwNr/BuqN+4IzWYbkrd4OATlSn5BfH03Pa
 yQyQtGU1/vKrx9UO/HhACcQgYItq/PCMuxPp1O6jBo1TEWOcN1+K+Aqs/MJHEPeq7EvX
 HMt/lmwnI9DrHFpLEUuqnTPwvuSoi84CQNljLzuMazkkkfs761Cfz2Gk3DU2u1UO+xgB
 ktkhBm4ReQt02bDETzsPzKyVFSnVUEMku+YjCY0GRvfeLtnKjNFILfY/d68yEHVgmnhN
 d/0UcqLHW688eOr1zK35GS0ZAfV/mETWJWXA3Dy+zrcj9DnpN/IXNkXiC4m/JPYHRtjN
 HTYg==
X-Gm-Message-State: AOUpUlF86h3xlSPW3K+BdFIiZDu1BnU9X4VDs6dWeRLegGOLY6tp/7pA
 zEHQky7ZM+aH0VLuCc9jHcfsaZPUVjZeWdJX7Ck3sg==
X-Google-Smtp-Source: AA+uWPx4MGOUx46Pmzabb3yRfw1JtPKUJAL+kB0IqvgYCLwRtQhnt5vRDTNycwoK6PjaXucULip+afQBv6+mEn508TE=
X-Received: by 2002:a24:2f0e:: with SMTP id
 j14-v6mr4724524itj.120.1534523218937; 
 Fri, 17 Aug 2018 09:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAPnigK=89ih9zLRcMCyGq9c+TgD40ZAyFmyG15YCp24_cV9Ndw@mail.gmail.com>
In-Reply-To: <CAPnigK=89ih9zLRcMCyGq9c+TgD40ZAyFmyG15YCp24_cV9Ndw@mail.gmail.com>
From: Kun Yi <kunyi@google.com>
Date: Fri, 17 Aug 2018 09:26:32 -0700
Message-ID: <CAGMNF6XT=GxduV5kQ0Vt_fgWqLEqHiidU_07RYJUF6xqPTx06g@mail.gmail.com>
Subject: Re: Announcing sdeventplus
To: William Kennington <wak@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000005de65b0573a40732"
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
X-List-Received-Date: Fri, 17 Aug 2018 16:27:03 -0000

--0000000000005de65b0573a40732
Content-Type: text/plain; charset="UTF-8"

Great stuff! Thanks William for the effort!

There are many adhoc usages of sd_event scattered around and having a
common library would definitely help with code reusability.
A simple search for "org:openbmc sd_event" returns 89 results in our
codebase.

On Tue, Aug 14, 2018 at 11:00 AM William Kennington <wak@google.com> wrote:

> I'd like to make available a wrapper around the sd_event libsystemd
> infrastructure to all of the openbmc based projects. This project is
> intended to closely resemble the sdbusplus project and provide only
> minimal wrapping of the systemd constructs, mostly related to handle
> ownership and error handling. Currently this is lacking a proper
> tutorial but it should be fairly straightforward to map any c-based
> sd_event tutorial to sdeventplus. There are 2 example programs which
> use some of the functionality. Otherwise this should be a complete
> wrapper around sd_svent as of systemd v233. There are some newer
> functions added in v237+ which can be optionally added at a later
> time.
>
> Please let me know what you think of the project which currently
> resides at https://github.com/wak-google/sdeventplus. This should find
> a new home at https://github.com/openbmc/sdeventplus if it receives
> good feedback.
>
> Thanks,
> William
>


-- 
Regards,
Kun

--0000000000005de65b0573a40732
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Great stuff! Thanks William for the effort!<div><br></div>=
<div>There are many adhoc usages of sd_event scattered around and having a =
common library would definitely help with code reusability.</div><div>A sim=
ple search for &quot;org:openbmc sd_event&quot; returns 89 results in our c=
odebase.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue,=
 Aug 14, 2018 at 11:00 AM William Kennington &lt;<a href=3D"mailto:wak@goog=
le.com">wak@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">I&#39;d like to make available a wrapper around the sd_event libsystemd<=
br>
infrastructure to all of the openbmc based projects. This project is<br>
intended to closely resemble the sdbusplus project and provide only<br>
minimal wrapping of the systemd constructs, mostly related to handle<br>
ownership and error handling. Currently this is lacking a proper<br>
tutorial but it should be fairly straightforward to map any c-based<br>
sd_event tutorial to sdeventplus. There are 2 example programs which<br>
use some of the functionality. Otherwise this should be a complete<br>
wrapper around sd_svent as of systemd v233. There are some newer<br>
functions added in v237+ which can be optionally added at a later<br>
time.<br>
<br>
Please let me know what you think of the project which currently<br>
resides at <a href=3D"https://github.com/wak-google/sdeventplus" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/wak-google/sdeventplus</a>. T=
his should find<br>
a new home at <a href=3D"https://github.com/openbmc/sdeventplus" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/openbmc/sdeventplus</a> if it=
 receives<br>
good feedback.<br>
<br>
Thanks,<br>
William<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr">Regards,<div>Kun</div></div></div>

--0000000000005de65b0573a40732--
