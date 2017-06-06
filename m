Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3whZy55QgxzDqKy
 for <openbmc@lists.ozlabs.org>; Tue,  6 Jun 2017 12:14:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VFy6Y6OR"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id p144so9098606ywp.2
 for <openbmc@lists.ozlabs.org>; Mon, 05 Jun 2017 19:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=P0EFYLmkUz1uyCpTi5psRb0VKePOq0qsZcR5p1bd4Rw=;
 b=VFy6Y6ORZwUeP8DVfGGKHKGfqo9b6nhGS/4OqYrc7Xgu0absRXL/WS3oeAThgY5EhU
 FgAnCZVKAwZpjuZsVe1M98cOhd0LFsBeegfpgnRzozYPN3SUIVFPvqBpXz5HHrlAOhy3
 4QyWLyeNYwd3whxk5Vr5DKX2rhHruzAzJ6MhveOmSvOfsZOPZTCFsHu+hWAQY5Ge+vNK
 uzdGVdF6dxHBvO6SB5N7zyMh2Itdz5wljZfaUNSHIn/n4WUwfKnqjHiUvVhwnbnZT8TC
 rsQOkTeRYp5qiviWgMDt1b6XhfwCG2mmYqboZrobJPfltFeSVYNoxs9Y0077vV3/RdvU
 rapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=P0EFYLmkUz1uyCpTi5psRb0VKePOq0qsZcR5p1bd4Rw=;
 b=W0AhyHHUDSEz/MSImY/5i8hdT2sl+0MOIcdy6JL70nDe3N1iAXpD2Bh0J43uNmMb8l
 TE2MiNbJUlPi4/nBx0xzRdKrGG52bmY9DkBalQAuhXfP2K1Bhs1LYsv36UoE368n8ocF
 pTVsg77FX6465bbhP+x43vuGy1ciKZlDeGhXbz9iY0+yzQmRjuoa3IiFvz0y3+EWAeEX
 OVviT5zpIy3Nac3L0bX/5cMLl5Xcq/MbFpP1+pYqZzawwlWjntCO5a3TTb5nR5+YHehQ
 O8r+qS/Q+g3r/RXYcT3QTMrIknlElSJGjg1+PS9pp/2YlgGLzAEhjt5h1lJBxscB4NCl
 7sNg==
X-Gm-Message-State: AODbwcDzTOp1kD2J9hBncaQ5Q4kNo0ebpCarOrEC7QZW/YLLW1AOlm38
 aU/Yu4NtTXtxpeZeiL6kWDGbfUGdOg==
X-Received: by 10.13.218.198 with SMTP id c189mr1090331ywe.308.1496715274950; 
 Mon, 05 Jun 2017 19:14:34 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Mon, 5 Jun 2017 19:14:14 -0700 (PDT)
In-Reply-To: <CAFRv3wzAfdwRreYMGMa4ZMiKuSu7fB4Sd9a8Jt3_Fah9L97R9g@mail.gmail.com>
References: <20170602194612.11866-1-rlippert@google.com>
 <CACPK8XdmjihLOZseWtGq+9QKQ+mDVNujP_csW8fhUTzPFoTMaQ@mail.gmail.com>
 <CAFRv3wzAfdwRreYMGMa4ZMiKuSu7fB4Sd9a8Jt3_Fah9L97R9g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 6 Jun 2017 11:44:14 +0930
X-Google-Sender-Auth: FMqIOO3LEyIg29ohg2lgD1h951E
Message-ID: <CACPK8Xe6Z-VK6rTnOhMfEzg=mMwOwN==64srwFryxdL1hR1G4g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: aspeed: zaius: Support new board FSI
 gpio pin mapping
To: Rob Lippert <rlippert@google.com>
Cc: Robert Lippert <roblip@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Xo Wang <xow@google.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 06 Jun 2017 02:14:38 -0000

On Tue, Jun 6, 2017 at 5:13 AM, Rob Lippert <rlippert@google.com> wrote:
> On Sun, Jun 4, 2017 at 9:46 PM, Joel Stanley <joel@jms.id.au> wrote:
>> On Sat, Jun 3, 2017 at 5:16 AM, Robert Lippert <roblip@gmail.com> wrote:
>>> FSI routing was broken on EVT boards and all boards were reworked
>>> to use the nearest available GPIO pins.  Future boards have
>>> fixed the issue so need to use the original planned GPIOG ports.
>>
>> How long will we need to carry support for the EVT boards?
>
> EVT boards should be scrapped within a few months (by end of year at
> the latest) at which point we can remove this code hack and uncomment
> the properties in the .dts file.
>
>>
>> We had proposed using u-boot to fix up the device tree for these kind
>> of changes. If you want to support the EVT long term, we should look
>> in to implementing those changes in u-boot.
>
> I looked at that briefly but it was significantly more complicated :)

Yeah agreed. Lets carry the hack for now, and it can be dropped in a
future rebase.

Cheers,

Joel
