Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PMvb3mKn"; 
 dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44StBs64cJzDq60
 for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2019 12:02:13 +1100 (AEDT)
Received: by mail-qt1-x831.google.com with SMTP id d13so8011944qth.5
 for <openbmc@lists.ozlabs.org>; Mon, 25 Mar 2019 18:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sw48ECHdwv9616JHUDLnPDj4UC/WV/6BhQQEcN5KNgs=;
 b=PMvb3mKnmW05o48ZWi2IPHtloPTDtpegdvPWK3G5Y9CHTN9MRP8wAlh1IsL41jTwiv
 U/GCNTHsCek+DGqNV4o1ag5QCUg0qITNM50uQ2BSLXAb3VaDc2jJNosogXqoYBejviCp
 tiG9U7wuKB96Qt+xuZCAgnwHkrxjRw0+ZLR2P9UaA5Ey3QSZZ/DWrZ76IjaP3k1ci4wm
 BazEWsA1ssYgWtLuSgx7mjbGPVvEQV8+ts1YuzH9Ww8DpfATqTzeOeC0BkZLHvHJw+p5
 tUtgmmig1/9kLUaoRvFCx9YJK6s9wuOJk/4jZhsr32W8EdedRmDpvs+HUayuCsCEptVx
 Qt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sw48ECHdwv9616JHUDLnPDj4UC/WV/6BhQQEcN5KNgs=;
 b=FeM3uYQz4JnIPIcgfA3ZwBDFSPBQeQYkO47mT1U2HsfEgulD/sF6EUD9ub/6bSI8n/
 UuAf9c7zYTaqSAcsMMw2D9yVWYucznCEA8BVfpBfj49N3Gf0BOKwcmg7UMH8COkV1kmL
 MmV/Z2v1kt6PY4UfV/wprSsbRkK7qKj7OmDaliiafZ/4z3YYj1OmpQLY21zHGosk+td5
 DY0kgOgcrgE5YKzggjHSLI+tKgenFgiYq2jyTRPY+EbvjqVhqAhWfaVE0mdVmkNQSo0g
 oUqoCdJhzryJUVmiA/WjCvS2DRTAsv0TnOHsUuBjs6atZkukz1WKWjDwFxcruxFQIxvM
 Xk2w==
X-Gm-Message-State: APjAAAXQloknQPXufWRK5RzUVG90+bWSqSsGKmPFlxjG+jEaQUfV9NL+
 8Og4gi+PBY+FCeT/K5Ls4RnFCgp73QS5ZQsr8eQ=
X-Google-Smtp-Source: APXvYqz98C+oCt9k8MD219Zyl0vE1IIaoMlt9SbA3FlZmvvLJJNWUpdkybubw+U7x7MBHaEVD8KHslLIDt5alkAa4rI=
X-Received: by 2002:a0c:b14d:: with SMTP id r13mr17224503qvc.80.1553562129512; 
 Mon, 25 Mar 2019 18:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cDQc=o_=vEFRAjRRq9bV2Fz6ZD7Osp+vkd2QRgxmGcXGg@mail.gmail.com>
 <bee0622c-8ae6-3db3-b7f7-9d48651cf907@linux.intel.com>
 <740E00DF-F233-41A1-B894-9DB98A9AD62A@fb.com>
 <CAG9c7cAHLdfqDMjWRnqbpw=VcA5zX96Sx2tqJ5TOMw9mKU7X=w@mail.gmail.com>
 <2B1545B0-29CC-4E8C-85B5-317A2E5AD5D9@fb.com>
In-Reply-To: <2B1545B0-29CC-4E8C-85B5-317A2E5AD5D9@fb.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Tue, 26 Mar 2019 09:01:57 +0800
Message-ID: <CAG9c7cC3iWdQizTEthsM3J-BjSxJV_Btioz+WM_owYhsLo6HjA@mail.gmail.com>
Subject: Re: Some problems about FruDevice in the entity-manager
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: James Feist <james.feist@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000ddbce40584f4de1b"
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
X-List-Received-Date: Tue, 26 Mar 2019 01:02:15 -0000

--000000000000ddbce40584f4de1b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vijay,
Currently, I bypass the 8/16bit checking to try dbus-sensor.

I just followed your suggestion and only changed the one line.
But I couldn't find the fru device under the tree of
/xyz/openbmc_project/FruDevice/

There was the below error message in the journal.
Mar 26 08:17:56 henbin fru-device[1111]: failed to format fru for device at
bus 6address 50

Please let me know if you want to try other.

BRs.
Henbin.

Vijay Khemka <vijaykhemka@fb.com> =E6=96=BC 2019=E5=B9=B43=E6=9C=8826=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=887:05=E5=AF=AB=E9=81=93=EF=BC=9A

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

--000000000000ddbce40584f4de1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi Vija=
y,</div><div>Currently, I bypass the 8/16bit checking to try dbus-sensor.</=
div><div><br></div><div>I just followed your suggestion and only changed th=
e one line.</div><div>But I couldn&#39;t find the fru device under the tree=
 of /xyz/openbmc_project/FruDevice/</div><div><br></div><div>There was the =
below error message in the journal.</div><div><div>Mar 26 08:17:56 henbin f=
ru-device[1111]: failed to format fru for device at bus 6address 50<br></di=
v></div><div><br></div><div>Please let me know if you want to try other.</d=
iv><div><br></div><div>BRs.</div><div>Henbin.</div><div><br></div><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Vijay Khemka &lt;<a=
 href=3D"mailto:vijaykhemka@fb.com">vijaykhemka@fb.com</a>&gt; =E6=96=BC 20=
19=E5=B9=B43=E6=9C=8826=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=887:05=
=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_-6690780380188087163WordSection1">
<p class=3D"MsoNormal">Hi Henbin,<u></u><u></u></p>
<p class=3D"MsoNormal">I am assuming your device is 16 bit and in your last=
 email you said 16bit check is failing. If that check fails then following =
code will not get executed. Also while loop is same as i2c_smbus_read_i2c_b=
lock_data(). <u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I would suggest one thing, if your 16bit check is pa=
ssing and still you don=E2=80=99t see fru device, please make only one line=
 change below and test.<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 int ret =3D i2c_smbus_write_byte_data(=
file, high_addr, low_addr);<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 //int ret =3D i2c_smbus_write_byte_dat=
a(file, 0, low_addr);<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Please let me know result.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Regards<u></u><u></u></p>
<p class=3D"MsoNormal">-Vijay<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(181,196,223);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From: =
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
<p class=3D"MsoNormal">Thanks for your response. <u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I also encountered another problem.<u></u><u></u></p=
>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">That&#39;s,=C2=A0 I found the content of 16-bit EEPR=
OM through the=C2=A0combination of the SMBUS APIs was not incorrect.<u></u>=
<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
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
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 return i2c_smbus_read_i2c_block_data(f=
ile, high_addr, len, buf);<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
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
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
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
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
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
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Let me know if you have any comments.<u></u><u></u><=
/p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
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

</blockquote></div></div></div></div>

--000000000000ddbce40584f4de1b--
