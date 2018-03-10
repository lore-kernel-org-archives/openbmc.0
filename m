Return-Path: <guhan.sac@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::234; helo=mail-qt0-x234.google.com;
 envelope-from=guhan.sac@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iAqEDF7c"; 
 dkim-atps=neutral
Received: from mail-qt0-x234.google.com (mail-qt0-x234.google.com
 [IPv6:2607:f8b0:400d:c0d::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zypCk34GMzF1vx
 for <openbmc@lists.ozlabs.org>; Sat, 10 Mar 2018 13:31:29 +1100 (AEDT)
Received: by mail-qt0-x234.google.com with SMTP id v90so13197959qte.12
 for <openbmc@lists.ozlabs.org>; Fri, 09 Mar 2018 18:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5GjvTRgDOoghMb8xIZNtd7CrVvsT4Zks4OpuJSR/HQE=;
 b=iAqEDF7cghpRzaEoQP5qp072gpyDHz8KsJ+3SiiZvPMh53sntjlIbMdGNtueRvnb8c
 PpNMTt4PbxUmyPXUSzroDsbJQ5EMrSLibco+QVt/Ah6o6Jr3BXENIi6spgwVwCX++GR8
 Awt/Usz0U2OBhJQUVEeeeWE7z5J4138Y9umq68oxNPqQ0ywieBC+wEE5UB9CzDHJtNPC
 8F7mEYj+6kDSzrRygtINyzAsmwzboi8hpa+a8ZUclhCW9gCcGC9r1rkWE0b5I7S/lEnM
 0AEB6rlRSpIz2a80v09gR3zNESih3pn1hTjwaMAhhRe0dqhodMqkuz2OXAF0xEsNGNfU
 i5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5GjvTRgDOoghMb8xIZNtd7CrVvsT4Zks4OpuJSR/HQE=;
 b=YMNgTElYLe24Zahgf/J3LZ1gJdS5a7TV1Rq2rG3D+RzVtNnP3R2NuKV12Y7R/u9Hs2
 1eM7P2uERX163K7aRgHRu9nlyx6A0tEcMzMxINADu4CNCfxMSHjxjjWOmPe8Y5RMvstk
 R9caeULvVqCE+sj6reWUnPv95s9hib0KjZdOcj5pIzUJ77aiXS0nmsG9kXdxZRO7u5k7
 Nl0BWQTi8fWCALHqX+MNTjoAX9VE00ds0hZSvikrPGEMje/N4ycFRKu/4sRJHGE+NYFh
 xhndv4lo5G/7H08RG4wBifJasyrdCt0ZAKOhi3TUuAuw9Asy3QOu8hAwPKzedq3ID1cI
 +gEQ==
X-Gm-Message-State: AElRT7Fe9k4mBrWzfzvqfpioOog4JQuk79HBd6JrZJjxnxkNFmzNoa1C
 TNtBzw/QUcr5Cz6s3HdDWbcLNyCzeXaWHe+iREP67g==
X-Google-Smtp-Source: AG47ELu+JUlGzWrG2T8NBcClVo1E4/tlo77mSl1q+a7i7v4hNVX9JfP3GXoRnFnWizALAgRnKyVmdxFLczAStZQQqzU=
X-Received: by 10.200.41.231 with SMTP id 36mr917493qtt.159.1520649086613;
 Fri, 09 Mar 2018 18:31:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.36.195 with HTTP; Fri, 9 Mar 2018 18:31:06 -0800 (PST)
From: guhan balasubramanian <guhan.sac@gmail.com>
Date: Fri, 9 Mar 2018 18:31:06 -0800
Message-ID: <CAMNAJg3dMki4zJhDyAFfJndwo_j8NA7UjTek0LUD3SCMfQwf1w@mail.gmail.com>
Subject: Sensor readings as 1-byte
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="001a1135b1d0a2bdb4056705b47e"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 10 Mar 2018 02:31:32 -0000

--001a1135b1d0a2bdb4056705b47e
Content-Type: text/plain; charset="UTF-8"

Hi,

According to the IPMI spec, we represent all sensor readings (Volt, Temp,
Amp, etc.) as 1-byte.

Since we represent them as 1-byte, we use a linearization formula to
convert to actual value as follows:

y = (M*x + B*10^(k1))*10^(k2)

where x is the 1-byte value that is filled in the get sensor reading
command.

We see in the ipmitool example on how an example of 3.36 V is represented
as 1-byte.
https://computercheese.blogspot.com/2013/10/ipmi-sensor-reading-conversion-formula.html?q=sensor

Can any one please help on how the values for M, B, k1 and k2 are populated
for each sensor?

In the openbmc repo, I believe these values are present in the config.yaml
of phosphor-ipmi-sensor-inventory (based on the following sample).

0xF1:
  sensorType: 0x01
  path: /xyz/openbmc_project/sensors/temperature/temp1
  sensorReadingType: 0x01
  *multiplierM*: 511
  *offsetB*: 0
  *bExp*: 0
  mutability: Mutability::Write|Mutability::Read
  serviceInterface: org.freedesktop.DBus.Properties
  readingType: readingData
  interfaces:
    xyz.openbmc_project.Sensor.Value:
      Value:
        Offsets:
          0x0:
            type: int64_t


Thanks,
Guhan

--001a1135b1d0a2bdb4056705b47e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>According to the IPMI spec, we repr=
esent all sensor readings (Volt, Temp, Amp, etc.) as 1-byte.=C2=A0</div><di=
v><br></div><div>Since we represent them as 1-byte, we use a linearization =
formula to convert to actual value as follows:</div><div><br></div><div>y =
=3D (M*x + B*10^(k1))*10^(k2)</div><div><br></div><div>where x is the 1-byt=
e value that is filled in the get sensor reading command.</div><div><br></d=
iv><div>We see in the ipmitool example on how an example of 3.36 V is repre=
sented as 1-byte.=C2=A0</div><div><a href=3D"https://computercheese.blogspo=
t.com/2013/10/ipmi-sensor-reading-conversion-formula.html?q=3Dsensor">https=
://computercheese.blogspot.com/2013/10/ipmi-sensor-reading-conversion-formu=
la.html?q=3Dsensor</a></div><div><br></div><div>Can any one please help on =
how the values for M, B, k1 and k2 are populated for each sensor?=C2=A0</di=
v><div><br></div><div>In the openbmc repo, I believe these values are prese=
nt in the config.yaml of phosphor-ipmi-sensor-inventory (based on the follo=
wing sample).=C2=A0</div><div><br></div><div><div>0xF1:</div><div>=C2=A0 se=
nsorType: 0x01</div><div>=C2=A0 path: /xyz/openbmc_project/sensors/temperat=
ure/temp1</div><div>=C2=A0 sensorReadingType: 0x01</div><div>=C2=A0 <b>mult=
iplierM</b>: 511</div><div>=C2=A0 <b>offsetB</b>: 0</div><div>=C2=A0 <b>bEx=
p</b>: 0</div><div>=C2=A0 mutability: Mutability::Write|Mutability::Read</d=
iv><div>=C2=A0 serviceInterface: org.freedesktop.DBus.Properties</div><div>=
=C2=A0 readingType: readingData</div><div>=C2=A0 interfaces:</div><div>=C2=
=A0 =C2=A0 xyz.openbmc_project.Sensor.Value:</div><div>=C2=A0 =C2=A0 =C2=A0=
 Value:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Offsets:</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x0:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 type: int64_t</div></div><div><table class=3D"gmail-highlight gmail-=
tab-size gmail-js-file-line-container" style=3D"box-sizing:border-box;borde=
r-collapse:collapse;color:rgb(36,41,46);font-family:-apple-system,system-ui=
,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&qu=
ot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;font-size:14px;f=
ont-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fon=
t-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial"><tbody=
 style=3D"box-sizing:border-box"><tr style=3D"box-sizing:border-box"><td id=
=3D"gmail-LC18" class=3D"gmail-blob-code gmail-blob-code-inner gmail-js-fil=
e-line" style=3D"box-sizing:border-box;padding:0px 10px;line-height:20px;ve=
rtical-align:top;overflow:visible;font-family:SFMono-Regular,Consolas,&quot=
;Liberation Mono&quot;,Menlo,Courier,monospace;font-size:12px;color:rgb(36,=
41,46);word-wrap:normal;white-space:pre"><br></td></tr></tbody></table><br>=
</div><div>Thanks,</div><div>Guhan</div><div><br></div></div>

--001a1135b1d0a2bdb4056705b47e--
