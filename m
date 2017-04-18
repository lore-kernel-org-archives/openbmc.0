Return-Path: <raltherr@google.com>
Received: from mail-wm0-x229.google.com (mail-wm0-x229.google.com
 [IPv6:2a00:1450:400c:c09::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6xFH2QcLzDq5b
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 06:14:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="VrLkQJnL"; 
 dkim-atps=neutral
Received: by mail-wm0-x229.google.com with SMTP id w64so65209214wma.0
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 13:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=iaZyyz572YnMAaKsnfON/0Fd2aPPPsqbP2vmeKaTlJo=;
 b=VrLkQJnLKdnTxCIFdnlcqS00OWYYaldIspPfvB8092uZwREBz9abcOdpZrIhmF3kai
 hm1kbjwJGzzQRZqT1EdjGxUlzT62j38Hw1UXYGFUGzs8WNZqqBEWmLAz5TiEFHYPG/v/
 Mh4iNspEG3lBnSxwLtRY36XgDqONIXa45RDIdzRqJ6ubL3/ftGV3HEmdhv5SuH2gt3fj
 PVSefLSP/1xT/7nto4nwVp0GlrPzzVzNvjXCNDP6yKctnM8qQ6EsR8u1/rFfjlZuXRu9
 DhXOpJgTPH+CNqoO6iIMWdsc6tLI1CmOtz2wneQgULh3LOnzUyt3vlYb2aK2a+bZj6JD
 36zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=iaZyyz572YnMAaKsnfON/0Fd2aPPPsqbP2vmeKaTlJo=;
 b=UnvG8YdSbfsK2b8rUMojD6q35mzrP6J7CvxXutnGnssIUqfVybL+4V1thwBov9yjbc
 0F1cVdanNkSc/kaB0wr79FXxGk8X66Y3XOjFDop13XB0+Vav6z8qk1wve3yZArYJ/Gv8
 leSh/Znjy1xZSFe+gbO9dmBJaoNXe7KK1JfnBlk0qbOzhIygwGtrVVqDbbexwbknFUj9
 oCg4yrkSkYexsl0A4KEPLry492zc/yeK2FCbSA67Dok+0jFrf2dkamouBfS/kKBvbBxh
 ny8N+xvijh1suQ5b3ow8gP72VoTbUJhjawEjuOB8riKM9SKZZoax6TDzrEDqaLxSOwvV
 Wzkw==
X-Gm-Message-State: AN3rC/6+UariPSvA2I4jhsi5NlCYcModDs97qb2OfjG/ZKrazawhDa4a
 xAOK/mCvsizZDHBKb8lSHlvzlECzGtiP
X-Received: by 10.28.87.70 with SMTP id l67mr13922942wmb.37.1492546495278;
 Tue, 18 Apr 2017 13:14:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.184.195 with HTTP; Tue, 18 Apr 2017 13:14:54 -0700 (PDT)
In-Reply-To: <CAFR_W8q2LeLYZQZd17sFYo=KztC_JOrnLbnD0H2-1VaoQkjYUA@mail.gmail.com>
References: <CAFR_W8rbMN1uSC8o+cF94D40KwSdJT1oOGYLMS90PWHHuAVsaQ@mail.gmail.com>
 <CANF=oU6TBUTjq6gyDUZ=TWWQ-h-M3Hzdii4iBbUPVvMx5qRpAA@mail.gmail.com>
 <CAFR_W8rHQNgzV9Lu5scZYF2-zV5y0kjCJDQ5BY0RYirEhi=pwQ@mail.gmail.com>
 <CAFR_W8q2LeLYZQZd17sFYo=KztC_JOrnLbnD0H2-1VaoQkjYUA@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 18 Apr 2017 13:14:54 -0700
Message-ID: <CAPLgG=mZ=S9zYbghEp63iOFbGqDYeqGUHQ6Sm5-uoTTXnvtWAw@mail.gmail.com>
Subject: Re: Running OpenBMC in qemu
To: Maxim Sloyko <maxims@google.com>
Cc: Robi Buranyi <rburanyi@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a1144323eaa230d054d768fe0
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
X-List-Received-Date: Tue, 18 Apr 2017 20:15:00 -0000

--001a1144323eaa230d054d768fe0
Content-Type: text/plain; charset=UTF-8

FWIW, without -nographic, the default is to start a VNC server for the
graphics output.

On Tue, Apr 18, 2017 at 12:46 PM, Maxim Sloyko <maxims@google.com> wrote:

> On Tue, Apr 18, 2017 at 10:01 AM, Maxim Sloyko <maxims@google.com> wrote:
> > On Mon, Apr 17, 2017 at 5:56 PM, Robi Buranyi <rburanyi@google.com>
> wrote:
> >> why does it have to be qemuarm exactly? You can equally run
> qemux86(-64),
> >> and shall see no difference in test results.
> >
> > Well, I guess it does not *have* to be qemuarm, but last time I tried
> > it, it worked, that's why I was running qemuarm. I was also under the
> > impression that we are trying to support it.
> >
> > If it's broken beyond repair though, it's fine by me.
> >
> >>
> >> so what has been working for me all the time [and still works with a
> >> relatively recent gbmc checkout]
> >> - build for machine qeumux86-64
> >> - and run a console-only mode: runqemu qemux86-64 ext4
> >> qemuparams="-nographic"
>
> OK, so it turns out the problem was not arm vs x86, the problem was
> the lack of -nographic parameter.
> qemuarm image booted OK with -nographic parameter.
>
> >>
> >>
> >>
> >> On Mon, Apr 17, 2017 at 5:25 PM, Maxim Sloyko <maxims@google.com>
> wrote:
> >>>
> >>> Hi all!
> >>>
> >>> I've ran into troubles when I was trying to run OpenBMC image in qemu.
> >>> It has been a while since I've done this, so I'm wondering if I'm
> >>> missing something.
> >>>
> >>> I build it with:
> >>>
> >>> export TEMPLATECONF=meta-phosphor/conf
> >>> source openbmc-env
> >>> MACHINE=qemuarm bitbase obmc-phosphor-image
> >>>
> >>> With v1.0-stable openbmc/openbmc branch I get this output:
> >>> http://pastebin.ca/3798183
> >>>
> >>> With the most recent version (master), I get very similar output,
> >>> except that the error is now:
> >>>
> >>> VNC server running on ::1:5900
> >>> vpb_sic_write: Bad register offset 0x2c
> >>>
> >>>
> >>> In both cases the terminal I run this from basically just hangs.
> >>>
> >>> Am I missing something here?
> >>>
> >>> Thanks!
> >>>
> >>> --
> >>> Maxim Sloyko
> >>
> >>
> >
> >
> >
> > --
> > Maxim Sloyko
>
>
>
> --
> Maxim Sloyko
>

--001a1144323eaa230d054d768fe0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW, without -nographic, the default is to start a VNC se=
rver for the graphics output.</div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On Tue, Apr 18, 2017 at 12:46 PM, Maxim Sloyko <span dir=
=3D"ltr">&lt;<a href=3D"mailto:maxims@google.com" target=3D"_blank">maxims@=
google.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">On Tue, Apr 18, 2017 at 10:01 AM, Maxim Sloyko &lt;<a href=3D"mail=
to:maxims@google.com">maxims@google.com</a>&gt; wrote:<br>
&gt; On Mon, Apr 17, 2017 at 5:56 PM, Robi Buranyi &lt;<a href=3D"mailto:rb=
uranyi@google.com">rburanyi@google.com</a>&gt; wrote:<br>
&gt;&gt; why does it have to be qemuarm exactly? You can equally run qemux8=
6(-64),<br>
&gt;&gt; and shall see no difference in test results.<br>
&gt;<br>
&gt; Well, I guess it does not *have* to be qemuarm, but last time I tried<=
br>
&gt; it, it worked, that&#39;s why I was running qemuarm. I was also under =
the<br>
&gt; impression that we are trying to support it.<br>
&gt;<br>
&gt; If it&#39;s broken beyond repair though, it&#39;s fine by me.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; so what has been working for me all the time [and still works with=
 a<br>
&gt;&gt; relatively recent gbmc checkout]<br>
&gt;&gt; - build for machine qeumux86-64<br>
&gt;&gt; - and run a console-only mode: runqemu qemux86-64 ext4<br>
&gt;&gt; qemuparams=3D&quot;-nographic&quot;<br>
<br>
</span>OK, so it turns out the problem was not arm vs x86, the problem was<=
br>
the lack of -nographic parameter.<br>
qemuarm image booted OK with -nographic parameter.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Apr 17, 2017 at 5:25 PM, Maxim Sloyko &lt;<a href=3D"mailt=
o:maxims@google.com">maxims@google.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hi all!<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;ve ran into troubles when I was trying to run OpenBMC im=
age in qemu.<br>
&gt;&gt;&gt; It has been a while since I&#39;ve done this, so I&#39;m wonde=
ring if I&#39;m<br>
&gt;&gt;&gt; missing something.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I build it with:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; export TEMPLATECONF=3Dmeta-phosphor/<wbr>conf<br>
&gt;&gt;&gt; source openbmc-env<br>
&gt;&gt;&gt; MACHINE=3Dqemuarm bitbase obmc-phosphor-image<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; With v1.0-stable openbmc/openbmc branch I get this output:<br>
&gt;&gt;&gt; <a href=3D"http://pastebin.ca/3798183" rel=3D"noreferrer" targ=
et=3D"_blank">http://pastebin.ca/3798183</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; With the most recent version (master), I get very similar outp=
ut,<br>
&gt;&gt;&gt; except that the error is now:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; VNC server running on ::1:5900<br>
&gt;&gt;&gt; vpb_sic_write: Bad register offset 0x2c<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; In both cases the terminal I run this from basically just hang=
s.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Am I missing something here?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks!<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; Maxim Sloyko<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Maxim Sloyko<br>
<br>
<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
Maxim Sloyko<br>
</font></span></blockquote></div><br></div>

--001a1144323eaa230d054d768fe0--
