Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:400c:c0c::22e; helo=mail-wr0-x22e.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="FIRaPm8Q"; 
 dkim-atps=neutral
Received: from mail-wr0-x22e.google.com (mail-wr0-x22e.google.com
 [IPv6:2a00:1450:400c:c0c::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 404gHd0KKvzF1cW
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 02:40:12 +1100 (AEDT)
Received: by mail-wr0-x22e.google.com with SMTP id s10so6239551wra.13
 for <openbmc@lists.ozlabs.org>; Mon, 19 Mar 2018 08:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uczJC1ZwrdYNekFXRVQUjh54whFh13RU0JtQku9D4Ps=;
 b=FIRaPm8Q67Qmn+0JYJwlmS15UfNEJbJDthjiOXVz3jBWapNBqiLkvQ5Nh97b7U4Cv4
 U5c46wTtzpKn9+pZ8umkznPmO0/cax8bBedZm6NudHO+VgVJwhOcnli4StwfINwhrZSz
 QtdA9wllTF/a08j5xuC3rx9YD3vIvefrD9qrKto0fQU3qvQrbyG1JQDaKc2EpXl0MDih
 b8kVyus/448MBdVIVQLEQjRiJNtMtj6nU7qWCXhtOWIK9t4rHetMRFjH8H3km6RdxjJR
 tFX2NzshLTWRsXHDgywZKe9asx/JewRGudYJYRYZlW57OCfIdSyA+sNai9csVMFDl4iV
 mbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uczJC1ZwrdYNekFXRVQUjh54whFh13RU0JtQku9D4Ps=;
 b=uHWT22D38i2XBBcNRHNMsfDoRapL8O7Yt1MmmKXvuagEHKU8M30PIN5eYXOKFN3GLd
 BqtvuPjKrQXK7Ql4FDH/0CuBxettwFIMmfJ71GNRL0o3QuxtzgupFyum4gpM8LlM0/Yh
 qHs9vVcN7qT7U/7zkNVjpNfoxgS014Y8iz545vCwc210V8ZdWhT0QusfQl7kRSijYnNA
 /tM2bDmLLCnKi+iYzbHmIW1OiYzA4TC3tgrBuEZeIbrHcRI/fDC98S0kWEJS7sBVrG8x
 enYkDyLzeUeQNhJJmXstVGjCuRLwXm8T7MuM15Wdsx6ufoh4y/kTykMoO/aPMQpscW5B
 90Lw==
X-Gm-Message-State: AElRT7HSi+kSLRIyFPq8RHLvL73mAd15X4VsLKzkIndoYlvp+GJ+pyxq
 tet9m1993uNqSjU9tTR6loz4cLBr2a4qZ10elPMhmQ==
X-Google-Smtp-Source: AG47ELvnJnbkxSLKUcuX8ZMEvLZNyP+cuU1YgISGP0TQWRV6qzVn6wMM+W5GuhL2oDVtMxq/8LsZ6QjJc/s+2a22/aw=
X-Received: by 10.223.173.197 with SMTP id w63mr10628578wrc.83.1521474009038; 
 Mon, 19 Mar 2018 08:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <f34018a7-be64-9a2b-befd-632747234fd0@linux.vnet.ibm.com>
 <eb3ad4a5-d261-adaa-1782-b7cf77fc7267@linux.vnet.ibm.com>
In-Reply-To: <eb3ad4a5-d261-adaa-1782-b7cf77fc7267@linux.vnet.ibm.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Mon, 19 Mar 2018 15:39:58 +0000
Message-ID: <CAJoAoZnqH=C6Nd-XLtZE=4+AcfFQg53B0GYeTWM_03KJCQEo1w@mail.gmail.com>
Subject: Re: IPMI SOL performance
To: Tom Joseph <tomjose@linux.vnet.ibm.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, Bradley W Bishop <bradleyb@us.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Content-Type: multipart/alternative; boundary="f403045cf398d891220567c5c517"
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
X-List-Received-Date: Mon, 19 Mar 2018 15:40:14 -0000

--f403045cf398d891220567c5c517
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 19, 2018 at 4:18 AM Tom Joseph <tomjose@linux.vnet.ibm.com>
wrote:

>
>    Related issue -  https://github.com/openbmc/openbmc/issues/2958
>
> On Monday 19 March 2018 04:43 PM, Tom Joseph wrote:
> > Hello,
> >
> > I wanted to discuss about an issue related to IPMI SOL. Petitboot has
> > a menu to select the boot option, it has a timeout after which the
> > default boot option is selected and boot continues.The observation is
> > that when verbose debug traces are enabled in the hostboot, by the
> > time petitboot options are printed on the SOL console the menu timeout
> > expires and the user is not able to change the boot option.
> >
> > The same issue is not hit by the ssh console on port 2200 and does not
> > miss the timeout of the petitboot menu option.
> >
> > IPMI uses UDP protocol and the maximum size of the  SOL payload per
> > packet according to the specification is 255 bytes. Also the ack for
> > each of the IPMI packet requires a command lookup
> > and execution. Compared with IPMI SOL, ssh supports 64kb payloads and
> > ack does not need an application lookup, so the round-trip timing is
> > faster. IPMI specification for SOL is written with UART speed as
> > reference, but the VUART pushes the data at a much faster rate.
> >
> > One suggestion that I came across support an OEM payload size for SOL,
> > which is higher than 255 bytes, to get a better throughput. Please do
> > share other ideas to tackle this problem and improve performance.
> >
> > Regards,
> > Tom
> >
>
> Is it a possibility to just increase the petitboot timeout? Do you have an
idea of how much we are missing it by?

--f403045cf398d891220567c5c517
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Mar 19=
, 2018 at 4:18 AM Tom Joseph &lt;<a href=3D"mailto:tomjose@linux.vnet.ibm.c=
om">tomjose@linux.vnet.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><br>
=C2=A0=C2=A0 Related issue -=C2=A0 <a href=3D"https://github.com/openbmc/op=
enbmc/issues/2958" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
openbmc/openbmc/issues/2958</a><br>
<br>
On Monday 19 March 2018 04:43 PM, Tom Joseph wrote:<br>
&gt; Hello,<br>
&gt;<br>
&gt; I wanted to discuss about an issue related to IPMI SOL. Petitboot has<=
br>
&gt; a menu to select the boot option, it has a timeout after which the<br>
&gt; default boot option is selected and boot continues.The observation is<=
br>
&gt; that when verbose debug traces are enabled in the hostboot, by the<br>
&gt; time petitboot options are printed on the SOL console the menu timeout=
<br>
&gt; expires and the user is not able to change the boot option.<br>
&gt;<br>
&gt; The same issue is not hit by the ssh console on port 2200 and does not=
<br>
&gt; miss the timeout of the petitboot menu option.<br>
&gt;<br>
&gt; IPMI uses UDP protocol and the maximum size of the=C2=A0 SOL payload p=
er<br>
&gt; packet according to the specification is 255 bytes. Also the ack for<b=
r>
&gt; each of the IPMI packet requires a command lookup<br>
&gt; and execution. Compared with IPMI SOL, ssh supports 64kb payloads and<=
br>
&gt; ack does not need an application lookup, so the round-trip timing is<b=
r>
&gt; faster. IPMI specification for SOL is written with UART speed as<br>
&gt; reference, but the VUART pushes the data at a much faster rate.<br>
&gt;<br>
&gt; One suggestion that I came across support an OEM payload size for SOL,=
<br>
&gt; which is higher than 255 bytes, to get a better throughput. Please do<=
br>
&gt; share other ideas to tackle this problem and improve performance.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Tom<br>
&gt;<br>
<br></blockquote><div>Is it a possibility to just increase the petitboot ti=
meout? Do you have an idea of how much we are missing it by?=C2=A0</div></d=
iv></div>

--f403045cf398d891220567c5c517--
