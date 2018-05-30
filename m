Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::232; helo=mail-io0-x232.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VGTeEIoa"; 
 dkim-atps=neutral
Received: from mail-io0-x232.google.com (mail-io0-x232.google.com
 [IPv6:2607:f8b0:4001:c06::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wZxp6LSSzDr3M
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 12:57:01 +1000 (AEST)
Received: by mail-io0-x232.google.com with SMTP id a10-v6so19923253ioc.9
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 19:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Wt03ue/60g4fBkipdevOuajDswPnX9KDq1bW541JJ9Q=;
 b=VGTeEIoaM9E+MY1SlK6E1EOoXWClySnUx5W8g4uZknlwLA5aeno3Udg0LNafX/NaIq
 tFIbHfMK4UkGvzEmdvoOQWINIiUZffVP/BI5dzNfxueDHa3im48XH5/drBHKXZgMwdd4
 fq33f/JecRaa/Leq933B/AirytmCspTYJn08hv4YLZOJIq4yf+X+q7t5ib2nb+J7nFDE
 Fcw5YOOQopRz70qKuudQQvBMUWyaHpj0J7hqXNQqQGK5i/Qn6HL9JhYMfIrHXPA2RxDl
 kQXdIWBekIutqzip65wiClYoCUALrMUY1BbVB8+3h2Owb/Hw2jcCc/+vuWMbk2/ErUrJ
 Zo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Wt03ue/60g4fBkipdevOuajDswPnX9KDq1bW541JJ9Q=;
 b=qFcRUG/bfPRrzSZw/LN4NI8nPS0MvDkOso6kKqDHVcF32gKQ2K6AfzrKc7fzmUfdjT
 hYvzzbd1JF/hFH2M08UL4NOawflYYVnd/aNL8c3Kme6KLYRwy+Cv751xa3+BUdWSZpKb
 SKvfWGWhhzgswVA8RBKtb6GQ05KYXqTK9L0uRyweq2TRxUW7Ul2n1SrbaE2N85VmhSha
 Fh/JBOWqPCk5uGmZI3yuMC4zSxWDy5q9RUD+VC5PTXueKsyqnLUpZ9rKOBb572jC1KBL
 eik+LYd/zOBF0aSqvP//Km+gklcv9gAGPns1FLanxNF1pfFAfarYlanveChZ1DW6q0mO
 +DtQ==
X-Gm-Message-State: ALKqPwcIDoqPvWEkkaG0C1mKjczEMMjpW8Cn7mStgX15KYu7WcSdBeZi
 E3eK7NqVoek6bJ6IFSOQ/JK3d0xYr510Bm0Qqwk=
X-Google-Smtp-Source: ADUXVKKSDM5yx1s5SqgAW2Uf6z7Uus8MFwC1EKxKFcYshLt2r4lqT3f4dB3B5g+Ilr6Xtm0vbuv5Crg3CGqHPoqoYZE=
X-Received: by 2002:a6b:9652:: with SMTP id
 y79-v6mr699160iod.171.1527649019540; 
 Tue, 29 May 2018 19:56:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:558a:0:0:0:0:0 with HTTP; Tue, 29 May 2018 19:56:59
 -0700 (PDT)
In-Reply-To: <CAG9c7cCVmjbxMLFie0_bHtU60amR1S2aoygHgT7bV9rWRdEXTA@mail.gmail.com>
References: <CAG9c7cCVmjbxMLFie0_bHtU60amR1S2aoygHgT7bV9rWRdEXTA@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 30 May 2018 10:56:59 +0800
Message-ID: <CAARXrt=5dFZwqeW4+sradJYwYaaFr4-rQbVP-MhQf=j6LQCQuA@mail.gmail.com>
Subject: Re: Fail to start org.openbmc.managers.System.service
To: =?UTF-8?B?5by15ryi5b2s?= <henbinchang@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000026b6e8056d638132"
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
X-List-Received-Date: Wed, 30 May 2018 02:57:04 -0000

--00000000000026b6e8056d638132
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It looks like your build is missing the `pyinventorymgr`

A quick check:
1. It comes from obmc-mgr-inventory.bb;
2. This recipe is added by packagegroup-obmc-apps.bbappend in meta-openpowe=
r
layer, with openpower distro feature:

    RDEPENDS_${PN}-inventory_append_df-openpower =3D " obmc-mgr-inventory"

Since you are missing this recipe, I guess your build is not openpower?



On Wed, May 30, 2018 at 10:30 AM, =E5=BC=B5=E6=BC=A2=E5=BD=AC <henbinchang@=
gmail.com> wrote:

> This inventory module comes from
>> https://github.com/openbmc/skeleton/tree/master/pyinventorymgr
>> I believe all you need to do is ensure you bring in this recipe when
>> you build your image:
>> https://github.com/openbmc/openbmc/blob/master/meta-phosphor
>> /common/recipes-phosphor/chassis/obmc-mgr-inventory.bb
>> Your image should then have the inventory module:
>> ls /usr/lib/python2.7/site-packages/obmc/
>> __init__.py   __init__.pyc  dbuslib       enums.py      enums.pyc
>> inventory     mapper        sensors.py    sensors.pyc   system
>> utils         wsgi
>
>
> Hi Andrew,
>
> I could bitbake build the obmc-mgr-inventory recipe and find the
> obmc/inventory in the source path of obmc-mgr-inventory.
>
> ls pyinventorymgr/
> build  inventory_items.py  Makefile  obmc  setup.cfg  setup.py
> sync_inventory_items.py
> ls pyinventorymgr/obmc/
> inventory
>
> But I still couldn't see the inventory in the path
> ls /usr/lib/python2.7/site-packages/obmc/
> dbuslib  enums.py  enums.pyc  __init__.py  __init__.pyc  mapper
> sensors.py  sensors.pyc  system  utils  wsgi
>
> What may I miss?
>
> Thanks.
>

--00000000000026b6e8056d638132
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It looks like your build is missing the `pyinventorym=
gr`</div><div><br></div><div>A quick check:</div><div>1. It comes from <a h=
ref=3D"http://obmc-mgr-inventory.bb">obmc-mgr-inventory.bb</a>;</div><div>2=
. This recipe is added by packagegroup-obmc-apps.bbappend in meta-openpower=
</div><div>layer, with openpower distro feature:</div><div><br></div><div>=
=C2=A0 =C2=A0 RDEPENDS_${PN}-inventory_append_df-openpower =3D &quot; obmc-=
mgr-inventory&quot;</div><div><br></div><div>Since you are missing this rec=
ipe, I guess your build is not openpower?</div><div><br></div><div><br></di=
v></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, M=
ay 30, 2018 at 10:30 AM, =E5=BC=B5=E6=BC=A2=E5=BD=AC <span dir=3D"ltr">&lt;=
<a href=3D"mailto:henbinchang@gmail.com" target=3D"_blank">henbinchang@gmai=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"l=
tr"><span class=3D"">

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:14px;font-style:normal;fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial;float:none;display:inline">=
This inventory module comes from<br></span><a href=3D"https://github.com/op=
enbmc/skeleton/tree/master/pyinventorymgr" rel=3D"noreferrer" style=3D"colo=
r:rgb(17,85,204);font-family:arial,sans-serif;font-size:14px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)" targ=
et=3D"_blank">https://github.com/openbmc/ske<wbr>leton/tree/master/pyinvent=
orym<wbr>gr</a><br style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:14px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:14px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial;float:none;display:inline">I believe all you need to do is ensure=
 you bring in this recipe when<br></span><span style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:14px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial;float:none;display:inline">you build=
 your image:<br></span><a href=3D"https://github.com/openbmc/openbmc/blob/m=
aster/meta-phosphor/common/recipes-phosphor/chassis/obmc-mgr-inventory.bb" =
rel=3D"noreferrer" style=3D"color:rgb(17,85,204);font-family:arial,sans-ser=
if;font-size:14px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255)" target=3D"_blank">https://github.com/openbmc/op=
e<wbr>nbmc/blob/master/meta-phosphor<wbr>/common/recipes-phosphor/chass<wbr=
>is/obmc-mgr-inventory.bb</a><br style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:14px;font-style:normal;font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:14px;font-style:normal;font-variant-ligatures:norm=
al;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-alig=
n:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing=
:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-d=
ecoration-color:initial;float:none;display:inline">Your image should then h=
ave the inventory module:<br></span><span style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:14px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial;float:none;display:inline">ls /usr/lib/py=
thon2.7/site-</span><span style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:14px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial;float:none;display:inline">packag<wbr>es/obmc/<br></span>=
<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
4px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial;fl=
oat:none;display:inline">__init__.py=C2=A0 =C2=A0__init__.pyc=C2=A0 dbuslib=
=C2=A0 =C2=A0 =C2=A0 =C2=A0enums.py=C2=A0 =C2=A0 =C2=A0 enums.pyc<br></span=
><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
14px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">inventory=C2=A0 =C2=A0 =C2=A0mapper=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 sensors.py=C2=A0 =C2=A0 sensors.pyc=C2=A0 =C2=A0system<br></s=
pan><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:14px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l;float:none;display:inline">utils=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wsgi</s=
pan></blockquote><div><br></div></span><div>Hi Andrew,</div><div><br></div>=
<div>I could bitbake build the obmc-mgr-inventory=C2=A0recipe and find the =
obmc/inventory in the source path of=C2=A0obmc-mgr-inventory.<br></div><div=
><div><br></div><div>ls pyinventorymgr/</div><div>build=C2=A0 inventory_ite=
ms.py=C2=A0 Makefile=C2=A0 obmc=C2=A0 setup.cfg=C2=A0 setup.py=C2=A0 sync_i=
nventory_items.py</div></div><div>ls pyinventorymgr/obmc/<br></div><div>inv=
entory<br></div><div><br></div><div>But I still couldn&#39;t see the invent=
ory in the=C2=A0path</div><div><span style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-size:14px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial;float:none;display:inline">ls /usr/lib/python2=
.7/site-</span><span style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:14px;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline">packag<wbr>es/obmc/</span>

</div><div><span style=3D"text-align:start;text-indent:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al;float:none;display:inline"><span style=3D"font-size:14px">dbuslib=C2=A0 =
enums.py=C2=A0 enums.pyc=C2=A0 __init__.py=C2=A0 __init__.pyc=C2=A0 mapper=
=C2=A0 sensors.py=C2=A0 sensors.pyc=C2=A0 system=C2=A0 utils=C2=A0 wsgi</sp=
an><br></span></div><div><span style=3D"text-align:start;text-indent:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline"><span style=3D"font-size:14px">=
<br></span></span></div><div><span style=3D"text-align:start;text-indent:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial;float:none;display:inline"><span style=3D"font-size:14=
px">What may I miss?</span></span></div><div><span style=3D"text-align:star=
t;text-indent:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial;float:none;display:inline"><span style=
=3D"font-size:14px"><br></span></span></div><div><span style=3D"text-align:=
start;text-indent:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial;float:none;display:inline"><span s=
tyle=3D"font-size:14px">Thanks.</span></span></div></div>
</blockquote></div><br></div>

--00000000000026b6e8056d638132--
