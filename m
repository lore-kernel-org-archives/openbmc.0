Return-Path: <brendanhiggins@google.com>
Received: from mail-ua0-x235.google.com (mail-ua0-x235.google.com
 [IPv6:2607:f8b0:400c:c08::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sNyWX2dPPzDrhr
 for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2016 05:00:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=OcEMSqtd; 
 dkim-atps=neutral
Received: by mail-ua0-x235.google.com with SMTP id k90so49549444uak.1
 for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2016 12:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5ZuJ0FrAoH4aR0q6d4WBDC5t6o33vl3Y+J9pcd9FPho=;
 b=OcEMSqtdh+eHJgeQ59ife4GXa4qgklfJs9K+KTpFWVDdWVBnLlx4bWO0a73Tj0UYIG
 uRritSB1B4+GcnGt2c8ZNQfJbCS+Au2fH4oP3cOJBNMjEjzj/8JIvxUsXpqZoh9UA2T2
 BrWYt9thtgBZxiyfNj/0iShQq9MHyox+W9eCaw84Ktr5DklYr8Cui7f70KqbV+OGbL/s
 feK17px4jjW0XW1fpG23W7NM/aooYUQqpeEbQehKmSWycia4KT9wEvEbXPkzrM2BIPXv
 e9P2d6I1XXg+H6W7qz/m+YG9LJp+9tq9Nn6SZsVmYZ+RoqjC+gC+aCmefcB2FkZS525i
 5Zmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ZuJ0FrAoH4aR0q6d4WBDC5t6o33vl3Y+J9pcd9FPho=;
 b=Hl1MK7+88SrQrqaFe4tWEbTFvf7CgYV4MhkKnzMy9XB9pFeotHcP+fAgy9IC9Wojxu
 7MxkPMxBT23VEO4VQzX5pK2buerSnvnfguzisnKxDPT09oLrYZBnSNfsymFeo74HY7pH
 BZHgZI+Ne0VreLN5oYuPyimY3XY+m6+JEwtrI0Vb2Mk0XIcF4tHOhQQuHxFdVB+Gm/lo
 lltVhDtrcWgiEXhaMtPsznv6Fhq23PC6I7ttF1iajvAhlRQgyWlhTbkzRwkDPAPRAdEy
 NJntgF040evIwFM/+fOMu6XIFNjdUHTqHJFrZ/XsvlKbEVtw3n8NOzZ2CvmSts/rgwEv
 V+xw==
X-Gm-Message-State: AE9vXwOa3gTtw+1hUvXVs8+AnopA7P6dlIGI5xtXJ+1EIvGzZ/G3MTIl25YCFBus6UO0LA4vYvpK3EOM7KhcZn/b
X-Received: by 10.31.95.137 with SMTP id t131mr2775434vkb.67.1472583605946;
 Tue, 30 Aug 2016 12:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <1471743258-7179-1-git-send-email-brendanhiggins@google.com>
 <1471743258-7179-3-git-send-email-brendanhiggins@google.com>
 <CACPK8XfAfiuas_D3UGMf6Hf922oFH9dcHg_9QUP7xvmuTkmabg@mail.gmail.com>
In-Reply-To: <CACPK8XfAfiuas_D3UGMf6Hf922oFH9dcHg_9QUP7xvmuTkmabg@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 30 Aug 2016 18:59:55 +0000
Message-ID: <CAFd5g45iZBEAPQtkHRUuT6aB5zTYxjW50sFMTYEw=h0u7mUJrA@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: aspeed: cleanup driver
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114e3caebc4f6b053b4e96af
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Aug 2016 19:00:09 -0000

--001a114e3caebc4f6b053b4e96af
Content-Type: text/plain; charset=UTF-8

checkpatch seems to be upset about my device tree identifiers being
undocumented; do we have a coordinated effort for this? I did not even see
a directory for aspeed under arm.

checkpatch is also asked about updating MAINTAINERS, but looks like it
should be covered under existing line:
F: drivers/*/*aspeed*
Does it just ask this every time you add a file?

changelog:
 - Squashed driver commits as suggested by Joel
 - Renamed a couple functions for consistency
 - Fixed a couple style errors

On Sun, Aug 28, 2016 at 10:35 PM Joel Stanley <joel@jms.id.au> wrote:

> Hi Brendan,
>
> On Sun, Aug 21, 2016 at 11:04 AM, Brendan Higgins
> <brendanhiggins@google.com> wrote:
> > Rewrote most of master IRQ handler, xfer functions, and error recovery.
> > Minor refactor of probing functions. Added remove functions.
>
> Thanks for the patch. The diff is quite noisy given you're deleting
> lots of cruft from the vendor driver. It would be easier for us to
> review if you send the patch that adds the driver from scratch.
>
> One suggestion I did have is to rename the driver to use the aspeed_
> prefix for all functions so that it matches the drivers that have
> already gone upstream.
>
> Given our goal is immediate upstream submission, how about you send a
> complete patch that adds the driver to upstream (say 4.8-rc4?)? Send
> it to the i2c lists and cc myself, jk@ozlabs.org, and andrew@aj.id.au.
>
> I hope we can get this sent out for upstream review this week. Let me
> know if there's anything I can do to help achieve that.
>
> Cheers,
>
> Joel
>
> > ---
> >  drivers/i2c/busses/i2c-aspeed.c | 932
> ++++++++++++++--------------------------
> >  1 file changed, 318 insertions(+), 614 deletions(-)
>

--001a114e3caebc4f6b053b4e96af
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">checkpatch seems to be upset about my device tree identifi=
ers being undocumented; do we have a coordinated effort for this? I did not=
 even see a directory for aspeed under arm.<div><br></div><div>checkpatch i=
s also asked about updating MAINTAINERS, but looks like it should be covere=
d under existing line:</div><div>F:<span class=3D"Apple-tab-span" style=3D"=
white-space:pre">	</span>drivers/*/*aspeed*</div><div>Does it just ask this=
 every time you add a file?</div><div><br></div><div>changelog:</div><div>=
=C2=A0- Squashed driver commits as suggested by Joel</div><div>=C2=A0- Rena=
med a couple functions for consistency</div><div>=C2=A0- Fixed a couple sty=
le errors</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sun=
, Aug 28, 2016 at 10:35 PM Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.a=
u">joel@jms.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi=
 Brendan,<br>
<br>
On Sun, Aug 21, 2016 at 11:04 AM, Brendan Higgins<br>
&lt;<a href=3D"mailto:brendanhiggins@google.com" target=3D"_blank">brendanh=
iggins@google.com</a>&gt; wrote:<br>
&gt; Rewrote most of master IRQ handler, xfer functions, and error recovery=
.<br>
&gt; Minor refactor of probing functions. Added remove functions.<br>
<br>
Thanks for the patch. The diff is quite noisy given you&#39;re deleting<br>
lots of cruft from the vendor driver. It would be easier for us to<br>
review if you send the patch that adds the driver from scratch.<br>
<br>
One suggestion I did have is to rename the driver to use the aspeed_<br>
prefix for all functions so that it matches the drivers that have<br>
already gone upstream.<br>
<br>
Given our goal is immediate upstream submission, how about you send a<br>
complete patch that adds the driver to upstream (say 4.8-rc4?)? Send<br>
it to the i2c lists and cc myself, <a href=3D"mailto:jk@ozlabs.org" target=
=3D"_blank">jk@ozlabs.org</a>, and <a href=3D"mailto:andrew@aj.id.au" targe=
t=3D"_blank">andrew@aj.id.au</a>.<br>
<br>
I hope we can get this sent out for upstream review this week. Let me<br>
know if there&#39;s anything I can do to help achieve that.<br>
<br>
Cheers,<br>
<br>
Joel<br>
<br>
&gt; ---<br>
&gt;=C2=A0 drivers/i2c/busses/i2c-aspeed.c | 932 ++++++++++++++------------=
--------------<br>
&gt;=C2=A0 1 file changed, 318 insertions(+), 614 deletions(-)<br>
</blockquote></div>

--001a114e3caebc4f6b053b4e96af--
