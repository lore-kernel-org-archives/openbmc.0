Return-Path: <mine260309@gmail.com>
Received: from mail-qk0-x231.google.com (mail-qk0-x231.google.com
 [IPv6:2607:f8b0:400d:c09::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v3Ss86khszDqKj
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 00:45:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BB4IbfmQ"; 
 dkim-atps=neutral
Received: by mail-qk0-x231.google.com with SMTP id a20so13491308qkc.1
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2017 05:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=5c4Qqc8lJ/3kcksagsf6c8ksgc4R7G1As1mnInL+wD8=;
 b=BB4IbfmQfiwSxV2K1L9AoOV6MDPW4HgggIeZgbReHEJYZZCOVOFgam7whI+I+GXlGC
 iTOXHsVtym4iuxbxd7cu/OfEDYrNHHfm81ZzUiGaAIFwpJH1Zb8GqD20ImYaYwaS1gTQ
 oUqDhFrddTS2tbAnhlezVdHDIsbAeoUgW2BRec507ejCj1DJ2JO5kqY5EdgJVIgRuK89
 tiBv1EOWo1nRAQP+FVGMfrPAQjYmhZXr2najYheJNtXH0ZKdcBPxbv1Pn/W10jspRW7u
 xk7a1eMmOOz0mVgkmpIDtdmjr4miFOiw7uK+fUY94ktM239HzgHiSzz2Wpih+cgWBcPa
 n0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=5c4Qqc8lJ/3kcksagsf6c8ksgc4R7G1As1mnInL+wD8=;
 b=gISA4bBa7At59buUf0O73rMvubPb76L5t4/VICLI8Up+v4jKFFIl1Xb7bXG4F1fjDf
 9DW3BRj3AbUhJZd7oc4Tl3WhIdZdClPQfoZRkoBOhL3BpAXn2H5UFa729T0mTFphurEF
 JlEdUYBceMKLhmlGBIRjmSBF6osKFi0kW0xrH/TG7r2mQuA3mqcGZ72f9OI06d2oyGZG
 Pz7BzCax2OwcI23zqnSnzSb5Utl1dAHOPNQ6SRNicAaHfVZ31DzPgPc7W1DmV+E9ooxM
 Q1tqGdzZgpL3idZvuYqMHsLd5/KIbzB2mO+A1qAPjExxTnO9jkSYHQ5BgMfshbW1t5Pk
 20ew==
X-Gm-Message-State: AIkVDXI/sC/F1/msqxUYJYF7+bsXpJteuJmGp0I+HcyUhoRQb6NhBPkXrRWBdpFy5PNOnez+6ibMU8VcWIT0Uw==
X-Received: by 10.55.220.199 with SMTP id v190mr2908995qki.42.1484747114347;
 Wed, 18 Jan 2017 05:45:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.122 with HTTP; Wed, 18 Jan 2017 05:45:13 -0800 (PST)
In-Reply-To: <3c0b4208-9e8f-12c7-39a9-749a68d2b788@linux.vnet.ibm.com>
References: <CAARXrtkPMixp9M0SYyaeP4_j83mRRXNG1O2Tf24rL5OH6CbJvg@mail.gmail.com>
 <20170116194447.d3yzsldsu3qsl5sz@asimov>
 <CAARXrtnHD0s=dMKJwy_XqJ==cpamDiVPn8c4K=+ZPso1d0gSBg@mail.gmail.com>
 <3c0b4208-9e8f-12c7-39a9-749a68d2b788@linux.vnet.ibm.com>
From: Mine <mine260309@gmail.com>
Date: Wed, 18 Jan 2017 21:45:13 +0800
Message-ID: <CAARXrt=itSfG2jmbaZAmJ+TsiAXs6oxW-ckUamw1b-nRV7SYOQ@mail.gmail.com>
Subject: Re: RFC: new design of phosphor-time-manager on sdbusplus
To: vishwa <vishwa@linux.vnet.ibm.com>
Cc: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c0cc85855025c05465ea055
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
X-List-Received-Date: Wed, 18 Jan 2017 13:45:18 -0000

--94eb2c0cc85855025c05465ea055
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Vishwa,

On Wed, Jan 18, 2017 at 7:07 PM, vishwa <vishwa@linux.vnet.ibm.com> wrote:
> On 01/17/2017 01:21 PM, Mine wrote:
>>
>> Hi Patrick,
>>
>> On Tue, Jan 17, 2017 at 3:44 AM, Patrick Williams <patrick@stwcx.xyz>
>> wrote:
>>>
>>> On Fri, Jan 13, 2017 at 03:42:50PM +0800, Mine wrote:
>>>>
>>>> New Design
>>>>
>>>> Create two objects:
>>>
>>> You mean 'classes' or 'objects'?  I think you mean two classes, which
>>> initially we will only have 1 instance of each.  Please make sure the
>>> HostEpoch implementation can relatively-easily be enhanced to have
>>> multiple instances.
>>
>> I should be meant to create two "instances" on the bus, eventually it
>> looks
>> something like:
>> ```
>> xyz.openbmc_project.Time.Manager
>>      /xyz/openbmc_project/time/host_epoch
>>          org.freedesktop.DBus.Peer
>>          org.freedesktop.DBus.Introspectable
>>          org.freedesktop.DBus.Properties
>>          xyz.openbmc_project.Time.EpochTime
>>      /xyz/openbmc_project/time/bmc_epoch
>>          org.freedesktop.DBus.Peer
>>          org.freedesktop.DBus.Introspectable
>>          org.freedesktop.DBus.Properties
>>          xyz.openbmc_project.Time.EpochTime
>>
>> ```
>> The service's BUSNAME is still `xyz.openbmc_project.Time.Manager`, and
>> it creates two objects, one for BmcEpoch and the other for HostEpoch, wh=
o
>> both implement xyz.openbmc_project.Time.EpochTime interface.
>
> So TimeManager still owns the responsibility of maintaining offsets etc
> right ?

Not exactly, HostEpoch will own the offset and maintain it.
But yes, overall HostEpoch is part of TimeManager, so you can say
TimeManager owns the offset as well.

>
>>>>     - BmcEpoch
>>>>     - HostEpoch
>>>>
>>>> They both implements EpochTime interface.
>>>>
>>>> For BmcEpoch:
>>>>
>>>>     - When elapsed() is called, return BMC time;
>>>>     - When elapsed(us) is called, use above SetTime(=E2=80=9Cbmc=E2=80=
=9D) logic
>>>>
>>>> For HostEpoch:
>>>>
>>>>     - When elapsed() is called, return HOST time;
>>>>     - When elapsed(us) is called, use above SetTime(=E2=80=9Chost=E2=
=80=9D) logic.
>>>
>>> Seems ok.
>>>
>>> The errors also need to be converted to dbus-defined errors, right?
>>>
>>>> And there will be no =E2=80=9Ccurr_time_mode/owner=E2=80=9D or
>>>> =E2=80=9Crequested_time_mode/owner=E2=80=9D
>>>> properties on DBUS.
>>>
>>> So these are only stored in phosphor-settingsd now or are they also use=
d
>>> internally for decisions?  I believe the previous implementation had
>>> them exposed more for debug purposes.  Are you going to add them to the
>>> journal at least?
>>
>> Yes, the time_mode and time_owner are still stored in
>> phosphor-settingsd, and they
>> are used internally by phosphor-time-manager, which will register
>> callback for the
>> settings' change and handled accordingly.
>> The difference from the previous implementation is that we do not expose
>> these
>> settings in time-manager's DBus now.
>>
>> What do you mean by "add them to the journal"?
>
> I believe he is asking you to put that information in the journal traces
so
> that we can use them for debug. I think you don't need anything more to
> cater to that request as the original implementation already puts those a=
s
> journal traces.

Sure.
The code will use sdbusplus's logging to send journal logs.

>>
>>
>>> --
>>> Patrick Williams
>>
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
>
>

--94eb2c0cc85855025c05465ea055
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Vishwa,<br><br>On Wed, Jan 18, 2017 at 7:07 PM, vishwa =
&lt;<a href=3D"mailto:vishwa@linux.vnet.ibm.com">vishwa@linux.vnet.ibm.com<=
/a>&gt; wrote:<br>&gt; On 01/17/2017 01:21 PM, Mine wrote:<br>&gt;&gt;<br>&=
gt;&gt; Hi Patrick,<br>&gt;&gt;<br>&gt;&gt; On Tue, Jan 17, 2017 at 3:44 AM=
, Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.x=
yz</a>&gt;<br>&gt;&gt; wrote:<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; On Fri, Jan 1=
3, 2017 at 03:42:50PM +0800, Mine wrote:<br>&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt=
;&gt; New Design<br>&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt; Create two objects=
:<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; You mean &#39;classes&#39; or &#39;object=
s&#39;?=C2=A0 I think you mean two classes, which<br>&gt;&gt;&gt; initially=
 we will only have 1 instance of each.=C2=A0 Please make sure the<br>&gt;&g=
t;&gt; HostEpoch implementation can relatively-easily be enhanced to have<b=
r>&gt;&gt;&gt; multiple instances.<br>&gt;&gt;<br>&gt;&gt; I should be mean=
t to create two &quot;instances&quot; on the bus, eventually it<br>&gt;&gt;=
 looks<br>&gt;&gt; something like:<br>&gt;&gt; ```<br>&gt;&gt; xyz.openbmc_=
project.Time.Manager<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0/xyz/openbmc_project/t=
ime/host_epoch<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0org.freedeskto=
p.DBus.Peer<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0org.freedesktop.D=
Bus.Introspectable<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0org.freede=
sktop.DBus.Properties<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xyz.ope=
nbmc_project.Time.EpochTime<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0/xyz/openbmc_pr=
oject/time/bmc_epoch<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0org.free=
desktop.DBus.Peer<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0org.freedes=
ktop.DBus.Introspectable<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0org.=
freedesktop.DBus.Properties<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0x=
yz.openbmc_project.Time.EpochTime<br>&gt;&gt;<br>&gt;&gt; ```<br>&gt;&gt; T=
he service&#39;s BUSNAME is still `xyz.openbmc_project.Time.Manager`, and<b=
r>&gt;&gt; it creates two objects, one for BmcEpoch and the other for HostE=
poch, who<br>&gt;&gt; both implement xyz.openbmc_project.Time.EpochTime int=
erface.<br>&gt;<br>&gt; So TimeManager still owns the responsibility of mai=
ntaining offsets etc<br>&gt; right ?<div><br><div>Not exactly, HostEpoch wi=
ll own the offset and maintain it.</div><div>But yes, overall HostEpoch is =
part of TimeManager, so you can say TimeManager owns the offset as well.</d=
iv><div><br></div><div>&gt;<br></div><div>&gt;&gt;&gt;&gt; =C2=A0 =C2=A0 - =
BmcEpoch<br>&gt;&gt;&gt;&gt; =C2=A0 =C2=A0 - HostEpoch<br>&gt;&gt;&gt;&gt;<=
br>&gt;&gt;&gt;&gt; They both implements EpochTime interface.<br>&gt;&gt;&g=
t;&gt;<br>&gt;&gt;&gt;&gt; For BmcEpoch:<br>&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt=
;&gt; =C2=A0 =C2=A0 - When elapsed() is called, return BMC time;<br>&gt;&gt=
;&gt;&gt; =C2=A0 =C2=A0 - When elapsed(us) is called, use above SetTime(=E2=
=80=9Cbmc=E2=80=9D) logic<br>&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt; For HostE=
poch:<br>&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt; =C2=A0 =C2=A0 - When elapsed(=
) is called, return HOST time;<br>&gt;&gt;&gt;&gt; =C2=A0 =C2=A0 - When ela=
psed(us) is called, use above SetTime(=E2=80=9Chost=E2=80=9D) logic.<br>&gt=
;&gt;&gt;<br>&gt;&gt;&gt; Seems ok.<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; The err=
ors also need to be converted to dbus-defined errors, right?<br>&gt;&gt;&gt=
;<br>&gt;&gt;&gt;&gt; And there will be no =E2=80=9Ccurr_time_mode/owner=E2=
=80=9D or<br>&gt;&gt;&gt;&gt; =E2=80=9Crequested_time_mode/owner=E2=80=9D<b=
r>&gt;&gt;&gt;&gt; properties on DBUS.<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; So t=
hese are only stored in phosphor-settingsd now or are they also used<br>&gt=
;&gt;&gt; internally for decisions?=C2=A0 I believe the previous implementa=
tion had<br>&gt;&gt;&gt; them exposed more for debug purposes.=C2=A0 Are yo=
u going to add them to the<br>&gt;&gt;&gt; journal at least?<br>&gt;&gt;<br=
>&gt;&gt; Yes, the time_mode and time_owner are still stored in<br>&gt;&gt;=
 phosphor-settingsd, and they<br>&gt;&gt; are used internally by phosphor-t=
ime-manager, which will register<br>&gt;&gt; callback for the<br>&gt;&gt; s=
ettings&#39; change and handled accordingly.<br>&gt;&gt; The difference fro=
m the previous implementation is that we do not expose<br>&gt;&gt; these<br=
>&gt;&gt; settings in time-manager&#39;s DBus now.<br>&gt;&gt;<br>&gt;&gt; =
What do you mean by &quot;add them to the journal&quot;?<br>&gt;<br>&gt; I =
believe he is asking you to put that information in the journal traces so<b=
r>&gt; that we can use them for debug. I think you don&#39;t need anything =
more to<br>&gt; cater to that request as the original implementation alread=
y puts those as<br>&gt; journal traces.</div><div><br></div><div>Sure.</div=
><div>The code will use sdbusplus&#39;s logging to send journal logs.<br><b=
r></div><div>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt;&gt; --<br>&gt;&gt;&gt; Patric=
k Williams<br>&gt;&gt;<br>&gt;&gt; ________________________________________=
_______<br>&gt;&gt; openbmc mailing list<br>&gt;&gt; <a href=3D"mailto:open=
bmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br>&gt;&gt; <a href=3D"h=
ttps://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org/listinfo=
/openbmc</a><br>&gt;<br>&gt;<br><br></div></div></div>

--94eb2c0cc85855025c05465ea055--
