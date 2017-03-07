Return-Path: <xow@google.com>
Received: from mail-qk0-x22e.google.com (mail-qk0-x22e.google.com
 [IPv6:2607:f8b0:400d:c09::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vd8wv5qkLzDq5x
 for <openbmc@lists.ozlabs.org>; Wed,  8 Mar 2017 08:31:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gAcvUuCU"; 
 dkim-atps=neutral
Received: by mail-qk0-x22e.google.com with SMTP id v125so26671530qkh.2
 for <openbmc@lists.ozlabs.org>; Tue, 07 Mar 2017 13:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=f6hrcB40J3IXLowpvjWG8adIHXEVSZnnTY37G5XoqxI=;
 b=gAcvUuCU7tbuys2/XZbFlC1MMbSmSOpogoMETx/kN0gqeP7dyj36kaAtkGyaWyHZ1Q
 cblbo4S/RL+ZVPfO+C/8cvBWqMac+ZrLY0HX/bMB13w8weVldYuvrrvxz0A/YWthFDmv
 CvRJW+wuY/vJlzcZ3q2RC5/tQhAlgRzB/ESAXLtoNa35jjJJ0+VkP0n/KIqlKXoslHUs
 Wq3bl/WJ+ayPq2VDbTnTsyTsSwnHDXzI0AcFH4iU4vkD8iGIYgXMnjpKRsDG98EZHSLM
 RJIDhVYnF8mH8vitqgXuZkrXzTMTBOiZF3i5AqsAiEX/6OLfFpxZK9ItHIIVkH0R6+s6
 wQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=f6hrcB40J3IXLowpvjWG8adIHXEVSZnnTY37G5XoqxI=;
 b=Axdb5fwddU19YnbJ50DDAsFilHbbhwbX/UkOdTtPTI/cMfv7onCnGHwy5dPVPzJH8D
 hdrOHxyYzsEmaRq8P+esi3Xio4WXoFbdmDzlvzuxG3Ee13b4f6ikYdtUtrALGhgjcE3/
 IXtuCST8F/oJZJ+YXovWQTXYoCZE2ago+ekuVagdpdDSq3ArvC2DBvB3oBWP4uzypKs5
 gE3zuMT9v5p6on9+SoUZwY3q9FGRO+N17D5aYViWxcYb1K8gVQo1QTXSpRy/MNg/wRJc
 CfdrsVc4XqwMhdb8nNsx+fZxXXrSb//VVcNkDm3GM6kkSDeAdMHuMhoH6Hn+8Yc8PTWQ
 OmKw==
X-Gm-Message-State: AMke39nBlsgVOcGdutO6lrkkqzOQOrgLZjw6nX6k1VvdzmDMtWWwGDn6xdjm2WGELM5Me7e5CfU8PER/KJ1Fflce
X-Received: by 10.200.3.230 with SMTP id z38mr3365633qtg.181.1488922284481;
 Tue, 07 Mar 2017 13:31:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.17.56 with HTTP; Tue, 7 Mar 2017 13:31:24 -0800 (PST)
In-Reply-To: <CAPLgG=naqWVfr3C2yFBP9HSTR9WC3UT661fEu+ZT3_ETxp+tuw@mail.gmail.com>
References: <20170303205920.146751-1-xow@google.com>
 <CAPLgG==-CnHNe14H9SV2ZCfJu9ZQ_Xc7ayXfkKbQY+_ZmVPubA@mail.gmail.com>
 <CAPH-5w7dkuLF_wfwxtSVsHgxCfe787twEuFa-nh2JkncP3gcLw@mail.gmail.com>
 <CAPLgG=naqWVfr3C2yFBP9HSTR9WC3UT661fEu+ZT3_ETxp+tuw@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Tue, 7 Mar 2017 13:31:24 -0800
Message-ID: <CAPH-5w7VWSpob8KSpfYKwOT9HcT9Sab8pnpzOPQvrXd8shDLtA@mail.gmail.com>
Subject: Re: [PATCH linux] ARM: dts: aspeed: zaius: Enable NC-SI mux
To: Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Tue, 07 Mar 2017 21:31:28 -0000

On Tue, Mar 7, 2017 at 1:21 PM, Rick Altherr <raltherr@google.com> wrote:
> I don't believe it currently does.  I'm concerned with whether U-Boot
> or Linux is expected to configure the NC-SI muxes.
>
> On Tue, Mar 7, 2017 at 1:19 PM, Xo Wang <xow@google.com> wrote:
>> On Tue, Mar 7, 2017 at 1:13 PM, Rick Altherr <raltherr@google.com> wrote:
>>> Why is Linux doing this instead of U-Boot?
>>>
>>
>> Does our U-Boot understand Aspeed GPIO in the device tree? If it does,
>> then it makes more sense for U-Boot to consume and set these pin
>> assignments.
>>
>> xo

I would think U-Boot is expected to, since that provides the option of
netbooting from the NC-SI adapter in U-Boot.

In addition, the Linux ftgmac100 driver can't yet handle the NC-SI mux
changing dynamically (https://github.com/openbmc/openbmc/issues/979).
So for now the mux must be enabled and selected prior to that driver
probing. This is the only reason why this assignment exists as a Linux
gpio-hog: it is set prior to any other driver being probed.

xo
