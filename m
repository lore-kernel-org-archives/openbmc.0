Return-Path: <yuenn@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::232; helo=mail-ua0-x232.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Fpj+6EIz"; 
 dkim-atps=neutral
Received: from mail-ua0-x232.google.com (mail-ua0-x232.google.com
 [IPv6:2607:f8b0:400c:c08::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ybQrq6JpqzDqG6
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 09:52:42 +1100 (AEDT)
Received: by mail-ua0-x232.google.com with SMTP id r11so4974691uah.12
 for <openbmc@lists.ozlabs.org>; Mon, 13 Nov 2017 14:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=1aZGvsUDRZyeRrjT/3xp/+SDASi2zDQp9gFCBuu94Rc=;
 b=Fpj+6EIzeYUbLa58l6twhgEyl8gP2mMQo5h53MKmNhjLbF/sYhyzL0jjOIuALpHswO
 LFbsWTwfn4Kzdu64OEmQkosdBLjrRZv1Lbx0+H/TA6qCMXZmLnOv4DHnGvy7WVa3pQH/
 t2WzMAbNvsFWBwLYiVz4LBMtCwV5UHoipbjBXGOEd2V3O553tBdGVDTuKdrZMycnDPdL
 iqu4HCINZoyq35EidUsxbyThZTNX9lwmaSDP7D9YOxOt/gUOr3K8qZYvhhUeiqVSGslH
 OBksGiIG6Qo8A5tPCW/0QExSdH2B6Mkw5h2lt9pJ4Kv/nQMeycvteXV2TzJk5tI2OBGG
 3DfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=1aZGvsUDRZyeRrjT/3xp/+SDASi2zDQp9gFCBuu94Rc=;
 b=jzvoZx583HSlvLJCezbeVXoyEqjBwJL1uP/6yn80GAmhwwSuFDF1lQUvkqOYcccI1j
 XxuDdx0IGDCBqapbmkUXqQtzllhnap1aspmBWbmxXwhS5HhI8kW67hI+c+mhoLqdN+n8
 mOVKFd9/nYzhmBhhNrA1KY2bRVECK+Dk7fMN3/DiDGL4+CGt+6NCNepFr5UoXvcvRcPB
 PR0xM3PGNY8hLV8/CoF10nZa/+HwHLzCGT5jTjPd4eGpYtmkFh0wJMdnARga3hNlMAga
 lrTT8LMm82jQ2I9aMx+KnhGy7hCqlSICAmXKUzElvKuk13eVZSbtuvJ202lt6FObQdGF
 +tmw==
X-Gm-Message-State: AJaThX6VVO0XxgL0/fvRssNkNbejHnXs9zILhdQ9wbRck0LaeRZ2/QKt
 RxxH2NKO0Eyx+cE/kfn0Y5tZxYQdBWXydTjElN7xDmZp
X-Google-Smtp-Source: AGs4zMY7g2QEbxiF58gTFn7e6Do+zQm+b5VZsfbvUTdUUF40eROOAZ2t/TuMV7vJwiJ8i+maFvhOmMDvN1psO569DJ8=
X-Received: by 10.176.8.201 with SMTP id o9mr8936775uaf.155.1510613560087;
 Mon, 13 Nov 2017 14:52:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.178.66 with HTTP; Mon, 13 Nov 2017 14:51:59 -0800 (PST)
In-Reply-To: <131f9b9846da161265b9554bd4bcb523@linux.vnet.ibm.com>
References: <4322480B-15BC-4260-9D78-917E823CB8D8@fuzziesquirrel.com>
 <CACPK8XfeOVFEq6mRSL2DKOJazSvGSPYHrG6OtEtNi+EeWptvWg@mail.gmail.com>
 <CADfYTpFLS4MO4iAYnw9i-LqS5_WNwkkqO7PX3kk6hXJB2KR1Zw@mail.gmail.com>
 <131f9b9846da161265b9554bd4bcb523@linux.vnet.ibm.com>
From: Nancy Yuen <yuenn@google.com>
Date: Mon, 13 Nov 2017 14:51:59 -0800
Message-ID: <CADfYTpFnbKPJAjQ25NnJr7oRaxscSVZgEiyJZJoDLP3B+-MTGQ@mail.gmail.com>
Subject: Re: OpenBMC community telecom - call for 11/13 topics
To: anoo <anoo@linux.vnet.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC <openbmc@lists.ozlabs.org>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 openbmc <openbmc-bounces+anoo=linux.vnet.ibm.com@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="f403045e630ca4ff9c055de52017"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Nov 2017 22:52:45 -0000

--f403045e630ca4ff9c055de52017
Content-Type: text/plain; charset="UTF-8"

Brendan will be on to talk about host-ipmid.

----------
Nancy

On Mon, Nov 13, 2017 at 12:28 PM, anoo <anoo@linux.vnet.ibm.com> wrote:

> Inband update. Andrew J mentioned that the v3 mbox spec supports the
> current needs of Google in this area, so want to get a consensus to use
> mbox as the inband update mechanism for the reference implementation.
>
>
> On 2017-11-13 13:51, Nancy Yuen wrote:
>
>> I'd like to talk a bit more about testing.
>>
>> ----------
>> Nancy
>>
>> On Sat, Nov 11, 2017 at 4:46 PM, Joel Stanley <joel@jms.id.au> wrote:
>>
>> On Sat, Nov 11, 2017 at 1:22 AM, Brad Bishop
>>> <bradleyb@fuzziesquirrel.com> wrote:
>>>
>>>> Please reply with any topics for the 11/13 call.
>>>>
>>>
>>> - Moving to a new base kernel (4.13)
>>>
>>> Cheers,
>>>
>>> Joel
>>>
>>
>

--f403045e630ca4ff9c055de52017
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Brendan will be on to talk about host-ipmid.</div><div cla=
ss=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_signature" da=
ta-smartmail=3D"gmail_signature">----------<br>Nancy</div></div>
<br><div class=3D"gmail_quote">On Mon, Nov 13, 2017 at 12:28 PM, anoo <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:anoo@linux.vnet.ibm.com" target=3D"_blan=
k">anoo@linux.vnet.ibm.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Inband update. Andrew J mentioned that the v3 mbox spec supports th=
e current needs of Google in this area, so want to get a consensus to use m=
box as the inband update mechanism for the reference implementation.<div cl=
ass=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 2017-11-13 13:51, Nancy Yuen wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
I&#39;d like to talk a bit more about testing.<br>
<br>
----------<br>
Nancy<br>
<br>
On Sat, Nov 11, 2017 at 4:46 PM, Joel Stanley &lt;<a href=3D"mailto:joel@jm=
s.id.au" target=3D"_blank">joel@jms.id.au</a>&gt; wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Sat, Nov 11, 2017 at 1:22 AM, Brad Bishop<br>
&lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com" target=3D"_blank">bradle=
yb@fuzziesquirrel.com</a>&gt; wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Please reply with any topics for the 11/13 call.<br>
</blockquote>
<br>
- Moving to a new base kernel (4.13)<br>
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></blockquote>
<br>
</div></div></blockquote></div><br></div>

--f403045e630ca4ff9c055de52017--
