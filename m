Return-Path: <osk@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kI2QpmnY"; 
 dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 434GCx21GgzDqjL
 for <openbmc@lists.ozlabs.org>; Wed, 28 Nov 2018 07:51:24 +1100 (AEDT)
Received: by mail-wm1-x32f.google.com with SMTP id g67so397667wmd.2
 for <openbmc@lists.ozlabs.org>; Tue, 27 Nov 2018 12:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3FSwEmBau6Kpg/AG0wK2b04GqzS1uvBfrz5mcP2e3bI=;
 b=kI2QpmnYhkc4kWYT1LM4mi6p0pgyGzjgARp8fXKjifvtyqNxeqeGxUE77tv5VhaDOl
 NWlH8vUGHEkskCavAAveAg5YX5f7/QcLteB6Z9IVf7YC6serZGe/IUqTo3N2Osg6UfzN
 Z55NBe1Ruw7Lnrt0rZRWFEVAs9fiF9J5X4d1Z4+sro5pKQs6Sp+1NcFrZzIzfbVUoo6q
 f7ljM3T7luMKNEVFu5/N/mH6HyQGKAQCEmSmo533NpSOQV9CaCEUJ1Kprw3NQ15PzI+C
 +Q2rvse7UKGp54JAEPO7yW8jvjJqqVdXNiuT+sN3UesJRNgLKmLhmhMXZUcRWsbLayve
 RxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3FSwEmBau6Kpg/AG0wK2b04GqzS1uvBfrz5mcP2e3bI=;
 b=l3AACSmnONJ2OVFedDtcTkPch0stl9cdPz58Oznbi3mNX2qNLK6zXKPf86nZL7+xyr
 X4k+/0acd33nrjLANS+JulsEGsPHteb838R8FGEGm+bqvF7VHBbCZcAcdOCWE95oI0Yw
 CsgShB060OTPrdY6dzIgxxz5VXbcPNtc0K2wmPsEijFi+ogOptCfC/cNWPReAtS3LHnL
 Ue2uWBz/sfYhxt2xghlDL91nqGglf/T+9ahlP/1TftQet5x4/6M9YHtgl0MeHu3TOt3C
 teC5bYTF+Tg/28Ya45rr9QHtFZBdADK1qlm5SIQ2YxVqmhMzvUIbm+4wI6U1f+jsKXp0
 U2Yw==
X-Gm-Message-State: AA+aEWbSFcMsS1AF4jlb6X3qb+VNFyseAMW26q7QQGS1+XGDnYBZcsxB
 YZ6St0NYBNctV1Ba2srD8Lx7hwqRCn5ilJH+eajvVg==
X-Google-Smtp-Source: AFSGD/WLRc7NUCVv1tBq93SqlVEB31ZcyVzuG13hjbj99PB45Nm0zMRnr8gtbVJCv0PIjMCN8Zaw1+OpjWIZm3cionI=
X-Received: by 2002:a1c:6382:: with SMTP id
 x124-v6mr367968wmb.145.1543351881103; 
 Tue, 27 Nov 2018 12:51:21 -0800 (PST)
MIME-Version: 1.0
References: <CABoTLcSpcTKHJu5xwWx4TQr1_5FjLvb9QsOAYQhCfMaQwQ5qug@mail.gmail.com>
 <1bf30dfc-cc55-649d-3b0a-1cf29355daf9@intel.com>
 <d372150746d3f52901cbff4a4d422357d6f00676.camel@fuzziesquirrel.com>
 <610D7954-EAF3-4CB7-9B4B-7A067DA8E8B5@fb.com>
In-Reply-To: <610D7954-EAF3-4CB7-9B4B-7A067DA8E8B5@fb.com>
From: Oskar Senft <osk@google.com>
Date: Tue, 27 Nov 2018 15:51:09 -0500
Message-ID: <CABoTLcTqqsVdeMBb7n0DWcj3LbqN3Tx14Mr4FtrVuWBo8tw3Vw@mail.gmail.com>
Subject: Re: Submit board schematics to OpenBMC docs repo
To: sdasari@fb.com
Cc: bradleyb@fuzziesquirrel.com, ed.tanous@intel.com, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000a3a49a057bab9c33"
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
X-List-Received-Date: Tue, 27 Nov 2018 20:51:26 -0000

--000000000000a3a49a057bab9c33
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks everyone, that makes sense!

Oskar.

On Tue, Nov 27, 2018 at 2:57 PM Sai Dasari <sdasari@fb.com> wrote:

>
>
> =EF=BB=BFOn 11/26/18, 10:58 AM, "openbmc on behalf of Brad Bishop"
> <openbmc-bounces+sdasari=3Dfb.com@lists.ozlabs.org on behalf of
> bradleyb@fuzziesquirrel.com> wrote:
>
>     On Fri, 2018-11-16 at 14:26 -0800, Ed Tanous wrote:
>     > On 11/16/18 11:58 AM, Oskar Senft wrote:
>     > > Is there a good place in OpenBMC to post that? Maybe the docs rep=
o?
>     > > It's 4 PDF files with < 10 MiB in total. Having this information
>     > > publicly posted by them would make development much easier.
>     >
>     > One thing I wonder is whether or not we (the OpenBMC project) wants
>     > to
>     > be in the business of hosting hardware schematics.  It feels a litt=
le
>     > bit out of our wheelhouse.  It seems like a much better thing for a=
n
>     > organization like OCP to manage, who deals in a lot of open physica=
l
>     > hardware, and understands the licenses and subtleties around hostin=
g
>     > that kind of documentation.
>     >
>     > For example, is the company planning on releasing the schematics wi=
th
>     > a
>     > creative commons, Apache, or MIT license?  I have no idea the
>     > subtleties
>     > of that when it comes to hardware schematics, but maybe someone els=
e
>     > does?  Does posting the schematics with that license open the
>     > possibility of someone copying the hardware?
>     >
>     > Maybe it makes more sense to post it somewhere outside the OpenBMC
>     > project (the companies website perhaps) then post a link to it to t=
he
>     > mailing list?
>     >
>     > I'm mostly just thinking out loud at this point.
>     >
>     >
>     >
>     > As far as where we put it if we do decide to host it, I don't think=
 a
>     > git repo is the right choice.  Schematics aren't likely to be sourc=
e
>     > controlled (given that they're going to be board files and PDFs, no=
t
>     > editable schematics) so some kind of file drop seems like a better
>     > choice than the docs repository.
>     >
>
>     fwiw I  agree with Ed on all points here...
>
>  @Oskar Senft Based on this recommendation, I think it would be good to
> host schematics outside the github and provide a softlink as a reference.
>
>
>

--000000000000a3a49a057bab9c33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks everyone, that makes sense!<div><br></div><div>Oska=
r.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, Nov 2=
7, 2018 at 2:57 PM Sai Dasari &lt;<a href=3D"mailto:sdasari@fb.com">sdasari=
@fb.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
=EF=BB=BFOn 11/26/18, 10:58 AM, &quot;openbmc on behalf of Brad Bishop&quot=
; &lt;openbmc-bounces+sdasari=3D<a href=3D"mailto:fb.com@lists.ozlabs.org" =
target=3D"_blank">fb.com@lists.ozlabs.org</a> on behalf of <a href=3D"mailt=
o:bradleyb@fuzziesquirrel.com" target=3D"_blank">bradleyb@fuzziesquirrel.co=
m</a>&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 On Fri, 2018-11-16 at 14:26 -0800, Ed Tanous wrote:<br>
=C2=A0 =C2=A0 &gt; On 11/16/18 11:58 AM, Oskar Senft wrote:<br>
=C2=A0 =C2=A0 &gt; &gt; Is there a good place in OpenBMC to post that? Mayb=
e the docs repo?<br>
=C2=A0 =C2=A0 &gt; &gt; It&#39;s 4 PDF files with &lt; 10 MiB in total. Hav=
ing this information<br>
=C2=A0 =C2=A0 &gt; &gt; publicly posted by them would make development much=
 easier.<br>
=C2=A0 =C2=A0 &gt; <br>
=C2=A0 =C2=A0 &gt; One thing I wonder is whether or not we (the OpenBMC pro=
ject) wants<br>
=C2=A0 =C2=A0 &gt; to<br>
=C2=A0 =C2=A0 &gt; be in the business of hosting hardware schematics.=C2=A0=
 It feels a little<br>
=C2=A0 =C2=A0 &gt; bit out of our wheelhouse.=C2=A0 It seems like a much be=
tter thing for an<br>
=C2=A0 =C2=A0 &gt; organization like OCP to manage, who deals in a lot of o=
pen physical<br>
=C2=A0 =C2=A0 &gt; hardware, and understands the licenses and subtleties ar=
ound hosting<br>
=C2=A0 =C2=A0 &gt; that kind of documentation.<br>
=C2=A0 =C2=A0 &gt; <br>
=C2=A0 =C2=A0 &gt; For example, is the company planning on releasing the sc=
hematics with<br>
=C2=A0 =C2=A0 &gt; a<br>
=C2=A0 =C2=A0 &gt; creative commons, Apache, or MIT license?=C2=A0 I have n=
o idea the<br>
=C2=A0 =C2=A0 &gt; subtleties<br>
=C2=A0 =C2=A0 &gt; of that when it comes to hardware schematics, but maybe =
someone else<br>
=C2=A0 =C2=A0 &gt; does?=C2=A0 Does posting the schematics with that licens=
e open the<br>
=C2=A0 =C2=A0 &gt; possibility of someone copying the hardware?<br>
=C2=A0 =C2=A0 &gt; <br>
=C2=A0 =C2=A0 &gt; Maybe it makes more sense to post it somewhere outside t=
he OpenBMC<br>
=C2=A0 =C2=A0 &gt; project (the companies website perhaps) then post a link=
 to it to the<br>
=C2=A0 =C2=A0 &gt; mailing list?<br>
=C2=A0 =C2=A0 &gt; <br>
=C2=A0 =C2=A0 &gt; I&#39;m mostly just thinking out loud at this point.<br>
=C2=A0 =C2=A0 &gt; <br>
=C2=A0 =C2=A0 &gt; <br>
=C2=A0 =C2=A0 &gt; <br>
=C2=A0 =C2=A0 &gt; As far as where we put it if we do decide to host it, I =
don&#39;t think a<br>
=C2=A0 =C2=A0 &gt; git repo is the right choice.=C2=A0 Schematics aren&#39;=
t likely to be source<br>
=C2=A0 =C2=A0 &gt; controlled (given that they&#39;re going to be board fil=
es and PDFs, not<br>
=C2=A0 =C2=A0 &gt; editable schematics) so some kind of file drop seems lik=
e a better<br>
=C2=A0 =C2=A0 &gt; choice than the docs repository.<br>
=C2=A0 =C2=A0 &gt; <br>
<br>
=C2=A0 =C2=A0 fwiw I=C2=A0 agree with Ed on all points here...<br>
<br>
=C2=A0@Oskar Senft Based on this recommendation, I think it would be good t=
o host schematics outside the github and provide a softlink as a reference.=
 <br>
<br>
<br>
</blockquote></div>

--000000000000a3a49a057bab9c33--
