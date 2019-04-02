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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44YJz53b13zDq7c
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 17:22:22 +1100 (AEDT)
Received: from ([60.208.111.195])
 by unicom146.biz-email.net (Antispam) with ASMTP (SSL) id TKR14615
 for <openbmc@lists.ozlabs.org>; Tue, 02 Apr 2019 14:15:15 +0800
Received: from mail-lf1-f52.google.com (10.100.1.52) by
 jtjnmail201601.home.langchao.com (10.100.2.1) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Tue, 2 Apr 2019 14:15:12 +0800
Received: by mail-lf1-f52.google.com with SMTP id r25so8030895lfn.13
 for <openbmc@lists.ozlabs.org>; Mon, 01 Apr 2019 23:15:12 -0700 (PDT)
X-Gm-Message-State: APjAAAVjq6b9nkrFCKScM7fKVtD15xfvzxXCPULn5qvSJq08V9oqP207
 sAKLIpKikI6zfOMd5t8fFomKCOFfp6q7MS4Y/cI=
X-Google-Smtp-Source: APXvYqx8FbVNcnBnPkwyRYaJvnCEeGxR2aLMr+AJ40hG0reMXVaMJ8jbSpNVYy6IncUrasuCRSXRF0naSWLrUB9YGpc=
X-Received: by 2002:a19:7410:: with SMTP id v16mr20534714lfe.1.1554185709115; 
 Mon, 01 Apr 2019 23:15:09 -0700 (PDT)
MIME-Version: 1.0
From: John Wang <wangzqbj@inspur.com>
Date: Tue, 2 Apr 2019 14:14:58 +0800
X-Gmail-Original-Message-ID: <CAHkHK0_fLLvzQi-PNdH1nxjJZJ0XC9097nf0QZ8ViijYY6bhEg@mail.gmail.com>
Message-ID: <CAHkHK0_fLLvzQi-PNdH1nxjJZJ0XC9097nf0QZ8ViijYY6bhEg@mail.gmail.com>
Subject: [cpusensor] pingTimer and creationTimer are conflict??
To: <jae.hyun.yoo@linux.intel.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000001b5fa80585860f7a"
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
X-List-Received-Date: Tue, 02 Apr 2019 06:22:28 -0000

--0000000000001b5fa80585860f7a
Content-Type: text/plain; charset="UTF-8"

Hi Jae,

When two cpus are configured in the entity-manager and there is only one
cpu on the motherboard, the cpusensor service cannot expose cpu sensor
information to dbus.
Before [this change](
https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/18963), cpu
sensor information can be exposed to dbus.

By checking the code,I found that pingTimer causes detectCpu to be executed
every 1s, and the detectCpu function calls
creationTimer.expires_from_now(3s/5s), which causes the callback of
creationTimer to only enter the cancel
state(boost::asio::error::operation_aborted).

Only when all the cpu configured in the entity-mangaer are detected will
stop pinging.

Is this a bug ?

Regards

John

--0000000000001b5fa80585860f7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div>Hi Jae,</div><div><br></div><div>When two cpus are configure=
d in the entity-manager and there is only one cpu on the motherboard, the c=
pusensor service cannot expose cpu sensor information to dbus.=C2=A0</div><=
div>Before [this change](<a href=3D"https://gerrit.openbmc-project.xyz/c/op=
enbmc/dbus-sensors/+/18963">https://gerrit.openbmc-project.xyz/c/openbmc/db=
us-sensors/+/18963</a>), cpu sensor information can be exposed to dbus.</di=
v><div><br></div><div>By checking the code,I found that pingTimer causes de=
tectCpu to be executed every 1s, and the detectCpu function calls creationT=
imer.expires_from_now(3s/5s), which causes the callback of creationTimer to=
 only enter the cancel state(boost::asio::error::operation_aborted).</div><=
div><br></div><div>Only when all the cpu configured in the entity-mangaer a=
re detected will stop pinging.</div><div><br></div><div>Is this a bug ?</di=
v><div><br></div><div>Regards</div><div><br></div><div>John</div><div><br><=
/div></div></div></div></div></div>

--0000000000001b5fa80585860f7a--
