Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::230; helo=mail-qt0-x230.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YgE2QyU0"; 
 dkim-atps=neutral
Received: from mail-qt0-x230.google.com (mail-qt0-x230.google.com
 [IPv6:2607:f8b0:400d:c0d::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41pdw71BybzF0Qs
 for <openbmc@lists.ozlabs.org>; Mon, 13 Aug 2018 11:50:14 +1000 (AEST)
Received: by mail-qt0-x230.google.com with SMTP id w26-v6so15901271qto.5
 for <openbmc@lists.ozlabs.org>; Sun, 12 Aug 2018 18:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=CjAIdypNptn6kJL2Cf3zsUY4JD5qulb4I60EYh3FHQA=;
 b=YgE2QyU0vEasA0Pg682BAgk2co/l3yJqyvdBltn7Qu+NMnDCZ8CFxm2cPNZWHctTef
 HRPZVou/J50MPPRsA3kMiOUtCyAx2YgMviiG4xV0r9lO0GkGQ43fQ4v0Di2B0Vox53dN
 bG1qk6jNBBmyv8+tTI4XNzqduJ0uv9qQqulXWwIXA2fke3QhuQb+M3D5cbiCh86DAq7v
 K09LW3SXI5WKBWWEmbix7iazHnOQjj8EO7PEDP3I+g24sCE0LlGB5CK2BWSDPAZLk5Xs
 Epbhviv4fR+C7kbgINiycbIcgVqeRHZ5YlMqq/zGwsGd3EiXfyjFe1WrbA9ULl/NLKVK
 KWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=CjAIdypNptn6kJL2Cf3zsUY4JD5qulb4I60EYh3FHQA=;
 b=jwJxSbpPaBz5qC3dXdajupwBbpcgI2gz6wiBsKrUVn/FzypxrTRNvgP1cuj0kzIogA
 x9193HsZljjLKInsqSjlFudvVPoDgYdL8pM2nOtA8i3rQbFwWzcR0XmBJVq/OFf1N70p
 jkx0hms4VKNEwX/aMfITW+sWgM8NK4WPgaGGcyVFIEZXi3+Matt0QC7FHA1bEJAvy9rK
 6MZBCWBxpZG6+TOU/Peqpth+td2zWaS0S0TnZPT9pCgU0XkNVb96PrNUXdP0o+rO3V1L
 iQr7yN9ZQJgDbO8JyJGWtalUU7iwWV5wCLOY+KLjAtCqTp1iz5ss24dxT3XFhE3+e5ie
 g47A==
X-Gm-Message-State: AOUpUlE7kFP2EFo435nVkr0Q1wg5EUmMHCxsGoz6ljTERsiCf55vdmGD
 mWdMQcx1aGttNBhQXP2U3EeDDIxprMthHhQ92vg=
X-Google-Smtp-Source: AA+uWPxseLpP83mFmtwaFFGMEJSMg1KyMXjt2ctFqjIunIohQ/8MXrJpnUeSYgijtfzOCGpkwYjIpmSkNkytmS44PVU=
X-Received: by 2002:a0c:ae17:: with SMTP id
 y23-v6mr13712694qvc.157.1534125011916; 
 Sun, 12 Aug 2018 18:50:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:26a7:0:0:0:0:0 with HTTP; Sun, 12 Aug 2018 18:50:10
 -0700 (PDT)
In-Reply-To: <1534120584.257240.1471848920.37585ACD@webmail.messagingengine.com>
References: <CAG9c7cAk-B=cSwWz3373eywPud3mQdBKCBMwb_iwuCcAwX9Udw@mail.gmail.com>
 <CACPK8Xf1bDR_vPSDF7p1qW1cGjmjmRXSe2qdei9YMjKtqRHL8Q@mail.gmail.com>
 <CAG9c7cB7sNDGX+o4x4BXxNgw=H6uk=NDzjSnfn9xH+1k=+DT9w@mail.gmail.com>
 <1534120584.257240.1471848920.37585ACD@webmail.messagingengine.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Mon, 13 Aug 2018 09:50:10 +0800
Message-ID: <CAG9c7cDCbbDcJpnXoNfW6OO=DMF6KCRCOQWSAy+iUqLv-7COHg@mail.gmail.com>
Subject: Re: Patch files not apply while devtool modify linux-aspeed
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, Adriana Kobylak <anoo@linux.vnet.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="000000000000605ca105734750b7"
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
X-List-Received-Date: Mon, 13 Aug 2018 01:50:16 -0000

--000000000000605ca105734750b7
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,
Thanks for your response.

It's really missing from the DTS.

I met the issue after upgrading to Yocto 2.5.
The devtool worked well previously.

I tried other recipe, e.g. 'devtool modify u-boot-aspeed'
I could see the commits as expected.

-Henbin

2018-08-13 8:36 GMT+08:00 Andrew Jeffery <andrew@aj.id.au>:

> Hi Henbin,
>
> On Fri, 10 Aug 2018, at 11:09, Henbin Chang wrote:
> > Thanks Joel.
> >
> > The issue could be duplicated following the steps in the romulus machine.
> >
> > 1. 'devtool modify linux-aspeed'
> > 2. 'cd workspace/sources/linux-aspeed/' and edit
> > 'arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts'
> > 3. 'git add -A' and 'git commit -m 'Test modify dts' '
> > 4. go to build directory and 'devtool update-recipe -m patch -a
> > ../meta-openbmc-machines/meta-openpower/meta-ibm/meta-romulus/ linux-
> > aspeed'
> > 5. Confirm the below files are generated.
> > meta-openbmc-machines/meta-openpower/meta-ibm/meta-romulus/recipes-
> > kernel/linux/linux-aspeed/0001-Test-modify-dts.patch
> > meta-openbmc-machines/meta-openpower/meta-ibm/meta-romulus/recipes-
> > kernel/linux/linux-aspeed_git.bbappend
> > 6. 'devtool reset linux-aspeed' and remove ' workspace/sources/linux-
> > aspeed/
> > '
> > 7. 'devtool modify linux-aspeed' again
> > 8. 'cd workspace/sources/linux-aspeed/ ' and the commit with the 'Test
> > modify dts' message not found while 'git log'
> > 9. 'git branch'
> >   dev
> >   dev-4.10
> >   dev-4.13
> >   dev-4.17
> >   dev-4.3
> >   dev-4.4
> >   dev-4.6
> >   dev-4.7
> > * devtool
> >   devtool-no-overrides
> >   devtool-override-df-obmc-ubi-fs
> >   master
> > 10. 'git checkout dev-4.17' and 'git log'
> >
> > commit 2310638091e7b4dd97014f1b373a9ba111ac4e58
> > Author: Henbin.Chang <henbin-chang@mic.com.tw>
> > Date:   Thu Aug 9 16:15:48 2018 +0800
> >
> >     Test modify dts
> >
> > I had no idea why the patch was not applied in the 'devtool' branch.
>
> My understanding of devtool isn't great, however if you patch the
> source this way I'm somewhat confident it _doesn't_ do a `git am`
> to commit the patch, rather it just uses patch(1) to modify the source
> in-place. As such you'll just have a dirty working tree, not modified
> history.
>
> Is the actual change missing from the DTS?
>
> Cheers,
>
> Andrew
>

--000000000000605ca105734750b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Andrew,<div>Thanks for your response.</div><div><br></d=
iv><div>It&#39;s really missing from the DTS.</div><div><br></div><div>I me=
t the issue after upgrading to Yocto 2.5.</div><div>The devtool worked well=
 previously.<br></div><div><br></div><div>I tried other recipe, e.g. &#39;d=
evtool modify u-boot-aspeed&#39;</div><div>I could see the commits as expec=
ted.</div><div><br></div><div>-Henbin</div></div><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">2018-08-13 8:36 GMT+08:00 Andrew Jeffery <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:andrew@aj.id.au" target=3D"_blank">an=
drew@aj.id.au</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Henbin,<=
br>
<div><div class=3D"h5"><br>
On Fri, 10 Aug 2018, at 11:09, Henbin Chang wrote:<br>
&gt; Thanks Joel.<br>
&gt; <br>
&gt; The issue could be duplicated following the steps in the romulus machi=
ne.<br>
&gt; <br>
&gt; 1. &#39;devtool modify linux-aspeed&#39;<br>
&gt; 2. &#39;cd workspace/sources/linux-<wbr>aspeed/&#39; and edit<br>
&gt; &#39;arch/arm/boot/dts/aspeed-bmc-<wbr>opp-romulus.dts&#39;<br>
&gt; 3. &#39;git add -A&#39; and &#39;git commit -m &#39;Test modify dts&#3=
9; &#39;<br>
&gt; 4. go to build directory and &#39;devtool update-recipe -m patch -a<br=
>
&gt; ../meta-openbmc-machines/meta-<wbr>openpower/meta-ibm/meta-<wbr>romulu=
s/ linux-<br>
&gt; aspeed&#39;<br>
&gt; 5. Confirm the below files are generated.<br>
&gt; meta-openbmc-machines/meta-<wbr>openpower/meta-ibm/meta-<wbr>romulus/r=
ecipes-<br>
&gt; kernel/linux/linux-aspeed/<wbr>0001-Test-modify-dts.patch<br>
&gt; meta-openbmc-machines/meta-<wbr>openpower/meta-ibm/meta-<wbr>romulus/r=
ecipes-<br>
&gt; kernel/linux/linux-aspeed_git.<wbr>bbappend<br>
&gt; 6. &#39;devtool reset linux-aspeed&#39; and remove &#39; workspace/sou=
rces/linux-<br>
&gt; aspeed/<br>
&gt; &#39;<br>
&gt; 7. &#39;devtool modify linux-aspeed&#39; again<br>
&gt; 8. &#39;cd workspace/sources/linux-<wbr>aspeed/ &#39; and the commit w=
ith the &#39;Test<br>
&gt; modify dts&#39; message not found while &#39;git log&#39;<br>
&gt; 9. &#39;git branch&#39;<br>
&gt;=C2=A0 =C2=A0dev<br>
&gt;=C2=A0 =C2=A0dev-4.10<br>
&gt;=C2=A0 =C2=A0dev-4.13<br>
&gt;=C2=A0 =C2=A0dev-4.17<br>
&gt;=C2=A0 =C2=A0dev-4.3<br>
&gt;=C2=A0 =C2=A0dev-4.4<br>
&gt;=C2=A0 =C2=A0dev-4.6<br>
&gt;=C2=A0 =C2=A0dev-4.7<br>
&gt; * devtool<br>
&gt;=C2=A0 =C2=A0devtool-no-overrides<br>
&gt;=C2=A0 =C2=A0devtool-override-df-obmc-ubi-<wbr>fs<br>
&gt;=C2=A0 =C2=A0master<br>
&gt; 10. &#39;git checkout dev-4.17&#39; and &#39;git log&#39;<br>
&gt; <br>
&gt; commit 2310638091e7b4dd97014f1b373a9b<wbr>a111ac4e58<br>
&gt; Author: Henbin.Chang &lt;<a href=3D"mailto:henbin-chang@mic.com.tw">he=
nbin-chang@mic.com.tw</a>&gt;<br>
&gt; Date:=C2=A0 =C2=A0Thu Aug 9 16:15:48 2018 +0800<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Test modify dts<br>
&gt; <br>
&gt; I had no idea why the patch was not applied in the &#39;devtool&#39; b=
ranch.<br>
<br>
</div></div>My understanding of devtool isn&#39;t great, however if you pat=
ch the<br>
source this way I&#39;m somewhat confident it _doesn&#39;t_ do a `git am`<b=
r>
to commit the patch, rather it just uses patch(1) to modify the source<br>
in-place. As such you&#39;ll just have a dirty working tree, not modified<b=
r>
history.<br>
<br>
Is the actual change missing from the DTS?<br>
<br>
Cheers,<br>
<br>
Andrew<br>
</blockquote></div><br></div>

--000000000000605ca105734750b7--
