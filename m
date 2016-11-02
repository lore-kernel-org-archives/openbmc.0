Return-Path: <raltherr@google.com>
Received: from mail-yb0-x229.google.com (mail-yb0-x229.google.com
 [IPv6:2607:f8b0:4002:c09::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7wpX0NMSzDvHV
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 15:58:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=o5oJWeDe; 
 dkim-atps=neutral
Received: by mail-yb0-x229.google.com with SMTP id o7so1503938ybb.0
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 21:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=XWu8VX3qFuwlyUM9kxu8HfLlFI6jruhfQmuwuWnzzNE=;
 b=o5oJWeDenU5exFMkdy16rbnsLj3kXIiKEmqaqeACE+wdwtJykXSPSD7pbZNIBX7ZZP
 NAm8gNSk3xN27WSP/Ad0wWt78Q+IG71w+3hnGAkV7yu7pj0QlQtgmmAww95S1Ju9RMjc
 Lk9kwOHL/tk8HAHN4NS5e4uHZnJEj74ojEhzEWY/0l44Mgnw/tC6YvkOcA2Z6G32kyXO
 zMnENLjbYYQcDpGUF99JhlRamBkKtdoRSwPYxIjYaQlH182VJbglHeWRtMGUwYDl7f7N
 FaSeTMLfdrcT/YCvzUhn5EF/2amO2nZCX419Qv9kSWdin1B18aRAP8kPcvegAvJlXWVJ
 CO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=XWu8VX3qFuwlyUM9kxu8HfLlFI6jruhfQmuwuWnzzNE=;
 b=Gwoziy0YCRSFDXdsT+nDrUKO+UwkLErLqrktrpoZtTZKi/Z+YlB0ElbQ8IbxmZH/dV
 Ra2zdR3GH9+edTIul4AijSPYH5thFv95jyxdta1gidFMQdK8v2sq9AKMbQhAg1A6rE3Y
 F5LuvM3XXoRLwVyLetznSYCiNBeJv7qvfhIj3QKuvGYLHY1Oe7gPmk0eIF9Q7FVCrVRC
 q70hwcLdNz4FOCDV450S0riqFHNbx55eUhIKFpl3Utwnte48xUYNf5xlhOzjXZUaNOLp
 0jPlv1Ii5/4/TLM/gxFkMNXk6Dd2PVVYNTmCzluWD4+qxkRpaTf8ts8b0oxbfys0cHPI
 4i9w==
X-Gm-Message-State: ABUngvcO259oLpvzU7DznuaCjM01QhWfjJUDVye2mpNVC7E3IeLrs526ZyihIlk6cJnn0TA32wc10Tej4c7uIkEn
X-Received: by 10.37.164.104 with SMTP id f95mr1150393ybi.49.1478062688587;
 Tue, 01 Nov 2016 21:58:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.160.4 with HTTP; Tue, 1 Nov 2016 21:58:07 -0700 (PDT)
In-Reply-To: <20161031210739.k2x67uz6m55j3n2u@asimov>
References: <20161031210739.k2x67uz6m55j3n2u@asimov>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 1 Nov 2016 21:58:07 -0700
Message-ID: <CAPLgG==F66J2S4Ex+tF1dAQY7RxiDD=rOcmZ8Y50jTcMLDWjrw@mail.gmail.com>
Subject: Re: Comments on Sensor design.
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=f403045c68e282c23b05404a49ed
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Nov 2016 04:58:12 -0000

--f403045c68e282c23b05404a49ed
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I see Type and Unit being conflated.  I find it perfectly reasonable to
report temperatures (called a Type in the example, in math/physics circles
it would be a measurement dimension) in any of =C2=BAF, =C2=BAC, or K (unit=
s).  In
the monitoring systems I've designed, I've used something like:

Interface xyz.openbmc_project.Sensor
                Properties:
                     - Instance Identifier (map<string, string>)
                     - Value (integer)
                     - Unit (string [enumeration])
                     - Scale (integer, n where real_value =3D value*10^n)

Where the path conveys a broader grouping of device type and the
measurement dimension:
/xyz/openbmc_project/sensors/cpu/temperature
/xyz/openbmc_project/sensors/fan/current_speed

That allows for querying the data in a variety of ways: all data about a
given element in the system (/xyz/openbmc_project/sensors/cpu with
instance_id <core=3D1>), one type of measurement across all instances of a
device type (/xyz/openbmc_project/sensors/cpu/temperature), etc.

On Mon, Oct 31, 2016 at 2:08 PM, Patrick Williams <patrick@stwcx.xyz> wrote=
:

> There was a request for us to start on the openbmc interfaces for
> Sensors in the near future.  Before we get started on it I wanted to
> solicit feedback on two divergent approaches.
>
> Before I start, keep in mind that any proposals for DBus designs will
> show up here:
>     https://gerrit.openbmc-project.xyz/#/q/project:openbmc/phosphor-dbus-
> interfaces+status:open
>
> The two divergent approaches are:
>
>     1. Have a single interface for all sensor readings.  Example:
>             Interface xyz.openbmc_project.Sensor
>                 Properties:
>                      - Value (integer)
>                      - Unit (string [enumeration])
>                      - Scale (integer, n where real_value =3D value*10^n)
>
>     2. Have unique interfaces for different kinds of sensor readings.
>             Interface xyz.openbmc_project.Sensor.Temperature
>             Interface xyz.openbmc_project.Sensor.Tach
>                 ( Same value and scale properties )
>
> In both cases the dbus path could contain the 'type':
>     /xyz/openbmc_project/sensors/temperature/ambient
>     /xyz/openbmc_project/sensors/fan_tach/fan0
>
> The question is essentially should the "Unit" property be used to
> resolve the 'type' or should we have distinct interfaces for each
> 'type'?
>
> For some comparison with other standards, CIM had a single Sensor class
> while Redfish seems to have multiple classes (Fan, Temperature) for each
> type.
>
> --
> Patrick Williams
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
>

--f403045c68e282c23b05404a49ed
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I see Type and Unit being conflated.=C2=A0 I find it perfe=
ctly reasonable to report temperatures (called a Type in the example, in ma=
th/physics circles it would be a measurement dimension) in any of =C2=BAF, =
=C2=BAC, or K (units).=C2=A0 In the monitoring systems I&#39;ve designed, I=
&#39;ve used something like:<div><br></div><div><span style=3D"font-size:12=
.8px">Interface xyz.openbmc_project.Sensor</span><br style=3D"font-size:12.=
8px"><span style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Properties:</span></div><div><span style=3D"font-size:=
12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0- Instance Identifier (map&lt;string, string&gt;)</span><br style=
=3D"font-size:12.8px"><span style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Value (integer)</=
span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Uni=
t (string [enumeration])</span><br style=3D"font-size:12.8px"><span style=
=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0- Scale (integer, n where real_value =3D value*10^n=
)</span><br></div><div><span style=3D"font-size:12.8px"><br></span></div><d=
iv><span style=3D"font-size:12.8px">Where the path conveys a broader groupi=
ng of device type and the measurement dimension:</span></div><div><span sty=
le=3D"font-size:12.8px">/xyz/openbmc_project/sensors/cpu/temperature</span>=
</div><div><span style=3D"font-size:12.8px">/xyz/openbmc_project/sensors/fa=
n/current_speed</span><span style=3D"font-size:12.8px"><br></span></div><di=
v><span style=3D"font-size:12.8px"><br></span></div><div><span style=3D"fon=
t-size:12.8px">That allows for querying the data in a variety of ways: all =
data about a given element in the system (</span><span style=3D"font-size:1=
2.8px">/xyz/openbmc_project/sensors/cpu with instance_id &lt;core=3D1&gt;),=
 one type of measurement across all instances of a device type (/xyz/openbm=
c_project/sensors/cpu/temperature), etc.</span></div></div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On Mon, Oct 31, 2016 at 2:08 PM, =
Patrick Williams <span dir=3D"ltr">&lt;<a href=3D"mailto:patrick@stwcx.xyz"=
 target=3D"_blank">patrick@stwcx.xyz</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">There was a request for us to start on the openbmc interf=
aces for<br>
Sensors in the near future.=C2=A0 Before we get started on it I wanted to<b=
r>
solicit feedback on two divergent approaches.<br>
<br>
Before I start, keep in mind that any proposals for DBus designs will<br>
show up here:<br>
=C2=A0 =C2=A0 <a href=3D"https://gerrit.openbmc-project.xyz/#/q/project:ope=
nbmc/phosphor-dbus-interfaces+status:open" rel=3D"noreferrer" target=3D"_bl=
ank">https://gerrit.openbmc-<wbr>project.xyz/#/q/project:<wbr>openbmc/phosp=
hor-dbus-<wbr>interfaces+status:open</a><br>
<br>
The two divergent approaches are:<br>
<br>
=C2=A0 =C2=A0 1. Have a single interface for all sensor readings.=C2=A0 Exa=
mple:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Interface xyz.openbmc_project.Sen=
sor<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Properties:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0- Value (integer)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0- Unit (string [enumeration])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0- Scale (integer, n where real_value =3D value*10^n)<br>
<br>
=C2=A0 =C2=A0 2. Have unique interfaces for different kinds of sensor readi=
ngs.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Interface xyz.openbmc_project.Sen=
sor.<wbr>Temperature<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Interface xyz.openbmc_project.Sen=
sor.<wbr>Tach<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ( Same value and sc=
ale properties )<br>
<br>
In both cases the dbus path could contain the &#39;type&#39;:<br>
=C2=A0 =C2=A0 /xyz/openbmc_project/sensors/<wbr>temperature/ambient<br>
=C2=A0 =C2=A0 /xyz/openbmc_project/sensors/<wbr>fan_tach/fan0<br>
<br>
The question is essentially should the &quot;Unit&quot; property be used to=
<br>
resolve the &#39;type&#39; or should we have distinct interfaces for each<b=
r>
&#39;type&#39;?<br>
<br>
For some comparison with other standards, CIM had a single Sensor class<br>
while Redfish seems to have multiple classes (Fan, Temperature) for each<br=
>
type.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Patrick Williams<br>
</font></span><br>______________________________<wbr>_________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
<br></blockquote></div><br></div>

--f403045c68e282c23b05404a49ed--
