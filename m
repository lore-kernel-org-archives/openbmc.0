Return-Path: <chou.brad@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=chou.brad@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gLufNGYy"; 
 dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44k10c66SKzDqHW
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 19:53:49 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id n8so10061303plp.10
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 02:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:message-id:date:to;
 bh=rsvIVinn8vLm5Jcky3zo0rL8inH23CtkY+Lrv6y8tiU=;
 b=gLufNGYyhhPZOAXl6MQB4PGCIGtt5Bw8x1kOUpiOF9u+Zk0CtRxgKs4cm4EAqPNcKO
 2mrSBRdzOpGIcMTyAYHgg4kcByOIZJdY9TWPHZRINQkMUklwQetv/adnbcGwJKeHSvNk
 iTujwpN7cS5gRXzFEC/s7/dAPiWc0WSSOvUevEsq7MAmpOkUoTBQQSCIHdYion00L8lh
 vLsjvsMR9XH3woPjgvd+HMW1rUCSLTBt9QyHP9jmFY91ijhFmipzxjQZgwnfIRFdcdQX
 pNXDqNcwkK79DLOghzHvv2Lk0nMkEYF6YY3i07i/vSGtvAZtbpz60pCSmDQuJreJn1m0
 Y2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:message-id:date:to;
 bh=rsvIVinn8vLm5Jcky3zo0rL8inH23CtkY+Lrv6y8tiU=;
 b=QadFR68gDiX3/x9jd2ddRdCzsOq9z6LM6sgRWupzpm+0WKwo26UOiCSIN2bYgl/Jto
 nbV61nR2kEpd9YvgQPweIS7vNxkDC5CmgOqSzPaH8VM1xhPzCcFisP1cJIv2QSzo3v+V
 7LecICIV5HNpVNbrRxkJKMJ6Ljb6PJXBAZe42+YK8hsavXZp7kLkyLP4i1Wc4oEK+N0P
 u2f3u3JP/aYItvoF/Ft8EaSlrxZw4dH7tmLKjuwJEJE8uc0hAPqbxpsL03xaFZ7g0W1t
 B8WDfpzCP5MHoq1LiWZa5ThVYQqPAoYWyNE5tA0MZKc+36b/kyx7yv0SKBdiw6fGgG91
 d33g==
X-Gm-Message-State: APjAAAUZg9WhoPOytLP+hhVQLA67K/sHGZcoOFHQE9kdDAx8LczZHlZ2
 qMf33vLpnOiYshofPUkoDvKUPOMZ24k=
X-Google-Smtp-Source: APXvYqxacveAgviZn0cixbSw6A9OyKrFYfY0gmtyU3o+y3BqCONFqd8muruhPQvdBiPgnQn1afQ3Sg==
X-Received: by 2002:a17:902:2aa6:: with SMTP id
 j35mr24392233plb.236.1555408426176; 
 Tue, 16 Apr 2019 02:53:46 -0700 (PDT)
Received: from [192.168.1.2] (220-128-238-121.HINET-IP.hinet.net.
 [220.128.238.121])
 by smtp.gmail.com with ESMTPSA id z7sm43153204pgh.81.2019.04.16.02.53.44
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Apr 2019 02:53:45 -0700 (PDT)
From: Brad Chou <chou.brad@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_35824AD1-C6D4-4D98-B0D1-82094E0B5980"
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: phosphor-fan-presence-tach failed with DBusMethodError
Message-Id: <79ECCA67-5A36-48A7-B5DF-5840DC390D8C@gmail.com>
Date: Tue, 16 Apr 2019 17:53:41 +0800
To: openbmc@lists.ozlabs.org
X-Mailer: Apple Mail (2.3445.9.1)
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
X-List-Received-Date: Tue, 16 Apr 2019 09:53:53 -0000


--Apple-Mail=_35824AD1-C6D4-4D98-B0D1-82094E0B5980
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi All,
The phosphor-fan-presence-tach failed as :
root@mingder:~# systemctl status phosphor-fan-presence-tach@0.service =
--no-pager
? phosphor-fan-presence-tach@0.service - Phosphor Fan Presence Tach =
Daemon
   Loaded: loaded =
(/lib/systemd/system/obmc-chassis-poweron@0.target.requires/../phosphor-fa=
n-presence-tach@.service; static; vendor preset: enabled)
   Active: failed (Result: signal) since Tue 2019-04-16 15:34:06 UTC; =
1min 21s ago
  Process: 2183 ExecStart=3D/usr/bin/env phosphor-fan-presence-tach =
(code=3Dkilled, signal=3DABRT)
 Main PID: 2183 (code=3Dkilled, signal=3DABRT)

Apr 16 15:34:05 mingder systemd[1]: =
phosphor-fan-presence-tach@0.service: Service RestartSec=3D1s expired, =
scheduling restart.
Apr 16 15:34:05 mingder systemd[1]: =
phosphor-fan-presence-tach@0.service: Scheduled restart job, restart =
counter is at 2.
Apr 16 15:34:06 mingder systemd[1]: Stopped Phosphor Fan Presence Tach =
Daemon.
Apr 16 15:34:06 mingder systemd[1]: =
phosphor-fan-presence-tach@0.service: Start request repeated too =
quickly.
Apr 16 15:34:06 mingder systemd[1]: =
phosphor-fan-presence-tach@0.service: Failed with result 'signal'.
Apr 16 15:34:06 mingder systemd[1]: Failed to start Phosphor Fan =
Presence Tach Daemon.
root@mingder:~#=20


After trying to execute it manually, I got this error:
root@mingder:~# /usr/bin/env phosphor-fan-presence-tach
terminate called after throwing an instance of =
'phosphor::fan::util::DBusMethodError'
  what():  DBus method call failed
Aborted
root@mingder:~#=20


My config.yaml for phosphor-fan-presence-config-native/ is :
- name: fan1
  path: /system/chassis/motherboard/fan1
  methods:
    - type: tach
      sensors:
        - FAN1_L

- name: fan2
  path: /system/chassis/motherboard/fan2
  methods:
    - type: tach
      sensors:
        - FAN2_L

- name: fan3
  path: /system/chassis/motherboard/fan3
  methods:
    - type: tach
      sensors:
        - FAN3_L

- name: fan4
  path: /system/chassis/motherboard/fan4
  methods:
    - type: tach
      sensors:
        - FAN4_L


The /system/chassis/motherboard/fanX can be seen as :
[bradchou@localhost ~]$ curl -b cjar -k =
https://${bmc}/xyz/openbmc_project/inventory/system/chassis/motherboard/en=
umerate =
<https://${bmc}/xyz/openbmc_project/inventory/system/chassis/motherboard/e=
numerate>
"/xyz/openbmc_project/inventory/system/chassis/motherboard/fan1": {
      "Functional": true,
      "Present": true,
      "PrettyName": "fan1"
    },
    "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan2": {
      "Functional": true,
      "Present": true,
      "PrettyName": "fan2"
    },
    "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan3": {
      "Functional": true,
      "Present": true,
      "PrettyName": "fan3"
    },
    "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan4": {
      "Functional": true,
      "Present": true,
      "PrettyName": "fan4"
    },


I can also get the sensors for each FAN:
[bradchou@localhost ~]$ curl -b cjar -k =
https://${bmc}/xyz/openbmc_project/sensors/fan_tach/enumerate
"data": {
    "/xyz/openbmc_project/sensors/fan_tach/FAN1_L": {
      "CriticalAlarmHigh": false,
      "CriticalAlarmLow": false,
      "CriticalHigh": 20000,
      "CriticalLow": 1200,
      "MaxValue": 0,
      "MinValue": 0,
      "Scale": 0,
      "Target": 128,
      "Unit": "xyz.openbmc_project.Sensor.Value.Unit.RPMS",
      "Value": 10485
    },
 =20

It seems the sensor is ok and the inventory object for fan is also =
created.
But the phosphor-fan-presence-tach still failed.
Can anyone help me to figurate out what=E2=80=99s going wrong ?

Thanks.



--Apple-Mail=_35824AD1-C6D4-4D98-B0D1-82094E0B5980
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><div =
dir=3D"auto" style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;" class=3D"">Hi All,<div =
class=3D"">The&nbsp;phosphor-fan-presence-tach&nbsp;failed as =
:</div><div class=3D""><div class=3D"">root@mingder:~# systemctl status =
<a href=3D"mailto:phosphor-fan-presence-tach@0.service" =
class=3D"">phosphor-fan-presence-tach@0.service</a> --no-pager</div><div =
class=3D"">? <a href=3D"mailto:phosphor-fan-presence-tach@0.service" =
class=3D"">phosphor-fan-presence-tach@0.service</a> - Phosphor Fan =
Presence Tach Daemon</div><div class=3D"">&nbsp; &nbsp;Loaded: loaded =
(/<a =
href=3D"mailto:lib/systemd/system/obmc-chassis-poweron@0.target.requires" =
class=3D"">lib/systemd/system/obmc-chassis-poweron@0.target.requires</a>/.=
./phosphor-fan-presence-tach@.service; static; vendor preset: =
enabled)</div><div class=3D"">&nbsp; &nbsp;Active: failed (Result: =
signal) since Tue 2019-04-16 15:34:06 UTC; 1min 21s ago</div><div =
class=3D"">&nbsp; Process: 2183 ExecStart=3D/usr/bin/env =
phosphor-fan-presence-tach (code=3Dkilled, signal=3DABRT)</div><div =
class=3D"">&nbsp;Main PID: 2183 (code=3Dkilled, signal=3DABRT)</div><div =
class=3D""><br class=3D""></div><div class=3D"">Apr 16 15:34:05 mingder =
systemd[1]: <a href=3D"mailto:phosphor-fan-presence-tach@0.service" =
class=3D"">phosphor-fan-presence-tach@0.service</a>: Service =
RestartSec=3D1s expired, scheduling restart.</div><div class=3D"">Apr 16 =
15:34:05 mingder systemd[1]: <a =
href=3D"mailto:phosphor-fan-presence-tach@0.service" =
class=3D"">phosphor-fan-presence-tach@0.service</a>: Scheduled restart =
job, restart counter is at 2.</div><div class=3D"">Apr 16 15:34:06 =
mingder systemd[1]: Stopped Phosphor Fan Presence Tach Daemon.</div><div =
class=3D"">Apr 16 15:34:06 mingder systemd[1]: <a =
href=3D"mailto:phosphor-fan-presence-tach@0.service" =
class=3D"">phosphor-fan-presence-tach@0.service</a>: Start request =
repeated too quickly.</div><div class=3D"">Apr 16 15:34:06 mingder =
systemd[1]: <a href=3D"mailto:phosphor-fan-presence-tach@0.service" =
class=3D"">phosphor-fan-presence-tach@0.service</a>: Failed with result =
'signal'.</div><div class=3D"">Apr 16 15:34:06 mingder systemd[1]: =
Failed to start Phosphor Fan Presence Tach Daemon.</div><div =
class=3D"">root@mingder:~#&nbsp;</div></div><div class=3D""><br =
class=3D""></div><div class=3D""><br class=3D""></div><div =
class=3D"">After trying to execute it manually, I got this =
error:</div><div class=3D""><div class=3D"">root@mingder:~# /usr/bin/env =
phosphor-fan-presence-tach</div><div class=3D"">terminate called after =
throwing an instance of 'phosphor::fan::util::DBusMethodError'</div><div =
class=3D"">&nbsp; what(): &nbsp;DBus method call failed</div><div =
class=3D"">Aborted</div><div =
class=3D"">root@mingder:~#&nbsp;</div></div><div class=3D""><br =
class=3D""></div><div class=3D""><br class=3D""></div><div class=3D"">My =
config.yaml for&nbsp;phosphor-fan-presence-config-native/ is :</div><div =
class=3D""><div class=3D"">- name: fan1</div><div class=3D"">&nbsp; =
path: /system/chassis/motherboard/fan1</div><div class=3D"">&nbsp; =
methods:</div><div class=3D"">&nbsp; &nbsp; - type: tach</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; sensors:</div><div class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; - FAN1_L</div><div class=3D""><br =
class=3D""></div><div class=3D"">- name: fan2</div><div class=3D"">&nbsp; =
path: /system/chassis/motherboard/fan2</div><div class=3D"">&nbsp; =
methods:</div><div class=3D"">&nbsp; &nbsp; - type: tach</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; sensors:</div><div class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; - FAN2_L</div><div class=3D""><br =
class=3D""></div><div class=3D"">- name: fan3</div><div class=3D"">&nbsp; =
path: /system/chassis/motherboard/fan3</div><div class=3D"">&nbsp; =
methods:</div><div class=3D"">&nbsp; &nbsp; - type: tach</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; sensors:</div><div class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; - FAN3_L</div><div class=3D""><br =
class=3D""></div><div class=3D"">- name: fan4</div><div class=3D"">&nbsp; =
path: /system/chassis/motherboard/fan4</div><div class=3D"">&nbsp; =
methods:</div><div class=3D"">&nbsp; &nbsp; - type: tach</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; sensors:</div><div class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; - FAN4_L</div></div><div class=3D""><br =
class=3D""></div><div class=3D""><br class=3D""></div><div class=3D"">The =
/system/chassis/motherboard/fanX can be seen as :</div><div =
class=3D"">[bradchou@localhost ~]$ curl -b cjar -k <a =
href=3D"https://${bmc}/xyz/openbmc_project/inventory/system/chassis/mother=
board/enumerate" =
class=3D"">https://${bmc}/xyz/openbmc_project/inventory/system/chassis/mot=
herboard/enumerate</a></div><div class=3D""><div =
class=3D"">"/xyz/openbmc_project/inventory/system/chassis/motherboard/fan1=
": {</div><div class=3D"">&nbsp; &nbsp; &nbsp; "Functional": =
true,</div><div class=3D"">&nbsp; &nbsp; &nbsp; "Present": =
true,</div><div class=3D"">&nbsp; &nbsp; &nbsp; "PrettyName": =
"fan1"</div><div class=3D"">&nbsp; &nbsp; },</div><div class=3D"">&nbsp; =
&nbsp; "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan2": =
{</div><div class=3D"">&nbsp; &nbsp; &nbsp; "Functional": =
true,</div><div class=3D"">&nbsp; &nbsp; &nbsp; "Present": =
true,</div><div class=3D"">&nbsp; &nbsp; &nbsp; "PrettyName": =
"fan2"</div><div class=3D"">&nbsp; &nbsp; },</div><div class=3D"">&nbsp; =
&nbsp; "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan3": =
{</div><div class=3D"">&nbsp; &nbsp; &nbsp; "Functional": =
true,</div><div class=3D"">&nbsp; &nbsp; &nbsp; "Present": =
true,</div><div class=3D"">&nbsp; &nbsp; &nbsp; "PrettyName": =
"fan3"</div><div class=3D"">&nbsp; &nbsp; },</div><div class=3D"">&nbsp; =
&nbsp; "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan4": =
{</div><div class=3D"">&nbsp; &nbsp; &nbsp; "Functional": =
true,</div><div class=3D"">&nbsp; &nbsp; &nbsp; "Present": =
true,</div><div class=3D"">&nbsp; &nbsp; &nbsp; "PrettyName": =
"fan4"</div><div class=3D"">&nbsp; &nbsp; },</div></div><div =
class=3D""><br class=3D""></div><div class=3D""><br class=3D""></div><div =
class=3D"">I can also get the sensors for each FAN:</div><div =
class=3D"">[bradchou@localhost ~]$ curl -b cjar -k <a =
href=3D"https://${bmc}/xyz/openbmc_project/sensors/fan_tach/enumerate" =
class=3D"">https://${bmc}/xyz/openbmc_project/sensors/fan_tach/enumerate</=
a></div><div class=3D""><div class=3D"">"data": {</div><div =
class=3D"">&nbsp; &nbsp; "/xyz/openbmc_project/sensors/fan_tach/FAN1_L": =
{</div><div class=3D"">&nbsp; &nbsp; &nbsp; "CriticalAlarmHigh": =
false,</div><div class=3D"">&nbsp; &nbsp; &nbsp; "CriticalAlarmLow": =
false,</div><div class=3D"">&nbsp; &nbsp; &nbsp; "CriticalHigh": =
20000,</div><div class=3D"">&nbsp; &nbsp; &nbsp; "CriticalLow": =
1200,</div><div class=3D"">&nbsp; &nbsp; &nbsp; "MaxValue": 0,</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; "MinValue": 0,</div><div class=3D"">&nbsp;=
 &nbsp; &nbsp; "Scale": 0,</div><div class=3D"">&nbsp; &nbsp; &nbsp; =
"Target": 128,</div><div class=3D"">&nbsp; &nbsp; &nbsp; "Unit": =
"xyz.openbmc_project.Sensor.Value.Unit.RPMS",</div><div class=3D"">&nbsp; =
&nbsp; &nbsp; "Value": 10485</div><div class=3D"">&nbsp; &nbsp; =
},</div><div class=3D"">&nbsp;&nbsp;</div></div><div class=3D""><br =
class=3D""></div><div class=3D"">It seems the sensor is ok and the =
inventory object for fan is also created.</div><div class=3D"">But the =
phosphor-fan-presence-tach still failed.</div><div class=3D"">Can anyone =
help me to figurate out what=E2=80=99s going wrong ?</div><div =
class=3D""><br class=3D""></div><div class=3D"">Thanks.</div><div =
class=3D""><br class=3D""></div><div class=3D""><br =
class=3D""></div></div></body></html>=

--Apple-Mail=_35824AD1-C6D4-4D98-B0D1-82094E0B5980--
