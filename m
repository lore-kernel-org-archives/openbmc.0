Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::22f; helo=mail-qt0-x22f.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iAFBJqC4"; 
 dkim-atps=neutral
Received: from mail-qt0-x22f.google.com (mail-qt0-x22f.google.com
 [IPv6:2607:f8b0:400d:c0d::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41RhNt5m1BzF35t
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jul 2018 15:35:57 +1000 (AEST)
Received: by mail-qt0-x22f.google.com with SMTP id d4-v6so10678112qtn.13
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 22:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=OfvjHHSfI47m2Nyu5DLHfUfp5OUCH1x4u/4GeyQC35w=;
 b=iAFBJqC4DHSWvbNKht1rvdXmT3eHkT4D0Yf5ENXYGMLLbEF3Q14qk/r5L06vAF3pmu
 N17f3Yv49mas2XgkHbVfD6lg8d6pqkoOaBogz9OY0wiMSnyNCttyHYznFJGTsJceBTmS
 b2q2z2qRNKXPcZPc5wBhKHt9yTbSyfDzMIudJUqrd9IY9QjEGjHrzhIUcygSlDKL6svI
 OZApNzHrxwWDIYdJ7aFQPyu/nK/Eu0ZfJtlHE62m/n85gy6Gcl3A3wjwgsmZXVt+nUSj
 kwKNIsxP0io469GBUuh1XOJrkNNuEKjab4NxoXnGXr4n8PYiRB3z+HQDkAAmYcRnIQZw
 iYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=OfvjHHSfI47m2Nyu5DLHfUfp5OUCH1x4u/4GeyQC35w=;
 b=HOTMn0MB1WSRr+t7bGgbp/M/J0BuSXSza7+m/xf7U8OorskjnOw8LcHu/0+LCOcXpg
 b/Cu63xfAmJBd3EdL1CSGHHKaITWaiIUFkxExo7QHcWZGMdq2AKMTWgGrilFKZWzTaj3
 yNs678Rmp200PAlpQErVLgikIdPWnyavblP7dZghSydaE51pnWZNunU22D5iYlEH/ILY
 LISA8EJZBpYm4wFOM+NIpf/ZHlfPkjN1Q6+eaykJM6yHGObs13VAOPFd8ErdAQnIapiC
 O9kHp2E71BTytsGrlXzDejH0YhqgDOsM+svG72nbfC/e1G75GHj9QyF0GPozuVdqJjrG
 6r/w==
X-Gm-Message-State: AOUpUlFYxwrdtweZ7YjoHzoGM+ctrww+ebyRRtUItyHnosJWfH9u+8TR
 TX2JJXd8D8zNF6zVLJ++T+uby/nmVcRbBvIDlC4=
X-Google-Smtp-Source: AAOMgpe+8wa/paRkJwGvwhL3hi9znv62H09a4nwDStmU8HhC2Qgpb+RuVnEeeaSPCD6zU46qrAGOnRzACGDU4hQhWV0=
X-Received: by 2002:ac8:709:: with SMTP id g9-v6mr4565816qth.110.1531460155193; 
 Thu, 12 Jul 2018 22:35:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:26a7:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 22:35:54
 -0700 (PDT)
In-Reply-To: <7E9441B1E5EFFD4681F54958E821699345811F51@ORSMSX114.amr.corp.intel.com>
References: <CAG9c7cAqGU5gBkjOG7=Q+bdNDqqd3ALFi+GZwgWpGPN6YHn4dA@mail.gmail.com>
 <ab6d15cb-f965-3211-fbaa-6a734bf6eb70@linux.vnet.ibm.com>
 <CAG9c7cARHXbG2tByEjOONxmhy+wqsTLs-PuYk08qn-aFRN1fdw@mail.gmail.com>
 <CAG9c7cBVWo=SAS7-_gLbhGwcRxy3Gi=nFQWTMqW0B_YpH1QR9A@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E821699345811F51@ORSMSX114.amr.corp.intel.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Fri, 13 Jul 2018 13:35:54 +0800
Message-ID: <CAG9c7cBZFSEGaD+Ab3oKoq9_B6f08k6ENEj9eQt5FkOmtc_pEg@mail.gmail.com>
Subject: Re: IPMI and Redfish support in openbmc Linux
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000089bd850570dada35"
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
X-List-Received-Date: Fri, 13 Jul 2018 05:36:00 -0000

--00000000000089bd850570dada35
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Understood.

Thanks Ed's response.

2018-07-13 1:57 GMT+08:00 Tanous, Ed <ed.tanous@intel.com>:

> There have been quite a few changes to bmcweb in the last month, and some
> of the dependencies didn=E2=80=99t get synchronized like we expected them=
 to.
>
>
>
> The good news is that we=E2=80=99ve merged quite a few patches, including=
 a number
> of new Redfish schemas, as well as the patch that moves bmcweb over to
> sdbusplus and beast.  Moving forward, we are going to deprecate boost-dbu=
s,
> as sdbusplus now has a superset of functionality at this point in time.
> The error you=E2=80=99re seeing is caused by boost-dbus not being updated=
 to the
> interfaces used in boost 1.66, which was merged with the last yocto patch=
.
>
>
>
> The bad news is that some of the sdbusplus patches for adding unit tests
> and fixing bugs has caused product regressions, and are holding up the
> merge of the recipe bump.  Because of the order in which the recipes got
> merged into upstream, bmcweb builds require the below recipe bump for the
> moment.
>
>
>
> https://gerrit.openbmc-project.xyz/#/c/11456/
>
>
>
> Checking out that patchset should let you build bmcweb against tip, and
> we=E2=80=99ll work on getting the regression squashed and fixes merged in=
to
> mainline, hopefully shortly.
>
>
>
> -Ed
>
>
>
> *From:* Henbin Chang [mailto:henbinchang@gmail.com]
> *Sent:* Wednesday, July 11, 2018 10:55 PM
> *To:* OpenBMC Maillist <openbmc@lists.ozlabs.org>; Tanous, Ed <
> ed.tanous@intel.com>
> *Subject:* Re: IPMI and Redfish support in openbmc Linux
>
>
>
> Hi Ed,
>
>
>
> I upgraded my openbmc REPO with the Github and used the latest bmcweb
> (commit id: 7885954af734ae61a2e1358740f84ad39248f18d.)
>
>
>
> But I got the below error for compiling.
>
> ...
>
> 6: error: 'async_result_init' is not a member of 'boost::asio::detail'
>
>      boost::asio::detail::async_result_init<
>
>                           ^~~~~~~~~~~~~~~~~
>
> /common/code_ref/s2600wf_openbmc/openbmc/build/tmp/
> work/armv6-openbmc-linux-gnueabi/boost-dbus/1.0+
> gitAUTOINC+2ec8037525-r0/git/include/dbus/connection_service.hpp:84:26:
> note: suggested alternative: 'async_result_helper'
>
>      boost::asio::detail::async_result_init<
>
>                           ^~~~~~~~~~~~~~~~~
>
>                           async_result_helper
>
> /common/code_ref/s2600wf_openbmc/openbmc/build/tmp/
> work/armv6-openbmc-linux-gnueabi/boost-dbus/1.0+
> gitAUTOINC+2ec8037525-r0/git/include/dbus/connection_service.hpp:85:23:
> error: expected primary-expression before ',' token
>
>          MessageHandler, void(boost::system::error_code, message)>
>
>                        ^
>
> /common/code_ref/s2600wf_openbmc/openbmc/build/tmp/
> work/armv6-openbmc-linux-gnueabi/boost-dbus/1.0+
> gitAUTOINC+2ec8037525-r0/git/include/dbus/connection_service.hpp:85:25:
> error: expected primary-expression before 'void'
>
>          MessageHandler, void(boost::system::error_code, message)>
>
> ...
>
>
>
> Suppose this is because the boost-dbus is too old.
>
>
>
> Do you any suggestion?
>
>
>
> Thanks.
>
>
>
>
>
> 2018-07-12 8:05 GMT+08:00 Henbin Chang <henbinchang@gmail.com>:
>
> Thank your support.
>
>
>
> It did work after I used the default port 18080.
>
> curl -k https://10.99.241.79:18080/redfish/v1
>
>
>
> I had to indicate the account/password if I would like to access other
> node.
>
> curl -k https://root:0penBmc@10.99.241.79:18080/redfish/v1/Managers/
>
>
>
> Bmcweb will launch under one of two ports. If launched manually, it will
> launch under port 18080. If launched via systemd, it will use socket
> activation to launch under port 883 (to avoid conflicting with the existi=
ng
> phosphor-rest server). Another thing to recognize is that there is a debu=
g
> html interface built into the redfish interface, so the easiest way to te=
st
> is to use a web browser, and you will get the graphical interface with
> clickable links. Try pointing a web browser at https://10.99.241.79:18080=
/
> redfish/v1 and see if that works. PS, the trailing backslash is
> unimportant. Bmcweb is designed to strip the trailing backslash for you i=
n
> either case, so redfish/v1 is the same as redfish/v1/ -Ed
>
>
>
>
>
> 2018-07-10 16:39 GMT+08:00 Ratan Gupta <ratagupt@linux.vnet.ibm.com>:
>
> Hi Henbin,
>
> Can you try "curl -b cjar -k https://<ip>:18080/redfish/v1"?
>
> Seems default port is 18080
>
> https://github.com/openbmc/bmcweb/blob/master/src/webserver_main.cpp#L24
>
> Regards
>
> Ratan Gupta
>
>
>
>
>
> On Tuesday 10 July 2018 10:06 AM, Henbin Chang wrote:
>
> H Ed,
>
> I built bmcweb into my machine, and check the 'bmcweb' daemon was started
> up.
>
>
>
> ps aux | grep bmcweb
>
>   919 root       0:00 /usr/bin/bmcweb
>
>  8662 root       0:00 grep bmcweb
>
>
>
> But I couldn't access Redfish API through the below command.
>
> curl -b cjar -k https://10.99.241.79/redvish/v1/
>
>
>
> Could you help provide the suggestion?
>
>
>
> Thanks.
>
> -Henbin.
>
>
>
> There are several servers that support Redfish, and we have a working
> group that meets weekly to talk through technical issues each week, which
> you're welcome to attend. The only one checked into the upstream project =
is
> bmcweb. If you need help getting it started, I'm happy to help.
> https://github.com/openbmc/bmcweb
>
>
>
>
>
>
>
>
>

--00000000000089bd850570dada35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">

<div style=3D"font-size:small;text-decoration-style:initial;text-decoration=
-color:initial">Understood.</div><div style=3D"font-size:small;text-decorat=
ion-style:initial;text-decoration-color:initial"><br></div><span style=3D"f=
ont-size:small;text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">Thanks Ed&#39;s response.</span>=C2=A0</div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">2018-07-13 1:57 GMT+0=
8:00 Tanous, Ed <span dir=3D"ltr">&lt;<a href=3D"mailto:ed.tanous@intel.com=
" target=3D"_blank">ed.tanous@intel.com</a>&gt;</span>:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">There have been quite a few changes t=
o bmcweb in the last month, and some of the dependencies didn=E2=80=99t get=
 synchronized like we expected them to.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">The good news is that we=E2=80=99ve m=
erged quite a few patches, including a number of new Redfish schemas, as we=
ll as the patch that moves bmcweb over to sdbusplus and
 beast.=C2=A0 Moving forward, we are going to deprecate boost-dbus, as sdbu=
splus now has a superset of functionality at this point in time.=C2=A0 The =
error you=E2=80=99re seeing is caused by boost-dbus not being updated to th=
e interfaces used in boost 1.66, which was merged
 with the last yocto patch.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">The bad news is that some of the sdbu=
splus patches for adding unit tests and fixing bugs has caused product regr=
essions, and are holding up the merge of the recipe
 bump.=C2=A0 Because of the order in which the recipes got merged into upst=
ream, bmcweb builds require the below recipe bump for the moment.<u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><a href=3D"https://gerrit.openbmc-pro=
ject.xyz/#/c/11456/" target=3D"_blank">https://gerrit.openbmc-<wbr>project.=
xyz/#/c/11456/</a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">Checking out that patchset should let=
 you build bmcweb against tip, and we=E2=80=99ll work on getting the regres=
sion squashed and fixes merged into mainline, hopefully
 shortly.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">-Ed<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> Henbin Chang [mailto:<a href=
=3D"mailto:henbinchang@gmail.com" target=3D"_blank">henbinchang@gmail.com</=
a>]
<br>
<b>Sent:</b> Wednesday, July 11, 2018 10:55 PM<br>
<b>To:</b> OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org"=
 target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;; Tanous, Ed &lt;<a href=
=3D"mailto:ed.tanous@intel.com" target=3D"_blank">ed.tanous@intel.com</a>&g=
t;<br>
<b>Subject:</b> Re: IPMI and Redfish support in openbmc Linux<u></u><u></u>=
</span></p>
</div>
</div><div><div class=3D"h5">
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">Hi Ed,<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I upgraded my openbmc REPO with the Github and used =
the latest bmcweb (commit id:
<span style=3D"font-size:9.0pt;font-family:Consolas;color:#444d56;backgroun=
d:white">
7885954af734ae61a2e1358740f84a<wbr>d39248f18d.</span>)<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">But I got the below error for compiling.<u></u><u></=
u></p>
</div>
<div>
<p class=3D"MsoNormal">...<u></u><u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">6: error: &#39;async_result_init&#39; is not a membe=
r of &#39;boost::asio::detail&#39;<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0boost::asio::detail::async_<wbr>=
result_init&lt;<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">/common/code_ref/s2600wf_<wbr>openbmc/openbmc/build/=
tmp/<wbr>work/armv6-openbmc-linux-<wbr>gnueabi/boost-dbus/1.0+<wbr>gitAUTOI=
NC+2ec8037525-r0/git/<wbr>include/dbus/connection_<wbr>service.hpp:84:26: n=
ote: suggested alternative: &#39;async_result_helper&#39;<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0boost::asio::detail::async_<wbr>=
result_init&lt;<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 async_result_helper<u></u><u></u></p=
>
</div>
<div>
<p class=3D"MsoNormal">/common/code_ref/s2600wf_<wbr>openbmc/openbmc/build/=
tmp/<wbr>work/armv6-openbmc-linux-<wbr>gnueabi/boost-dbus/1.0+<wbr>gitAUTOI=
NC+2ec8037525-r0/git/<wbr>include/dbus/connection_<wbr>service.hpp:85:23: e=
rror: expected primary-expression before &#39;,&#39; token<u></u><u></u></p=
>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MessageHandler, vo=
id(boost::system::error_<wbr>code, message)&gt;<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">/common/code_ref/s2600wf_<wbr>openbmc/openbmc/build/=
tmp/<wbr>work/armv6-openbmc-linux-<wbr>gnueabi/boost-dbus/1.0+<wbr>gitAUTOI=
NC+2ec8037525-r0/git/<wbr>include/dbus/connection_<wbr>service.hpp:85:25: e=
rror: expected primary-expression before &#39;void&#39;<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MessageHandler, vo=
id(boost::system::error_<wbr>code, message)&gt;<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal">...<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Suppose this is because the boost-dbus is too old.<u=
></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Do you any suggestion?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">2018-07-12 8:05 GMT+08:00 Henbin Chang &lt;<a href=
=3D"mailto:henbinchang@gmail.com" target=3D"_blank">henbinchang@gmail.com</=
a>&gt;:<u></u><u></u></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<div>
<p class=3D"MsoNormal">Thank your support.<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">It did work after I used the default port 18080.<u><=
/u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">curl -k <a href=3D"https://10.99.241.79:18080/redfis=
h/v1" target=3D"_blank">
https://10.99.241.79:18080/<wbr>redfish/v1</a><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I had to indicate the account/password if I would li=
ke to access other node.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"background:white">curl -k <a href=3D"=
https://root:0penBmc@10.99.241.79:18080/redfish/v1/Managers/" target=3D"_bl=
ank">
https://root:0penBmc@10.99.<wbr>241.79:18080/redfish/v1/<wbr>Managers/</a><=
/span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal">Bmcweb will launch under one of two ports. If launch=
ed manually, it will launch under port 18080. If launched via systemd, it w=
ill use socket activation to launch under port 883 (to avoid conflicting wi=
th the existing phosphor-rest server).
 Another thing to recognize is that there is a debug html interface built i=
nto the redfish interface, so the easiest way to test is to use a web brows=
er, and you will get the graphical interface with clickable links. Try poin=
ting a web browser at
<a href=3D"https://10.99.241.79:18080/redfish/v1" target=3D"_blank">https:/=
/10.99.241.79:18080/<wbr>redfish/v1</a> and see if that works. PS, the trai=
ling backslash is unimportant. Bmcweb is designed to strip the trailing bac=
kslash for you in either case, so redfish/v1
 is the same as redfish/v1/ -Ed<u></u><u></u></p>
</blockquote>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
<div>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">2018-07-10 16:39 GMT+08:00 Ratan Gupta &lt;<a href=
=3D"mailto:ratagupt@linux.vnet.ibm.com" target=3D"_blank">ratagupt@linux.vn=
et.ibm.com</a>&gt;:<u></u><u></u></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<div>
<p>Hi Henbin,<u></u><u></u></p>
<p>Can you try <span style=3D"font-size:10.5pt;font-family:&quot;Arial&quot=
;,sans-serif;color:#454545;background:white">
&quot;curl -b cjar -k <a href=3D"https://%3cip%3e:18080/redfish/v1" target=
=3D"_blank">https://&lt;ip&gt;:18080/redfish/v1</a>&quot;<wbr>?</span><u></=
u><u></u></p>
<p>Seems default port is 18080<u></u><u></u></p>
<p><a href=3D"https://github.com/openbmc/bmcweb/blob/master/src/webserver_m=
ain.cpp#L24" target=3D"_blank">https://github.com/openbmc/<wbr>bmcweb/blob/=
master/src/<wbr>webserver_main.cpp#L24</a><u></u><u></u></p>
<p>Regards<u></u><u></u></p>
<p><span style=3D"color:#888888">Ratan Gupta<u></u><u></u></span></p>
<div>
<div>
<p><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">On Tuesday 10 July 2018 10:06 AM, Henbin Chang wrote=
:<u></u><u></u></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<div>
<p class=3D"MsoNormal">H Ed, <u></u><u></u></p>
<div>
<p class=3D"MsoNormal">I built bmcweb into my machine, and check the &#39;b=
mcweb&#39; daemon was started up.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">ps aux | grep bmcweb<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 919 root=C2=A0 =C2=A0 =C2=A0 =C2=A00:00 /usr/=
bin/bmcweb<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A08662 root=C2=A0 =C2=A0 =C2=A0 =C2=A00:00 grep =
bmcweb<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">But I couldn&#39;t access Redfish API through the be=
low command.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">curl -b cjar -k <a href=3D"https://10.99.241.79/redv=
ish/v1/" target=3D"_blank">
https://10.99.241.79/redvish/<wbr>v1/</a><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Could you help provide the suggestion?<u></u><u></u>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">-Henbin.<u></u><u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal">There are several servers that support Redfish, and =
we have a working group that meets weekly to talk through technical issues =
each week, which you&#39;re welcome to attend. The only one checked into th=
e upstream project is bmcweb. If you need
 help getting it started, I&#39;m happy to help.<br>
<a href=3D"https://github.com/openbmc/bmcweb" target=3D"_blank">https://git=
hub.com/openbmc/<wbr>bmcweb</a><u></u><u></u></p>
</blockquote>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
</div>
</blockquote>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div></div></div>
</div>
</div>

</blockquote></div><br></div>

--00000000000089bd850570dada35--
