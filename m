Return-Path: <guhan.sac@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::233; helo=mail-qt0-x233.google.com;
 envelope-from=guhan.sac@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NMNQDb4E"; 
 dkim-atps=neutral
Received: from mail-qt0-x233.google.com (mail-qt0-x233.google.com
 [IPv6:2607:f8b0:400d:c0d::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zssh46JhszF1pp
 for <openbmc@lists.ozlabs.org>; Fri,  2 Mar 2018 12:50:24 +1100 (AEDT)
Received: by mail-qt0-x233.google.com with SMTP id m13so10155110qtg.13
 for <openbmc@lists.ozlabs.org>; Thu, 01 Mar 2018 17:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=qAQac7THOnBMhfFszfzopYai4jN/MILLdIb2lnj8eMM=;
 b=NMNQDb4EAzq8S4D0nRh4dFQ8HrQiL8ZIrNKD7cYzzOkl/KrLCVzZMkhIuAMuz2rxdc
 dWA929zPT3DCWdxM9PBCOFaqfeqRHIdDwWXl0QZV9XGl9usCSnXeXt+wpxE4LrQaScxb
 13dBX/cWBG9luos6OCLHJonjN3Cu7ifz0ltlF3ZsfEiIMnXAGpVUI9K2+mSTJPLBkZ0V
 F7vBg5kfi6xHajR6c+hBCVmOp/BmdO7BXOIIWCMHTBNihH1iv5B3713YsoFlpJQpAmCd
 WXaZvawsgGgZqVuwj+bm58R1I3OxJjMcDTxw8KtOJqc/t9kScxpCu+DofUCQ6tvIf5XM
 Atng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=qAQac7THOnBMhfFszfzopYai4jN/MILLdIb2lnj8eMM=;
 b=Bq5d1n0K0AYQgo1bRWsrxCPmUMO6ecslQ301iUO/eiNDd7JEe6fBdQDiRSQWwMEDsh
 G/5AWfwrO4gJdcNo6m6DKJ1vUzKXR1lmlzEtXB/Wl9GaDSvpP1wh399SZsqzjNbtP4FN
 BVCNcGfSPmwJ8sV5Hx6eHhREFJGIVdw73IPGN7eX3gLCTnx/F2yp8yHuAi8bxCZiGgJ1
 iTy1x3b69KIWjchGQo/LY2UtpAUgAktEt6PazBXTkQ/egW9jUbATSPd9zHYIvsXQup8g
 v3xAuOpes+bnttpIzGOjgyjzhAtPtI4RSQRQWqlRlzZ5FYF1sUKZJpFLZKiOtJqyR5hv
 piCQ==
X-Gm-Message-State: AElRT7Grrurf3ugL3Sbf5q3YHiGaPo5TMjo4Kt1bliIOlL0Dj07Oqp0A
 DZF9YZXtt67QwaRy9HMfRo3RQBzhQKe1SfS3OaOFRA==
X-Google-Smtp-Source: AG47ELssemoGS+K62NvUJgGRwStSxJ77dQuq8JUBZjbtNN/ZRmYNzdAFZGky2rQoASuDzN3SuLxACPSDxiO+cG4vTDM=
X-Received: by 10.200.41.231 with SMTP id 36mr6344779qtt.159.1519955420498;
 Thu, 01 Mar 2018 17:50:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.33.220 with HTTP; Thu, 1 Mar 2018 17:49:59 -0800 (PST)
In-Reply-To: <mailman.137.1518635814.10144.openbmc@lists.ozlabs.org>
References: <mailman.137.1518635814.10144.openbmc@lists.ozlabs.org>
From: guhan balasubramanian <guhan.sac@gmail.com>
Date: Thu, 1 Mar 2018 17:49:59 -0800
Message-ID: <CAMNAJg3uRy8V9NQJagXkdh=krK4Q5EqW+A4rwYDxZf92XOooTA@mail.gmail.com>
Subject: Re: openbmc Digest, Vol 30, Issue 51
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="001a1135b1d0e9cdf20566643221"
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
X-List-Received-Date: Fri, 02 Mar 2018 01:50:29 -0000

--001a1135b1d0e9cdf20566643221
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Currently in the IPMID (net and host) shared libraries, SDR and sensor ipmi
commands are addressed by querying the "IdInfoMap" data structure
(sensorhandler.cpp). This data structure is being filled up using
phosphor-sensor-inventory/config.yaml, during build time (as mentioned by
Patrick and Lei).

Assuming that we are not able to pre-fill the config yaml, is there a way
in the current implementation, where we can add sensors to this sensors
"IdInfoMap" data structure dynamically during run time?

Thanks,
Guhan



> Date: Wed, 14 Feb 2018 10:36:23 -0800
> From: Patrick Venture <venture@google.com>
> To: Lei YU <mine260309@gmail.com>
> Cc: "Sachin Naik (sachnaik)" <sachnaik@cisco.com>,
>         "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
> Subject: Re: Porting hwmon sensors to openBMC
> Message-ID:
>         <CAO=3DnotwMecK=3DGhvVUtgeVUZFV38K71Q5SSF0TeCS0CxY2W+axw@mail.gm
> ail.com>
> Content-Type: text/plain; charset=3D"UTF-8"
>
> Lei is correct. If you want, however, to read the sensors over IPMI
> you'll need to add a yaml configuration for the sensors as well for
> phosphor-host-ipmid.
> See https://github.com/openbmc/openbmc/blob/master/meta-openbmc-
> machines/meta-x86/meta-quanta/meta-q71l/recipes-phosphor/
> ipmi/q71l-ipmi-sensor-map/config.yaml
> for an example.
>
> On Tue, Jan 23, 2018 at 11:04 PM, Lei YU <mine260309@gmail.com> wrote:
> > On Tue, Jan 23, 2018 at 3:33 PM, Sachin Naik (sachnaik)
> > <sachnaik@cisco.com> wrote:
> >> Hi All
> >>
> >> I am porting a new board to openbmc.
> >> I have question on mapping hwmon type sensors to Dbus
> >>
> >> So far I have created machine layer and added U-boot config, Kernel
> config and device tree. In kernel config I have enabled lm75 hwmon driver
> for LM75 temperature device. Corresponding entry added in device tree.
> >>
> >> Right now I have created hwmon temperature sensors entry in our machin=
e
> layer by extending recipes-phosphor/sensors/phosphor-hwmon%.bbappend
> >> and created conf file with temperature sensors label.
> >>
> >> Now my question is how do implement/map dbus temperature sensor value
> interface to our hwmon temperature sensors? Is above implementation is
> enough or it requires
> >> Some mapping for dbus to hwmon instance?
> >
> > After you added config files for the temperature sensors with
> > phosphor-hwmon%.bbappend, phosphor-hwmon will read from
> > hwmon instance and create dbus objects at
> > /xyz/openbmc_project/sensors/, which will at least have "Value",
> > =E2=80=9CScale" and "Unit" properties.
> >
> > I do not think it requires other configs, unless I misunderstand
> > your case?
> >
> >>
> >> Thanks and regards
> >> Sachin
> >>
> >>
>

--001a1135b1d0e9cdf20566643221
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div=
>Hi,</div><div><br></div><div>Currently in the IPMID (net and host) shared =
libraries, SDR and sensor ipmi commands are addressed by querying the &quot=
;IdInfoMap&quot; data structure (sensorhandler.cpp). This data structure is=
 being filled up using phosphor-sensor-inventory/config.yaml, during build =
time (as mentioned by Patrick and Lei).=C2=A0</div><div><br></div><div>Assu=
ming that we are not able to pre-fill the config yaml, is there a way in th=
e current implementation, where we can add sensors to this sensors &quot;Id=
InfoMap&quot; data structure dynamically during run time?=C2=A0</div><div><=
br></div><div>Thanks,</div><div>Guhan</div><div><br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Date: Wed, 14 Feb 2018 10:36:23 -0800<br>
From: Patrick Venture &lt;<a href=3D"mailto:venture@google.com" target=3D"_=
blank">venture@google.com</a>&gt;<br>
To: Lei YU &lt;<a href=3D"mailto:mine260309@gmail.com" target=3D"_blank">mi=
ne260309@gmail.com</a>&gt;<br>
Cc: &quot;Sachin Naik (sachnaik)&quot; &lt;<a href=3D"mailto:sachnaik@cisco=
.com" target=3D"_blank">sachnaik@cisco.com</a>&gt;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"mailto:openbmc@lists.ozlabs.or=
g" target=3D"_blank">openbmc@lists.ozlabs.org</a>&quot; &lt;<a href=3D"mail=
to:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>=
&gt;<br>
Subject: Re: Porting hwmon sensors to openBMC<br>
Message-ID:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;CAO=3DnotwMecK=3D<a href=3D"mailto:GhvVUtge=
VUZFV38K71Q5SSF0TeCS0CxY2W%2Baxw@mail.gmail.com" target=3D"_blank">GhvVUtge=
VUZFV38K<wbr>71Q5SSF0TeCS0CxY2W+axw@mail.gm<wbr>ail.com</a>&gt;<br>
Content-Type: text/plain; charset=3D&quot;UTF-8&quot;<br>
<br>
Lei is correct. If you want, however, to read the sensors over IPMI<br>
you&#39;ll need to add a yaml configuration for the sensors as well for<br>
phosphor-host-ipmid.<br>
See <a href=3D"https://github.com/openbmc/openbmc/blob/master/meta-openbmc-=
machines/meta-x86/meta-quanta/meta-q71l/recipes-phosphor/ipmi/q71l-ipmi-sen=
sor-map/config.yaml" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/openbmc/ope<wbr>nbmc/blob/master/meta-openbmc-<wbr>machines/meta-x86/meta=
-quanta/<wbr>meta-q71l/recipes-phosphor/<wbr>ipmi/q71l-ipmi-sensor-map/<wbr=
>config.yaml</a><br>
for an example.<br>
<br>
On Tue, Jan 23, 2018 at 11:04 PM, Lei YU &lt;<a href=3D"mailto:mine260309@g=
mail.com" target=3D"_blank">mine260309@gmail.com</a>&gt; wrote:<br>
&gt; On Tue, Jan 23, 2018 at 3:33 PM, Sachin Naik (sachnaik)<br>
&gt; &lt;<a href=3D"mailto:sachnaik@cisco.com" target=3D"_blank">sachnaik@c=
isco.com</a>&gt; wrote:<br>
&gt;&gt; Hi All<br>
&gt;&gt;<br>
&gt;&gt; I am porting a new board to openbmc.<br>
&gt;&gt; I have question on mapping hwmon type sensors to Dbus<br>
&gt;&gt;<br>
&gt;&gt; So far I have created machine layer and added U-boot config, Kerne=
l config and device tree. In kernel config I have enabled lm75 hwmon driver=
 for LM75 temperature device. Corresponding entry added in device tree.<br>
&gt;&gt;<br>
&gt;&gt; Right now I have created hwmon temperature sensors entry in our ma=
chine layer by extending recipes-phosphor/sensors/phosp<wbr>hor-hwmon%.bbap=
pend<br>
&gt;&gt; and created conf file with temperature sensors label.<br>
&gt;&gt;<br>
&gt;&gt; Now my question is how do implement/map dbus temperature sensor va=
lue interface to our hwmon temperature sensors? Is above implementation is =
enough or it requires<br>
&gt;&gt; Some mapping for dbus to hwmon instance?<br>
&gt;<br>
&gt; After you added config files for the temperature sensors with<br>
&gt; phosphor-hwmon%.bbappend, phosphor-hwmon will read from<br>
&gt; hwmon instance and create dbus objects at<br>
&gt; /xyz/openbmc_project/sensors/, which will at least have &quot;Value&qu=
ot;,<br>
&gt; =E2=80=9CScale&quot; and &quot;Unit&quot; properties.<br>
&gt;<br>
&gt; I do not think it requires other configs, unless I misunderstand<br>
&gt; your case?<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Thanks and regards<br>
&gt;&gt; Sachin<br>
&gt;&gt;<br>
&gt;&gt;<br></blockquote></div></div></div>

--001a1135b1d0e9cdf20566643221--
