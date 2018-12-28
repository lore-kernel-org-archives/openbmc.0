Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="S3idDEz8"; 
 dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43R24d4dBvzDqMb
 for <openbmc@lists.ozlabs.org>; Fri, 28 Dec 2018 20:50:08 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id c73so10287229pfe.13
 for <openbmc@lists.ozlabs.org>; Fri, 28 Dec 2018 01:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=H8oR+xQS+fCZGt7Y20kZG4KQpxqVuces4OjFV8rW240=;
 b=S3idDEz8bS++B8/F3KdWtq1HO5vnZBbMvj7v8EfXJPJCow+zn0Wbwqi4OtpVkZJ/Vn
 +zRkunlcw7oQXh3sQwF5vaXCAFGAB56ntA4fQWlwP4f2MKwFSLYNsIlCjg7pi7fCqMXa
 l3NSkuQib9VDhtA+c/p1IAFhnvik2sb7rCquCtuDWg0rggKxGFdmqD3A7OJvkyhHZ5fJ
 o5Uz0pm6/2S00f6Qxj+zIoqFpRUPkkutn3NJrGSpiMLxF9yjWS1MH6YX3dW5lIeQeyGX
 fIai5X7f0Ea9fZAOXVVdDeED65+YTS4BLSWGZZZRlhalplBErRhiQi2dh0zcIAlb0+j9
 1udw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=H8oR+xQS+fCZGt7Y20kZG4KQpxqVuces4OjFV8rW240=;
 b=XS9SiCe0av7pPGQZG+q/UF3UPAhkLf5ex+5AUFtgC1l4MXbV41hPtl5h6hhKgnTUMe
 C2sJtOJaOM4lV3LIuHVSdusvQNI5zrh6z1Cjk9F1YqM0GcfQlPWr0ftcffuf7WryH02n
 dl9PyeTaWZkZgknu1v01vC2eNEiU987KLMvMNck9ObjNs6sKE3bcYvf+aoMzb/eLH2os
 gFpSfm9zpXd2lLrMW8CJQUMaKsin/Pshw6E7sp/7SxQ0wGYEPOwAwOPHRda4Elbs8oQk
 Vh/JxVIFg1CQ+fsUjI2cec4jYZ8YbKou2miwI4rQIND+jPiWDUj+NphQSB10P8UDJkPY
 rHfA==
X-Gm-Message-State: AJcUukdrMn43kRj7jQtCHZ6oHd6k5G3KtJjiC5dbz0mVuLxU5raBoSUF
 qfG06XhH4LhBnZodzzHiU8ed6CrGD/NAOnhE4YwClw==
X-Google-Smtp-Source: ALg8bN4RQDDbZJxH0t0W/gqDI7w3GxiTfkLKtoAMScacbt7uZQd45TR+mmUlNERa6AHmKaCRCi1XvLYrVXnxlczCYno=
X-Received: by 2002:a63:4d:: with SMTP id 74mr26280239pga.248.1545990606221;
 Fri, 28 Dec 2018 01:50:06 -0800 (PST)
MIME-Version: 1.0
References: <DFD47DF5-0CAE-4968-AF01-76B5884C2D58@fb.com>
 <7E9441B1E5EFFD4681F54958E821699345985566@ORSMSX114.amr.corp.intel.com>
 <2382D7CD-E130-4EDC-99AE-D993115C2A63@fb.com>
In-Reply-To: <2382D7CD-E130-4EDC-99AE-D993115C2A63@fb.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 28 Dec 2018 01:49:54 -0800
Message-ID: <CAO=notwPOqcrNMG2H5Yc8kiZa6GGJv+FPbVqeumG9b=Btoc_pw@mail.gmail.com>
Subject: Re: Testing Phosphor-pid-control
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: "Tanous, Ed" <ed.tanous@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 28 Dec 2018 09:50:11 -0000

On Thu, Dec 20, 2018 at 12:57 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Hi Ed,
> I am able to override and read it back but not seeing any change in pwm d=
ata as well as fan speed. I have swampd running.

You mean the dbus reads of the values aren't changing?  I'm not as
familiar with the dbus-sensor integration beyond run-time
configuration, versus run-time state.  Swampd itself doesn't expose
PID information or set-point information unless that's done in the
step controller (and I didn't see that aspect in that object).

Or are you saying that the fan speeds aren't changing when you read
the hwmon values?

>
> Regards
> -Vijay
>
> =EF=BB=BFOn 12/20/18, 10:14 AM, "Tanous, Ed" <ed.tanous@intel.com> wrote:
>
>     Assuming you=E2=80=99re using dbus-sensors (which I=E2=80=99m pretty =
sure you are):
>
>     Support for overriding sensor values was recently landed in this comm=
it:
>     https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__gerrit.openbmc=
-2Dproject.xyz_-23_c_openbmc_dbus-2Dsensors_-2B_16177_&d=3DDwIGaQ&c=3D5VD0R=
TtNlTh3ycd41b3MUw&r=3Dv9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&m=3D1J-5e=
Jl4Drc2LKcQ2SdONc02uR5cih3P68m66QcMYog&s=3Dc9798qmI_pA3hnzB97oaYFK8yFTmwrxd=
pAeRrui4qkY&e=3D
>
>     Overriding a sensor value with a "fake" sensor reading should be as e=
asy as simply calling SetProperty on the dbus interface.
>
>     Example as tested on my system (your path names may vary)
>     dbus-send --system --print-reply --dest=3Dxyz.openbmc_project.CPUSens=
or /xyz/openbmc_project/sensors/temperature/Core_1_CPU0 org.freedesktop.DBu=
s.Properties.Set string:xyz.openbmc_project.Sensor.Value string:Value varia=
nt:double:1.0
>
>     and verify by reading it back out:
>
>     dbus-send --system --print-reply --dest=3Dxyz.openbmc_project.CPUSens=
or /xyz/openbmc_project/sensors/temperature/Core_1_CPU0 org.freedesktop.DBu=
s.Properties.GetAll string:xyz.openbmc_project.Sensor.Value
>
>
