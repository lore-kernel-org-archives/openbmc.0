Return-Path: <raltherr@google.com>
Received: from mail-it0-x22b.google.com (mail-it0-x22b.google.com
 [IPv6:2607:f8b0:4001:c0b::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vJl7J3H2rzDqHX
 for <openbmc@lists.ozlabs.org>; Thu,  9 Feb 2017 15:13:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="o1ELVVXb"; 
 dkim-atps=neutral
Received: by mail-it0-x22b.google.com with SMTP id c7so117104246itd.1
 for <openbmc@lists.ozlabs.org>; Wed, 08 Feb 2017 20:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=QclhN9zAu3Q5h/09TdmClQZVOKUjPVKb42ZlujtL5e0=;
 b=o1ELVVXbR79oy7ilzOd9wyN4Qw6KksVhdSNTZeYcj02hPMRDv/Or0CKSpowDw+H1Nt
 Z/JzzJDHka9gsakrs9kVB3TEauLPgPCEq9dAMr8DAPIMH+Sw2KveNgQ2Yt5Ilqasw3De
 r7HXosDMgY22cgmEyqOmZskbrXguyu2FlkXTo1z1ySuzM4iDEgRteBEnQenSZWvULE2k
 5fMI8GNriiGskRUQOjmG0MOlV58h17csgwNNYcFjGh0pGDO55369XcHDscG9262Kz8uw
 4zbHWIZ7hLx/DHRTMijHtQGTNXyCxerrkPbQIRmg9ZJtV3FopEnu7pWWjruseQlvHUq9
 rz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=QclhN9zAu3Q5h/09TdmClQZVOKUjPVKb42ZlujtL5e0=;
 b=rFsA4nS8TQFZppRjDdFhDS/WgkIyx8NUIBse2XF5GDdQrSowP/MmPOwrO0voQbqL24
 hvDVo+cMQ/E5PsizpCAoei9MVKt5jHbiTqAQ4pfEsq508cpLHebbkLxiJdgD7jTYav9A
 8oCMoqA1MkGGy+qT091GkykP5PtlGYBF08T/cv4enhVNhE6jsus6+c8ToArPeRStHQ1q
 QE3lgbHgNtk3NbyLjO2DF/nNl85TI8BjhagYoFpQxZ1oB2hx68m1uNgc1/iBOMKPUJBG
 DfAlJcSrTlAk/5p3Q88GKsNyrEMtL6XYfQlSJgbh+OKc24aTlzNnu7ZdCOLtMlneJhj+
 iVEw==
X-Gm-Message-State: AIkVDXIllP5wY1mWYy2T8rs4GPjXMxyKyZt3Jpj3TnvglvN+nHgPP1jP53XYZ9W9Y2Bemb7m/r7GUMiuEedR3MoQ
X-Received: by 10.36.224.140 with SMTP id c134mr19693388ith.105.1486613605096; 
 Wed, 08 Feb 2017 20:13:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Wed, 8 Feb 2017 20:13:24 -0800 (PST)
Received: by 10.64.133.226 with HTTP; Wed, 8 Feb 2017 20:13:24 -0800 (PST)
In-Reply-To: <CACPK8XfmY3sGcvqQnjmdOOL59RNxQ_M0YGPAROdW5GMujA+BVw@mail.gmail.com>
References: <CAPH-5w7reqNuPcbf48F+beqFyK=Te5c9rd+0hwvqt4nD0MQXqA@mail.gmail.com>
 <CACPK8XfmY3sGcvqQnjmdOOL59RNxQ_M0YGPAROdW5GMujA+BVw@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 8 Feb 2017 20:13:24 -0800
Message-ID: <CAPLgG==GnEFG23QYWy81TexkKwcUaERd2gPqRBPnSY82h0fmmQ@mail.gmail.com>
Subject: Re: Patchwork lists submitters @google.com as "Rick Altherr via
 openbmc"
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c19e204d9e03b0548113361
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
X-List-Received-Date: Thu, 09 Feb 2017 04:13:33 -0000

--94eb2c19e204d9e03b0548113361
Content-Type: text/plain; charset=UTF-8

Testing... Testing... Is this thing on?

On Feb 8, 2017 7:05 PM, "Joel Stanley" <joel@jms.id.au> wrote:

> On Wed, Feb 8, 2017 at 8:46 AM, Xo Wang via openbmc
> <openbmc@lists.ozlabs.org> wrote:
> > Hey folks,
> >
> > I think Patchwork has decided that the email openbmc@lists.ozlabs.org
> > now maps to the author of the first patch originating from that email
> > (Rick Altherr @ Google).
> >
> > So all of the patches from @google.com proxied by Mailman are now
> > showing up as authored by Rick:
> > https://patchwork.ozlabs.org/project/openbmc/list/?
> submitter=70875&archive=both&state=*
> >
> > Since Joel is presumably picking from Patchwork to GitHub, the git
> > author info might be a bit unreliable. You'll have to peek at the
> > Signed-off-by: for the Google blames. :)
>
> Submitter 70875 is now known as "Unknown sender due to SPF". This
> looks ugly, but does save me from applying misattributed patches.
>
> I have made some tweaks to the mailing list settings that might let
> DMARC'd mail get through. I have turned off the munging and will keep
> an eye out for missed mail. If it's still broken I will have to turn
> it back on.
>
> Xo (or any other @google.com account holder), if you could reply to
> this thread without ccing me that would be a good test.
>
> Cheers,
>
> Joel
>

--94eb2c19e204d9e03b0548113361
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Testing... Testing... Is this thing on?</div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Feb 8, 2017 7:05 PM, &qu=
ot;Joel Stanley&quot; &lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au<=
/a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On We=
d, Feb 8, 2017 at 8:46 AM, Xo Wang via openbmc<br>
&lt;<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a=
>&gt; wrote:<br>
&gt; Hey folks,<br>
&gt;<br>
&gt; I think Patchwork has decided that the email <a href=3D"mailto:openbmc=
@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br>
&gt; now maps to the author of the first patch originating from that email<=
br>
&gt; (Rick Altherr @ Google).<br>
&gt;<br>
&gt; So all of the patches from @<a href=3D"http://google.com" rel=3D"noref=
errer" target=3D"_blank">google.com</a> proxied by Mailman are now<br>
&gt; showing up as authored by Rick:<br>
&gt; <a href=3D"https://patchwork.ozlabs.org/project/openbmc/list/?submitte=
r=3D70875&amp;archive=3Dboth&amp;state=3D*" rel=3D"noreferrer" target=3D"_b=
lank">https://patchwork.ozlabs.org/<wbr>project/openbmc/list/?<wbr>submitte=
r=3D70875&amp;archive=3Dboth&amp;<wbr>state=3D*</a><br>
&gt;<br>
&gt; Since Joel is presumably picking from Patchwork to GitHub, the git<br>
&gt; author info might be a bit unreliable. You&#39;ll have to peek at the<=
br>
&gt; Signed-off-by: for the Google blames. :)<br>
<br>
Submitter 70875 is now known as &quot;Unknown sender due to SPF&quot;. This=
<br>
looks ugly, but does save me from applying misattributed patches.<br>
<br>
I have made some tweaks to the mailing list settings that might let<br>
DMARC&#39;d mail get through. I have turned off the munging and will keep<b=
r>
an eye out for missed mail. If it&#39;s still broken I will have to turn<br=
>
it back on.<br>
<br>
Xo (or any other @<a href=3D"http://google.com" rel=3D"noreferrer" target=
=3D"_blank">google.com</a> account holder), if you could reply to<br>
this thread without ccing me that would be a good test.<br>
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></div></div>

--94eb2c19e204d9e03b0548113361--
