Return-Path: <wangzqbj@inspur.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=162.243.126.186; helo=vip.corpemail.net;
 envelope-from=wangzqbj@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from vip.corpemail.net (vip.corpemail.net [162.243.126.186])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44VQ4v4Dl6zDq7k
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 00:02:21 +1100 (AEDT)
Received: from ([60.208.111.195])
 by unicom146.biz-email.net (Antispam) with ASMTP (SSL) id TPH38601
 for <openbmc@lists.ozlabs.org>; Thu, 28 Mar 2019 20:57:01 +0800
Received: from mail-lj1-f171.google.com (10.100.1.52) by
 jtjnmail201602.home.langchao.com (10.100.2.2) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Thu, 28 Mar 2019 20:57:40 +0800
Received: by mail-lj1-f171.google.com with SMTP id r24so16472436ljg.3
 for <openbmc@lists.ozlabs.org>; Thu, 28 Mar 2019 05:56:35 -0700 (PDT)
X-Gm-Message-State: APjAAAUBArapcYjJ0FSVVdxg1GZn3O0Vu+WZflUsDNDbBDXTY/eEAo27
 TcdJoV+TUi4EeNdN99gAbsRGHXu/UkHrYpI2Hek=
X-Google-Smtp-Source: APXvYqytSQ9tsWjBMeDsuT37RtwKFOZAsCD1TZqFYdc1g4tBKgcl50RIC15WrsE22EKK2epEStmqvfX7Rpv5H0G8gmw=
X-Received: by 2002:a2e:9e89:: with SMTP id f9mr22908567ljk.28.1553777792716; 
 Thu, 28 Mar 2019 05:56:32 -0700 (PDT)
MIME-Version: 1.0
From: John Wang <wangzqbj@inspur.com>
Date: Thu, 28 Mar 2019 20:56:21 +0800
X-Gmail-Original-Message-ID: <CAHkHK09mDPscFDRG=_z3biKchg0pNv9urSWacjyYmq2W9Rt0pQ@mail.gmail.com>
Message-ID: <CAHkHK09mDPscFDRG=_z3biKchg0pNv9urSWacjyYmq2W9Rt0pQ@mail.gmail.com>
Subject: questions about host-state-manager on x86 platform
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000065131905852715c6"
X-Originating-IP: [10.100.1.52]
X-ClientProxiedBy: jtjnmail201601.home.langchao.com (10.100.2.1) To
 jtjnmail201602.home.langchao.com (10.100.2.2)
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
X-List-Received-Date: Thu, 28 Mar 2019 13:02:25 -0000

--00000000000065131905852715c6
Content-Type: text/plain; charset="UTF-8"

I found that on my machine (x86), phosphor-state-manager(host) doesn't work
as expected.
I have a problem when debugging. I hope someone can help me.

When `obmcutil poweroff` is executed, it calls `obmc-host-shutdown@0.target
`
and  will change the CurrentHostState by judging whether
obmc-host-stop@0.target is executed or not.

However,On my machine, obmc-host-stop@0.target has never been executed.

$systemctl status obmc-host-shutdown@0.target
obmc-host-shutdown@0.target - Power0 Host Off
   Loaded: loaded (/lib/systemd/system/obmc-host-shutdown@.target; static;
vendor preset: enabled)
   Active: active

on5263m5 systemd[1]: Reached target Power0 Host Off.

$systemctl status obmc-host-stop@0.target
Obmc-host-stop@0.target - Stop Host0
   Loaded: loaded (/lib/systemd/system/obmc-host-stop@.target; static;
vendor preset: enabled)
   Active: inactive (dead)

There is such a comment in the code

host-shutdown notifies host of shutdown and that leads to host-stop being
called so initiate a host shutdown with the -shutdown target and consider
the
host shut down when the -stop target is complete

But I have not figured out how -stop target is called.

In addition, if the shutdown is performed on the host operating system,
is it impossible for host-state-manager to know that it is currently shut
down?
In this case, how is openbmc handled? Which module should I refer to?

Thanks

John

--00000000000065131905852715c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>I =
found that on my machine (x86), phosphor-state-manager(host) doesn&#39;t wo=
rk as expected.=C2=A0</div><div>I have a problem when debugging. I hope som=
eone can help me.=C2=A0</div><div><br></div><div>When `obmcutil poweroff` i=
s executed, it calls `obmc-host-shutdown@0.target`=C2=A0</div><div>and=C2=
=A0 will change the CurrentHostState by judging whether obmc-host-stop@0.ta=
rget is executed or not.</div><div><br></div><div>However,On my machine, ob=
mc-host-stop@0.target has never been executed.</div><div><br></div><div>$sy=
stemctl status obmc-host-shutdown@0.target<br></div><div><div>obmc-host-shu=
tdown@0.target - Power0 Host Off</div><div>=C2=A0 =C2=A0Loaded: loaded (/li=
b/systemd/system/obmc-host-shutdown@.target; static; vendor preset: enabled=
)</div><div>=C2=A0 =C2=A0Active: active</div><div><br></div><div>on5263m5 s=
ystemd[1]: Reached target Power0 Host Off.<br></div></div><div><br></div><d=
iv>$systemctl status obmc-host-stop@0.target</div><div>Obmc-host-stop@0.tar=
get - Stop Host0</div><div>=C2=A0 =C2=A0Loaded: loaded (/lib/systemd/system=
/obmc-host-stop@.target; static; vendor preset: enabled)</div><div>=C2=A0 =
=C2=A0Active: inactive (dead)</div><div><br></div><div>There is such a comm=
ent in the code</div><div><br></div><div>host-shutdown notifies host of shu=
tdown and that leads to host-stop being</div><div>called so initiate a host=
 shutdown with the -shutdown target and consider the=C2=A0</div><div>host s=
hut down when the -stop target is complete</div><div><br></div><div>But I h=
ave not figured out how -stop target is called.</div><div><br></div><div>In=
 addition, if the shutdown is performed on the host operating system,=C2=A0=
</div><div>is it impossible for host-state-manager to know that it is curre=
ntly shut down?=C2=A0</div><div>In this case, how is openbmc handled? Which=
 module should I refer to?</div><div><br></div><div>Thanks</div><div><br></=
div><div>John</div></div></div></div></div>

--00000000000065131905852715c6--
