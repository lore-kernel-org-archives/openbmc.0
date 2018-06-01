Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c0d::235; helo=mail-qt0-x235.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gmh5KbgD"; 
 dkim-atps=neutral
Received: from mail-qt0-x235.google.com (mail-qt0-x235.google.com
 [IPv6:2607:f8b0:400d:c0d::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40y9G83Kz4zDrpC
 for <openbmc@lists.ozlabs.org>; Sat,  2 Jun 2018 02:46:39 +1000 (AEST)
Received: by mail-qt0-x235.google.com with SMTP id y89-v6so7479675qtd.10
 for <openbmc@lists.ozlabs.org>; Fri, 01 Jun 2018 09:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rUj0se4JF1tKMQGZsbqdTsmKeBbCcvH+KysmMq6e35Y=;
 b=gmh5KbgD+FJhZ2dYIGaeT26yxDj+3re/THYTmEyB/p6NXUWkJPUZrory78edsTH/hM
 S2roZYrCd3GyWIexQDwIuldMyLSf6RFLUmRN7J4c39KycgFM4JGF2GR3Hbjr5DB2qRTT
 rEtprSJB/KXX52g+5GwymAlFKLuSc7IOoO2PGvQm3BSX0qJhdmLWNDqGD/vgOJwnDMDa
 NRqFK6JKdJWt5HD0Vl+rXisk6RQaDn3GxX1X6xIYdijsuujyEQfWbZLmrjFxv8j/hzlP
 p5TpUjRwssnvOAfwjdOrdbT2+/c1nOEVjU8+1sSLzLtYAUarZONs4b3hN4CbFJUYhSXK
 n9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rUj0se4JF1tKMQGZsbqdTsmKeBbCcvH+KysmMq6e35Y=;
 b=Mv7d5MjWYokdnUMKyEPsCW5dmuYaoHyxZgAmiSRrxiCzjup/9Wn8WKSYCnmIm6YUOn
 vWigZXT+rHKMj3VTHYOWAOlk4du7nSYb781hUZLbcK75/jsJ5yVwmbicnGrwcXko4WkQ
 cyyI002ro5l6YLoU1RG7JrpobcmQzGKbFwQ98+wPJiJP8Vdre/AW2ooVEA4SCUUBhCIj
 uN1+k41lSpz92UfqT0Ek6DJPj4JfZHQiXKyvjH9zOxEZQUV5H/EzmX8N1VrtOr14oAOC
 dHFHE2ChHlNIHbE6N/EAkGSIMSzZLmglkVNNat0F/Q69gT7CxT3f0HKWpabmOqMVt2J2
 1Scg==
X-Gm-Message-State: APt69E141EAjv0dV1p3O9csgFcCufAvuhFNI9AYTB5gMJ0SmbATFXUwk
 g4u1fT5uCM8M9LpV6EqrbymFh+EmfqgXTMqSRGjQIQ==
X-Google-Smtp-Source: ADUXVKL/ukdGVRwPJeueHOBtrtkY5RioQH7VSB7Dnwy13rgMthIjHnxkfhUx/f2Es+6rvbsaRzmpK2FaWJcvXkvmZHg=
X-Received: by 2002:ac8:22d4:: with SMTP id
 g20-v6mr11209950qta.159.1527871596795; 
 Fri, 01 Jun 2018 09:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <1526953427.458876.1380098832.53C3F9C7@webmail.messagingengine.com>
 <CAJoAoZmd+RJepSkFE+VUapmrY_rYdftKX0LnSrjUXSqv_bGy2w@mail.gmail.com>
 <1527814593.468836.1392470512.06FD33AE@webmail.messagingengine.com>
In-Reply-To: <1527814593.468836.1392470512.06FD33AE@webmail.messagingengine.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Fri, 1 Jun 2018 09:46:24 -0700
Message-ID: <CAJoAoZn7q_eXB4+J57H3RJpM=O_o5oSRtcxbJrb7gFjT-84uUA@mail.gmail.com>
Subject: Re: obmc-gerrit: A tool for automagically adding reviewers to your
 patches
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org, bradleyb@fuzziesquirrel.com
Content-Type: multipart/alternative; boundary="000000000000ca86e9056d97533c"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jun 2018 16:46:41 -0000

--000000000000ca86e9056d97533c
Content-Type: text/plain; charset="UTF-8"

At least in IPMI etc I haven't seen people use this. Are they common
elsewhere in the project?

On Thu, May 31, 2018 at 5:56 PM Andrew Jeffery <andrew@aj.id.au> wrote:

> On Fri, 1 Jun 2018, at 09:07, Emily Shaffer wrote:
> > Excellent! Thanks Andrew!!!!!
>
> No worries.
>
> I'm wondering whether I should also add support for parsing 'Cc:' tags out
> of the commit messages and further mangling the refspec based on that...
>
> Thoughts?
>
> Andrew
>

--000000000000ca86e9056d97533c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">At least in IPMI etc I haven&#39;t seen people use this. A=
re they common elsewhere in the project?</div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr">On Thu, May 31, 2018 at 5:56 PM Andrew Jeffery &lt;<a hr=
ef=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On Fri, 1 Jun 2018, at 09:07, Emily Shaffer wrote=
:<br>
&gt; Excellent! Thanks Andrew!!!!!<br>
<br>
No worries.<br>
<br>
I&#39;m wondering whether I should also add support for parsing &#39;Cc:&#3=
9; tags out of the commit messages and further mangling the refspec based o=
n that...<br>
<br>
Thoughts?<br>
<br>
Andrew<br>
</blockquote></div>

--000000000000ca86e9056d97533c--
