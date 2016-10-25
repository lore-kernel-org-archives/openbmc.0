Return-Path: <yuenn@google.com>
Received: from mail-wm0-x235.google.com (mail-wm0-x235.google.com
 [IPv6:2a00:1450:400c:c09::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t3Njn2rRkzDvHq
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 06:38:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=J01+CvTZ; 
 dkim-atps=neutral
Received: by mail-wm0-x235.google.com with SMTP id c78so28373728wme.0
 for <openbmc@lists.ozlabs.org>; Tue, 25 Oct 2016 12:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to;
 bh=bNd6dZGLHyoxgLXCoRTmMG9v5Yo4CiHvYvTMx7qHmB4=;
 b=J01+CvTZy1aYtybAYW4ksDT/dQxKXSMJbdmrOrFgENEY4GkGGvIfzulxjOPNH2ctT9
 OwL1FnjFsdL8HRk+K/56Ko1/8x9NWNYTHsT/Zr15F5aaNH2XN5CJ6oQNrVyZ7dgb82p9
 folfX81aF1jqNUBhSggVv8AzRj/BLalnaelYLf/exALNMZ9szSPbhSiuPtVhlxufI4CR
 fsuLxFxRTH0cuSTbsAaRHE6yRQEp0FtGftoFEpmsz7odCmJfp+Otzv1jPOV8uMvYysUl
 w4zGi69VxBWXvlg9xOSBxtdqbTlw/3aDARiFVSM8rS0C3S6qB0kvDTn541C+FW8sSaSc
 y7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bNd6dZGLHyoxgLXCoRTmMG9v5Yo4CiHvYvTMx7qHmB4=;
 b=Shh5x5k2IDG12LJ/m3AyFPMxH1PsKonXhhF72pRBvHUkoLGJb30586god7rOwft9AO
 lrWsyU702SbGq2B+Hdye4SDopFB4r81cPureXHW527+FUwTx+S+DpWDCvppeRY/0uIkp
 Hc7y3v3npGRuWKKj7A8enqVRz04RnHl2CJ2c/s4IP/ue/5ioq1BQFTXVv/ZZlXeyoJIH
 JraURMY7oj8M22A6KIZUxr5+Tfz8j99Ez7f+iKPWSj3UYibZcLBJlU674DhwikufDvZn
 Kz6ycWtB7lUpy5rgGwG6x7rNkr6GSrbDRCSSg5K/+k7sJoXo4yDqgNxOatzNZXAR7Hqb
 8LKA==
X-Gm-Message-State: ABUngvdEoaTy/+CHOFDACQzrrZ7B/27IafBQHT3vKupmNqM/0is+b2ZLm/r6k3OWzk5+TCCyLbi4hiZnSltkqtxh
X-Received: by 10.28.30.3 with SMTP id e3mr5020268wme.40.1477424295318; Tue,
 25 Oct 2016 12:38:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.54.149 with HTTP; Tue, 25 Oct 2016 12:37:34 -0700 (PDT)
From: Nancy Yuen <yuenn@google.com>
Date: Tue, 25 Oct 2016 12:37:34 -0700
Message-ID: <CADfYTpGhjpJrghBk9GUw_Epi=buw_TWfhAkTr=OzmZrFvfQcSg@mail.gmail.com>
Subject: Re: Merging rights
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary=001a114b35084e6e6e053fb5a6c5
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
X-List-Received-Date: Tue, 25 Oct 2016 19:38:22 -0000

--001a114b35084e6e6e053fb5a6c5
Content-Type: text/plain; charset=UTF-8

I'd like to be added as well.  I can help with changes coming via Google.


> Date: Thu, 20 Oct 2016 12:13:49 +1030
> From: Joel Stanley <joel@jms.id.au>
> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Patrick Williams
>         <patrick@stwcx.xyz>
> Subject: Merging rights
> Message-ID:
>         <CACPK8Xe12uXO+YfxS_fvwd=4RqBsS_M1ahj9KD=sv9ERMgVOrA@mail.
> gmail.com>
> Content-Type: text/plain; charset=UTF-8
>
> Hello Patrick,
>
> I've had this patch under review for a few days. It's been sitting at
> +3 for about 5 days now, but I can't commit it as I don't have
> permission.
>
>  https://gerrit.openbmc-project.xyz/#/c/762/
>
> In light of this I think we need more users with permission to commit
> when code review has been completed.
>
> Can I please be added to that list?
>
> Cheers,
>
> Joel
>
>

--001a114b35084e6e6e053fb5a6c5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div=
>I&#39;d like to be added as well.=C2=A0 I can help with changes coming via=
 Google.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Date: Thu, 20 Oct 2016 12:13:49 +1030<br>
From: Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au" target=3D"_blank">=
joel@jms.id.au</a>&gt;<br>
To: OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=
=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;, Patrick Williams<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:patrick@stwcx.xyz" target=
=3D"_blank">patrick@stwcx.xyz</a>&gt;<br>
Subject: Merging rights<br>
Message-ID:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;CACPK8Xe12uXO+YfxS_fvwd=3D4RqBs<wbr>S_M1ahj=
9KD=3D<a href=3D"mailto:sv9ERMgVOrA@mail.gmail.com" target=3D"_blank">sv9ER=
MgVOrA@mail.<wbr>gmail.com</a>&gt;<br>
Content-Type: text/plain; charset=3DUTF-8<br>
<br>
Hello Patrick,<br>
<br>
I&#39;ve had this patch under review for a few days. It&#39;s been sitting =
at<br>
+3 for about 5 days now, but I can&#39;t commit it as I don&#39;t have<br>
permission.<br>
<br>
=C2=A0<a href=3D"https://gerrit.openbmc-project.xyz/#/c/762/" rel=3D"norefe=
rrer" target=3D"_blank">https://gerrit.openbmc-projec<wbr>t.xyz/#/c/762/</a=
><br>
<br>
In light of this I think we need more users with permission to commit<br>
when code review has been completed.<br>
<br>
Can I please be added to that list?<br>
<br>
Cheers,<br>
<br>
Joel<br>
<br></blockquote></div></div></div>

--001a114b35084e6e6e053fb5a6c5--
