Return-Path: <guhan.sac@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4002:c05::230; helo=mail-yw0-x230.google.com;
 envelope-from=guhan.sac@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wpx1xkxY"; 
 dkim-atps=neutral
Received: from mail-yw0-x230.google.com (mail-yw0-x230.google.com
 [IPv6:2607:f8b0:4002:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40MhrS2gHkzDrDT
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 12:42:12 +1000 (AEST)
Received: by mail-yw0-x230.google.com with SMTP id h28so2123298ywk.5
 for <openbmc@lists.ozlabs.org>; Thu, 12 Apr 2018 19:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=lhBFXumsrQNYydj8+RwT0k9ijzTOviQu2htvki4d0jk=;
 b=Wpx1xkxY5jQvgu6vJu85bFgDxU/3Q/EiUcJ8KOBc8r1QfCLvYRYu0IihJ8KzIOrH6E
 ZVq8YsjQtwKTMl23V5NvYR7bCdODhrIWEnrYEkPpe6MqbVgxHt8f268BsM73bdF2iin2
 cDGIeYv1Z0IbU+e9PjA93iJ99STCNYp7Gl8SxLIoCSp+cFiHlPnl5JEag0aIo2MRDE7g
 44zzjNDxm0WnZsFM/7QdP7etIhh4ha3/6fvULI2zP9yrTv5Aoo+T9hqrrFh8BRNSTdcx
 alGyjclDM33wZF5GkePv4GDgkdj0Hvwu2rtXuD81tqcmhxvogYSpML27KuWqqJXOc1HX
 ILiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=lhBFXumsrQNYydj8+RwT0k9ijzTOviQu2htvki4d0jk=;
 b=qc4dyFRQxRKvtuLQUttblJVimrCzaCo2BboPOmwDKLvrg6ODvBsmvRzBSkO4L5GPbX
 5FVTF2Je6/RXNeheVQGXFB7X+KAIQUa+EjW7aWClIxUw0avgOSNoAwBjCxVv1OoAxkw6
 WM32l/PFB9S6K6t7kY/ZTBhqd2zXMurPh4MfGsY80c8vesxfsfzVaE4g6h8AJ3F3kOzL
 W2fr9oHW3T9oAiipUBVxdGlXhlMXVgnp9sdpLuZj3dP3LjB4baZpmWsfcR4/HBFtKPDs
 bjUScvq6l3yekJFJARlh1QoDJhc/ltpMf8Mq1EOBMHLIhz5qOg43mQ1TGl7zKG6+pFky
 blaA==
X-Gm-Message-State: ALQs6tBd7kOqujfiuzxUmZmc59zKqTqU08V41isEmWbqFxWmQZSLZfA4
 kLOQ7Sniay458UrkJHcTCpBzMAxpMfkA95svMr8=
X-Google-Smtp-Source: AIpwx4/iThGRaxD/r4mi1ATzHrmSrbAuj4ox9FjIvurFc64Q9tZrROoVlPq3+J0nB7pdSkqnHjj/L+5cEZFie31xipg=
X-Received: by 10.13.199.193 with SMTP id j184mr2667209ywd.383.1523587329699; 
 Thu, 12 Apr 2018 19:42:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.37.114 with HTTP; Thu, 12 Apr 2018 19:41:49 -0700 (PDT)
From: guhan balasubramanian <guhan.sac@gmail.com>
Date: Thu, 12 Apr 2018 19:41:49 -0700
Message-ID: <CAMNAJg36J-8BjiKpHRaDJYTw0pJEnwTG=2+PKgzgNDAb_w6K9g@mail.gmail.com>
Subject: Re: Sensor readings as 1-byte
To: Tom Joseph <tomjose@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="001a114e544a9236a40569b1d173"
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
X-List-Received-Date: Fri, 13 Apr 2018 02:42:17 -0000

--001a114e544a9236a40569b1d173
Content-Type: text/plain; charset="UTF-8"

Hi Tom,

Thanks for the explanation. But I still see some concerns in this
conversion logic.

For input, we have 4 given parameters as
    1. Min and Max values of the sensor (y)
    2. the Min and Max values of the byte value (x - assuming this is
always 0 to 255).

For output, we have 4 paramters to calculate
    1. multiplierM (M)
    2. offsetB (B)
    3. bExp (k1)
    4. rExp (k2)

We have two equations to compute 4 variables in this logic.


On Sat, Mar 10, 2018 at 9:45 AM, Tom Joseph <tomjose@linux.vnet.ibm.com>
wrote:

> Hello Guhan,
> The updated sensor-example.yaml has the Rexp field as well. These values
> are  calculated based on the minimum and maximum value of the sensor.
>
> If a temperature sensor has a range of -127 - +128, means y is -127 to
> +128 and the range of x is 0-255.
> By substituting x = 0 and y = -127 (k2 is the decimal precision and assume
> in this case as whole nos) implies Bexp = -127.
> Similarly substitute x = 255 and y = 128 and M is evaluated as 1.
>

In the above example, with 2 values [(0, -127) and (255, 128)] for (x,y) we
were able to calculate M and B. We are assuming k2 as 0 since we are taking
only whole numbers for our ranges (y values). But we are still assuming the
values for k1 as 0.


>
> Regards,
> Tom
>
>
> On Saturday 10 March 2018 08:01 AM, guhan balasubramanian wrote:
>
> Hi,
>
> According to the IPMI spec, we represent all sensor readings (Volt, Temp,
> Amp, etc.) as 1-byte.
>
> Since we represent them as 1-byte, we use a linearization formula to
> convert to actual value as follows:
>
> y = (M*x + B*10^(k1))*10^(k2)
>
> where x is the 1-byte value that is filled in the get sensor reading
> command.
>
> We see in the ipmitool example on how an example of 3.36 V is represented
> as 1-byte.
> https://computercheese.blogspot.com/2013/10/ipmi-
> sensor-reading-conversion-formula.html?q=sensor
>
> Can any one please help on how the values for M, B, k1 and k2 are
> populated for each sensor?
>
> In the openbmc repo, I believe these values are present in the config.yaml
> of phosphor-ipmi-sensor-inventory (based on the following sample).
>
> 0xF1:
>   sensorType: 0x01
>   path: /xyz/openbmc_project/sensors/temperature/temp1
>   sensorReadingType: 0x01
>   *multiplierM*: 511
>   *offsetB*: 0
>   *bExp*: 0
>   mutability: Mutability::Write|Mutability::Read
>   serviceInterface: org.freedesktop.DBus.Properties
>   readingType: readingData
>   interfaces:
>     xyz.openbmc_project.Sensor.Value:
>       Value:
>         Offsets:
>           0x0:
>             type: int64_t
>
> Thanks,
> Guhan
>
> With the given information, do you think there is a generic way
(algorithm) where we can compute all the 4 variables M, B, k1 and k2?

Thanks,
Guhan

--001a114e544a9236a40569b1d173
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Tom,<div><br></div><div>Thanks for the explanation. But=
 I still see some concerns in this conversion logic.</div><div><div><br></d=
iv><div><font color=3D"#3d85c6">For input, we have 4 given parameters as</f=
ont></div><div><font color=3D"#3d85c6">=C2=A0 =C2=A0 1. Min and Max values =
of the sensor (y)</font></div><div><font color=3D"#3d85c6">=C2=A0 =C2=A0 2.=
 the Min and Max values of the byte value (x - assuming this is always 0 to=
 255).=C2=A0</font></div><div><font color=3D"#3d85c6"><br></font></div><div=
><font color=3D"#3d85c6">For output, we have 4 paramters to calculate</font=
></div><div><font color=3D"#3d85c6">=C2=A0 =C2=A0 1. multiplierM (M)</font>=
</div><div><font color=3D"#3d85c6">=C2=A0 =C2=A0 2. offsetB (B)</font></div=
><div><font color=3D"#3d85c6">=C2=A0 =C2=A0 3. bExp (k1)</font></div><div><=
font color=3D"#3d85c6">=C2=A0 =C2=A0 4. rExp (k2)</font></div></div><div><f=
ont color=3D"#3d85c6"><br></font></div><div><font color=3D"#3d85c6">We have=
 two equations to compute 4 variables in this logic.=C2=A0</font></div><div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">On Sat, Mar 10, 2018 at 9:45 AM, Tom Joseph <span dir=
=3D"ltr">&lt;<a href=3D"mailto:tomjose@linux.vnet.ibm.com" target=3D"_blank=
">tomjose@linux.vnet.ibm.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF">
    <p>Hello Guhan,</p>
    The updated sensor-example.yaml has the Rexp field as well. These
    values are=C2=A0 calculated based on the minimum and maximum value of t=
he
    sensor.<br>
    <br>
    If a temperature sensor has a range of -127 - +128, means y is -127
    to +128 and the range of x is 0-255.<br>
    By substituting x =3D 0 and y =3D -127 (k2 is the decimal precision and
    assume in this case as whole nos) implies Bexp =3D -127.<br>
    Similarly substitute x =3D 255 and y =3D 128 and M is evaluated as 1. <=
br></div></blockquote><div><br></div><div><p class=3D"MsoNormal" style=3D"m=
argin:0in 0in 0.0001pt;font-size:12pt;font-family:Calibri,sans-serif;color:=
rgb(0,0,0);font-style:normal;font-variant-caps:normal;font-weight:normal;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px"><span style=3D"font-size:11pt;color:rgb(=
68,114,196)">In the above example, with 2 values [(0, -127) and (255, 128)]=
 for (x,y) we were able to calculate M and B. We are assuming k2 as 0 since=
 we are taking only whole numbers for our ranges (y values). But we are sti=
ll assuming the values for k1 as 0.<span class=3D"gmail-Apple-converted-spa=
ce">=C2=A0</span></span></p></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div bgcolor=3D"#FFFFFF">
    <br>
    Regards,<br>
    Tom<div><div class=3D"gmail-h5"><br>
    <br>
    <div class=3D"gmail-m_-4887759536924537063moz-cite-prefix">On Saturday =
10 March 2018 08:01 AM,
      guhan balasubramanian wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">Hi,
        <div><br>
        </div>
        <div>According to the IPMI spec, we represent all sensor
          readings (Volt, Temp, Amp, etc.) as 1-byte.=C2=A0</div>
        <div><br>
        </div>
        <div>Since we represent them as 1-byte, we use a linearization
          formula to convert to actual value as follows:</div>
        <div><br>
        </div>
        <div>y =3D (M*x + B*10^(k1))*10^(k2)</div>
        <div><br>
        </div>
        <div>where x is the 1-byte value that is filled in the get
          sensor reading command.</div>
        <div><br>
        </div>
        <div>We see in the ipmitool example on how an example of 3.36 V
          is represented as 1-byte.=C2=A0</div>
        <div><a href=3D"https://computercheese.blogspot.com/2013/10/ipmi-se=
nsor-reading-conversion-formula.html?q=3Dsensor" target=3D"_blank">https://=
computercheese.<wbr>blogspot.com/2013/10/ipmi-<wbr>sensor-reading-conversio=
n-<wbr>formula.html?q=3Dsensor</a></div>
        <div><br>
        </div>
        <div>Can any one please help on how the values for M, B, k1 and
          k2 are populated for each sensor?=C2=A0</div>
        <div><br>
        </div>
        <div>In the openbmc repo, I believe these values are present in
          the config.yaml of phosphor-ipmi-sensor-inventory (based on
          the following sample).=C2=A0</div>
        <div><br>
        </div>
        <div>
          <div>0xF1:</div>
          <div>=C2=A0 sensorType: 0x01</div>
          <div>=C2=A0 path: /xyz/openbmc_project/sensors/<wbr>temperature/t=
emp1</div>
          <div>=C2=A0 sensorReadingType: 0x01</div>
          <div>=C2=A0 <b>multiplierM</b>: 511</div>
          <div>=C2=A0 <b>offsetB</b>: 0</div>
          <div>=C2=A0 <b>bExp</b>: 0</div>
          <div>=C2=A0 mutability: Mutability::Write|Mutability::<wbr>Read</=
div>
          <div>=C2=A0 serviceInterface: org.freedesktop.DBus.<wbr>Propertie=
s</div>
          <div>=C2=A0 readingType: readingData</div>
          <div>=C2=A0 interfaces:</div>
          <div>=C2=A0 =C2=A0 xyz.openbmc_project.Sensor.<wbr>Value:</div>
          <div>=C2=A0 =C2=A0 =C2=A0 Value:</div>
          <div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Offsets:</div>
          <div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0:</div>
          <div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type: int64_t</div=
>
        </div>
        <div>
          <table class=3D"gmail-m_-4887759536924537063gmail-highlight gmail=
-m_-4887759536924537063gmail-tab-size gmail-m_-4887759536924537063gmail-js-=
file-line-container">
            <tbody style=3D"box-sizing:border-box">
              <tr style=3D"box-sizing:border-box">
                <td id=3D"gmail-m_-4887759536924537063gmail-LC18" class=3D"=
gmail-m_-4887759536924537063gmail-blob-code gmail-m_-4887759536924537063gma=
il-blob-code-inner gmail-m_-4887759536924537063gmail-js-file-line" style=3D=
"box-sizing:border-box;padding:0px 10px;line-height:20px;vertical-align:top=
;overflow:visible;font-family:SFMono-Regular,Consolas,&quot;Liberation Mono=
&quot;,Menlo,Courier,monospace;font-size:12px;color:rgb(36,41,46);word-wrap=
:normal;white-space:pre-wrap">
</td>
              </tr>
            </tbody>
          </table>
          <br>
        </div>
        <div>Thanks,</div>
        <div>Guhan</div>
        <div><br></div></div></blockquote></div></div></div></blockquote><d=
iv><font color=3D"#3d85c6">With the given information, do you think there i=
s a generic way (algorithm) where we can compute all the 4 variables M, B, =
k1 and k2?=C2=A0</font></div><div><font color=3D"#3d85c6"><br></font></div>=
<div><font color=3D"#4472c4" face=3D"Calibri, sans-serif"><span style=3D"fo=
nt-size:14.6667px">Thanks,</span></font></div><div><font color=3D"#4472c4" =
face=3D"Calibri, sans-serif"><span style=3D"font-size:14.6667px">Guhan</spa=
n></font></div></div><br></div></div></div>

--001a114e544a9236a40569b1d173--
