Return-Path: <ojayanth@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400c:c08::22e; helo=mail-ua0-x22e.google.com;
 envelope-from=ojayanth@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VG4RsNcG"; 
 dkim-atps=neutral
Received: from mail-ua0-x22e.google.com (mail-ua0-x22e.google.com
 [IPv6:2607:f8b0:400c:c08::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lrH61GZxzDqhV;
 Wed,  8 Aug 2018 22:26:57 +1000 (AEST)
Received: by mail-ua0-x22e.google.com with SMTP id g18-v6so2106300uam.6;
 Wed, 08 Aug 2018 05:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TbmwLNXW2+LKXrJmp9aauDh8loDmujCgAVGOyVVfJcM=;
 b=VG4RsNcGobXRprQFTBhBUzuuHicE7voQOATGYmujmko5H6UTqVkZEf0WxeWrJllEhF
 W6rOgyo/eCuippeFOgLQCmZbtIwIZtUwv302ZLY8MfF6K82mbqMzQSAuQ8Wk9ZdySdyv
 5HfgmfLrNeCQleXzs+6+dZtEu0P5hwXV3EsrowyFz5ggju8WbfHk9jXgS1vUGx8tSOdV
 aW2E/H9adXwvjsHTx122KDlAJgr/X30gwR7WHxsHZYmiTSO0vMFmqjKTdfAgm7vChYi9
 NkNAtgaltOBz/oLCWz2eTl7BbFCHd85FopyqAl+FrCvnQcUXvPfx5E6jc9GrQCoGRoX5
 J6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TbmwLNXW2+LKXrJmp9aauDh8loDmujCgAVGOyVVfJcM=;
 b=UXyZKhj7CmJwXOL2Z0kv+JD3TYa7hfa34raL0vRUrnQugg2UGUApwjg3U+l4CjL1vu
 N8qe+2SDwBU7DvzEihCc59OveeBj0+IyEb7GidZBhPLt8jCTQJCSWK40C4iStvK78ABR
 JVv3ubAfxwzdeILrimIwsbWjCUTNlEi6hfOK/l09vr7+OVVHQIBuQ3aza4yYmjmW1Fo+
 9CNAK9YO0k4zcs5hsY64orzoadW7u6MzAPYmPa0+QDurIHL7w/m1JB9sPUZnYxR31PhU
 yBZbtLh7lnjkvhs3JLH6XvDDjZJG4F/0R/kkERvfVetUPgrrIUtBUR3S9iA+pSNHKR9d
 x7Xw==
X-Gm-Message-State: AOUpUlFXIVdIxtTbz5L3V2wa2PPl9Gp6sGR+28YXaBW28GwAEC13M823
 WSZShRBkT7y8bwDvMTTDYVpcWmPwAjhtLcvm9IQ=
X-Google-Smtp-Source: AA+uWPw3W2Y7aD2hdEBI9OvpDnHGv4UKIeghWWUjS6P7TFuJNmf6DgWIIBLqeLzMJ4z5SKT8s1/cXZtpxq4IXew4ldM=
X-Received: by 2002:ab0:18a0:: with SMTP id
 t32-v6mr1780020uag.110.1533731214864; 
 Wed, 08 Aug 2018 05:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <CACkAXSrxyf819dQc+LEOfwahpcrK2QRH1AkXump-D9Ae+yaKBQ@mail.gmail.com>
 <1d63a4ec-1902-c9d3-13d8-94ef7e437425@intel.com>
 <OF7222EE1F.6CAFD8F2-ON652582DC.00462B53-652582DC.0047E9DE@notes.na.collabserv.com>
 <26322a4a-9668-880c-52e4-b50f8a49e558@intel.com>
In-Reply-To: <26322a4a-9668-880c-52e4-b50f8a49e558@intel.com>
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Wed, 8 Aug 2018 17:56:42 +0530
Message-ID: <CACkAXSrsm0CFZaH9JWvTEpcZP=78-r_1XN01jHFfCZF=kwhrDw@mail.gmail.com>
Subject: Re: SSL Certificate management proposal.
To: ed.tanous@intel.com
Cc: hramasub@in.ibm.com, bradleyb@fuzziesquirrel.com, openbmc@lists.ozlabs.org,
 openbmc-bounces+hramasub=in.ibm.com@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000003e39680572eba03c"
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
X-List-Received-Date: Wed, 08 Aug 2018 12:26:59 -0000

--0000000000003e39680572eba03c
Content-Type: text/plain; charset="UTF-8"

Initial version of certificate management design document is available for
review.
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/11840/1/xyz/openbmc_project/Certificate/README.md

On Wed, Aug 1, 2018 at 10:19 PM Ed Tanous <ed.tanous@intel.com> wrote:

> On 08/01/2018 06:05 AM, Hariharasubramanian Ramasubramanian wrote:
> >
> >  > Third, it requires that every BMC be provisioned by the intermediate
> >  > authority, which can be difficult if keys either have a cost
> associated
> >  > with them, or are difficult to acquire.
> > The cost considerations could potentially be different for Enterprise
> > class servers and servers deployed on the cloud ? I presume enterprises
> > would favour security to cost.
> >
>
> Varies greatly between organizations, and how they manage their threat
> model.  I think that we should support both.
>

--0000000000003e39680572eba03c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Initial version of certificate management design docum=
ent is available for review. <br><a href=3D"https://gerrit.openbmc-project.=
xyz/#/c/openbmc/phosphor-dbus-interfaces/+/11840/1/xyz/openbmc_project/Cert=
ificate/README.md">https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-=
dbus-interfaces/+/11840/1/xyz/openbmc_project/Certificate/README.md</a><br>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Aug 1, 2018 a=
t 10:19 PM Ed Tanous &lt;<a href=3D"mailto:ed.tanous@intel.com">ed.tanous@i=
ntel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 08/01/20=
18 06:05 AM, Hariharasubramanian Ramasubramanian wrote:<br>
&gt; <br>
&gt;=C2=A0 &gt; Third, it requires that every BMC be provisioned by the int=
ermediate<br>
&gt;=C2=A0 &gt; authority, which can be difficult if keys either have a cos=
t associated<br>
&gt;=C2=A0 &gt; with them, or are difficult to acquire.<br>
&gt; The cost considerations could potentially be different for Enterprise =
<br>
&gt; class servers and servers deployed on the cloud ? I presume enterprise=
s <br>
&gt; would favour security to cost.<br>
&gt; <br>
<br>
Varies greatly between organizations, and how they manage their threat <br>
model.=C2=A0 I think that we should support both.<br>
</blockquote></div>

--0000000000003e39680572eba03c--
