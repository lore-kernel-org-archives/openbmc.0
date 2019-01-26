Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="AR5RdfQq"; 
 dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43mdLp1HbJzDq6t
 for <openbmc@lists.ozlabs.org>; Sat, 26 Jan 2019 12:18:19 +1100 (AEDT)
Received: by mail-qt1-x836.google.com with SMTP id t33so12774983qtt.4
 for <openbmc@lists.ozlabs.org>; Fri, 25 Jan 2019 17:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oKUbcObTsUmSGLX0l1jBFbt6cYiFvAFOuNk1MoJYWJk=;
 b=AR5RdfQqGSgtraGlpMm6PU2iurFYyi6srfjKNOF033bSaF9IwsM7VE9zV09lbxl+D4
 ZOFKqgmSIddzv0akwdTAFZNuvEHpOzec7ZdwJit0cAZLfaiWLKYUe8zV/nBwL7sg+bby
 44AItxLPKVJ6ZkRIVNZjgRWI/DeCNWgVtkO9XsrMb69oSVc5v/SNrqHeTpyuwT6IuBT3
 +7Ith2+4JZzD6FNiVqBRwTptwplkkF46aoTOvDdWMgos3dKEszQTf00W3F4cL0XOwnib
 VQZr7iJTdGYfT2faz9lFXVS5+ry7EbS1U8ijPd8C+eTiTcJdynn6A+LWf1njvThFXU4L
 Bt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oKUbcObTsUmSGLX0l1jBFbt6cYiFvAFOuNk1MoJYWJk=;
 b=Lm+ROCnFr+7Mfgs/n2tD2viwBKqaPHvHFjRLn6ueLy2SFOvppGUF/pu6Y7SRDWTAq7
 uf5Im6qCKpPr+66zkiVGxPosvyIAlwR4wLaFIgv7vMqnwJD+ecZr6SFao9L21VKBN++d
 N54AabIPUY/XzhaTxTPTP5L1wgVK9rLUvnQF6f6+GRSPMLOr57vjIFVG6rlrIyUjC7qi
 FUXxFZrBpzWXvBL746g2PWvwM40SFo9xsD0r3h9VVFVfzvScFXRAoU6+R8J2URnlNLPr
 FO6H314xdqH12KXSbfcQCy+GafRiJDygcS1RVxFmQ9MLxo/1SW/KH8LOGABNGiwHtT9g
 Pp+g==
X-Gm-Message-State: AJcUukfuEnlXanAuKlA9VmSF9hSr0WXAzqU3eWn7BPUZ+FkeygvfeS2M
 jek771GUq8GQUJ4/SPt4vtBoeR4L6MUlrZ+snGrWMA==
X-Google-Smtp-Source: ALg8bN4p2Nu8aMRHO0FOqSJe7D5uw5MrBl1lqhx14fgKvWWYNNYWXJDkxfdRmoMf5ZfARJNTGoe8VWhJ/OCXECMo8aE=
X-Received: by 2002:a0c:eb41:: with SMTP id c1mr12857055qvq.211.1548465496543; 
 Fri, 25 Jan 2019 17:18:16 -0800 (PST)
MIME-Version: 1.0
References: <CAJoAoZnbzzcruF7YnKh7LS+Pg6uxVx=BSJaR-X5q9cX9QMDgOg@mail.gmail.com>
 <AF6D38D7-CFE5-4D25-A31B-FB82DD82B4FB@amperecomputing.com>
 <MN2PR01MB5359821606C930685149BB57B79A0@MN2PR01MB5359.prod.exchangelabs.com>
 <CAJoAoZnQmnJmCaD9+=tmyDo4tekuhAZOatE889ahqXSOd6FOUg@mail.gmail.com>
 <814A00F2-640D-4AD3-821A-491472C7D027@amperecomputing.com>
In-Reply-To: <814A00F2-640D-4AD3-821A-491472C7D027@amperecomputing.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Fri, 25 Jan 2019 17:18:04 -0800
Message-ID: <CAJoAoZmUw3TZ3zQO7JEt9UVhizZiRCRMFOwer+eo41Q8Jj=mZw@mail.gmail.com>
Subject: Re: ampere-openbmc/phosphor-host-ipmid
To: Hoang Nguyen <hnguyen@amperecomputing.com>
Cc: Hien Pham <hpham@amperecomputing.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000dee96105805237fa"
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
X-List-Received-Date: Sat, 26 Jan 2019 01:18:27 -0000

--000000000000dee96105805237fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+OpenBMC mailing list

Hoang,

Thanks for the overview. I think that we would probably like to see your
design for review - it sounds interesting and there have been other
complaints regarding FRU parser.  If you want to provide more detail to the
entire list I'm sure we will be interested to hear, and also very
interested to take a look at your code and consider adoption.

Thanks!
Emily

On Fri, Jan 25, 2019 at 1:23 AM Hoang Nguyen <hnguyen@amperecomputing.com>
wrote:

> Hi Emily,
>
>
>
> FYI, now I don=E2=80=99t have too much time to develop new feature of IPM=
I@OpenBMC,
> but I can follow the IPMI@OpenBMC activity.
>
> I=E2=80=99ll push the code for reviewing if you=E2=80=99re interesting in=
 my design.
>
>
>
> Firstly, I=E2=80=99ll overview about my design. And I=E2=80=99ll continue=
 in detail if you
> agree.
>
>
>
> *The package name*: FRU manager
>
>
>
> *The reason for new package:*
>
> + Current package doesn=E2=80=99t support Multirecord FRU parsing
>
> + Sometime, using =E2=80=9CIPMI fru write=E2=80=A6=E2=80=9D command will =
crash the FRU EEPROM
> image -> nothing from D-Bus can inform this info
>
>
>
> *New package structure:*
>
> FRU manager package has 2 parts: *Manager* and *Parser*
>
> + *Manager*:
>
>     - Initial the D-Bus interface + all properties of
> Chassis/Board/Product/Multirecord areas (with default value)
>
>     - Provide the D-Bus methods for other packages (*Parser* as an
> example) to update the real data of FRU to D-Bus
>
>     - Provide methods to update the FRU device directly (in case of FRU
> recovering)
>
>
>
> + *Parser*:
>
>     - Access the FRU device directly to parse the FRU data and request to
> update these date to D-Bus (using *Manager* supported methods)
>
>
>
> *New services to handle new package:*
>
> Add more 2 services:
>
> + FRU manager service: start Manager part to handle all FRU request on
> D-Bus
>
> + FRU parser service: start Parser part to parse FRU data and update to
> D-Bus
>
>
>
> *Improvement points:*
>
> + Handle Multirecord data
>
> + In case of FRU data is not correct, the FRU parser service will be
> failed, all data of FRU on D-Bus are =E2=80=9Cdefault value=E2=80=9D
>
>    -> We can identify the issue and recovering the FRU image
>
>
>
>
>
> Best regards,
>
> Hoang
>
>
>
> *From: *Emily Shaffer <emilyshaffer@google.com>
> *Date: *Friday, January 25, 2019 at 7:11 AM
> *To: *Hien Pham <hpham@amperecomputing.com>
> *Cc: *Hoang Nguyen <hnguyen@amperecomputing.com>
> *Subject: *Re: ampere-openbmc/phosphor-host-ipmid
>
>
>
> [NOTICE: This email originated from an external sender. Please be mindful
> of safe email handling and proprietary information protection practices.]
> _________________________________________________________________________=
_______________________________________________
>
>
> Hien, Hoang,
>
>
>
> Thanks so much for replying to my cold email :)
>
>
>
> I want to take a look and understand better the approach you guys used.
> We've added more support to some of the FRU functionality you were missin=
g
> - specifically multirecord FRU has seen development in the past month or
> two - but it looks like you made a broader change.  If you have the
> engineer time to do so, I think it'd be valuable for you to push either
> your code or a design proposal (which maybe you already have written) for
> the OpenBMC community to take a look at (via gerrit) - I'd like to get th=
e
> rest of the community's feedback too.
>
>
>
> It sounds like you aren't able to dedicate a lot of resources right now s=
o
> I definitely understand if you don't want to put up a review; if you won'=
t
> have the time, could you let me know? I'll ask the other IPMI maintainers
> to take a look at your approach too and we can decide if it's something w=
e
> want to bring over ourselves.  (But it's more cohesive for the community =
if
> you're able to push the review from your end :) )
>
>
>
> Thanks,
>
> Emily
>
>
>
> On Wed, Jan 23, 2019 at 11:53 PM Hien Pham <hpham@amperecomputing.com>
> wrote:
>
> Dear Emily,
>
>
>
> I'm Hien Plam (Ampere OpenBMC CLA manager).  Nice to hear that you care
> the change we did.
>
>
>
> No worry, we committed to contribute back and willing to submit the chang=
e
> to the upstream anyway (if you see the change are applicable).  Please le=
t
> us know if you are interesting in our FRU refactor (Hoang's
> explanation below).  If yes, we can process  next step to upstream the
> changes.
>
>
>
> Thank and best regards,
> ------------------------------
>
> *From:* Hoang Nguyen
> *Sent:* Thursday, January 24, 2019 2:02:23 PM
> *To:* Emily Shaffer
> *Cc:* Hien Pham
> *Subject:* Re: ampere-openbmc/phosphor-host-ipmid
>
>
>
> Hi Emily,
>
>
>
> First at all, I=E2=80=99d like to inform that now we=E2=80=99re suspendin=
g the OpenBMC
> activity due to the business strategy.
>
> But we=E2=80=99ll come back with OpenBMC soon (I=E2=80=99m *sure* about i=
t).
>
>
>
> Regarding to your interesting of IPMI implementations (FRU interaction in
> phosphor-host-ipmid), I=E2=80=99ve not push these code because I=E2=80=99=
m using another
> design for the communication between IPMI implementation
> (phosphor-host-ipmid) and FRU access handler (ipmi-fru-parser).
>
>
>
> At current design, I found some limitation, such as:
>
>    - ipmi-fru-parser cannot parse the multi-record area
>    - ipmi-fru-parser takes many responsibilities:
>
>
>    - Handle FRU device
>       - Implement IPMI FRU commands
>
>
>    - many modules can access the FRU EEPROM device directly
>
>
>
> So I changed the design, include:
>
>    1. Disable the ipmi-fru-parser
>    2. Create new module (like FRU manager package) to handle the FRU
>    device.
>
> Overview about this package, it can:
>
>    - Access (read/write) the FRU device directly.
>    - Parse the multi-record area and public all info to D-Bus interface
>    - Provide some methods (using D-Bus interface) to support the
>    read/write FRU device request from other packages.
>
>
>    1. Update all relate packages (phosphor-host-ipmid is example):
>
>
>    - Stop accessing FRU device directly and start using FRU manager
>    package by calling supported methods
>    - Move IPMI FRU commands to phosphor-host-ipmid
>
>
>
> With this design, each package takes only one responsibility; prevent the
> issue of FRU device accessing from many packages.
>
>
>
> Finally, because this solution is specific for our system, so I did not
> pushed it.
>
> (but it always follow the common specification)
>
>
>
> Best regards,
>
> Hoang
>
>
>
> *From: *Emily Shaffer <emilyshaffer@google.com>
> *Date: *Thursday, January 24, 2019 at 5:26 AM
> *To: *Hoang Nguyen <hnguyen@amperecomputing.com>
> *Subject: *ampere-openbmc/phosphor-host-ipmid
>
>
>
> [NOTICE: This email originated from an external sender. Please be mindful
> of safe email handling and proprietary information protection practices.]
> _________________________________________________________________________=
_______________________________________________
>
>
> Hi Hoang,
>
>
>
> I'm a maintainer of the IPMI stack for OpenBMC (github.com/openbmc) and
> came across your forked project today.
>
>
>
> I noticed that Ampere executed a CLA with OpenBMC in July 2018, but I
> don't see that you're contributing your IPMI implementations back to
> OpenBMC. It actually looks like in general Ampere has written some code
> that we want, especially regarding FRU interaction in phosphor-host-ipmid=
,
> so I'm curious why it is that you haven't pushed any code back up to us.
>
>
>
> Can I facilitate getting Ampere to contribute back to the OpenBMC
> community?
>
>
>
> Thanks,
>
> Emily Shaffer
> (Github/Freenode: nasamuffin)
>
>

--000000000000dee96105805237fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">+OpenBMC mailing list<div><br></div><div>Hoang,</div><div>=
<br></div><div>Thanks for the overview. I think that we would probably like=
 to see your design for review - it sounds interesting and there have been =
other complaints regarding FRU parser.=C2=A0 If you want to provide more de=
tail to the entire list I&#39;m sure we will be interested to hear, and als=
o very interested to take a look at your code and consider adoption.</div><=
div><br></div><div>Thanks!</div><div>Emily</div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 25, 2019 at 1:23=
 AM Hoang Nguyen &lt;<a href=3D"mailto:hnguyen@amperecomputing.com">hnguyen=
@amperecomputing.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"m_-7908660954218574492WordSection1">
<p class=3D"MsoNormal">Hi Emily,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">FYI, now I don=E2=80=99t have too much time to devel=
op new feature of IPMI@OpenBMC, but I can follow the IPMI@OpenBMC activity.=
<u></u><u></u></p>
<p class=3D"MsoNormal">I=E2=80=99ll push the code for reviewing if you=E2=
=80=99re interesting in my design.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Firstly, I=E2=80=99ll overview about my design. And =
I=E2=80=99ll continue in detail if you agree.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><b>The package name</b>: FRU manager<u></u><u></u></=
p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><b>The reason for new package:<u></u><u></u></b></p>
<p class=3D"MsoNormal">+ Current package doesn=E2=80=99t support Multirecor=
d FRU parsing<u></u><u></u></p>
<p class=3D"MsoNormal">+ Sometime, using =E2=80=9CIPMI fru write=E2=80=A6=
=E2=80=9D command will crash the FRU EEPROM image -&gt; nothing from D-Bus =
can inform this info<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><b>New package structure:<u></u><u></u></b></p>
<p class=3D"MsoNormal">FRU manager package has 2 parts: <b>Manager</b> and =
<b>Parser</b><u></u><u></u></p>
<p class=3D"MsoNormal">+ <b>Manager</b>:<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 - Initial the D-Bus interface + a=
ll properties of Chassis/Board/Product/Multirecord areas (with
<span style=3D"color:red">default value</span>)<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 - Provide the D-Bus methods for o=
ther packages (<b>Parser</b> as an example) to update the real data of FRU =
to D-Bus<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0 =C2=A0- Provide methods to update the F=
RU device directly (in case of FRU recovering)<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">+ <b>Parser</b>:<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 - Access the FRU device directly =
to parse the FRU data and request to update these date to D-Bus (using
<b>Manager</b> supported methods)<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><b>New services to handle new package:<u></u><u></u>=
</b></p>
<p class=3D"MsoNormal">Add more 2 services:<u></u><u></u></p>
<p class=3D"MsoNormal">+ FRU manager service: start Manager part to handle =
all FRU request on D-Bus<u></u><u></u></p>
<p class=3D"MsoNormal">+ FRU parser service: start Parser part to parse FRU=
 data and update to D-Bus<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><b>Improvement points:<u></u><u></u></b></p>
<p class=3D"MsoNormal">+ Handle Multirecord data<u></u><u></u></p>
<p class=3D"MsoNormal">+ In case of FRU data is not correct, the FRU parser=
 service will be failed, all data of FRU on D-Bus are =E2=80=9Cdefault valu=
e=E2=80=9D<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0 -&gt; We can identify the issue and rec=
overing the FRU image<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Best regards,<u></u><u></u></p>
<p class=3D"MsoNormal">Hoang<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border:none;border-top:solid #b5c4df 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12.0pt;color:black">From=
: </span></b><span style=3D"font-size:12.0pt;color:black">Emily Shaffer &lt=
;<a href=3D"mailto:emilyshaffer@google.com" target=3D"_blank">emilyshaffer@=
google.com</a>&gt;<br>
<b>Date: </b>Friday, January 25, 2019 at 7:11 AM<br>
<b>To: </b>Hien Pham &lt;<a href=3D"mailto:hpham@amperecomputing.com" targe=
t=3D"_blank">hpham@amperecomputing.com</a>&gt;<br>
<b>Cc: </b>Hoang Nguyen &lt;<a href=3D"mailto:hnguyen@amperecomputing.com" =
target=3D"_blank">hnguyen@amperecomputing.com</a>&gt;<br>
<b>Subject: </b>Re: ampere-openbmc/phosphor-host-ipmid<u></u><u></u></span>=
</p>
</div></div></div><div lang=3D"EN-US" link=3D"blue" vlink=3D"purple"><div c=
lass=3D"m_-7908660954218574492WordSection1">
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal">[NOTICE: This email originated from an external send=
er. Please be mindful of safe email handling and proprietary information pr=
otection practices.] ______________________________________________________=
__________________________________________________________________
<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Hien, Hoang, <u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks so much for replying to my cold email :)<u></=
u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I want to take a look and understand better the appr=
oach you guys used. We&#39;ve added more support to some of the FRU functio=
nality you were missing - specifically multirecord FRU has seen development=
 in the past month or two - but it looks
 like you made a broader change.=C2=A0 If you have the engineer time to do =
so, I think it&#39;d be valuable for you to push either your code or a desi=
gn proposal (which maybe you already have written) for the OpenBMC communit=
y to take a look at (via gerrit) - I&#39;d like
 to get the rest of the community&#39;s feedback too.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">It sounds like you aren&#39;t able to dedicate a lot=
 of resources right now so I definitely understand if you don&#39;t want to=
 put up a review; if you won&#39;t have the time, could you let me know? I&=
#39;ll ask the other IPMI maintainers to take a look
 at your approach too and we can decide if it&#39;s something we want to br=
ing over ourselves.=C2=A0 (But it&#39;s more cohesive for the community if =
you&#39;re able to push the review from your end :) )<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Emily<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Wed, Jan 23, 2019 at 11:53 PM Hien Pham &lt;<a hr=
ef=3D"mailto:hpham@amperecomputing.com" target=3D"_blank">hpham@amperecompu=
ting.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<div>
<div id=3D"m_-7908660954218574492m_3349455740235281957divtagdefaultwrapper"=
>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span style=3D"font-size:12.0=
pt;color:black">Dear Emily,<u></u><u></u></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span style=3D"font-size:12.0=
pt;color:black"><u></u>=C2=A0<u></u></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span style=3D"font-size:12.0=
pt;color:black">I&#39;m Hien Plam (Ampere OpenBMC CLA manager).=C2=A0 Nice =
to hear that you care the change we did.<u></u><u></u></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span style=3D"font-size:12.0=
pt;color:black"><u></u>=C2=A0<u></u></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span style=3D"font-size:12.0=
pt;color:black">No worry, we committed to contribute back and willing to su=
bmit the change to the upstream anyway (if you see the change are applicabl=
e).=C2=A0 Please let us know if you are interesting
 in=C2=A0our FRU refactor=C2=A0(Hoang&#39;s explanation=C2=A0below).=C2=A0 =
If yes, we can process=C2=A0 next step to upstream the changes.<u></u><u></=
u></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span style=3D"font-size:12.0=
pt;color:black"><u></u>=C2=A0<u></u></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span style=3D"font-size:12.0=
pt;color:black">Thank and best regards,<u></u><u></u></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"0" width=3D"100%" align=3D"center">
</div>
<div id=3D"m_-7908660954218574492m_3349455740235281957divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> Hoang Nguyen<br>
<b>Sent:</b> Thursday, January 24, 2019 2:02:23 PM<br>
<b>To:</b> Emily Shaffer<br>
<b>Cc:</b> Hien Pham<br>
<b>Subject:</b> Re: ampere-openbmc/phosphor-host-ipmid</span> <u></u><u></u=
></p>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
</div>
</div>
<div>
<div>
<div>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">Hi Emily,=
<u></u><u></u></p>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">=C2=A0<u>=
</u><u></u></p>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">First at =
all, I=E2=80=99d like to inform that now we=E2=80=99re suspending the OpenB=
MC activity due to the business strategy.<u></u><u></u></p>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">But we=E2=
=80=99ll come back with OpenBMC soon (I=E2=80=99m
<b>sure</b> about it).<u></u><u></u></p>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">=C2=A0<u>=
</u><u></u></p>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">Regarding=
 to your interesting of IPMI implementations (FRU interaction in phosphor-h=
ost-ipmid), I=E2=80=99ve not push these code because I=E2=80=99m using anot=
her design for the communication between IPMI implementation (phosphor-host=
-ipmid)
 and FRU access handler (ipmi-fru-parser).<u></u><u></u></p>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">=C2=A0<u>=
</u><u></u></p>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">At curren=
t design, I found some limitation, such as:<u></u><u></u></p>
<ul type=3D"disc">
<li class=3D"m_-7908660954218574492m3349455740235281957xmsolistparagraph">
ipmi-fru-parser cannot parse the multi-record area<u></u><u></u></li><li cl=
ass=3D"m_-7908660954218574492m3349455740235281957xmsolistparagraph">
ipmi-fru-parser takes many responsibilities: <u></u><u></u></li></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"m_-7908660954218574492m3349455740235281957xmsolistparagraph">
Handle FRU device<u></u><u></u></li><li class=3D"m_-7908660954218574492m334=
9455740235281957xmsolistparagraph">
Implement IPMI FRU commands<u></u><u></u></li></ul>
</ul>
<ul type=3D"disc">
<li class=3D"m_-7908660954218574492m3349455740235281957xmsolistparagraph">
many modules can access the FRU EEPROM device directly<u></u><u></u></li></=
ul>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">=C2=A0<u>=
</u><u></u></p>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">So I chan=
ged the design, include:<u></u><u></u></p>
<ol start=3D"1" type=3D"1">
<li class=3D"m_-7908660954218574492m3349455740235281957xmsolistparagraph">
Disable the ipmi-fru-parser<u></u><u></u></li><li class=3D"m_-7908660954218=
574492m3349455740235281957xmsolistparagraph">
Create new module (like FRU manager package) to handle the FRU device.<u></=
u><u></u></li></ol>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsolistparagraph">Ov=
erview about this package, it can:<u></u><u></u></p>
<ul type=3D"disc">
<li class=3D"m_-7908660954218574492m3349455740235281957xmsolistparagraph">
Access (read/write) the FRU device directly.<u></u><u></u></li><li class=3D=
"m_-7908660954218574492m3349455740235281957xmsolistparagraph">
Parse the multi-record area and public all info to D-Bus interface<u></u><u=
></u></li><li class=3D"m_-7908660954218574492m3349455740235281957xmsolistpa=
ragraph">
Provide some methods (using D-Bus interface) to support the read/write FRU =
device request from other packages.<u></u><u></u></li></ul>
<ol start=3D"3" type=3D"1">
<li class=3D"m_-7908660954218574492m3349455740235281957xmsolistparagraph">
Update all relate packages (phosphor-host-ipmid is example):<u></u><u></u><=
/li></ol>
<ul type=3D"disc">
<li class=3D"m_-7908660954218574492m3349455740235281957xmsolistparagraph">
Stop accessing FRU device directly and start using FRU manager package by c=
alling supported methods<u></u><u></u></li><li class=3D"m_-7908660954218574=
492m3349455740235281957xmsolistparagraph">
Move IPMI FRU commands to phosphor-host-ipmid<u></u><u></u></li></ul>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">=C2=A0<u>=
</u><u></u></p>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">With this=
 design, each package takes only one responsibility; prevent the issue of F=
RU device accessing from many packages.<u></u><u></u></p>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">=C2=A0<u>=
</u><u></u></p>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">Finally, =
because this solution is specific for our system, so I did not pushed it.<u=
></u><u></u></p>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">(but it a=
lways follow the common specification)<u></u><u></u></p>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">=C2=A0<u>=
</u><u></u></p>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">Best rega=
rds,<u></u><u></u></p>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">Hoang<u><=
/u><u></u></p>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">=C2=A0<u>=
</u><u></u></p>
<div style=3D"border:none;border-top:solid #b5c4df 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal"><b><span =
style=3D"font-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">Emily Shaffer &lt;<=
a href=3D"mailto:emilyshaffer@google.com" target=3D"_blank">emilyshaffer@go=
ogle.com</a>&gt;<br>
<b>Date: </b>Thursday, January 24, 2019 at 5:26 AM<br>
<b>To: </b>Hoang Nguyen &lt;<a href=3D"mailto:hnguyen@amperecomputing.com" =
target=3D"_blank">hnguyen@amperecomputing.com</a>&gt;<br>
<b>Subject: </b>ampere-openbmc/phosphor-host-ipmid</span><u></u><u></u></p>
</div>
<div>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">=C2=A0<u>=
</u><u></u></p>
</div>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">[NOTICE: =
This email originated from an external sender. Please be mindful of safe em=
ail handling and proprietary information protection practices.] ___________=
___________________________________________________________________________=
__________________________________
<u></u><u></u></p>
<div>
<div>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">Hi Hoang,=
 <u></u><u></u></p>
<div>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">=C2=A0<u>=
</u><u></u></p>
</div>
<div>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">I&#39;m a=
 maintainer of the IPMI stack for OpenBMC (<a href=3D"http://github.com/ope=
nbmc" target=3D"_blank">github.com/openbmc</a>) and came across your forked=
 project today.<u></u><u></u></p>
</div>
<div>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">=C2=A0<u>=
</u><u></u></p>
</div>
<div>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">I noticed=
 that Ampere executed a CLA with OpenBMC in July 2018, but I don&#39;t see =
that you&#39;re contributing your IPMI implementations back to OpenBMC. It =
actually looks like in general Ampere has written some code that
 we want, especially regarding FRU interaction in phosphor-host-ipmid, so I=
&#39;m curious why it is that you haven&#39;t pushed any code back up to us=
.<u></u><u></u></p>
</div>
<div>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">=C2=A0<u>=
</u><u></u></p>
</div>
<div>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">Can I fac=
ilitate getting Ampere to contribute back to the OpenBMC community?<u></u><=
u></u></p>
</div>
<div>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">=C2=A0<u>=
</u><u></u></p>
</div>
<div>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">Thanks,<u=
></u><u></u></p>
</div>
<div>
<p class=3D"m_-7908660954218574492m3349455740235281957xmsonormal">Emily Sha=
ffer<br>
(Github/Freenode: nasamuffin)<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div></div></blockquote></div></div></div>

--000000000000dee96105805237fa--
