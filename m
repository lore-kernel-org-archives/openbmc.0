Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::22a; helo=mail-oi0-x22a.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jD1tcn7o"; 
 dkim-atps=neutral
Received: from mail-oi0-x22a.google.com (mail-oi0-x22a.google.com
 [IPv6:2607:f8b0:4003:c06::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41l0rB0mwmzDqCF
 for <openbmc@lists.ozlabs.org>; Tue,  7 Aug 2018 13:49:13 +1000 (AEST)
Received: by mail-oi0-x22a.google.com with SMTP id v8-v6so26047670oie.5
 for <openbmc@lists.ozlabs.org>; Mon, 06 Aug 2018 20:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=IOPpqBQFLBIV1q+8XDKU7oF4u26SXk64B9dRYooCCVI=;
 b=jD1tcn7o+l/jyOC7bjtSclwmYTaSI+DyGsiWP3GEokKYNWMtJXL+Ksu7Px9koBsLCM
 U+21dnC0oBcW+Trvbvp3V50szcDSpoZcN5j2mHCP+rJgLUUZtTUN2itDYq2NVdQTXUa7
 0Zu4SYrlOAMY+e6eVS/hzU4bfk4wh23FyHAHb/JVbapItiou3z+AVbo8d7vOPZKvrYFs
 fdyhy2tPUE0CyfZ6NsInLiXIauVzEXVojs87zQANh3iNrbml+nLPmbce7iuk98eRPFql
 KUqp0iiTUS+46ZEEHmVZFOuubFTD58to30LHEDr+oEJG4okTUojHBGE6yIMA1t2HVAI5
 +VYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=IOPpqBQFLBIV1q+8XDKU7oF4u26SXk64B9dRYooCCVI=;
 b=ecTucBHP7+X6GtyCczqw8B3WdT1CiqNT+N7oTFk/b3Dw1BS79SRVYcMenJB51zZU3N
 YT6JSQQB2BP7+iFhqbYmWG98eyg7DPwGY9SCb47DO/QlWlz0gxwvDkVkyshaZuehEMnT
 CDg8dSx5hps2OlY+87zOVyNyZ/YzZDcVHQyv+FSUr6HTGGTPGyXLt3D2i9D/E48kWYzh
 9RIHph+ipxOMW2LNrl/xMixnRb4SY/BO3zNx5Wvo1LCc5/lddfDbvwMhG/QUutQDVuZw
 mjEQefBHbaQiLUi225Ub3mwwbO4uGvvXgQ8PNkS0l7ShoKLeAspZw7dQNeeGmmXISo7b
 FcSA==
X-Gm-Message-State: AOUpUlE8gIT7cn3BNLM4qqgtcvFstO6KVOdcEty3g9WUTXiDWi8J9mFc
 +ZCISzrsNlnshRyR/DfVID0KhmKupHdmW/OXVvs=
X-Google-Smtp-Source: AAOMgpdtCUjcJ4BZewXRKXtLxfidbBCUjYNRM+7srum01qE9JyJLk8FRdmz25jew6RXL6Ph2JdNrVNdKXYDg9J+fMQk=
X-Received: by 2002:aca:e6cd:: with SMTP id
 d196-v6mr16650646oih.94.1533613751740; 
 Mon, 06 Aug 2018 20:49:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:2c4a:0:0:0:0:0 with HTTP;
 Mon, 6 Aug 2018 20:49:11 -0700 (PDT)
In-Reply-To: <CAJoAoZ=VzAUp2Jg6nPy8UKBvqBw+s=xWwuMK4VG-p=t7QTwdkA@mail.gmail.com>
References: <CAE33tLFWffT5wd9La+zU-ATkbrqa4-aRH=C+t_OBnWgsSgwNdg@mail.gmail.com>
 <CAJoAoZ=VzAUp2Jg6nPy8UKBvqBw+s=xWwuMK4VG-p=t7QTwdkA@mail.gmail.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Tue, 7 Aug 2018 09:19:11 +0530
Message-ID: <CAE33tLGrrsCBjW3Hqpe1K8__WXLwmph5KWCTUVmoA2LUoBnSCw@mail.gmail.com>
Subject: Re: Temperature Sensor and its Reading not Showing Up.
To: Emily Shaffer <emilyshaffer@google.com>, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000e52ded0572d04620"
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
X-List-Received-Date: Tue, 07 Aug 2018 03:49:15 -0000

--000000000000e52ded0572d04620
Content-Type: text/plain; charset="UTF-8"

Hi Emily,

I did not configure the temperature sensors to report over dbus interface.
I am new in this area. Can you provide steps to configure the temperature
sensors to report over dbus?


Thanks and Regards,

Akash

On Mon, Aug 6, 2018 at 9:16 PM, Emily Shaffer <emilyshaffer@google.com>
wrote:

> Hi Akash,
>
> Have you configured your temp sensors to report over dbus already?
>
> Emily
>
> On Mon, Aug 6, 2018 at 4:58 AM AKASH G J <akashgj91@gmail.com> wrote:
>
>> Hi Team,
>>
>> I tried to list sensors and its reading using the command "ipmitool -I
>> dbus sdr elist full". But temperature sensor and its reading is not
>> displayed. Please someone help to resolve this problem.
>>
>>
>>
>> Thanks and Regards,
>>
>> Akash
>>
>

--000000000000e52ded0572d04620
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Emily,</div><div><br></div><div>I did not configur=
e the temperature sensors to report over dbus interface. I am new in this a=
rea. Can you provide steps to configure the temperature sensors to report o=
ver dbus?</div><div><br></div><div><br></div><div>Thanks and Regards,</div>=
<div><br></div><div>Akash<br></div><div><div class=3D"gmail_extra"><br><div=
 class=3D"gmail_quote">On Mon, Aug 6, 2018 at 9:16 PM, Emily Shaffer <span =
dir=3D"ltr">&lt;<a href=3D"mailto:emilyshaffer@google.com" target=3D"_blank=
">emilyshaffer@google.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div dir=3D"ltr">Hi Akash,<div><br></div><div>Have you configured yo=
ur temp sensors to report over dbus already?</div><span class=3D"HOEnZb"><f=
ont color=3D"#888888"><div><br></div><div>Emily</div></font></span></div><d=
iv class=3D"HOEnZb"><div class=3D"h5"><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr">On Mon, Aug 6, 2018 at 4:58 AM AKASH G J &lt;<a href=3D"mailto:a=
kashgj91@gmail.com" target=3D"_blank">akashgj91@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Hi Team,</div><=
div><br></div><div>I tried to list sensors and its reading using the comman=
d &quot;ipmitool -I dbus sdr elist full&quot;. But temperature sensor and i=
ts reading is not displayed. Please someone help to resolve this problem.</=
div><div><br></div><div><br></div><div><br></div><div>Thanks and Regards,</=
div><div><br></div><div>Akash<br></div></div>
</blockquote></div>
</div></div></blockquote></div><br></div></div></div>

--000000000000e52ded0572d04620--
