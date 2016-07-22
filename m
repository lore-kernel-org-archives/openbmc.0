Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rwdWZ61KVzDqYj
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jul 2016 14:50:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=sNyTv9tf; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id p126so7908450qke.1
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2016 21:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=LBci3pmHqwBUF7Ww31z6L9lZa8dtssQ96ErTERt0inA=;
 b=sNyTv9tfMdLNpCJRjI13cb5JdBZtcKhRyLQWcFDUJdd1e3Gl9r7bITscgyQy7SBlZB
 DnNDhAjwTpovT2Nllcp+Ay5DWxNK4SJ+TmFOmZHOo/B/eygOJ7xNh4VhIBxqxXEspGsy
 SfG5boBiZkp3+a59XU3ZCcTqBrMuLO4J1+ODTqMW/Hvx0BOiucKgMrmk2Cbtf05D616/
 AtbI1pD22f6BgKytPRMOJOj0EXIvokxv/qaan6hs7OP7vKEEFBz/gUZ7W/L+/EKeCWDI
 eGANQFompse0qF1cT4sixGiF7gs1UYkVhZkCigVMZS/c5gUtguRTh6pVumTA5wyyJSnw
 jsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=LBci3pmHqwBUF7Ww31z6L9lZa8dtssQ96ErTERt0inA=;
 b=cdqSEPyZCNJkXf68NiQQqpVhfW0/WXJDwccfnl/9/bgHmb8c8ynj07eA/QWdf6mJfD
 B1sj175wEGfBqM80x+zU4unAso33jSKN5pteIDKsgjFAXbfkbOZhrxU3lutapHBaZ8xC
 6sG+KsdfQy50Sj8udo14RqoD/+ghCy1Hv5AlxXq/qVisgyi8UVjnDeibAzWL1rueDKrY
 Zj5MPCan/MatbE5q7Pcvt6oH3MfBrHGY8pZ7Da7XyWKAIPjcI9Y+cSlMGTay+Vh30Hpe
 NbBHfudUH+ACkCEkJXgrNRTmgxgCoarQkysftO4y04QHkWIN3Go4RYfZli6AUXxSAans
 RatA==
X-Gm-Message-State: AEkoouuqBCMzzrQ2fGyajp27PqgQdC1cmxgPF/duSmh47mvQLS2FS3WM7vDLMRzNbNYH0Q5MSRyy94mmG2z0iA==
X-Received: by 10.55.38.197 with SMTP id m66mr2351036qkm.208.1469163048760;
 Thu, 21 Jul 2016 21:50:48 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.141 with HTTP; Thu, 21 Jul 2016 21:50:29 -0700 (PDT)
In-Reply-To: <20160722041220.zcutlqqvhl4qjpk4@asimov>
References: <20160721110110.6902-1-openbmc-patches@stwcx.xyz>
 <20160721110110.6902-2-openbmc-patches@stwcx.xyz>
 <CACPK8XfP-VJi_xbnrJ8urCC-C67aOkzWOUKQd5kO43GQrCgQuA@mail.gmail.com>
 <20160722041220.zcutlqqvhl4qjpk4@asimov>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 22 Jul 2016 14:20:29 +0930
X-Google-Sender-Auth: ybb3vfY8CwPduIJAUj4WLqqu13g
Message-ID: <CACPK8Xc7pNu_oCT1bR0BSvyqJ5CcyftBDKxj6-HYqZrHU4ZuLw@mail.gmail.com>
Subject: Re: [PATCH linux] Fix the incorrect debounce setting on power button
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 johnhcwang <hsienchiang@gmail.com>, Adriana Kobylak <anoo@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jul 2016 04:50:51 -0000

On Fri, Jul 22, 2016 at 1:42 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
>> On Thu, Jul 21, 2016 at 8:31 PM, OpenBMC Patches
>> <openbmc-patches@stwcx.xyz> wrote:
>> > From: johnhcwang <hsienchiang@gmail.com>
>> >
>> > PCLK divider selection is decided by SCU08[25:23] and the value is 011b
>> > on Barreleye.
>> > That means PCLK should be H-PLL/8=384MHz/8=48MHz, but the current
>> > debounce timer value was computed by 24MHz.
>> > So the correct value should be 20ms*48000000/1000=EA600h
>>
>> Thanks for the patch. I noticed this is against our dev-4.4 tree,
>> which is no longer maintained.
>>
>> Given you're looking at barreleye, I assume you are using the v1.0
>> release of OpenBMC?
>>
>> Patrick, if I do a new dev-4.4 tag with this fix, would it be queued
>> up for a v1.0.x release?
>
> I can do that.  It is up to Foxconn to let us know what fixes they'd
> like put into a v1.0.x release at this point.

Okay. I've sent a patch for the v1.0-stable branch. I suggest we merge
it in and when/if Foxconn require a new release, it will be ready to
go.

https://gerrit.openbmc-project.xyz/#/c/61/
