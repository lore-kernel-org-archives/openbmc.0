Return-Path: <padathjayashankar@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=padathjayashankar@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vqz/NRXD"; 
 dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44XkXP0YwwzDqHm
 for <openbmc@lists.ozlabs.org>; Mon,  1 Apr 2019 18:30:41 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id t8so7626149otp.7
 for <openbmc@lists.ozlabs.org>; Mon, 01 Apr 2019 00:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=P87KIzJxApb5xuKIjKIB5bTsT1eNaV7VdO0NbRuScZ4=;
 b=Vqz/NRXDfj4D3YSwSG0iUdQx7/Zk99+7KUPbAlfGBvLPctqcUHsXquA1akNSV0sCjH
 iGgATriaXVHMIp/44zWa0+tamJeZHwvSuCE5IojEbhp2wL17+zz1XoutXyXK+c0VT45+
 P84HywLoTs7EE9aYcSow/vth4EKu0xnATyPCUJJw1h2eJRnKWCGhPbB1ydPDo1mIIuxh
 OT3eT8g4jbERvBILBr1leIztlCAQXNts+qLoCUOwUOTplTtYJudi1Dr7/1solBi7U+6t
 z+3ssZXE6Vzk//UYr7fOugoBq6orAqpb8Ag1TVpGxnMusImAPvctecS8U6e1j0W54o/l
 GUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=P87KIzJxApb5xuKIjKIB5bTsT1eNaV7VdO0NbRuScZ4=;
 b=YQC6LM891PHqslMZ+oi6mhQMA3MdoZUCw4MBEG/2drS+lRgBbdLO4p1FflNqFGmebL
 uFIw/J5D1onzYD2Mhr5H/J+cRRqrY58LHtqMKYp0gBri3kFaWljCvxL2F4tLUJbf7tOO
 Pg+gCKbReqKQmmyh8Yn+8XKYMgxNMnnmVZgoKJEDmWpPnfeEc2d7CGzT97c0/3fS4Eh0
 kNwU7ayppPy32OyAtkN6As/KwCVBhR5KQHvEjUYQRoLpKbErS6p5eFC/Rps0vElxigJ8
 xGmgLfzpu3O7bJaxBTT7tqVxfHVVU34IUcZsiQ8ziN/EmGg35yKXHxfzBn89KiqC+7y1
 +8Dg==
X-Gm-Message-State: APjAAAXLj2rqvWa/kuEQSy6m/JYBH3bbqbh/dk0Nsb0MbpMetsWZj8Ch
 lHvxqhWU4HBQNqF/aLxFHZEPiSPHpuSf3WFj4gZR6h/M
X-Google-Smtp-Source: APXvYqx5Qy0MevmoYwmvDPbZRNoNwH0g9whN4nOFNa4xkBhqtNpkVZLHWEN2K3+gTU/b5Avc7FP/Ns/4oLbYHdPpfiE=
X-Received: by 2002:a9d:30d1:: with SMTP id r17mr42344942otg.331.1554103839486; 
 Mon, 01 Apr 2019 00:30:39 -0700 (PDT)
MIME-Version: 1.0
From: Jayashankar Padath <padathjayashankar@gmail.com>
Date: Mon, 1 Apr 2019 13:00:28 +0530
Message-ID: <CAFRDoixCqZ9bBF0drK4RqNwVfpkU3f6PeDA0FQyv7rdUU1tHZw@mail.gmail.com>
Subject: Regarding the design of ApplyTime property defined in the
 UpdateService redfish schema
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000004bf6c5058572ff69"
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
X-List-Received-Date: Mon, 01 Apr 2019 07:30:45 -0000

--0000000000004bf6c5058572ff69
Content-Type: text/plain; charset="UTF-8"

I am working on the openbmc issue
https://github.com/ibm-openbmc/dev/issues/482.

We are implementing the ApplyTime property defined in the UpdateService
redfish schema http://redfish.dmtf.org/schemas/v1/UpdateService.v1_4_0.json.

        "ApplyTime": {
            "enum": [
                "Immediate",
                "OnReset",
                "AtMaintenanceWindowStart",
                "InMaintenanceWindowOnReset"
            ]

This ApplyTime property is global to all firmware update packages and
below is the designed changes:

1) Define a new dbus interface for the ApplyTime property at
phosphor-dbus-interfaces/xyz/openbmc_project/Software/ApplyTime.interface.yaml
    Review link for this change :
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/19707
2) We are thinking to host this new property by phosphor-settingsd

Does anyone have any comment about this design ?

Thanks in advance,
Jayashankar

--0000000000004bf6c5058572ff69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>I am working on the openbmc issue <a=
 href=3D"https://github.com/ibm-openbmc/dev/issues/482">https://github.com/=
ibm-openbmc/dev/issues/482</a>.</div><div>=C2=A0</div><div>We are implement=
ing the ApplyTime property defined in the UpdateService redfish schema <a h=
ref=3D"http://redfish.dmtf.org/schemas/v1/UpdateService.v1_4_0.json">http:/=
/redfish.dmtf.org/schemas/v1/UpdateService.v1_4_0.json</a>.</div><div><br><=
/div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;ApplyTime&quot;: {</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;enum&quot;: [</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Immediate&quot;,=
</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;On=
Reset&quot;,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;AtMaintenanceWindowStart&quot;,</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;InMaintenanceWindowOnReset&quot;</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]</div><div><br></div><d=
iv>This ApplyTime property is global to all firmware update packages and=C2=
=A0 below is the designed changes:</div><div><br></div><div>1) Define a new=
 dbus interface for the ApplyTime property at phosphor-dbus-interfaces/xyz/=
openbmc_project/Software/ApplyTime.interface.yaml</div><div>=C2=A0 =C2=A0 R=
eview link for this change : <a href=3D"https://gerrit.openbmc-project.xyz/=
c/openbmc/phosphor-dbus-interfaces/+/19707">https://gerrit.openbmc-project.=
xyz/c/openbmc/phosphor-dbus-interfaces/+/19707</a></div><div>2) We are thin=
king to host this new property by phosphor-settingsd</div><div>=C2=A0</div>=
<div>Does anyone have any comment about this design ?</div><div><br></div><=
div>Thanks in advance,</div><div>Jayashankar</div></div></div>

--0000000000004bf6c5058572ff69--
