Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:400c:c0c::232; helo=mail-wr0-x232.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="k1crd6hZ"; 
 dkim-atps=neutral
Received: from mail-wr0-x232.google.com (mail-wr0-x232.google.com
 [IPv6:2a00:1450:400c:c0c::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 404lSD3NNHzF1Vc
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 05:47:55 +1100 (AEDT)
Received: by mail-wr0-x232.google.com with SMTP id u46so5673374wrc.11
 for <openbmc@lists.ozlabs.org>; Mon, 19 Mar 2018 11:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rZJVfYm48sNKGvDNcxmOG18QXmWKi6Osn00zbQEEWjA=;
 b=k1crd6hZtC5c5LmWmLSNGxCW4Q/tJEYfS3IXYMe1brkZGAVhTgaT0eMKQhDISIJVc8
 0UGCSlTWU3FJVD6PmJbsLvcrRl2XUO/wqeq2+2Rb7dmnNe0aARgO+DNdDAyfNT0AaANN
 9KkcBSy+2XaxzJkYmB+jcasJsXiROxAAlVWHQK/g+BCuTKZBO3ab8UI2Aa8Q16U89LiZ
 759nmm0lzHGv9w1C4uzc9CI06BLyAgcgIi8OsU7mSB1VSvWqAVkDhcQ/uAPB//9YqLdI
 Tn4RHpEZUdVRbe46LYmoNt0CJoV3fE7YRr4etyAGEhFda9y+ba/5YVfHfFjdjjM4f1Wp
 rGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rZJVfYm48sNKGvDNcxmOG18QXmWKi6Osn00zbQEEWjA=;
 b=MunFp7LTDCjTjJQmBqfSKt6K1RVAlB7R4WdUGbjKsWCLQ12ENPvW5wbae4civBRsq0
 qtUWSliV6o45pyMQfKm4vKaYFVHxObc9CkCS/OBa+/pydnFXGN/U6Vy3Q+MZfM0i7JK8
 DElYh7stwDiaRS9hUKag2Wh27xwe7aqtJ3NZ6Hgw6HPslV3ZYX/zuQlDzPh75JlD6msN
 baz9oLp8bvRlqqWwMK/Dzf2eV92lQvJOivNzpboywKHiCdHgYNcLO/KsdL4L59hqVGak
 /No8vYTYBrp7wRdF5n8FAA2QswZMl8XZLeJ3vxqNVFbvKJdIg/GGnKTLCMLZWXjJU68T
 x9rw==
X-Gm-Message-State: AElRT7EZ4SsaZtIek54G3orG7OlGy5OfDSLAPheiWphgNCWqSx47kbqY
 EwJKlY+6Uc8jpEe0m79BxCC3nJ2ERmPoakJRp6g+hw==
X-Google-Smtp-Source: AG47ELvQ8ZdtG3ibUigmSqUcwlVrLMxH8QFMQWdhNwvmFkf/YsKU2sRhJjMPdLNjf5tICuNWkcW0wacXTHjgy4kQFOM=
X-Received: by 10.223.139.144 with SMTP id o16mr10081072wra.279.1521485272292; 
 Mon, 19 Mar 2018 11:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <f34018a7-be64-9a2b-befd-632747234fd0@linux.vnet.ibm.com>
 <eb3ad4a5-d261-adaa-1782-b7cf77fc7267@linux.vnet.ibm.com>
 <CAJoAoZnqH=C6Nd-XLtZE=4+AcfFQg53B0GYeTWM_03KJCQEo1w@mail.gmail.com>
 <87y3iokp44.fsf@linux.vnet.ibm.com>
In-Reply-To: <87y3iokp44.fsf@linux.vnet.ibm.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Mon, 19 Mar 2018 18:47:41 +0000
Message-ID: <CAJoAoZko_Y3iJp07VBJ72E+OEq8TwXXnO5XxuqEnTPw2=EqGJw@mail.gmail.com>
Subject: Re: IPMI SOL performance
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: Tom Joseph <tomjose@linux.vnet.ibm.com>, Jeremy Kerr <jk@ozlabs.org>, 
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Bradley W Bishop <bradleyb@us.ibm.com>
Content-Type: multipart/alternative; boundary="f403045ea4663132ae0567c86571"
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
X-List-Received-Date: Mon, 19 Mar 2018 18:47:57 -0000

--f403045ea4663132ae0567c86571
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 19, 2018 at 9:27 AM Stewart Smith <stewart@linux.vnet.ibm.com>
wrote:

> Emily Shaffer <emilyshaffer@google.com> writes:
> >> Is it a possibility to just increase the petitboot timeout? Do you have
> an
> > idea of how much we are missing it by?
>
> Worst case (may be different currently due to improvements in ipmi
> stack) was about 10-15 minutes.

Yikes.

>


> We have different issues on the SSH console though, we can end up
> dropping chunks of console output under load (BMC CPU load or high
> console usage).
>
> I think Jeremy can relive the trauma of heading into the TTY layer, but
> I wonder if the solution here has something to do with having a
> end-to-end flow control story.
>
> --
> Stewart Smith
> OPAL Architect, IBM.
>
>
I was looking in the spec and I saw that the packet length for SOL is
configurable in the session header, but I didn't find the layout for the
header.  It's definitely not configurable past 255B?

It really doesn't sound like IPMI is well-suited to this task.  Tom, can
you post a proposal for the OEM command you'd like to see, or if you've
tried one internally?

--f403045ea4663132ae0567c86571
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon=
, Mar 19, 2018 at 9:27 AM Stewart Smith &lt;<a href=3D"mailto:stewart@linux=
.vnet.ibm.com">stewart@linux.vnet.ibm.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Emily Shaffer &lt;<a href=3D"mailto:emilyshaffer@goog=
le.com" target=3D"_blank">emilyshaffer@google.com</a>&gt; writes:<br>
&gt;&gt; Is it a possibility to just increase the petitboot timeout? Do you=
 have an<br>
&gt; idea of how much we are missing it by?<br>
<br>
Worst case (may be different currently due to improvements in ipmi<br>
stack) was about 10-15 minutes.</blockquote><div>Yikes.=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">=C2=A0</blockquote><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
We have different issues on the SSH console though, we can end up<br>
dropping chunks of console output under load (BMC CPU load or high<br>
console usage).<br>
<br>
I think Jeremy can relive the trauma of heading into the TTY layer, but<br>
I wonder if the solution here has something to do with having a<br>
end-to-end flow control story.<br>
<br>
--<br>
Stewart Smith<br>
OPAL Architect, IBM.<br>
<br></blockquote><div><br></div><div>I was looking in the spec and I saw th=
at the packet length for SOL is configurable in the session header, but I d=
idn&#39;t find the layout for the header.=C2=A0 It&#39;s definitely not con=
figurable past 255B?</div><div><br></div><div>It really doesn&#39;t sound l=
ike IPMI is well-suited to this task.=C2=A0 Tom, can you post a proposal fo=
r the OEM command you&#39;d like to see, or if you&#39;ve tried one interna=
lly?</div></div></div>

--f403045ea4663132ae0567c86571--
