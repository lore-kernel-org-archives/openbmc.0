Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c09::22b; helo=mail-qk0-x22b.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="MuO/Fpmx"; 
 dkim-atps=neutral
Received: from mail-qk0-x22b.google.com (mail-qk0-x22b.google.com
 [IPv6:2607:f8b0:400d:c09::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lJDZ1SjNzDqBx
 for <openbmc@lists.ozlabs.org>; Wed,  8 Aug 2018 01:22:52 +1000 (AEST)
Received: by mail-qk0-x22b.google.com with SMTP id 126-v6so11680777qke.5
 for <openbmc@lists.ozlabs.org>; Tue, 07 Aug 2018 08:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lbLhoi+s2lNFMRmtXT4YR+HsZneCv2zgQzm+xrkl6s0=;
 b=MuO/FpmxxV/WdQfRr18rT2z5eDEqAWCAKHHkVecZT9tUKUN0X6hsbpF2I1FRGeHWTp
 sGnEDuUtgVAKZmHKImvCu/ZxfN6S4UI/Ftedcwb+FnP9CMtZZmqf2Y3vou98jIb6ZoTv
 sNPyRGxyC1hCxTGXrhWM9xWRXT6EWB5KRYk/dVkN0UIl1V2QeOyeWzY3H/RQr995sEtc
 D5sw6aXa6MpE3nX+WljFMDZ4DrIzDUi0nBjPWA4EoYh/crH/+kCwQpJSawa7udhPhYBz
 y6tmkgeyDAdqVo214DaHm73nqLCPC1+thMDXAJcQQWMUWu2PV9swIy4BTIhZAPcBINhE
 ntZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lbLhoi+s2lNFMRmtXT4YR+HsZneCv2zgQzm+xrkl6s0=;
 b=VKeJPtYId445oEMKlnzxwhek/9VUACDg/PNruqxMso40r9hb9Sys1AgItvgCn82gVW
 tcKgfYtxjH3S9CXkWVUbtf+QuAlp0InaP0jKNW4On8qt7eVu82dhvDJntAaU1DUeKdvE
 il+2aEwK4dBE8cskP17JSCiLi8I/xD1lotrusUra/PJ7VoAVNHVAqIeC3rxaLtqFs6AI
 jHtJd28o5tkPks/4eqdkdCwSuTqbT7QcNKb0xSH0X4gHLAa6cwhgJRHzZbe7q6LpTp5G
 Zsna4LQxv25FMVd8W0U8bz0aX3Dd0RaWwwrbtugabArcl6FyXrMNwSR60uR9JQ9NL9Xy
 6aCg==
X-Gm-Message-State: AOUpUlGkoX2TALAwmnXbMUfPOGMIpQRTVOyy/5P+kwKKCuxvBaFTcvHu
 ygy4pcsqj3AlSU+Zm5bhTkwHuBfG7Kp6D7yHwsAFsw==
X-Google-Smtp-Source: AAOMgpcUyLOCSAzhkb/qCnkf0auR2qaazmffMQi2S4M4OsIGhBmotq1ltbogcXSZG4wrXaPiKyOGoFD1gpW8MTi2GRU=
X-Received: by 2002:a37:f6a:: with SMTP id
 z103-v6mr17968756qkg.427.1533655369772; 
 Tue, 07 Aug 2018 08:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAE33tLFWffT5wd9La+zU-ATkbrqa4-aRH=C+t_OBnWgsSgwNdg@mail.gmail.com>
 <CAJoAoZ=VzAUp2Jg6nPy8UKBvqBw+s=xWwuMK4VG-p=t7QTwdkA@mail.gmail.com>
 <CAE33tLGrrsCBjW3Hqpe1K8__WXLwmph5KWCTUVmoA2LUoBnSCw@mail.gmail.com>
In-Reply-To: <CAE33tLGrrsCBjW3Hqpe1K8__WXLwmph5KWCTUVmoA2LUoBnSCw@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Tue, 7 Aug 2018 08:22:38 -0700
Message-ID: <CAJoAoZ=QxUvonb4b7CRq3YxQGLP9_F9KcPD5C7wi-rqCKfN=xQ@mail.gmail.com>
Subject: Re: Temperature Sensor and its Reading not Showing Up.
To: AKASH G J <akashgj91@gmail.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000008690440572d9f797"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2018 15:22:55 -0000

--0000000000008690440572d9f797
Content-Type: text/plain; charset="UTF-8"

Akash,

Check out this doc:
https://github.com/openbmc/docs/blob/master/sensor-architecture.md

Basically, you need your sensors to be available over DBus first, then
configured to be available over IPMI. This doc should ideally give you some
good step-by-step but you could also take a look at the Witherspoon or
Zaius layers for an example.

Emily

On Mon, Aug 6, 2018, 8:49 PM AKASH G J <akashgj91@gmail.com> wrote:

> Hi Emily,
>
> I did not configure the temperature sensors to report over dbus interface.
> I am new in this area. Can you provide steps to configure the temperature
> sensors to report over dbus?
>
>
> Thanks and Regards,
>
> Akash
>
> On Mon, Aug 6, 2018 at 9:16 PM, Emily Shaffer <emilyshaffer@google.com>
> wrote:
>
>> Hi Akash,
>>
>> Have you configured your temp sensors to report over dbus already?
>>
>> Emily
>>
>> On Mon, Aug 6, 2018 at 4:58 AM AKASH G J <akashgj91@gmail.com> wrote:
>>
>>> Hi Team,
>>>
>>> I tried to list sensors and its reading using the command "ipmitool -I
>>> dbus sdr elist full". But temperature sensor and its reading is not
>>> displayed. Please someone help to resolve this problem.
>>>
>>>
>>>
>>> Thanks and Regards,
>>>
>>> Akash
>>>
>>
>

--0000000000008690440572d9f797
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Akash,<div><br></div><div>Check out this doc:=C2=A0<a href=3D"https://githu=
b.com/openbmc/docs/blob/master/sensor-architecture.md">https://github.com/o=
penbmc/docs/blob/master/sensor-architecture.md</a></div><div><br></div><div=
>Basically, you need your sensors to be available over DBus first, then con=
figured to be available over IPMI. This doc should ideally give you some go=
od step-by-step but you could also take a look at the Witherspoon or Zaius =
layers for an example.</div><div><br></div><div>Emily<br><br><div class=3D"=
gmail_quote"><div dir=3D"ltr">On Mon, Aug 6, 2018, 8:49 PM AKASH G J &lt;<a=
 href=3D"mailto:akashgj91@gmail.com">akashgj91@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Hi Emily,</div><=
div><br></div><div>I did not configure the temperature sensors to report ov=
er dbus interface. I am new in this area. Can you provide steps to configur=
e the temperature sensors to report over dbus?</div><div><br></div><div><br=
></div><div>Thanks and Regards,</div><div><br></div><div>Akash<br></div></d=
iv><div dir=3D"ltr"><div><div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On Mon, Aug 6, 2018 at 9:16 PM, Emily Shaffer <span dir=3D"ltr">&lt=
;<a href=3D"mailto:emilyshaffer@google.com" target=3D"_blank">emilyshaffer@=
google.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr">Hi Akash,<div><br></div><div>Have you configured your temp sensors=
 to report over dbus already?</div><span class=3D"m_2986422969281956581HOEn=
Zb"><font color=3D"#888888"><div><br></div><div>Emily</div></font></span></=
div><div class=3D"m_2986422969281956581HOEnZb"><div class=3D"m_298642296928=
1956581h5"><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Aug 6, 2=
018 at 4:58 AM AKASH G J &lt;<a href=3D"mailto:akashgj91@gmail.com" target=
=3D"_blank">akashgj91@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><div>Hi Team,</div><div><br></div><div>I tri=
ed to list sensors and its reading using the command &quot;ipmitool -I dbus=
 sdr elist full&quot;. But temperature sensor and its reading is not displa=
yed. Please someone help to resolve this problem.</div><div><br></div><div>=
<br></div><div><br></div><div>Thanks and Regards,</div><div><br></div><div>=
Akash<br></div></div>
</blockquote></div>
</div></div></blockquote></div><br></div></div></div>
</blockquote></div></div>

--0000000000008690440572d9f797--
