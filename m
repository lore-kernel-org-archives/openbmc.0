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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44jMFD00sJzDqGT
 for <openbmc@lists.ozlabs.org>; Mon, 15 Apr 2019 18:32:29 +1000 (AEST)
Received: from ([60.208.111.195])
 by unicom145.biz-email.net (Antispam) with ASMTP (SSL) id GMQ75208
 for <openbmc@lists.ozlabs.org>; Mon, 15 Apr 2019 16:27:08 +0800
Received: from mail-lj1-f170.google.com (10.100.1.52) by
 jtjnmail201601.home.langchao.com (10.100.2.1) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Mon, 15 Apr 2019 16:26:36 +0800
Received: by mail-lj1-f170.google.com with SMTP id v22so14754486lje.9
 for <openbmc@lists.ozlabs.org>; Mon, 15 Apr 2019 01:27:06 -0700 (PDT)
X-Gm-Message-State: APjAAAVBKOiQN1o3dUdNd2ov2fHMRf7zbstrCbYu2rh6M1C9srr3RyHA
 yMQqjS6KqvgY7BGPKrLxhrAW3G1ceTI3gZQA4vU=
X-Google-Smtp-Source: APXvYqyMMG8C1oa7S3yfIhj27VrCDJfFNG4EzKwO7yFINtmKPu5EI5qMk9cWFbRHN9qw7rsVHiEhxbQme0xZg9wzjeY=
X-Received: by 2002:a2e:99c5:: with SMTP id l5mr10793494ljj.55.1555316823623; 
 Mon, 15 Apr 2019 01:27:03 -0700 (PDT)
MIME-Version: 1.0
From: John Wang <wangzqbj@inspur.com>
Date: Mon, 15 Apr 2019 16:26:52 +0800
X-Gmail-Original-Message-ID: <CAHkHK09fXHS6wH5rvvm1G45z0nmooa29qRnk1Lb+DzZhWmYfLw@mail.gmail.com>
Message-ID: <CAHkHK09fXHS6wH5rvvm1G45z0nmooa29qRnk1Lb+DzZhWmYfLw@mail.gmail.com>
Subject: dbus sensors how to determine power on/off state
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000c90eb205868d6a48"
X-Originating-IP: [10.100.1.52]
X-ClientProxiedBy: jtjnmail201607.home.langchao.com (10.100.2.7) To
 jtjnmail201601.home.langchao.com (10.100.2.1)
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
X-List-Received-Date: Mon, 15 Apr 2019 08:32:33 -0000

--000000000000c90eb205868d6a48
Content-Type: text/plain; charset="UTF-8"

I noticed that dbus-sensors determines the power/on status
by getting the value of pgood in the
xyz.openbmc_project.Chassis.Control.Power interface.

but, refer to
https://github.com/openbmc/phosphor-dbus-interfaces/blob/a641728c6923d9fb374f973b1c216515a082e21f/xyz/openbmc_project/Chassis/Control/Power.interface.yaml#L17

It's PGood not pgood


There is a patch here[
https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-phosphor/dbus/phosphor-dbus-interfaces/0003-Chassis-Power-Control-are-implemented.patch],it
seems to work well with dbus-sensors

Is there a plan to merge this patch to the trunk, or let the dbus-sensors
get the power on/off status via other interfaces?

--000000000000c90eb205868d6a48
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>I noticed that dbus=
-sensors determines the power/on status=C2=A0</div><div>by getting the valu=
e of pgood in the xyz.openbmc_project.Chassis.Control.Power interface.</div=
><div><br></div><div>but, refer to <a href=3D"https://github.com/openbmc/ph=
osphor-dbus-interfaces/blob/a641728c6923d9fb374f973b1c216515a082e21f/xyz/op=
enbmc_project/Chassis/Control/Power.interface.yaml#L17">https://github.com/=
openbmc/phosphor-dbus-interfaces/blob/a641728c6923d9fb374f973b1c216515a082e=
21f/xyz/openbmc_project/Chassis/Control/Power.interface.yaml#L17</a></div><=
div><br></div><div>It&#39;s PGood not pgood<br></div><div><br></div><div><b=
r></div><div>There is a patch here[<a href=3D"https://github.com/Intel-BMC/=
openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-phosphor/dbus/phos=
phor-dbus-interfaces/0003-Chassis-Power-Control-are-implemented.patch">http=
s://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/r=
ecipes-phosphor/dbus/phosphor-dbus-interfaces/0003-Chassis-Power-Control-ar=
e-implemented.patch</a>],it seems to work well with dbus-sensors</div><div>=
<br></div><div>Is there a plan to merge this patch to the trunk, or let the=
 dbus-sensors get the power on/off status via other interfaces?=C2=A0</div>=
</div></div></div>

--000000000000c90eb205868d6a48--
