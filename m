Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="e82KdawO"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44LWmQ3P6LzDqTL
 for <openbmc@lists.ozlabs.org>; Sat, 16 Mar 2019 03:50:43 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id s23so6720611pfe.13
 for <openbmc@lists.ozlabs.org>; Fri, 15 Mar 2019 09:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WQpfYlqUPfTjIGNr7JnyoQcQM5nx0PAbSQg00fuSw8c=;
 b=e82KdawOZHjVxNViygThBoCueIV1lmJQbjBvL3wYW/Ni7D+IWTrNvQKXpduwKjIeOb
 kZRYV4wcNSf6XDEMznQSBjJBnIRG8d6MJnv6EFHkQadR+m8GYJGOfYAfDHhFNx2o68Jg
 iTUwVd6cZNfENzmer5DiKghGLe9K8abC6fxBGNSezkzN8b6gRV4aO24sNit0rXBQ21Jd
 79nYxBJrPzEq6McY7QSgXvmQkVgltBK4Z1jScPCS0AwtGfIOi5nBTCtIUEffw1NYFuOJ
 ZM4owrZ6y/qoYkAaClAAA6408KiqPk3SfYkGuar4Jx5sOOKpaOwEFEEjT/KvUNJnU3V3
 qdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WQpfYlqUPfTjIGNr7JnyoQcQM5nx0PAbSQg00fuSw8c=;
 b=Mum+X0DhAnqWKAIx4S8oOArBpR79s9g0tWtBICzk7nggLaLxs+D0H5XgTFbOOGBzLH
 JJasu6ae5hIrCaxwJXxLD6UXmk3CjKsIiFbvwq+qUisNDaE2T4doZXQBcNtor5MKyOuw
 ocB3Bc9yHH44mcn8u1Jyyz8/43OlC8l/l18tZzSt18TkR122yncvx9hYPQEXBdxKPY+9
 CNpGxrDyaElBwfT/n18Y7PfRF4PRkwkfFJQdUDbyDUSqRe5EiiDcIjMq2oVe/OkVrePK
 k9ymRdiaF+kwuw5TuAL1LemqxYNGBpXZngwOu19b0P8MRYLl64p+KZB/XlmKi1+LdzzH
 oXCQ==
X-Gm-Message-State: APjAAAWEXNnWHOBM5FXqkU68ah2jLexQI/HNLgOEvM6ARSGJoBmibSzW
 s21OZGhs9ySmg3GnzZ3aK05rVx9tjWmlLq+O+73nZg==
X-Google-Smtp-Source: APXvYqwmwAffiAGjsJxJax1VUPuNoJrM56ePmarOds/hV3uHzFTaw1AA8Mw9LUJtGb4PupDzknEBq/TDG81dzanDL0c=
X-Received: by 2002:a17:902:1486:: with SMTP id k6mr5196515pla.3.1552668639670; 
 Fri, 15 Mar 2019 09:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAO9PYRJjBTPEgymzS5aygU_=e2dBqDwMezFF2iOZ-Ah016dhYQ@mail.gmail.com>
 <CAJoAoZmWD_jx+qCtJV-KOXRGa0GO0w3JpOO_q4GHJ0KzR8LKuQ@mail.gmail.com>
 <CAO9PYRLkfidAqVTV-HU-SJAAdq9RARbLH8hanC+72rr03ibYNg@mail.gmail.com>
 <CAJoAoZmO1t4gougLchF-XacYVU5b7uR2qAYyXRHpjnwJNzdm6g@mail.gmail.com>
 <CAO9PYRKF5rVO7xJedEM4z7OAKLvtUU0LYJJb=rh7bUK85rJLkQ@mail.gmail.com>
 <CAJoAoZkLH8Bvsu8c1UNKdwhoxzJEGXcZ=GpdyrYt2wf_BTTWNg@mail.gmail.com>
 <CAO9PYR+t4BaVDA1+EHG9YXTf3MVd+2kf7LAiP1PcEwQvTgCgyA@mail.gmail.com>
 <CAJoAoZ=iZdB+HA1o9p1d3zgBaT9E93HpAos8PZ0fnXmcT3kJwQ@mail.gmail.com>
 <CAO9PYRLA6=1a9dsNPLj8zM5_xM9p=XUJ6gEe7-LbnFux_1+kkg@mail.gmail.com>
 <OF685C7ABC.91457B7F-ON002583B7.00595194-002583B7.005B0152@notes.na.collabserv.com>
 <CAO9PYR+CdKS5sbhBiJjy2PXEGaczLymS=vvtegG4H6h+q048pg@mail.gmail.com>
In-Reply-To: <CAO9PYR+CdKS5sbhBiJjy2PXEGaczLymS=vvtegG4H6h+q048pg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 15 Mar 2019 09:50:28 -0700
Message-ID: <CAO=notzeucOO+aBaz-d4R80d_bXNuBxWHmf5Ef07W1d_r+VsYQ@mail.gmail.com>
Subject: Re: Sensor value calculation formula
To: Deng Tyler <tyler.sabdon@gmail.com>
Cc: Milton Miller II <miltonm@us.ibm.com>,
 Emily Shaffer <emilyshaffer@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?546L5b+X5by6?= <wangzhiqiang8906@gmail.com>
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
X-List-Received-Date: Fri, 15 Mar 2019 16:50:47 -0000

On Thu, Mar 14, 2019 at 4:46 AM Deng Tyler <tyler.sabdon@gmail.com> wrote:
>
> Hi all:
>     Thank for your kindly reply and that really help me. I meat same prob=
lem discussed before by Patrick and Qianlihu as below. I add
>
> EXTRA_OECONF_append =3D " --enable-remove-from-dbus-on-fail" in hwmon app=
end, but it still not working. Hwmon monitor service still terminated  afte=
r init() called exit(0). I also try add "EXTRA_OECONF_append =3D " --enable=
-negative-errno-on-fail"" and still not working.
>
> What do I miss configuration or understand?

"""
when host powerd off
        1. echo add > /sys/class/hwmon/hwmon0/uevent
         2. failed to start phosphor-hwmon.
"""

After you run that add, what is the state of the sysfs path?  And what
is the configuration starting phosphor-hwmon.

What are you seeing on the journal (journalctrl --no-pager|grep hwmon)

>
> > On my board,when host powed off, the fan would stop.
> >
> > then,phosphor-hwmon failed to start
> >
> > debug:
> >
> > cat /sys/class/hwmon/hwmon0/fan1_input
> >         read error Connection timedout.
> >
> > edit the config file,
> >         LABEL_fan1 =3D fan1
> >         REMOVERCS =3D 110 // 110 means ETIMEDOUT
> >
> > when host powerd on
> >         1. echo add > /sys/class/hwmon/hwmon0/uevent
> >         2. phosphor-hwmon started
> >         3. host power off
> >         4. phosphor-hwmon did not exit.
> >         5. cpu usage of hwmon-read would be 4%
> >
> > when host powerd off
> >         1. echo add > /sys/class/hwmon/hwmon0/uevent
> >         2. failed to start phosphor-hwmon.
> >
> > I found when phosphor-hwmon init
> >
> >    Sensor::addValue would read fan1_input(there is no fan1_fault in sys=
fs),
> >    and it caused read timedout unexpection.
> >
> >    so init failed.
> >
> > On my board,I  want to boot the bmc with phosphor-hwmon when host power=
ed off.
> >
> > what should I do ?
>
> You have a couple options, one will basically remove the sensor from
> dbus on read failure, the other just leaves it but sets the value to
> -errno (in this case ETIMEDOUT).
>
> There are two configuration option switches for these, you can add it
> to your bbappend:
>
> EXTRA_OECONF_append =3D " --enable-remove-from-dbus-on-fail"
>
>
> EXTRA_OECONF_append =3D " --enable-negative-errno-on-fail"
>
> Milton Miller II <miltonm@us.ibm.com> =E6=96=BC 2019=E5=B9=B43=E6=9C=889=
=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=8812:34=E5=AF=AB=E9=81=93=EF=
=BC=9A
>>
>> On  03/06/2019 around 11:36PM in some timezone,  Deng Tyler wrote:
>>
>> >Hi Emily
>> >    I found it hardcoded in phosphor-hwmon for different sensor type.
>> >I think that scale value may be customized for more flexible to fit
>> >custom platform.
>>
>> Assuming that the sensor is exposed though a kernel sysfs hwmon
>> file, you should be looking to specify a gain for the file in sysfs inst=
ead.
>> Many sense devices already support a scale in the device tree.
>>
>> >
>> >Tyler
>> >Emily Shaffer <emilyshaffer@google.com> =E6=96=BC 2019=E5=B9=B43=E6=9C=
=887=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=881:22=E5=AF=AB=E9=81=93=
=EF=BC=9A
>> >Tyler,
>> >
>> >Sorry that I forgot. Yes, the scale is hardcoded for certain sensor
>> >types, ie voltage is always millivolts. I have asked about this
>> >before but maybe someone else on the list can give a better answer
>> >why that's the case.
>> >
>>
>> The Linux kernel hwmon API specifies the units for different sensors
>> as they are exposed in sysfs.  Hence the hwmon to dbus bridge can
>> hard code the unit for a given type of sensor.
>>
>> The hwmon API is documented at
>> https://www.kernel.org/doc/Documentation/hwmon/sysfs-interface
>> or
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/hwmon/sysfs-interface
>>
>> The above spec is linked as "HWMon interface" under the headings
>> "D-BUS" then "Path Definitions" headings in
>> https://github.com/openbmc/docs/blob/master/sensor-architecture.md
>>
>> milton
>>
>> Speaking for myself only.
>>
