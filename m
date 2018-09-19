Return-Path: <yuenn@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="E8cufHq1"; 
 dkim-atps=neutral
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Fv530bKfzDrBy
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 08:03:34 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id o18-v6so8667556wmc.0
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 15:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=TVd5MWmVkOdWbe6GXwuflY2wSWDY9IDbPdIhUzJN0Jw=;
 b=E8cufHq1o1Mn9gZHKO83hZ8saM/XWHFwkQBb1Z9r54HsROgj11fOgPyadeIPwVplkN
 xXH4EvehCrs3xCbZJKw2F49e8n+A8AGY7u5tIFwq3HHd2jBZqxK+ZEvDkMaNqBDVUrDl
 HiO+rcYdMGoKiH8g5dUtBnuRTqyWeGjRH60c/MImJvDlxGhQXhXTbYQQbz+/Zn6Ly12I
 Nae6LgcZdm5ZTTYcbmZDZoBRyis03I7eQ/hLxFrq3jRcIdAzwJa57gY6jma0igr+Rdkg
 fxBzrLOCT+qv6kUaR2Q3/68kRzDZVWZX/HvWTM5NZfb+8a17LWOHalnTkJDGIYH4r+6P
 JwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=TVd5MWmVkOdWbe6GXwuflY2wSWDY9IDbPdIhUzJN0Jw=;
 b=mspBHc6I6Ia7DjwhwMAshYxUXcAgd+hb4lqXajAdaT8Xg7rhhf1IfQ9Xwraa29/8wn
 OvLENFb6jsg8YLDbfUlxYT23lX0cWnngNFLdwRzpcUXBUfCAJgsVthyeV+Dbaf0e0GhH
 B9tJdbPHNUraUn43Bz+ad7v/0ToTa318BvDodIFQ4spNDfV2EpzXfUpocoldnvDH62u9
 lNArC2dB8tzXXL7MDraCmdwU8EDi6ieinQ/Po7KJoMdraCmyLB4VdCRTXQjctmg49iaE
 03E7eXLDegSdKP4KLxKmwMjzfSikJbWv6o9pDl3m+o6b2udHghytVHdfJLmMY0Ecj97X
 yrwQ==
X-Gm-Message-State: APzg51AhRX4lq/i790rx2BywgymoyzAz1r1VlJ+ucwS8+mklwV87+F2e
 3GNhQzpIeYlo+C2cStJ73KHkwaHBgA45Jq5M16z84Q==
X-Google-Smtp-Source: ANB0VdZyJpeehUc20EMgGGmKnAFEo7Tdxis/t5D4ZNYTyD0/cx0S/+cIqGcWXWSwxezf9qQsdCz+d2sHIPTAU/XPLxE=
X-Received: by 2002:a1c:dc41:: with SMTP id
 t62-v6mr21640317wmg.137.1537394611611; 
 Wed, 19 Sep 2018 15:03:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1c:20c7:0:0:0:0:0 with HTTP; Wed, 19 Sep 2018 15:02:50
 -0700 (PDT)
In-Reply-To: <8af8dac8-3dc1-1e21-9ff9-0aae0337f769@linux.intel.com>
References: <dVwK1y00D1vEVCc01VwKs6@charter.net>
 <CALLMt=pqSRi90cju_Gr1gBe+n9giWeM6LHYQ=MTnKDGEaaVifA@mail.gmail.com>
 <8af8dac8-3dc1-1e21-9ff9-0aae0337f769@linux.intel.com>
From: Nancy Yuen <yuenn@google.com>
Date: Wed, 19 Sep 2018 15:02:50 -0700
Message-ID: <CADfYTpFB+f4kp_sxqtKs+EX_C3AG4mW6nvmTM2uck8CT=qeuiQ@mail.gmail.com>
Subject: Re: Repository Growth
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000b502da0576409343"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2018 22:03:36 -0000

--000000000000b502da0576409343
Content-Type: text/plain; charset="UTF-8"

+1, I like the idea of having some form of automation to help with the
maintenance of this information.

----------
Nancy

On Wed, Sep 19, 2018 at 11:45 AM, Bills, Jason M <
jason.m.bills@linux.intel.com> wrote:

>
> The maintenance of it would be horrible for one
>>>>> person, but if someone wants their repository to have details and so
>>>>> on they can add it.
>>>>>
>>>>>
> Is it possible to scrape some of this info from github, gerrit, etc.?
> Perhaps portions of this could be automated to help with maintenance and to
> keep the information up-to-date.
>

--000000000000b502da0576409343
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">+1, I like the idea of having some form of automation to h=
elp with the maintenance of this information.</div><div class=3D"gmail_extr=
a"><br clear=3D"all"><div><div class=3D"gmail_signature" data-smartmail=3D"=
gmail_signature">----------<br>Nancy</div></div>
<br><div class=3D"gmail_quote">On Wed, Sep 19, 2018 at 11:45 AM, Bills, Jas=
on M <span dir=3D"ltr">&lt;<a href=3D"mailto:jason.m.bills@linux.intel.com"=
 target=3D"_blank">jason.m.bills@linux.intel.com</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><span class=3D""><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
The maintenance of it would be horrible for one<br>
person, but if someone wants their repository to have details and so<br>
on they can add it.<br>
<br>
</blockquote></blockquote></blockquote></blockquote>
<br></span>
Is it possible to scrape some of this info from github, gerrit, etc.? Perha=
ps portions of this could be automated to help with maintenance and to keep=
 the information up-to-date.<br>
</blockquote></div><br></div>

--000000000000b502da0576409343--
