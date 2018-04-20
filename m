Return-Path: <guhan.sac@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::236; helo=mail-qk0-x236.google.com;
 envelope-from=guhan.sac@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="P00VyNNC"; 
 dkim-atps=neutral
Received: from mail-qk0-x236.google.com (mail-qk0-x236.google.com
 [IPv6:2607:f8b0:400d:c09::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Rywg0LXMzF24t
 for <openbmc@lists.ozlabs.org>; Fri, 20 Apr 2018 11:30:42 +1000 (AEST)
Received: by mail-qk0-x236.google.com with SMTP id b131so3116141qkg.2
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 18:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=OvXhw7Gb7hBG0x6vFAXsODcGAQX6wypZQ3j0SGdI+h4=;
 b=P00VyNNCh3Ww/TF/+aUMHh5Q4Wa/HO6Gv7lDKHl4qmG3ZFZFsgk97P0Q0LQgi7JC2g
 Mdj/FXVz2J+/7fB6hiI1JL7JLTfDlzPXpnaBnzBqkYZ5zpNm6fx/Oq6Opec7y0UFrJsU
 0sZ1UvLTdXzoXn4EiRlyQJ8hp0um5NLqAkZ6HB0LZsTpyxRDyERLJZZsOm8uZ033kXyh
 3H7aNaHEnrywQ7tZx+XnPbRoxHfSoTvEVjOWqSqifewX5FCVpO06rh1i2e2VHRubiJu2
 AYNKn5OHvy4mT9s6al83SFYv2lA0JkPOhr+jG/9/iWuPfYr0YMIisqozeVp8pKJOq+cA
 B0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=OvXhw7Gb7hBG0x6vFAXsODcGAQX6wypZQ3j0SGdI+h4=;
 b=jZaFk7pspKF0VJpGGEL8y0DLMWl1my/s8WIveUIvVMrIEke1AC4+zV/+l+P6XiXBCT
 pD52w+MJxMRGom3wl9CqHG5swd/EcpblqcjG+eTbi+0Gql+5puKSzj4vIBPXtUv3Kjh0
 eE4G6Z1FCiryY7A5/c/jNGbWB2Xdukrntif21svmv5tHeR5UOZtF7awLseKKRoTTgOEg
 0X7AV5aSnV68SVVeRgzD95q5wvetK3DsvViL3a2lsXatyJOAAbSyWyA7aA4btW1qJNbQ
 W1nGECuN2uAEKh3UWJncVN2+4vJEVKNPULR4gI0mF4njv4o131sQgv3t6vrYgGaqXXHf
 0Dow==
X-Gm-Message-State: ALQs6tCq40d8HC0N/goQGeOcyM3K4Tzpd3TUpg/p8rgBqosX9RBCQXfW
 epB7T+0rgDF7mhTW8/k2DkoVk407MHsZggTX0Wc=
X-Google-Smtp-Source: AB8JxZqyQ3j9ehwmCfqncMfBmEWCgU/0QH708DCajRY2T2aVw7IKKY/0YoJ303U/Xz8vtkpvWcyv7O10a5okqqSOHVM=
X-Received: by 10.55.25.22 with SMTP id k22mr8615853qkh.436.1524187839584;
 Thu, 19 Apr 2018 18:30:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.36.4 with HTTP; Thu, 19 Apr 2018 18:30:19 -0700 (PDT)
In-Reply-To: <22ff8f1f-1973-2bb1-dbfe-2c441b00568c@linux.intel.com>
References: <CAMNAJg36J-8BjiKpHRaDJYTw0pJEnwTG=2+PKgzgNDAb_w6K9g@mail.gmail.com>
 <22ff8f1f-1973-2bb1-dbfe-2c441b00568c@linux.intel.com>
From: guhan balasubramanian <guhan.sac@gmail.com>
Date: Thu, 19 Apr 2018 18:30:19 -0700
Message-ID: <CAMNAJg3AZmZERqU9Hufc6niS=gAPOwZBD31DzNa670jRn46qyg@mail.gmail.com>
Subject: Re: Sensor readings as 1-byte
To: James Feist <james.feist@linux.intel.com>
Cc: Tom Joseph <tomjose@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="001a1147f394bfde05056a3da2fd"
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
X-List-Received-Date: Fri, 20 Apr 2018 01:30:44 -0000

--001a1147f394bfde05056a3da2fd
Content-Type: text/plain; charset="UTF-8"

Hi James,

Thank you for the reference implementation.
I see that you are using the GetAttributes function in sensorutils.cpp,
that accepts the Min and Max value and outputs mValue, bValue, rExp and
bExp. This is exactly what I was looking for.

I still had some concerns, can you please help with the following,

1. When I plug in values from Tom's example (in this thread), I don't seem
to get the expected values for B. When min and max are (-127 , 128), I am
getting M=1 and B=-1 (including bSigned) where according to Tom's
calculation, it is M=1 and B=-127. Am I interpreting the output of B
correctly?

2. Any reference document/spec for this algorithm, if available, would be
really helpful.

Thanks,
Guhan

On Fri, Apr 13, 2018 at 8:41 AM, James Feist <james.feist@linux.intel.com>
wrote:

> There is an RFC I posted that calculates the M, B, and exponents from
> the D-Bus sensor endpoints: https://gerrit.openbmc-project.xyz/#/c/8521/
>
> We were hoping to roll this into host-ipmi sometime in future.
>
> Thanks,
>
> James Feist
>
> On 04/12/2018 07:41 PM, guhan balasubramanian wrote:
>
>> Hi Tom,
>>
>> Thanks for the explanation. But I still see some concerns in this
>> conversion logic.
>>
>> For input, we have 4 given parameters as
>>      1. Min and Max values of the sensor (y)
>>      2. the Min and Max values of the byte value (x - assuming this is
>> always 0 to 255).
>>
>> For output, we have 4 paramters to calculate
>>      1. multiplierM (M)
>>      2. offsetB (B)
>>      3. bExp (k1)
>>      4. rExp (k2)
>>
>> We have two equations to compute 4 variables in this logic.
>>
>>
>> On Sat, Mar 10, 2018 at 9:45 AM, Tom Joseph <tomjose@linux.vnet.ibm.com
>> <mailto:tomjose@linux.vnet.ibm.com>> wrote:
>>
>>     Hello Guhan,
>>
>>     The updated sensor-example.yaml has the Rexp field as well. These
>>     values are  calculated based on the minimum and maximum value of the
>>     sensor.
>>
>>     If a temperature sensor has a range of -127 - +128, means y is -127
>>     to +128 and the range of x is 0-255.
>>     By substituting x = 0 and y = -127 (k2 is the decimal precision and
>>     assume in this case as whole nos) implies Bexp = -127.
>>     Similarly substitute x = 255 and y = 128 and M is evaluated as 1.
>>
>>
>> In the above example, with 2 values [(0, -127) and (255, 128)] for (x,y)
>> we were able to calculate M and B. We are assuming k2 as 0 since we are
>> taking only whole numbers for our ranges (y values). But we are still
>> assuming the values for k1 as 0.
>>
>>
>>     Regards,
>>     Tom
>>
>>
>>     On Saturday 10 March 2018 08:01 AM, guhan balasubramanian wrote:
>>
>>>     Hi,
>>>
>>>     According to the IPMI spec, we represent all sensor readings
>>>     (Volt, Temp, Amp, etc.) as 1-byte.
>>>
>>>     Since we represent them as 1-byte, we use a linearization formula
>>>     to convert to actual value as follows:
>>>
>>>     y = (M*x + B*10^(k1))*10^(k2)
>>>
>>>     where x is the 1-byte value that is filled in the get sensor
>>>     reading command.
>>>
>>>     We see in the ipmitool example on how an example of 3.36 V is
>>>     represented as 1-byte.
>>>     https://computercheese.blogspot.com/2013/10/ipmi-sensor-
>>> reading-conversion-formula.html?q=sensor
>>>     <https://computercheese.blogspot.com/2013/10/ipmi-sensor-
>>> reading-conversion-formula.html?q=sensor>
>>>
>>>     Can any one please help on how the values for M, B, k1 and k2 are
>>>     populated for each sensor?
>>>
>>>     In the openbmc repo, I believe these values are present in the
>>>     config.yaml of phosphor-ipmi-sensor-inventory (based on the
>>>     following sample).
>>>
>>>     0xF1:
>>>       sensorType: 0x01
>>>       path: /xyz/openbmc_project/sensors/temperature/temp1
>>>       sensorReadingType: 0x01
>>>     *multiplierM*: 511
>>>     *offsetB*: 0
>>>     *bExp*: 0
>>>       mutability: Mutability::Write|Mutability::Read
>>>       serviceInterface: org.freedesktop.DBus.Properties
>>>       readingType: readingData
>>>       interfaces:
>>>         xyz.openbmc_project.Sensor.Value:
>>>           Value:
>>>             Offsets:
>>>               0x0:
>>>                 type: int64_t
>>>
>>>
>>>     Thanks,
>>>     Guhan
>>>
>>> With the given information, do you think there is a generic way
>> (algorithm) where we can compute all the 4 variables M, B, k1 and k2?
>>
>> Thanks,
>> Guhan
>>
>>

--001a1147f394bfde05056a3da2fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi James,</div><div><br></div><div>Thank you for the =
reference implementation.</div><div>I see that you are using the GetAttribu=
tes function in sensorutils.cpp, that accepts the Min and Max value and out=
puts mValue, bValue, rExp and bExp. This is exactly what I was looking for.=
=C2=A0</div><div><br></div><div>I still had some concerns, can you please h=
elp with the following,</div><div><br></div><div>1. When I plug in values f=
rom Tom&#39;s example (in this thread), I don&#39;t seem to get the expecte=
d values for B. When min and max are (-127 , 128), I am getting M=3D1 and B=
=3D-1 (including bSigned) where according to Tom&#39;s calculation, it is M=
=3D1 and B=3D-127. Am I interpreting the output of B correctly?=C2=A0</div>=
<div><br></div><div>2. Any reference document/spec for this algorithm, if a=
vailable, would be really helpful.=C2=A0</div><div><br></div><div>Thanks,</=
div><div>Guhan</div></div><div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">On Fri, Apr 13, 2018 at 8:41 AM, James Feist <span dir=3D"ltr">&lt=
;<a href=3D"mailto:james.feist@linux.intel.com" target=3D"_blank">james.fei=
st@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
There is an RFC I posted that calculates the M, B, and exponents from<br>
the D-Bus sensor endpoints: <a href=3D"https://gerrit.openbmc-project.xyz/#=
/c/8521/" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-proje=
ct<wbr>.xyz/#/c/8521/</a><br>
<br>
We were hoping to roll this into host-ipmi sometime in future.<br>
<br>
Thanks,<br>
<br>
James Feist<span class=3D""><br>
<br>
On 04/12/2018 07:41 PM, guhan balasubramanian wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">
Hi Tom,<br>
<br>
Thanks for the explanation. But I still see some concerns in this conversio=
n logic.<br>
<br>
For input, we have 4 given parameters as<br>
=C2=A0=C2=A0 =C2=A0 1. Min and Max values of the sensor (y)<br>
=C2=A0=C2=A0 =C2=A0 2. the Min and Max values of the byte value (x - assumi=
ng this is always 0 to 255).<br>
<br>
For output, we have 4 paramters to calculate<br>
=C2=A0=C2=A0 =C2=A0 1. multiplierM (M)<br>
=C2=A0=C2=A0 =C2=A0 2. offsetB (B)<br>
=C2=A0=C2=A0 =C2=A0 3. bExp (k1)<br>
=C2=A0=C2=A0 =C2=A0 4. rExp (k2)<br>
<br>
We have two equations to compute 4 variables in this logic.<br>
<br>
<br></span><div><div class=3D"h5">
On Sat, Mar 10, 2018 at 9:45 AM, Tom Joseph &lt;<a href=3D"mailto:tomjose@l=
inux.vnet.ibm.com" target=3D"_blank">tomjose@linux.vnet.ibm.com</a> &lt;mai=
lto:<a href=3D"mailto:tomjose@linux.vnet.ibm.com" target=3D"_blank">tomjose=
@linux.vnet.ibm<wbr>.com</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 Hello Guhan,<br>
<br>
=C2=A0 =C2=A0 The updated sensor-example.yaml has the Rexp field as well. T=
hese<br>
=C2=A0 =C2=A0 values are=C2=A0 calculated based on the minimum and maximum =
value of the<br>
=C2=A0 =C2=A0 sensor.<br>
<br>
=C2=A0 =C2=A0 If a temperature sensor has a range of -127 - +128, means y i=
s -127<br>
=C2=A0 =C2=A0 to +128 and the range of x is 0-255.<br>
=C2=A0 =C2=A0 By substituting x =3D 0 and y =3D -127 (k2 is the decimal pre=
cision and<br>
=C2=A0 =C2=A0 assume in this case as whole nos) implies Bexp =3D -127.<br>
=C2=A0 =C2=A0 Similarly substitute x =3D 255 and y =3D 128 and M is evaluat=
ed as 1.<br>
<br>
<br>
In the above example, with 2 values [(0, -127) and (255, 128)] for (x,y) we=
 were able to calculate M and B. We are assuming k2 as 0 since we are takin=
g only whole numbers for our ranges (y values). But we are still assuming t=
he values for k1 as 0.<br>
<br>
<br>
=C2=A0 =C2=A0 Regards,<br>
=C2=A0 =C2=A0 Tom<br>
<br>
<br>
=C2=A0 =C2=A0 On Saturday 10 March 2018 08:01 AM, guhan balasubramanian wro=
te:<br>
</div></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"h5">
=C2=A0 =C2=A0 Hi,<br>
<br>
=C2=A0 =C2=A0 According to the IPMI spec, we represent all sensor readings<=
br>
=C2=A0 =C2=A0 (Volt, Temp, Amp, etc.) as 1-byte.<br>
<br>
=C2=A0 =C2=A0 Since we represent them as 1-byte, we use a linearization for=
mula<br>
=C2=A0 =C2=A0 to convert to actual value as follows:<br>
<br>
=C2=A0 =C2=A0 y =3D (M*x + B*10^(k1))*10^(k2)<br>
<br>
=C2=A0 =C2=A0 where x is the 1-byte value that is filled in the get sensor<=
br>
=C2=A0 =C2=A0 reading command.<br>
<br>
=C2=A0 =C2=A0 We see in the ipmitool example on how an example of 3.36 V is=
<br>
=C2=A0 =C2=A0 represented as 1-byte.<br>
=C2=A0 =C2=A0 <a href=3D"https://computercheese.blogspot.com/2013/10/ipmi-s=
ensor-reading-conversion-formula.html?q=3Dsensor" rel=3D"noreferrer" target=
=3D"_blank">https://computercheese.blogspo<wbr>t.com/2013/10/ipmi-sensor-<w=
br>reading-conversion-formula.<wbr>html?q=3Dsensor</a><br>
=C2=A0 =C2=A0 &lt;<a href=3D"https://computercheese.blogspot.com/2013/10/ip=
mi-sensor-reading-conversion-formula.html?q=3Dsensor" rel=3D"noreferrer" ta=
rget=3D"_blank">https://computercheese.blogsp<wbr>ot.com/2013/10/ipmi-senso=
r-<wbr>reading-conversion-formula.<wbr>html?q=3Dsensor</a>&gt;<br>
<br>
=C2=A0 =C2=A0 Can any one please help on how the values for M, B, k1 and k2=
 are<br>
=C2=A0 =C2=A0 populated for each sensor?<br>
<br>
=C2=A0 =C2=A0 In the openbmc repo, I believe these values are present in th=
e<br>
=C2=A0 =C2=A0 config.yaml of phosphor-ipmi-sensor-inventory (based on the<b=
r>
=C2=A0 =C2=A0 following sample).<br>
<br>
=C2=A0 =C2=A0 0xF1:<br>
=C2=A0 =C2=A0 =C2=A0 sensorType: 0x01<br>
=C2=A0 =C2=A0 =C2=A0 path: /xyz/openbmc_project/sensors/t<wbr>emperature/te=
mp1<br>
=C2=A0 =C2=A0 =C2=A0 sensorReadingType: 0x01<br></div></div>
=C2=A0 =C2=A0 *multiplierM*: 511<br>
=C2=A0 =C2=A0 *offsetB*: 0<br>
=C2=A0 =C2=A0 *bExp*: 0<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 mutability: Mutability::Write|Mutability::<wbr>Read<br=
>
=C2=A0 =C2=A0 =C2=A0 serviceInterface: org.freedesktop.DBus.Propertie<wbr>s=
<br>
=C2=A0 =C2=A0 =C2=A0 readingType: readingData<br>
=C2=A0 =C2=A0 =C2=A0 interfaces:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 xyz.openbmc_project.Sensor.Val<wbr>ue:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Value:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Offsets:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type: int64_t<br>
<br>
<br>
=C2=A0 =C2=A0 Thanks,<br>
=C2=A0 =C2=A0 Guhan<br>
<br>
</span></blockquote><span class=3D"">
With the given information, do you think there is a generic way (algorithm)=
 where we can compute all the 4 variables M, B, k1 and k2?<br>
<br>
Thanks,<br>
Guhan<br>
<br>
</span></blockquote>
</blockquote></div><br></div>

--001a1147f394bfde05056a3da2fd--
