Return-Path: <wangzqbj@inspur.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=162.243.126.186; helo=vip.corpemail.net;
 envelope-from=wangzqbj@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
X-Greylist: delayed 361 seconds by postgrey-1.36 at bilbo;
 Fri, 04 Jan 2019 23:28:14 AEDT
Received: from vip.corpemail.net (vip.corpemail.net [162.243.126.186])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43WPFp1sRQzDqD3
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jan 2019 23:28:10 +1100 (AEDT)
Received: from ([218.57.135.44])
 by unicom146.biz-email.net (Antispam) with ASMTP (SSL) id VNU47747
 for <openbmc@lists.ozlabs.org>; Fri, 04 Jan 2019 20:16:47 +0800
Received: from mail-lj1-f170.google.com (172.30.26.1) by
 jtjncas05.home.langchao.com (172.30.26.24) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 4 Jan 2019 20:17:11 +0800
Received: by mail-lj1-f170.google.com with SMTP id x85-v6so32291406ljb.2
 for <openbmc@lists.ozlabs.org>; Fri, 04 Jan 2019 04:17:11 -0800 (PST)
X-Gm-Message-State: AJcUuke4TEjWEXAVXEHywoM/rD4JAyjXO7BQIfqyjHyTLju3XbT072xK
 ixUWUob35H401sacOYtqFTgpJ4S2uc6r5/g5u8Y=
X-Google-Smtp-Source: ALg8bN7vaPx89PjvBVE4K6gFeZjyFBILf+6QO4c7fNeAUO8xCiCXhkLBr26qD+/i/kAjS9sW+EEj0yfw0PoOZxvEfIg=
X-Received: by 2002:a2e:841:: with SMTP id g1-v6mr31548340ljd.21.1546604228545; 
 Fri, 04 Jan 2019 04:17:08 -0800 (PST)
MIME-Version: 1.0
From: John Wang <wangzqbj@inspur.com>
Date: Fri, 4 Jan 2019 20:16:56 +0800
X-Gmail-Original-Message-ID: <CAHkHK0_nw0AWgaE_gX7HsMjf2zm-yxa92rp4WLgMtSU_86Asvg@mail.gmail.com>
Message-ID: <CAHkHK0_nw0AWgaE_gX7HsMjf2zm-yxa92rp4WLgMtSU_86Asvg@mail.gmail.com>
Subject: A tool to generate fru.bin
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000a69473057ea0dbc1"
X-Originating-IP: [172.30.26.1]
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
X-List-Received-Date: Fri, 04 Jan 2019 12:28:16 -0000

--000000000000a69473057ea0dbc1
Content-Type: text/plain; charset="UTF-8"

Hi all,

When I debug the fru function, I found that I need a tool to generate
binary data that conforms to the fru protocol specification, so that it can
be stored on the eeprom, and then I implement one myself.
https://github.com/inspur-bmc/fru-generator

This tool generates fru.bin based on the json file.

Usge:
        fru-generator -j fru.json -b fru.bin

The command to read fru:
phosphor-read-eeprom  --eeprom=/sys/bus/i2c/devices/xxx/eeprom --fruid=xx

We can also simulate a fru eeprom device like this:
phosphor-read-eeprom  --eeprom=/tmp/fru.bin --fruid=xx

I would like to contribute this tool to the community, if anyone is
interested.

Regards

-John

--000000000000a69473057ea0dbc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<br><br>When I debug the fru function, I found that=
 I need a tool to generate binary data that conforms to the fru protocol sp=
ecification, so that it can be stored on the eeprom, and then I implement o=
ne myself. =C2=A0 <a href=3D"https://github.com/inspur-bmc/fru-generator">h=
ttps://github.com/inspur-bmc/fru-generator</a><br><br>This tool generates f=
ru.bin based on the json file.<br><br>Usge:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
fru-generator -j fru.json -b fru.bin<br>=C2=A0<br>The command to read fru:<=
br>phosphor-read-eeprom =C2=A0--eeprom=3D/sys/bus/i2c/devices/xxx/eeprom --=
fruid=3Dxx<br><br>We can also simulate a fru eeprom device like this:<br>ph=
osphor-read-eeprom =C2=A0--eeprom=3D/tmp/fru.bin --fruid=3Dxx<br><br><div>I=
 would like to contribute this tool to the community, if anyone is interest=
ed.<br><br>Regards<br><br>-John</div></div>

--000000000000a69473057ea0dbc1--
