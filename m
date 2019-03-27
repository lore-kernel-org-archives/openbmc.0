Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::830; helo=mail-qt1-x830.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nLgbWrE2"; 
 dkim-atps=neutral
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44TdVt5CN9zDqKg
 for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2019 17:33:40 +1100 (AEDT)
Received: by mail-qt1-x830.google.com with SMTP id p20so17555693qtc.9
 for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2019 23:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0OxpcGZ1PP526PVQyEXa8EaVMKhxTrD6BKH12rwQ3f8=;
 b=nLgbWrE2pX9/8TR2QqpVKnamkd2G3XrmbnImRlCwT/5b5dRQVeJ2x5KiREuhsdWfcI
 wwiqqDRZVlYDUDLOFg/J4rfwmoKNmKv4sUqk5QRSnDJWVrFlwsmpbuLI7xaepNZld5oI
 gp3JfF7Ikcq90ex3GTs/nRUp+uJvC8n0zhevdu8TtNgIg5ce6YaavsbyEyOpg5xSF7bU
 AYPXpPxgtmHvFN18yr8atcIrMV3+b2zAEB2Muak5UnTKInjNGMVoocHOKdYYzMmUHxq/
 gZtpGbVcsYBvDgnZFik2bVyUBUt6UwC5IsPKVa+hEAMmLg7vBc9D2UvWv8/3Kg3CYPSQ
 Oaug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0OxpcGZ1PP526PVQyEXa8EaVMKhxTrD6BKH12rwQ3f8=;
 b=OHABZQCXRHdRXJVfpuCVRVoZB09OCFROo14RJGaF/ZN+3XLtA4ZpbQjyCWpPKh5hWI
 2k4cEPMB93pXON7FIIe8uCOmsu929/8zacrzLYh8bL7qTEcy9cSuPsEL7DB5qc0P0Hvv
 /ZwUt50pJJclvBfpTwvtEr6OAunD6GWn52AE8/s+p4BD890XcoZBpCkakLnUPmx2cESH
 p4x0QVcRXrBaR8QBpXKUt/JnQgMyYcvNsJjF9UDIhzaFujWUrardBht7EIcKk79kMVin
 Zzz4iudwGWZdKzAeU1D6HbDa2YZ5UAwhyquizdDW+g07a6K+8fxxKR7tcDy9IfBiiDgJ
 1/dQ==
X-Gm-Message-State: APjAAAUlCfh6wAyJ3Osh3wySJMCLpo5gjQCgpNB6sIPhd4gzYb0cfqFd
 /bK8JAUXS/9PUSOdCq+fDQmhUOjfipP0/VKdXWM8WOlv
X-Google-Smtp-Source: APXvYqygaKwT/X/0nyaTxnVVF9ezIyDgPfBzj6pjQe2LJJesGn45cWfgeppaf3JrmAtIyyOMr83v1oyCOsovVlScpms=
X-Received: by 2002:ac8:72d3:: with SMTP id o19mr29815080qtp.274.1553668416441; 
 Tue, 26 Mar 2019 23:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cDQc=o_=vEFRAjRRq9bV2Fz6ZD7Osp+vkd2QRgxmGcXGg@mail.gmail.com>
 <bee0622c-8ae6-3db3-b7f7-9d48651cf907@linux.intel.com>
 <740E00DF-F233-41A1-B894-9DB98A9AD62A@fb.com>
 <CAG9c7cAHLdfqDMjWRnqbpw=VcA5zX96Sx2tqJ5TOMw9mKU7X=w@mail.gmail.com>
 <2B1545B0-29CC-4E8C-85B5-317A2E5AD5D9@fb.com>
 <CAG9c7cC3iWdQizTEthsM3J-BjSxJV_Btioz+WM_owYhsLo6HjA@mail.gmail.com>
 <0B090F23-9C2C-4B7A-B59A-206C6236E816@fb.com>
In-Reply-To: <0B090F23-9C2C-4B7A-B59A-206C6236E816@fb.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Wed, 27 Mar 2019 14:33:25 +0800
Message-ID: <CAG9c7cATKWrbFwYohmVazNW0w_3kfdJme=Q=Hmmg3Dr1uKx5Ew@mail.gmail.com>
Subject: Re: Some problems about FruDevice in the entity-manager
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: James Feist <james.feist@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000000f8fba05850d9ec1"
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
X-List-Received-Date: Wed, 27 Mar 2019 06:33:43 -0000

--0000000000000f8fba05850d9ec1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Vijay.

We expect the patch for direct reading from sysfs you said before.

BRs,
Henbin.

Vijay Khemka <vijaykhemka@fb.com> =E6=96=BC 2019=E5=B9=B43=E6=9C=8827=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=882:44=E5=AF=AB=E9=81=93=EF=BC=9A

> Hi Henbin,
>
> If you are by passing this check then you have to be careful in changing
> code. None of below changes are required. I can=E2=80=99t say without deb=
ugging,
> why your fru device is not getting scanned properly. Please hexdump your
> eeprom device through sys file system and verify if it has right data.
>
>
>
> Regards
>
> -Vijay
>
>
>
> *From: *Henbin Chang <henbinchang@gmail.com>
> *Date: *Monday, March 25, 2019 at 6:02 PM
> *To: *Vijay Khemka <vijaykhemka@fb.com>
> *Cc: *James Feist <james.feist@linux.intel.com>, OpenBMC Maillist <
> openbmc@lists.ozlabs.org>
> *Subject: *Re: Some problems about FruDevice in the entity-manager
>
>
>
> Hi Vijay,
>
> Currently, I bypass the 8/16bit checking to try dbus-sensor.
>
>
>
> I just followed your suggestion and only changed the one line.
>
> But I couldn't find the fru device under the tree of
> /xyz/openbmc_project/FruDevice/
>
>
>
> There was the below error message in the journal.
>
> Mar 26 08:17:56 henbin fru-device[1111]: failed to format fru for device
> at bus 6address 50
>
>
>
> Please let me know if you want to try other.
>
>
>
> BRs.
>
> Henbin.
>
>
>
> Vijay Khemka <vijaykhemka@fb.com> =E6=96=BC 2019=E5=B9=B43=E6=9C=8826=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=887:05=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Henbin,
>
> I am assuming your device is 16 bit and in your last email you said 16bit
> check is failing. If that check fails then following code will not get
> executed. Also while loop is same as i2c_smbus_read_i2c_block_data().
>
>
>
> I would suggest one thing, if your 16bit check is passing and still you
> don=E2=80=99t see fru device, please make only one line change below and =
test.
>
>     int ret =3D i2c_smbus_write_byte_data(file, high_addr, low_addr);
>
>     //int ret =3D i2c_smbus_write_byte_data(file, 0, low_addr);
>
>
>
> Please let me know result.
>
>
>
> Regards
>
> -Vijay
>
>
>
>
>
> *From: *Henbin Chang <henbinchang@gmail.com>
> *Date: *Sunday, March 24, 2019 at 6:39 PM
> *To: *Vijay Khemka <vijaykhemka@fb.com>
> *Cc: *James Feist <james.feist@linux.intel.com>, OpenBMC Maillist <
> openbmc@lists.ozlabs.org>
> *Subject: *Re: Some problems about FruDevice in the entity-manager
>
>
>
> Thanks for your response.
>
>
>
> I also encountered another problem.
>
>
>
> That's,  I found the content of 16-bit EEPROM through the combination of
> the SMBUS APIs was not incorrect.
>
>
>
>     /* This is for 16 bit addressing EEPROM device. First an offset
>
>      * needs to be written before read data from a offset
>
>      */
>
>     int ret =3D i2c_smbus_write_byte_data(file, 0, low_addr);
>
>     if (ret < 0)
>
>     {
>
>         return ret;
>
>     }
>
>
>
>     return i2c_smbus_read_i2c_block_data(file, high_addr, len, buf);
>
>
>
> So I referred to i2c-tools to modify them.
>
> And then I could see my FRU under the tree of
> 'xyz/openbmc_project/FruDevice/'
>
>
>
>     int ret =3D i2c_smbus_write_byte_data(file, high_addr, low_addr);
>
>     //int ret =3D i2c_smbus_write_byte_data(file, 0, low_addr);
>
>     if (ret < 0)
>
>     {
>
>         return ret;
>
>     }
>
>     while (index < len){
>
> buf[index] =3D i2c_smbus_read_byte(file);
>
> index++;
>
>     }
>
>
>
>     //return i2c_smbus_read_i2c_block_data(file, high_addr, len, buf);
>
>     return len;
>
>
>
> Let me know if you have any comments.
>
>
>
> Thanks.
>
>

--0000000000000f8fba05850d9ec1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Vijay.<div><br><div>We expect the patch=C2=A0<span =
style=3D"color:rgb(0,0,0);white-space:pre-wrap">for direct reading from sys=
fs=C2=A0you said before.</span></div></div><div><span style=3D"color:rgb(0,=
0,0);white-space:pre-wrap"><br></span></div><div><span style=3D"color:rgb(0=
,0,0);white-space:pre-wrap">BRs,</span></div><div><span style=3D"color:rgb(=
0,0,0);white-space:pre-wrap">Henbin.</span></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Vijay Khemka &lt;<a href=
=3D"mailto:vijaykhemka@fb.com">vijaykhemka@fb.com</a>&gt; =E6=96=BC 2019=E5=
=B9=B43=E6=9C=8827=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=882:44=E5=AF=
=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_7981011503735916229WordSection1">
<p class=3D"MsoNormal">Hi Henbin,<u></u><u></u></p>
<p class=3D"MsoNormal">If you are by passing this check then you have to be=
 careful in changing code. None of below changes are required. I can=E2=80=
=99t say without debugging, why your fru device is not getting scanned prop=
erly. Please hexdump your eeprom device through
 sys file system and verify if it has right data.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Regards<u></u><u></u></p>
<p class=3D"MsoNormal">-Vijay<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(181,196,223);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From: =
</span></b><span style=3D"font-size:12pt;color:black">Henbin Chang &lt;<a h=
ref=3D"mailto:henbinchang@gmail.com" target=3D"_blank">henbinchang@gmail.co=
m</a>&gt;<br>
<b>Date: </b>Monday, March 25, 2019 at 6:02 PM<br>
<b>To: </b>Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com" target=3D=
"_blank">vijaykhemka@fb.com</a>&gt;<br>
<b>Cc: </b>James Feist &lt;<a href=3D"mailto:james.feist@linux.intel.com" t=
arget=3D"_blank">james.feist@linux.intel.com</a>&gt;, OpenBMC Maillist &lt;=
<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists=
.ozlabs.org</a>&gt;<br>
<b>Subject: </b>Re: Some problems about FruDevice in the entity-manager<u><=
/u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal">Hi Vijay,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Currently, I bypass the 8/16bit checking to try dbus=
-sensor.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I just followed your suggestion and only changed the=
 one line.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">But I couldn&#39;t find the fru device under the tre=
e of /xyz/openbmc_project/FruDevice/<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">There was the below error message in the journal.<u>=
</u><u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">Mar 26 08:17:56 henbin fru-device[1111]: failed to f=
ormat fru for device at bus 6address 50<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Please let me know if you want to try other.<u></u><=
u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">BRs.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Henbin.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.co=
m" target=3D"_blank">vijaykhemka@fb.com</a>&gt;
<span style=3D"font-family:&quot;MS Gothic&quot;">=E6=96=BC</span> 2019<spa=
n style=3D"font-family:&quot;MS Gothic&quot;">=E5=B9=B4</span>3<span style=
=3D"font-family:&quot;MS Gothic&quot;">=E6=9C=88</span>26<span style=3D"fon=
t-family:&quot;MS Gothic&quot;">=E6=97=A5</span>
<span style=3D"font-family:&quot;MS Gothic&quot;">=E9=80=B1=E4=BA=8C</span>=
 <span style=3D"font-family:&quot;MS Gothic&quot;">
=E4=B8=8A=E5=8D=88</span>7:05<span style=3D"font-family:&quot;MS Gothic&quo=
t;">=E5=AF=AB=E9=81=93=EF=BC=9A</span><u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<div>
<div>
<p class=3D"MsoNormal">Hi Henbin,<u></u><u></u></p>
<p class=3D"MsoNormal">I am assuming your device is 16 bit and in your last=
 email you said 16bit check is failing. If that check fails then following =
code will not get executed. Also while loop is same
 as i2c_smbus_read_i2c_block_data(). <u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">I would suggest one thing, if your 16bit check is pa=
ssing and still you don=E2=80=99t see fru device, please make only one line=
 change below and test.<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 int ret =3D i2c_smbus_write_byte_data(=
file, high_addr, low_addr);<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 //int ret =3D i2c_smbus_write_byte_dat=
a(file, 0, low_addr);<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Please let me know result.<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Regards<u></u><u></u></p>
<p class=3D"MsoNormal">-Vijay<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(181,196,223);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From:
</span></b><span style=3D"font-size:12pt;color:black">Henbin Chang &lt;<a h=
ref=3D"mailto:henbinchang@gmail.com" target=3D"_blank">henbinchang@gmail.co=
m</a>&gt;<br>
<b>Date: </b>Sunday, March 24, 2019 at 6:39 PM<br>
<b>To: </b>Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com" target=3D=
"_blank">vijaykhemka@fb.com</a>&gt;<br>
<b>Cc: </b>James Feist &lt;<a href=3D"mailto:james.feist@linux.intel.com" t=
arget=3D"_blank">james.feist@linux.intel.com</a>&gt;, OpenBMC Maillist &lt;=
<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists=
.ozlabs.org</a>&gt;<br>
<b>Subject: </b>Re: Some problems about FruDevice in the entity-manager</sp=
an><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal">Thanks for your response.
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I also encountered another problem.<u></u><u></u></p=
>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">That&#39;s,=C2=A0 I found the content of 16-bit EEPR=
OM through the=C2=A0combination of the SMBUS APIs was not incorrect.<u></u>=
<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 /* This is for 16 bit addressing EEPRO=
M device. First an offset<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0* needs to be written before rea=
d data from a offset<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0*/<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 int ret =3D i2c_smbus_write_byte_data(=
file, 0, low_addr);<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 if (ret &lt; 0)<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 {<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<u></u><u></u=
></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 }<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 return i2c_smbus_read_i2c_block_data(f=
ile, high_addr, len, buf);<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">So I referred to i2c-tools to modify them.=C2=A0<u><=
/u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">And then I could see my FRU under the tree of &#39;x=
yz/openbmc_project/FruDevice/&#39;<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 int ret =3D i2c_smbus_write_byte_data(=
file, high_addr, low_addr);<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 //int ret =3D i2c_smbus_write_byte_dat=
a(file, 0, low_addr);<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 if (ret &lt; 0)<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 {<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<u></u><u></u=
></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 }<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 while (index &lt; len){<u></u><u></u><=
/p>
</div>
<div>
<p class=3D"MsoNormal">buf[index] =3D i2c_smbus_read_byte(file);<u></u><u><=
/u></p>
</div>
<div>
<p class=3D"MsoNormal">index++;<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 }<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 //return i2c_smbus_read_i2c_block_data=
(file, high_addr, len, buf);<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 return len;<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Let me know if you have any comments.<u></u><u></u><=
/p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks.<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>
</div>
</div>
</div>

</blockquote></div>

--0000000000000f8fba05850d9ec1--
