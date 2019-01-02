Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Vmdm1ZID"; 
 dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43VL8933W9zDq8Y
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jan 2019 06:04:41 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id q1so15556341pfi.5
 for <openbmc@lists.ozlabs.org>; Wed, 02 Jan 2019 11:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dSIElgwspZhqPhlp8yAV6C5jUMO64kCbf8uWBTg+ZNk=;
 b=Vmdm1ZIDddMlplHzHZgi85lR69NFNfglT7PKfwviAJfLu/OQXClaFkumDRtiNeoquo
 ZHxo+tttSWyPuvkaULV0c6t8Y4LWiWZx2RNAYiz0P6WTJFoNeEU+e67E2DoR5qPndTJn
 4yJ5F4alOIZwNuPCPKwWBN3Q83pXM77xxOZMlHLkgl1Z6XV/XQRrvANctCpBBt6lXKKn
 5JLOkjBGo+8aZgS4Qig1D6XL93oGKbh1itvoIr81Da3nnwc7YFx60ujU5ZFg4g32nFH3
 T7m1iB8TMCZNw60ZWGtr2iphZ45goBS5kpxHet+5Nq5Uka+/E9MT858BwYJTSrhfdTPX
 hTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dSIElgwspZhqPhlp8yAV6C5jUMO64kCbf8uWBTg+ZNk=;
 b=Lyl1vUKsVvgUf5g0ejzDD3h6sSfsIWFGEfYu5Pe9pkd5vvwfrxHMDcq7uAWtcF/Ph4
 Yqg6D7J/eTH/+r9Bl/ypD/EK1QFtvW9DC95/F2NQDBJG6E8yq8qWOCTc6ipDuDD7Z012
 3LwDVJIhhQk3NQiKzvxz3gaoSJOgLgX1nsl02n4nn+ANUOWNI/ETZJzM89n+PvETnnhu
 23RhrbDtByRJSBmYcLhObcci6D5/aMEopLs8jcj6kuyI7Z8KsIDl06f/Cq66krPt/OOv
 Ir2whYVeMhAWbEW67STmM2tQUh55wCnYyhmC3dGyVLX2Y8xZWGvs4KUt9Mmujgg8ML39
 pUQQ==
X-Gm-Message-State: AA+aEWbjJuNhY0IBDy8QquXOz0V6Slhc3RR9vQy0npH6RtMZ8t8Rx3Vp
 Hbta3ed7G45d+DXaKPsGl2Wt5p12/IME/8gDmnOdkA==
X-Google-Smtp-Source: AFSGD/XX46lcROIEIMYOGPSTLKco27fRBx/TExTKBSJUBfps2Uz5MXDEo1qddTp4461m6yUMOhBCjJCx8xDny98RuTs=
X-Received: by 2002:a62:5d0c:: with SMTP id r12mr47168417pfb.0.1546455879112; 
 Wed, 02 Jan 2019 11:04:39 -0800 (PST)
MIME-Version: 1.0
References: <DFD47DF5-0CAE-4968-AF01-76B5884C2D58@fb.com>
 <7E9441B1E5EFFD4681F54958E821699345985566@ORSMSX114.amr.corp.intel.com>
 <2382D7CD-E130-4EDC-99AE-D993115C2A63@fb.com>
 <CAO=notwPOqcrNMG2H5Yc8kiZa6GGJv+FPbVqeumG9b=Btoc_pw@mail.gmail.com>
 <74BCEC89-4EFC-4FB7-BE76-0367361EDAA2@fb.com>
In-Reply-To: <74BCEC89-4EFC-4FB7-BE76-0367361EDAA2@fb.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 2 Jan 2019 11:04:28 -0800
Message-ID: <CAO=notwS+gXEVTa-7tqa54qvbmEntSyGJ+c5SeVe1w65yam50Q@mail.gmail.com>
Subject: Re: Testing Phosphor-pid-control
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: "Tanous, Ed" <ed.tanous@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 James Feist <james.feist@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 02 Jan 2019 19:04:43 -0000

On Wed, Jan 2, 2019 at 11:00 AM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Hi Patrick,
> I am not seeing any change in fan speed when I read hwmon values. Can you=
 please give me any formula how it is using data to change speed. Because I=
 tried faking several temperatures and finally could make this change when =
I bring temperature below 10 but it doesn't change when I take temperature =
to more than max value.

Which PID controller are you using?  If you only have sensors
configured then there's nothing to push the changes, presumably you
have a PID added.  Depending on which you chose, depends on what's
happening with it -- that's why I'm asking for more.  The formula for
the "normal" pid controller is such that it tries to reduce the
"error" between the set-point and the real fan speeds.

https://github.com/openbmc/phosphor-pid-control/blob/master/pid/ec/pid.cpp#=
L43

There's also a step-wise controller option, which is why I'm asking.

>
> Regards
> -Vijay
>
> =EF=BB=BFOn 12/28/18, 1:50 AM, "Patrick Venture" <venture@google.com> wro=
te:
>
>     On Thu, Dec 20, 2018 at 12:57 PM Vijay Khemka <vijaykhemka@fb.com> wr=
ote:
>     >
>     > Hi Ed,
>     > I am able to override and read it back but not seeing any change in=
 pwm data as well as fan speed. I have swampd running.
>
>     You mean the dbus reads of the values aren't changing?  I'm not as
>     familiar with the dbus-sensor integration beyond run-time
>     configuration, versus run-time state.  Swampd itself doesn't expose
>     PID information or set-point information unless that's done in the
>     step controller (and I didn't see that aspect in that object).
>
>     Or are you saying that the fan speeds aren't changing when you read
>     the hwmon values?
>
>     >
>     > Regards
>     > -Vijay
>     >
>     > On 12/20/18, 10:14 AM, "Tanous, Ed" <ed.tanous@intel.com> wrote:
>     >
>     >     Assuming you=E2=80=99re using dbus-sensors (which I=E2=80=99m p=
retty sure you are):
>     >
>     >     Support for overriding sensor values was recently landed in thi=
s commit:
>     >     https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__gerrit.o=
penbmc-2Dproject.xyz_-23_c_openbmc_dbus-2Dsensors_-2B_16177_&d=3DDwIGaQ&c=
=3D5VD0RTtNlTh3ycd41b3MUw&r=3Dv9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&m=
=3D1J-5eJl4Drc2LKcQ2SdONc02uR5cih3P68m66QcMYog&s=3Dc9798qmI_pA3hnzB97oaYFK8=
yFTmwrxdpAeRrui4qkY&e=3D
>     >
>     >     Overriding a sensor value with a "fake" sensor reading should b=
e as easy as simply calling SetProperty on the dbus interface.
>     >
>     >     Example as tested on my system (your path names may vary)
>     >     dbus-send --system --print-reply --dest=3Dxyz.openbmc_project.C=
PUSensor /xyz/openbmc_project/sensors/temperature/Core_1_CPU0 org.freedeskt=
op.DBus.Properties.Set string:xyz.openbmc_project.Sensor.Value string:Value=
 variant:double:1.0
>     >
>     >     and verify by reading it back out:
>     >
>     >     dbus-send --system --print-reply --dest=3Dxyz.openbmc_project.C=
PUSensor /xyz/openbmc_project/sensors/temperature/Core_1_CPU0 org.freedeskt=
op.DBus.Properties.GetAll string:xyz.openbmc_project.Sensor.Value
>     >
>     >
>
>
