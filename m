Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::234; helo=mail-qt0-x234.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="i9Ac8zm0"; 
 dkim-atps=neutral
Received: from mail-qt0-x234.google.com (mail-qt0-x234.google.com
 [IPv6:2607:f8b0:400d:c0d::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wZMF2bdKzDr3M
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 12:30:29 +1000 (AEST)
Received: by mail-qt0-x234.google.com with SMTP id q13-v6so21421606qtp.4
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 19:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=dfCdIJVtDpm98e1YnhPa69NPXYjsep82xKunySXZYHM=;
 b=i9Ac8zm0ppDOQPH0mi7yehHm10AieQocDim8ojDdtzl4eqA4WXlHC8TbooE95pJ8d3
 TlzyEL6uRrONftcPHkUQp0qRiYEFa0EgTAotucoAWEONReX357ft5SZ4/5znHIMp0DgI
 /lqxX0e08bRufltJrT3RanfQ4d7Sd+y0FpyYUzFr3H4GvwJAQE9Ya/oOQp86JXpfK+Ac
 WG7RJyxz6poC+oYdiQjPf0Vtq2ctUyydFWGG8LM9qw3xO5WroVicW3Hc5TDA+QFc+kJm
 W8nI7wRd8MF8KyjbI2Awf+PR10ZxvUsq5Ex2Wt2Rg06aH3nRUb74zp3aCDNZRF/M9/pM
 kb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=dfCdIJVtDpm98e1YnhPa69NPXYjsep82xKunySXZYHM=;
 b=m3gFtX2OPBqLsrgxGnYF90cjQcf3E+n4BEPGOwOBjaSJA1tGHTND6QfJ3pOejnej2z
 KNGYumwvecXj1bJ7lYM3nnQJyIkuAsIrvynL+idTqEktDWNzsKofu8Duebj+qWkDIOB7
 ZDF6rf65IZFMj+ZzYsGg7YElSbnjuzXOOkgWNnH5+d+sZuepfq07cMiI6dyJrhAkFPbi
 FMoEn1VXY2YbfMPAYk3ZDe6YRaLeuNFeeX/jbofzo2rHvzboPcGrXpgNAr6OVFUbHuSQ
 rTTtSNqvs96JaP3D1A2CptNWGeZdii8F6KwSWqZzf7CLvlZTXBAmHhCQ50smM4HQxpz0
 9t4A==
X-Gm-Message-State: APt69E18H9urw7PIi1oayDlDaFeS2Tyhc+9S90ymYSxZ/TXZC/8eZRpi
 w6nkh6r4V9uaseyO6rornNF/ZBGxTCjv8Viq7M8MEQ==
X-Google-Smtp-Source: ADUXVKImqeHMXK6lsPPn1TZccDlIaJBQRB1Y38rKcfQG0EgeFW4PqLKZWuWuuiNQIhTinr+PrJltbpyBcUuq+YzP9Kk=
X-Received: by 2002:a0c:87c1:: with SMTP id 1-v6mr812730qvk.141.1527647426434; 
 Tue, 29 May 2018 19:30:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:2d65:0:0:0:0:0 with HTTP; Tue, 29 May 2018 19:30:25
 -0700 (PDT)
From: =?UTF-8?B?5by15ryi5b2s?= <henbinchang@gmail.com>
Date: Wed, 30 May 2018 10:30:25 +0800
Message-ID: <CAG9c7cCVmjbxMLFie0_bHtU60amR1S2aoygHgT7bV9rWRdEXTA@mail.gmail.com>
Subject: Re: Fail to start org.openbmc.managers.System.service
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000031dbf5056d632241"
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
X-List-Received-Date: Wed, 30 May 2018 02:30:34 -0000

--00000000000031dbf5056d632241
Content-Type: text/plain; charset="UTF-8"

>
> This inventory module comes from
> https://github.com/openbmc/skeleton/tree/master/pyinventorymgr
> I believe all you need to do is ensure you bring in this recipe when
> you build your image:
> https://github.com/openbmc/openbmc/blob/master/meta-phosphor
> /common/recipes-phosphor/chassis/obmc-mgr-inventory.bb
> Your image should then have the inventory module:
> ls /usr/lib/python2.7/site-packages/obmc/
> __init__.py   __init__.pyc  dbuslib       enums.py      enums.pyc
> inventory     mapper        sensors.py    sensors.pyc   system
> utils         wsgi


Hi Andrew,

I could bitbake build the obmc-mgr-inventory recipe and find the
obmc/inventory in the source path of obmc-mgr-inventory.

ls pyinventorymgr/
build  inventory_items.py  Makefile  obmc  setup.cfg  setup.py
sync_inventory_items.py
ls pyinventorymgr/obmc/
inventory

But I still couldn't see the inventory in the path
ls /usr/lib/python2.7/site-packages/obmc/
dbuslib  enums.py  enums.pyc  __init__.py  __init__.pyc  mapper
sensors.py  sensors.pyc  system  utils  wsgi

What may I miss?

Thanks.

--00000000000031dbf5056d632241
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">

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
e<wbr>nbmc/blob/master/meta-phosphor<wbr>/common/recipes-phosphor/<wbr>chas=
sis/obmc-mgr-inventory.bb</a><br style=3D"color:rgb(34,34,34);font-family:a=
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
pan></blockquote><div><br></div><div>Hi Andrew,</div><div><br></div><div>I =
could bitbake build the obmc-mgr-inventory=C2=A0recipe and find the obmc/in=
ventory in the source path of=C2=A0obmc-mgr-inventory.<br></div><div><div><=
br></div><div>ls pyinventorymgr/</div><div>build=C2=A0 inventory_items.py=
=C2=A0 Makefile=C2=A0 obmc=C2=A0 setup.cfg=C2=A0 setup.py=C2=A0 sync_invent=
ory_items.py</div></div><div>ls pyinventorymgr/obmc/<br></div><div>inventor=
y<br></div><div><br></div><div>But I still couldn&#39;t see the inventory i=
n the=C2=A0path</div><div><span style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:14px;font-style:normal;font-variant-ligatures:norm=
al;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-alig=
n:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing=
:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-d=
ecoration-color:initial;float:none;display:inline">ls /usr/lib/python2.7/si=
te-</span><wbr style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:14px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:14px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline">packages/obmc/</span>

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

--00000000000031dbf5056d632241--
