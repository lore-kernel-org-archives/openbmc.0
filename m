Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tJRtC1jCyzDvk5
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 12:45:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QlxdU6qz"; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id f201so1067079oib.0
 for <openbmc@lists.ozlabs.org>; Tue, 15 Nov 2016 17:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=+fGdgTkDxcM2oKTp7di9OHrFFVYaovv6SLY3rNRGWCM=;
 b=QlxdU6qzraI6GVEPXKM/pjIQTDwkXERsaIDg6++yO2PTa+2sRn0jBxgtHKhjm7UWnI
 BDgknVdGgEg4IIK9r0Z/WxngB0izRzzu4tkyBAhydDa8PJlq8wYBc4GzMCLniC0g3soW
 17xqwjlpYAU9oCHDIANZxm177B/Z15V3MfLR/F0n6hB/Hn8KCTElxC4dcCQoomqjpiA0
 FI9rj3gYbdulkU7+mUuaAwNT+5Znw5dsxo/JZK9scTLPxCGm9A3TE9e328kH1AbjQAPY
 Ll/S2gsHsYAo8xYezbXvi+PLJ8XwHUJ7ZObz3YsCOZGdXNyWjCafenEY05WL5M4A9DYm
 T7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=+fGdgTkDxcM2oKTp7di9OHrFFVYaovv6SLY3rNRGWCM=;
 b=Bc3jVJvdt/C18Jcg1WaceocLzHMh9vp5RrlpMsIrpYOVJBSJFIh23dGSmv3WzVjvWq
 QgwyKSeouugIaHpVYKBI8rqRlBRuyUfqqxdWqvGoFCLkD7fGUEQ8bW46U3tXDzTZ/q+X
 NhIRy3uMioh6FC1eEP1Kej3qI1TjF7Ov7dF0wCP4Ro3Ro3lyi+Y1liMdFCrmIUo14yYr
 N/wEqV1eyMKLMKazrvONDj4b82T/vT529cdEvMFuRXUIJ58VpTuwEC01TET92HQfkLdn
 0vVGrSnDKItEiG5zhvHkJOm8eqqN4QKNo5mQJkNgqpi5NeIjxLNi2KDSksSzXNOcmBRm
 eVNA==
X-Gm-Message-State: ABUngvdZcm2hDJwCiqSP0kNVoeQ+fXAiJtmAsUShjDSrqxyA0hcA9lSi0Wt9UX/SPLEl4q5NkrsbgFfI6DLL1A==
X-Received: by 10.202.80.203 with SMTP id e194mr625573oib.188.1479260753318;
 Tue, 15 Nov 2016 17:45:53 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Tue, 15 Nov 2016 17:45:32 -0800 (PST)
In-Reply-To: <CANsWYUXufCoWDwAcQ-Eq1Ase1FKQPfxfkQFDxNok9kYzd63t3w@mail.gmail.com>
References: <1478117865-32103-1-git-send-email-jaghu@google.com>
 <CANsWYUXufCoWDwAcQ-Eq1Ase1FKQPfxfkQFDxNok9kYzd63t3w@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Nov 2016 12:15:32 +1030
X-Google-Sender-Auth: 1WF9PmSjWDHxxwHT240f6L56iW0
Message-ID: <CACPK8XeURnj9cOa8AEkTXjtx-qShvdGCJXP4ozDR5ZrdNVf-UQ@mail.gmail.com>
Subject: Re: [PATCH linux v4 0/3] Seven segment display support
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
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
X-List-Received-Date: Wed, 16 Nov 2016 01:45:55 -0000

Hello Jagha,

On Wed, Nov 16, 2016 at 7:07 AM, Jaghathiswari Rankappagounder
Natarajan <jaghu@google.com> wrote:
> Hi Joel,
>
> Could you please provide feedback for this driver.

You have not addressed all of the comments from Rick in v4 of your
patches. The first thing I noticed is he pointed out you need to
separate out the device tree documentation from the code. I stopped
reading at this point.

Please go back and re-read the previous review and ensure your patches
address all comments.

Cheers,

Joel


>
> Thanks,
> Jagha
>
>
> On Wed, Nov 2, 2016 at 1:17 PM, Jaghathiswari Rankappagounder Natarajan
> <jaghu@google.com> wrote:
>>
>> This patchset includes:
>>
>> Character device driver which implements the user-space API for letting a
>> user
>> write to two 7-segment displays including any conversion methods necessary
>> to map the user input to two 7-segment displays.
>>
>> Platform device driver which provides an API for displaying on two
>> 7-segment
>> displays, and implements the required bit-banging. The hardware assumed is
>> 74HC164 wired to two 7-segment displays.
>>
>> Adding clock, data and clear signal lines in the devicetree to control
>> seven segment display on zaius platform.
>>
>> A changelog between versions is included in the individual patches. Please
>> provide feedback.
>>
>> Thanks,
>> Jagha
>>
>> Jaghathiswari Rankappagounder Natarajan (3):
>>   drivers: misc: Character device driver for seven segment display
>>   drivers: misc: Platform driver for seven segment display support
>>   devicetree: Add devicetree changes to support seven segment display on
>>     zaius
>>
>>  .../bindings/misc/seven_segment_gpio.txt           |  23 +++
>>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         |   8 +
>>  drivers/misc/Kconfig                               |  16 ++
>>  drivers/misc/Makefile                              |   2 +
>>  drivers/misc/seven_seg_disp.c                      | 198
>> ++++++++++++++++++
>>  drivers/misc/seven_seg_disp.h                      |  35 ++++
>>  drivers/misc/seven_seg_gpio.c                      | 225
>> +++++++++++++++++++++
>>  7 files changed, 507 insertions(+)
>>  create mode 100644
>> Documentation/devicetree/bindings/misc/seven_segment_gpio.txt
>>  create mode 100644 drivers/misc/seven_seg_disp.c
>>  create mode 100644 drivers/misc/seven_seg_disp.h
>>  create mode 100644 drivers/misc/seven_seg_gpio.c
>>
>> --
>> 2.8.0.rc3.226.g39d4020
>>
>
