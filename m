Return-Path: <xow@google.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
 [209.85.220.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgwmC5236zDrPT
 for <openbmc@lists.ozlabs.org>; Sat, 24 Sep 2016 13:32:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=YV68sVsT; 
 dkim-atps=neutral
Received: by mail-qk0-f175.google.com with SMTP id z190so122883897qkc.3
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 20:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=chJqXv1hTrG4d5/fOefx62A2TQ2hfwiXcc6aQH6m4JI=;
 b=YV68sVsTjejUNgsN/OcP3m23CZrGsiZLCw3/fSjbj+hmgvEmZyYnJmjpGsb9311YA5
 oxnbedn5bEuZRmtv2/A7dadMLNbSq39gtZVAUbZQ/YkttUNWk7B+RpTIcGTcuo4vb62n
 DEDF57inuOt6Pt9eKbDRxycbDYKQc4eMgs8Y8eBZoQYDVnT+2ghagzHgNWk8Vg1yDCO4
 p+e4Z4w0vJuSRWb++iWzzUEKoirS87cwRbeyUDAihrrRcb7ML+GeP2zLdgA6itjfRAKh
 COD3DIeqA4mF/wUvR08FOfQPBE6i/8SG96Pro7wtiGvQA1znz9hQVuy5s9ud5girjxMb
 Afcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=chJqXv1hTrG4d5/fOefx62A2TQ2hfwiXcc6aQH6m4JI=;
 b=KxBBAhKAewSbsI6GZU0KdunkrQbf4t0jhsf7Nw/qsAWL0gPVAQ4EU2CBOSYKEnopWu
 Oe0y1lmBCeHjSyCuXYCIDZKPmWw9MsCnvIS/ywiUOVfWOj04OakmCxg5iK8lThxRWHow
 yJTGKtjUA6A6WXaGx4YnkW/0N8VC/fPi7ed+h7wptMJPLT02+SsTiZ1Lh3qnNpdeP3wZ
 b2tY5i53p+oZse73VElxFeBEhjLB4YX+wlRHDk+kS7PwkrTHCf7S36SEkdeq0BhBYU5t
 XaUMxmI6sm5YQ2+2HdWvUgjq5PbpxC2Gq11gkGLNAKnguG0tAIzfG9c1g8C5TcMGoReY
 yPxg==
X-Gm-Message-State: AA6/9RljXavM+hDcb2Cp7Gc7eXlSOtBUiaoRMf45DUbkbC2dws+H99Zo8h5AzFZHCJ8KoCiMgC7WOfB2CbRLrgHa
X-Received: by 10.55.145.197 with SMTP id t188mr11145179qkd.233.1474687916651; 
 Fri, 23 Sep 2016 20:31:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.47.132 with HTTP; Fri, 23 Sep 2016 20:31:56 -0700 (PDT)
In-Reply-To: <CACPK8XeN110qizi9jBRsK643Lp_uJWeUsKEA+paaqgo5Dw7K4A@mail.gmail.com>
References: <CAPH-5w4jbigkRRKvOs9hT_kvCyGSMG8bL=j5=z6cyDND52mdYw@mail.gmail.com>
 <CACPK8XeN110qizi9jBRsK643Lp_uJWeUsKEA+paaqgo5Dw7K4A@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Fri, 23 Sep 2016 20:31:56 -0700
Message-ID: <CAPH-5w4A5Thk8=hXOVX+TFFb7o1X1bdY37bnufWKAQb7-dUjPw@mail.gmail.com>
Subject: Re: Skeleton power control machine configuration
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Sat, 24 Sep 2016 03:33:03 -0000

On Thu, Sep 22, 2016 at 10:26 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hey Xo,
>
> On Fri, Sep 23, 2016 at 10:28 AM, Xo Wang <xow@google.com> wrote:
>> Hi folks,
>>
>> I was adding power sequencing and buttons for our P9 machine and I
>> noticed that Firestone, Garrison, and Witherspoon had patches to
>> op-pwrctl that replaced the net names on the power pins, added more
>> reset complexes, etc.
>>
>> https://github.com/openbmc/openbmc/blob/master/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/skeleton/skeleton/0001-Set-witherspoon-power-pin-and-pgood-nets.patch
>> https://github.com/openbmc/openbmc/blob/ced4c34ee252d0036b714425eecb0ed8bb528750/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/0001-Add-power-control-support-for-the-Garrison-system.patch
>>
>> I didn't want to do the same for our machine. I propose moving machine
>> specific options to the Python configuration so we can eliminate the
>> skeleton patches.
>
> Great! This was an area of concern for me as well.
>
> I'm not sure what the future plans are for this part of the codebase.
> I think that fixing it to remove the out of tree patches and enable
> new machines is great for the time being. We should check with Patrick
> and Brad as to their plans for the future, so we don't waste time on
> code that will be reworked.
>

This looked like the shortest path to per-machine power config until
we designed something new, so I just went and implemented it. I
thought Patrick did mention rewriting but you're right, we need this
part to work pretty soon.

>>
>> I mailed my prototype to the Gerrit that adds a dbus call to
>> system_manager, C bindings, and power control logic to handle the
>> abstraction. Please take a look.
>>
>> https://gerrit.openbmc-project.xyz/#/c/605/
>> https://gerrit.openbmc-project.xyz/#/c/606/
>> https://gerrit.openbmc-project.xyz/#/c/607/
>> https://gerrit.openbmc-project.xyz/#/c/608/
>>
>> I'm planning to also extend the GPIO/net name abstraction to reset and
>> power buttons, since they're also using net names directly in their
>> sources.
>
> I had a brief look at the patches and they look good to me. I left
> some minor comments in gerrit.
>
> In the future we want to ensure that all of the GPIOs are configured
> correctly to a known state at BMC boot.

To add to that, we might want to experiment with reset tolerance
registers to protect systems against blips from unexpected BMC warm
resets.

>
> Cheers,
>
> Joel

cheers
xo
