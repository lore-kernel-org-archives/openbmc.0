Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::231; helo=mail-it0-x231.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="PSqNo6Wk"; 
 dkim-atps=neutral
Received: from mail-it0-x231.google.com (mail-it0-x231.google.com
 [IPv6:2607:f8b0:4001:c0b::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420P2864KzzF0QC
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 08:44:15 +1000 (AEST)
Received: by mail-it0-x231.google.com with SMTP id h3-v6so5018769ita.2
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 15:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OmbH60ykW5+OavXwHD/kUcBny4i4fqkZ2DK//1NP6/Q=;
 b=PSqNo6Wk5jkEPw4EarWBJ/hemXSFlLf5omgeb6Q/RH7ILtFkWtknrdngVnkOi5Tr9c
 tAH2IW/qW4+RGM6goTiPzVgLSm2gVAs07E5VSIES89pMC1mVLlHFcOxe14sO9S/fP1Vw
 o2cb/+hEJr37eSWry1uKadm1POou/lHlJavJj8Gi7PxQhxDV+/JWMV0wAuSr0WkrKhDt
 mKFebGV779Y3IDPoMCpZEfIYXA1Ylz3HZCuGy5fEGnF1YloMubgY5hVf0jl0lSn1vIl1
 hfnWnJ9HZK939mgNZ88fD7gI9Xxn33Y/GMfwqdDtriK4ycd7y+KREbqPs4bxRxxulbgj
 Hlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OmbH60ykW5+OavXwHD/kUcBny4i4fqkZ2DK//1NP6/Q=;
 b=HzGtk9To97Txx46lXMrvn4UfkI5c8ILYZm8onIyAoOFkPG9LfjWN7HONLCr8yw35Dg
 UbVXhAKEYyvkmehKp5OVYRJ9o5I5OMSDnjlP23+yffMaLSl1QJJxr6b5spemXyAspflg
 dFvqq2nZTImHSoYHnsnCWHTvb5f89TlCFWDch926TC7r9GfTDNE03AzQFLXc0Hpoga4a
 AaCXmlk7Xga+ZXnm9dFfZUT3AZoIcRkFkYjgIAj5aflS+sLhLF+7D1PKHckCGMziK0Ye
 gHzzwBFs9h/Qzo+CNmpkqqeUh5x+2n5XzT1ImjGsFmb1gOUKlwq3fysbT7l0Ye6Q6EOv
 VAyg==
X-Gm-Message-State: APzg51A3AQ6fvdKYcr2l8GJ0cf6swhhVZ2u4GwBB1Ltmw82D84ZtpgMo
 H5nQh9Imy4C73dZCSvxUyaUirL4BwAsc2Ra0Z9APkw==
X-Google-Smtp-Source: ANB0VdbuM/m2VRu7ZcmfB+WJXkg6M7FypZof2yGmnxJGhiYa0P11T/c6RtUyvzoxjd9Kxf1UkMxy5PJrNdsRsJDQ9zE=
X-Received: by 2002:a24:eec7:: with SMTP id
 b190-v6mr3252172iti.32.1535496253142; 
 Tue, 28 Aug 2018 15:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <0ef9181f-eb70-552b-3411-da2bc9676be1@yadro.com>
 <CACPK8XdtitrjvDpuiPiz_ew03m972ueGRXAhd4kM_z6YSVtL3A@mail.gmail.com>
 <0E782585-1B8A-4BF7-9454-443061BA9C32@fuzziesquirrel.com>
 <CALLMt=rGmZ9-29xWMymUvdCAgVnFzQ+gyZDn3zXnWeR4imSYPA@mail.gmail.com>
 <359bcf51-5732-a65b-4b7e-dba2df0dd375@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E821699345836D0F@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E821699345836D0F@ORSMSX114.amr.corp.intel.com>
From: Kun Yi <kunyi@google.com>
Date: Tue, 28 Aug 2018 15:43:46 -0700
Message-ID: <CAGMNF6WZA_LKQ3ks+M2hG6Jp0E-T6taXF9NozRqWWkm5qMJnYQ@mail.gmail.com>
Subject: Re: Proposals for commit log policy
To: ed.tanous@intel.com
Cc: gmills@linux.vnet.ibm.com, geissonator@gmail.com, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, a.amelkin@yadro.com
Content-Type: multipart/alternative; boundary="000000000000b99f37057486941a"
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
X-List-Received-Date: Tue, 28 Aug 2018 22:44:17 -0000

--000000000000b99f37057486941a
Content-Type: text/plain; charset="UTF-8"

My take is that we should keep the easy things easy. i.e. keep auto-bumping
most of the repos.

Would people be interested in something like an auto-bump configuration?
For example a optional configuration file that specifies the git log
format, or some option to 'turn auto-bump off for this repo'.

On Tue, Aug 28, 2018 at 3:21 PM Tanous, Ed <ed.tanous@intel.com> wrote:

> >
> > I object too. I don't think the benefit of manual bumps is worth the
> effort.
> >
>
> Another vote for "I don't think it's worth the effort".
>
> Automatic bumps keep us up to date and make breakages happen and get fixed
> faster.  I would actually prefer that every gerrit review creates a manual
> bump to make sure the complete system builds with their given component
> change, but I realize this is hard to do.
>
> -Ed
>


-- 
Regards,
Kun

--000000000000b99f37057486941a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">My take is that we should keep the easy things easy. i.e. =
keep auto-bumping most of the repos.<div><br><div>Would people be intereste=
d in something like an auto-bump configuration? For=C2=A0example a optional=
 configuration file that specifies the git log format, or some option to &#=
39;turn auto-bump off for this repo&#39;.</div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr">On Tue, Aug 28, 2018 at 3:21 PM Tanous, Ed &lt;<a=
 href=3D"mailto:ed.tanous@intel.com">ed.tanous@intel.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">&gt; <br>
&gt; I object too. I don&#39;t think the benefit of manual bumps is worth t=
he effort.<br>
&gt; <br>
<br>
Another vote for &quot;I don&#39;t think it&#39;s worth the effort&quot;.<b=
r>
<br>
Automatic bumps keep us up to date and make breakages happen and get fixed =
faster.=C2=A0 I would actually prefer that every gerrit review creates a ma=
nual bump to make sure the complete system builds with their given componen=
t change, but I realize this is hard to do.<br>
<br>
-Ed<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr">Regards,<div>Kun</div></div></div></div>

--000000000000b99f37057486941a--
