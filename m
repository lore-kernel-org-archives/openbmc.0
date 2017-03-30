Return-Path: <raltherr@google.com>
Received: from mail-wr0-x22d.google.com (mail-wr0-x22d.google.com
 [IPv6:2a00:1450:400c:c0c::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vvKvW3jzjzDqC4
 for <openbmc@lists.ozlabs.org>; Fri, 31 Mar 2017 10:04:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vr/PUhnS"; 
 dkim-atps=neutral
Received: by mail-wr0-x22d.google.com with SMTP id l43so82836107wre.1
 for <openbmc@lists.ozlabs.org>; Thu, 30 Mar 2017 16:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=9RJeIbs71ympEU7ubi94in2rWhA+zBXoZ4bXg8Tbn4Y=;
 b=vr/PUhnS5EPi7P13mkH6U9QdQEXifvX6plQ+VZ4FKiIMOm8UbFFYfeBYyqlxJlrcNF
 aXgDLPNygmVzRDKeVFbywewFCGJ2ibJni7Wbj2PysS8a04YsbxgZpHYZ5Vv+PjePzJMv
 DDJXPYa5te+zQC9/piMdlqlJC0c/9RVsL6a7fOBT64lR/ffgEPXgkWpiZpQXO9Ie5xNB
 FhgXSx94qVYO+oAPxtfNkvfzYIttygqJXTyx4EdGtDnDg3axCcoEdRMuenp/lOqwhMj+
 6/Zmlrg69IV1e5XTwAXH5wTcEgr7dxnIsoJMMlsTfGpS71EkmYfydF8OyralYJv6hKKD
 8o4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=9RJeIbs71ympEU7ubi94in2rWhA+zBXoZ4bXg8Tbn4Y=;
 b=g+rZ2gH//lK4+qrjW4hV+WnTwZVwdm7VRMaJ8XqiLgW/akNuG50Snq/7YKqfGDfFUp
 SoeIWFgHI1EqFdkeBH79fZkEIgq6sEW3DJIeD84RbCZJ+k93JIGCgs5fKbNezQGjUQG6
 x84lm0t/PVzNYYHmT4YaQTnuRRr54lXGNAAKxxrANfe0PZs4tYg2FjD7YsZVP3OUu4bz
 aPxE7bKz0BhVS+mg5nH8WgQ+XHNxaAyXxePje7oOw0YRpaV1dorWDl+4BUisNYTyIo1+
 uWPoVmQLWoW/+rulTGX7rPt3aCmb6ToZYDayB0ed/Pr2+FbDT/n788L30J1I0do8HHi7
 LJ3A==
X-Gm-Message-State: AFeK/H3eIRmmtyIMKhFiGEbSDkQAtCrpTyHEfZzgU7lUMpBIqYXgg9KIgMZAE6g5E21hUwA8SUWda48XWarNk7VD
X-Received: by 10.223.143.36 with SMTP id p33mr1710823wrb.120.1490915058271;
 Thu, 30 Mar 2017 16:04:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.169.8 with HTTP; Thu, 30 Mar 2017 16:04:17 -0700 (PDT)
Received: by 10.28.169.8 with HTTP; Thu, 30 Mar 2017 16:04:17 -0700 (PDT)
In-Reply-To: <HE1PR0501MB2666721F6FF033CA4B94D754DD340@HE1PR0501MB2666.eurprd05.prod.outlook.com>
References: <HE1PR0501MB2666721F6FF033CA4B94D754DD340@HE1PR0501MB2666.eurprd05.prod.outlook.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 30 Mar 2017 16:04:17 -0700
Message-ID: <CAPLgG==+vcFHfjT1ZMrokYgnVdP13n-iNA30iqdocNRSF-C1Pw@mail.gmail.com>
Subject: Re: MCTP protocol support in OpenBMC?
To: David Thompson <dthompson@mellanox.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=f403045cf4e4708e19054bfab623
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
X-List-Received-Date: Thu, 30 Mar 2017 23:04:24 -0000

--f403045cf4e4708e19054bfab623
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I know the Aspeed parts have hardware to support MCTP. Neither mainline
Linux or OpenBMC have drivers for that hardware yet. I'm interested in what
can be done with MCTP but I'm not aware of any plans from IBM or Google to
implement support. That said, if you'd like to work on a device driver,
I'll gladly review patches and assist with upstreaming.

Rick

On Mar 30, 2017 3:09 PM, "David Thompson" <dthompson@mellanox.com> wrote:

> Hello folks,
>
>
>
> Does OpenBMC currently have any support for MCTP protocol layer,
>
> or is there a plan to deliver something like this in the future?  I=E2=80=
=99d be
>
> very interested to hear about any future plans related to MCTP stack.
>
>
>
> Thanks in advance,
>
> Dave
>
>
>
> David Thompson
>
> Sr. Staff Engineer, System SW
>
> Mellanox Technologies
>
> 1900 West Park Drive, Suite 290
>
> Westborough MA USA 01581
>
> Direct: 508-983-6439 <(508)%20983-6439>
>
>
>

--f403045cf4e4708e19054bfab623
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I know the Aspeed parts have hardware to support MCTP. Ne=
ither mainline Linux or OpenBMC have drivers for that hardware yet. I&#39;m=
 interested in what can be done with MCTP but I&#39;m not aware of any plan=
s from IBM or Google to implement support. That said, if you&#39;d like to =
work on a device driver, I&#39;ll gladly review patches and assist with ups=
treaming.<div dir=3D"auto"><br></div><div dir=3D"auto">Rick</div></div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mar 30, 2017 3:09 =
PM, &quot;David Thompson&quot; &lt;<a href=3D"mailto:dthompson@mellanox.com=
">dthompson@mellanox.com</a>&gt; wrote:<br type=3D"attribution"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">





<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"m_7203737888410934022WordSection1">
<p class=3D"MsoNormal">Hello folks,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Does OpenBMC currently have any support for MCTP pro=
tocol layer,<u></u><u></u></p>
<p class=3D"MsoNormal">or is there a plan to deliver something like this in=
 the future?=C2=A0 I=E2=80=99d be<u></u><u></u></p>
<p class=3D"MsoNormal">very interested to hear about any future plans relat=
ed to MCTP stack.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks in advance,<u></u><u></u></p>
<p class=3D"MsoNormal">Dave<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">David Thompson<u></u><u></u></p>
<p class=3D"MsoNormal">Sr. Staff Engineer, System SW<u></u><u></u></p>
<p class=3D"MsoNormal">Mellanox Technologies<u></u><u></u></p>
<p class=3D"MsoNormal">1900 West Park Drive, Suite 290<u></u><u></u></p>
<p class=3D"MsoNormal">Westborough MA USA 01581<u></u><u></u></p>
<p class=3D"MsoNormal">Direct: <a href=3D"tel:(508)%20983-6439" value=3D"+1=
5089836439" target=3D"_blank">508-983-6439</a><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>

</blockquote></div></div>

--f403045cf4e4708e19054bfab623--
