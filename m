Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::243; helo=mail-lf0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gz44xmqu"; 
 dkim-atps=neutral
Received: from mail-lf0-x243.google.com (mail-lf0-x243.google.com
 [IPv6:2a00:1450:4010:c07::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y6zQl0YrGzDrG0
 for <openbmc@lists.ozlabs.org>; Thu,  5 Oct 2017 14:53:50 +1100 (AEDT)
Received: by mail-lf0-x243.google.com with SMTP id l196so15527391lfl.1
 for <openbmc@lists.ozlabs.org>; Wed, 04 Oct 2017 20:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=Ogt+RUAqyGgmu22clA0HcrZGqhdb8apDEu25qYWMHyw=;
 b=gz44xmquqe3apFxwz3Mn3w1Z2gpZfFREmS9+ub1Ys5TfLttGvGKLn9BEBRSabonwzF
 Lqbe5tkpWwShHgLNfweMW4EWAbrBuY0tsOvXwo9ITkpggaylOhPb1HKvho43kCi9fDgX
 AW9DJafLlBlLo5IOP0CoiaZWy907ocMwSh+fVzTxK6ZejOpyTSn/l3lnBrGwScZ3Qh8f
 T1F/Awc6yBTlnG8pXEJNl8XWv1Frwxjg57+bWJytZ8c729hotCkCYe78rvKBNEkXVkDo
 H3LSB6e5und55qibEEJngc5eSFeJNyBSyZU89VuFs1HVzgjvRPdKqkcKD8rg6vfWHcSr
 xmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=Ogt+RUAqyGgmu22clA0HcrZGqhdb8apDEu25qYWMHyw=;
 b=nOJT+y8QhSGvKg50oVc93+YZq0jvJ4mvCkgylprJ+xGJvHIdM0zwANquxTBIbRfAAD
 3S7yEbP3LhKhjVPuvQ2By7RD4K1v8WzNE5WXmpD/BzonzAap+7CFSjyfrc18wIDEU4KI
 e1jUIMMafazo2BSTjy5ddWPw5dH9A8C+JqWcXiCW99iHduG+z1ofK8FLDnc4eMBw7Jse
 P0jGxUJDAMTZQ8WXdH+ZBKbvZqU+lCS2tZ5GI0oW3f5RuygdNTw344G74hyfrGxoxbU9
 eR/7WqnlrOtDLFqBq/AaH/XNzLuWPWULXp799WcHkctfFk9gpnChlIKubnunxalgCDQp
 5gPA==
X-Gm-Message-State: AMCzsaV1gfnV9tGFnbchml6RQyjcaIvoW27uu62ypAIeHeEbCjItztaX
 m30poMPMqIpoUns2LD/HJZCNVrSJ1Oag8QsOSis=
X-Google-Smtp-Source: AOwi7QA5UEQ4uyAaHqXGu/j+QQ3IAvKlAmxdXHMRoPv/S7AL4cxSnHWWMr5GT9qj0ZpUfljy69NieZOROloQF7tQFxI=
X-Received: by 10.25.233.81 with SMTP id g78mr3301804lfh.197.1507175626456;
 Wed, 04 Oct 2017 20:53:46 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.195.6 with HTTP; Wed, 4 Oct 2017 20:53:25 -0700 (PDT)
In-Reply-To: <4C6D0A46-3301-4EFE-96B2-DB19C4525D6C@fuzziesquirrel.com>
References: <1507058068-9406-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XfGubVuKRL=nTwbPbn5KMHtUvTULPZXvy=jYWPU_hbdDw@mail.gmail.com>
 <614fb026-d8fa-da2e-584a-c9766319ecea@linux.vnet.ibm.com>
 <4C6D0A46-3301-4EFE-96B2-DB19C4525D6C@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 5 Oct 2017 13:23:25 +0930
X-Google-Sender-Auth: OVynrjZcjb75dhD-a0ktf5JYgWE
Message-ID: <CACPK8XdfXFTXrbTvRS0hqPNPzS2OFTk7SpiX9kOLyMyZQ9PB-Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] Revert "drivers/hwmon/occ: Add temperature
 fault attribute and VRM temp alarm"
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 05 Oct 2017 03:53:53 -0000

On Thu, Oct 5, 2017 at 11:31 AM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
>> On Oct 4, 2017, at 11:04 AM, Eddie James <eajames@linux.vnet.ibm.com> wr=
ote:
>>
>>
>>
>> On 10/03/2017 11:38 PM, Joel Stanley wrote:
>>> On Wed, Oct 4, 2017 at 4:44 AM, Eddie James <eajames@linux.vnet.ibm.com=
> wrote:
>>>> From: "Edward A. James" <eajames@us.ibm.com>
>>>>
>>>> This reverts commit e55423ee10a5057338d24383c00e813436a126ea.
>>>>
>>>> Apologies for pushing this up so early... Userspace applications aren'=
t
>>>> ready for this change. The hwmon polling application cannot accept EGA=
IN
>>>> yet, and we can't be returning apparent errors if the sensor is
>>>> temporarily unavailable.
>>> Can you go into some more detail here please.
>>>
>>> It looks like these changes are within the hwmon ABI, so userspace
>>> that supports hwmon devices shouldn't break.
>>
>> Sure. With this change, the driver returns -EAGAIN when reading temperat=
ure sensors that show 0 temperature. Temperature 0 is how the OCC indicates=
 that the sensor is not available at the moment. So, we should retry in a b=
it. But the hwmon application currently sees any negative errno as an error=
,
>
> Actually the userspace retries for a configurable period on eio, etimedou=
t,
> ebadmsg, eagain, and exnio.  It also exits cleanly on enoent.
>
> If any of these errnos don=E2=80=99t go away after the configured number =
of retry
> attempts, an error is logged.  Any other errnos and an error is logged
> immediately. If this list needs improvement I=E2=80=99d love to hear abou=
t it.
>
> ebadmsg and enxio are observed when i2c devices are unplugged with transf=
ers
> in various stages of flight.  They occur just before the driver is unboun=
d
> after the presence gpio toggle on these devices is noticed and processed
> (killing the hwmon userspace daemon cleanly).
>
> eio, etimedout seem to be bus type errors that appear somewhat infrequent=
ly,
> but occur nevertheless.
>
> we all know what eagain means=E2=80=A6
>
> It isn=E2=80=99t so much that the hwmon userspace doesn=E2=80=99t support=
 this change,
> its just the resulting behavior difference at the other end of the
> hwmon abi <-> dbus api translation is not optimal, right now.
>
> 1 - Without this change, the hwmon userspace reads a value of 0 out of
> the sysfs attribute and happily reports that as the temp at the DBus leve=
l.
>
> With this change, the hwmon userspace would read the attribute, get an
> error and retry for a bit.  After a number of retries, the error is
> logged and the sensor is marked faulted at a dbus level.
>
> The issue is the consumer of the sensor at the dbus level.  Today, the
> dbus consumer happens to translate the sensor value of zero into the
> desired behavior.  If we submit this change the sensor will be put
> into faulted state and the consuming application doesn=E2=80=99t have sup=
port
> for that yet.
>
> We have open issues to enhance the application to support faulted sensors=
,
> its just not implemented yet.
>
> I hope this helps a decision to be made.

Thanks for the background. In general we want to write and test our
userspace such that it can cope with all of the return codes that the
kernel may throw at it. I look forward to helping us in this area in
the future.

We will take this patch as a once-off to keep the OCC train moving.
I've added your notes into the commit message.

Applied to dev-4.10.

Cheers,

Joel
