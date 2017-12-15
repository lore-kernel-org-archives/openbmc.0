Return-Path: <ojayanth@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400c:c08::235; helo=mail-ua0-x235.google.com;
 envelope-from=ojayanth@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KNo03ZYP"; 
 dkim-atps=neutral
Received: from mail-ua0-x235.google.com (mail-ua0-x235.google.com
 [IPv6:2607:f8b0:400c:c08::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yylGj2DmqzDrd2
 for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2017 20:18:36 +1100 (AEDT)
Received: by mail-ua0-x235.google.com with SMTP id v20so5774655uaj.0
 for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2017 01:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=cVOfY7ra5i9mkZB26/AnyOVNjSKf/2ZBmaQ7Stqxes0=;
 b=KNo03ZYPiSxdat1PDcCK4z5gLw3OP9ImjG7moZFsJSYw42DTsVdZUWNaYI5NFXeN0e
 XANf1RPrinjd24qxquuc2ptsJ1aPvXKt1MfI8KZ5PxYLmbjhBSNlikC0bBE6XIYfZvBE
 j6b1JrJ/qCUO/KYEAEaUBDAO2mRhq63/+kUVd6JbqsbLKI7Wmt2D1dkxH3gtyxfa5yWz
 Z0jVvUjqkO6j2LQL8pIeedXrhqwXnc6ruPWBYt4HJ/mw8DKgMvTM4ij6S9xKOB70S15V
 z4NGcWVGqXsET1k27z97MhTy7IyT6ynrbLL7wD2TqAGtLYGLHMWthM+c/s+ISRbVJdb4
 dE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=cVOfY7ra5i9mkZB26/AnyOVNjSKf/2ZBmaQ7Stqxes0=;
 b=WsVmbVdF+oChS2lNN88OuMcAnhdOcE5s88mI+lzsh75yUxSEJd70ukdS0dF1gkY2Yy
 UR38e8tgOjs/mLlFf+K8eiYHivuzHy0qMJmydc4A67zR/m9Ez2DpA+5TxHHheal06aMZ
 WJURWjtMaxL/+sNL38K1Beo1g36eE8/TLLVfaZlf9CRGBDc9boDTgH2pX3AR6LyyfnXg
 5GwD2fnklK//+kizX5qiYz4g7pJW8LUJjLMMAc1PA/Nl+Mz03QylKVVRgMgwp4w8TYn4
 QV4OtU4W/IVMKfY/9BsThRT6UaPL3GwMPEippNKgcMTdSwp4HEbEMDxxWIr+Mr7ys7ym
 VlOg==
X-Gm-Message-State: AKGB3mIKE/zlvrQuSuQN1LR1AG8/UWfOwcA0wgfegjdKQQg2o4Y4u22w
 i9VIbpEJVR1UOKtWFdSdtsZ63N1RR9uXJ+B/1CI=
X-Google-Smtp-Source: ACJfBosSqpdH3tCgXiWYuf8QWbtS9ZMWUJGGWNbN/SlSLa7BGp7XsDg4kViCp8bK5YJeIsjlHhyila0PDzni6oDn5Kg=
X-Received: by 10.176.22.82 with SMTP id l18mr13904724uae.73.1513329514385;
 Fri, 15 Dec 2017 01:18:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.26.32 with HTTP; Fri, 15 Dec 2017 01:18:33 -0800 (PST)
In-Reply-To: <874loswqus.fsf@linux.vnet.ibm.com>
References: <CACkAXSrqHOkyDZpYRCtibiA6CQ9Z7XRXw5BcTkvDSMwd1pEvjQ@mail.gmail.com>
 <874loswqus.fsf@linux.vnet.ibm.com>
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Fri, 15 Dec 2017 14:48:33 +0530
Message-ID: <CACkAXSpWZTzS5dOcC-sUqW8iHqrdiaZMJBqrJ41j8TjTC=kzcQ@mail.gmail.com>
Subject: Re: dreport will replace ffdc tool starting from Feb-2018.
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="001a11456b302215e105605d7c53"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Dec 2017 09:18:38 -0000

--001a11456b302215e105605d7c53
Content-Type: text/plain; charset="UTF-8"

FFDC tool in the OpenBMC builds is already modified to use dreport as the
back-end for capturing debug data.

dreport can be invoked directly with various switches for additional
options.

As you mentioned FFDC tool can be made to be a shell alias or a soft link
to dreport. This would enable to invoke FFDC tool in a same way as dreport
with all switches.

Jayanth Othayoth
Firmware Developer, IBM.


On Fri, Dec 15, 2017 at 10:05 AM, Stewart Smith <stewart@linux.vnet.ibm.com>
wrote:

> Jayanth Othayoth <ojayanth@gmail.com> writes:
> > Starting feb-2018 ffdc tool will be removed from openbmc builds. dreport
> > will replace ffdc tool with support for additional features.  dreport is
> > already available in openbmc builds.
> >
> > Users of ffdc tool must plan to migrate to dreport.
> >
> > dreport is  a drop-in replacement for ffdc.  ie run dreport instead of
> > ffdc.
>
> For ease of use, a shell alias would be appreciated. Old habits die hard :)
>
> --
> Stewart Smith
> OPAL Architect, IBM.
>
>

--001a11456b302215e105605d7c53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>FFDC tool in the OpenBMC builds is already =
modified to use dreport as the back-end for capturing debug data. <br><br><=
/div>dreport can be invoked directly with various switches for additional o=
ptions. <br><br>As you mentioned FFDC tool can be made to be a shell alias =
or a soft link to dreport. This would enable to invoke FFDC tool in a same =
way as dreport with all switches.<br><br></div>Jayanth Othayoth<br></div>Fi=
rmware Developer, IBM.<br><div><div>=C2=A0<br></div></div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Dec 15, 2017 at 10:=
05 AM, Stewart Smith <span dir=3D"ltr">&lt;<a href=3D"mailto:stewart@linux.=
vnet.ibm.com" target=3D"_blank">stewart@linux.vnet.ibm.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><span class=3D"">Jayanth Othayoth &=
lt;<a href=3D"mailto:ojayanth@gmail.com">ojayanth@gmail.com</a>&gt; writes:=
<br>
&gt; Starting feb-2018 ffdc tool will be removed from openbmc builds. drepo=
rt<br>
&gt; will replace ffdc tool with support for additional features.=C2=A0 dre=
port is<br>
&gt; already available in openbmc builds.<br>
&gt;<br>
&gt; Users of ffdc tool must plan to migrate to dreport.<br>
&gt;<br>
&gt; dreport is=C2=A0 a drop-in replacement for ffdc.=C2=A0 ie run dreport =
instead of<br>
&gt; ffdc.<br>
<br>
</span>For ease of use, a shell alias would be appreciated. Old habits die =
hard :)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Stewart Smith<br>
OPAL Architect, IBM.<br>
<br>
</font></span></blockquote></div><br></div>

--001a11456b302215e105605d7c53--
