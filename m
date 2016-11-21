Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMmVK4dMbzDvh6
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 22:25:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="wEsqeUv+"; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id v84so21590481oie.2
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 03:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=tBBEmytLXFM37dKIZQcapj/jkLPWKqMT2/Th1Lx2bT8=;
 b=wEsqeUv+/DkGUYDV0SQJ1IV7C4Heh/NcCrywSJb9DEPH25pdNzu9P13P59n7a7l4hR
 iBxKZkj9foBtgS1ldllOeyd9Ga8Kvux+nPa3DCadJ+Youp1U2Ufwpt7+59Shoa6i0nQn
 8/JOnRiH8i0AConwEH3boKnNGOCkOgCtk0TqM7zlvAj6JCOrcemYBQUXmwb3sQLtxB9g
 rIUWK/KlP6K5jCgDAfjRmXB8wS9dCVMedZDghZ1pkramr+FzFwSIdhThFi2+nRFYJ3Xw
 JG9ioos2+GjcnGPVQZI/RGSYFL2Y4M646fWwjtGpxD6/RQihP6c1Xq+Lkvjz7mPFOCP6
 m+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=tBBEmytLXFM37dKIZQcapj/jkLPWKqMT2/Th1Lx2bT8=;
 b=NUXRhgtHf3MOw3NhpgLJ1INACWAcWAAxCDxVSHEaJ6ZHCghkupOgvef/oIzR5ma+KK
 fCnn9pqKkvB8Y0b1bzePVw3vcprU5jB52XdjMcuC6/qfwLZJIwB4gnyadip4vMsQPN5/
 vqCzl8KLCQ0u09zsV92mz4KRxEE8pG8haw2fvgTG3L/fIVoq75FNTeDcZtMSnxkN8mIW
 0mQzfLVYCOTBBeHghFhubuB/EGIxVNrD0gVyTWjK6Q8GbxISvXRJVCKEDuAg9ze7rPed
 msGekLsb/3r4vEPCNOBdKHWdsPhkhVoY7Sh6byxpQ3OWlvZiXeDHIpri84+Rh/23qi+d
 axCg==
X-Gm-Message-State: AKaTC00RbSVZIbEW0dMjFRq25pZ2++zHj8sQ2rsER8wkW4b2CtQ6ahfxjIeKxvl1/Qu9WIOvJ399Mp57g/+aJg==
X-Received: by 10.157.45.166 with SMTP id g35mr8147907otb.223.1479727510931;
 Mon, 21 Nov 2016 03:25:10 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Mon, 21 Nov 2016 03:24:50 -0800 (PST)
In-Reply-To: <7060991b-bdd7-cf80-9450-5b658053643b@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-20-git-send-email-clg@kaod.org>
 <CACPK8XcN4uJ59hNj8ULJ-O9B-jk+W2xLBW5z2J6zFVmCcsuAAQ@mail.gmail.com>
 <7060991b-bdd7-cf80-9450-5b658053643b@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 21:54:50 +1030
X-Google-Sender-Auth: 6XPlvmLKjxJeMYAp-142ONbRfVg
Message-ID: <CACPK8XeKKYpcK=59GKOWOQc60YtAu_MkvQCGXXTRtdBh8tqNvQ@mail.gmail.com>
Subject: Re: [PATCH qemu 19/38] aspeed/smc: add support for DMAs
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 21 Nov 2016 11:25:14 -0000

On Mon, Nov 21, 2016 at 9:37 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> On 11/21/2016 08:25 AM, Joel Stanley wrote:
>> On Sat, Nov 19, 2016 at 12:51 AM, C=C3=A9dric Le Goater <clg@kaod.org> w=
rote:
>>> Some of SMC controllers on the Aspeed SoCs support DMA to access the
>>> flash modules. It can operate in a normal mode, to copy to or from the
>>> flash module mapping window, or in a checksum calculation mode, to
>>> evaluate the best clock settings for reads.
>>>
>>> When DMA is enabled, a DMA request is built and passed on to a bottom
>>> half to handle the memory transaction. The CPU is notified of the
>>> completion with an IRQ if it was enabled.
>>>
>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>> ---
>>>  hw/ssi/aspeed_smc.c | 234 ++++++++++++++++++++++++++++++++++++++++++++=
++++++--
>>>  1 file changed, 227 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>>> index 24c78aa57537..9596ea94a3bc 100644
>>> --- a/hw/ssi/aspeed_smc.c
>>> +++ b/hw/ssi/aspeed_smc.c
>>
>>> @@ -685,6 +697,202 @@ static uint64_t aspeed_smc_read(void *opaque, hwa=
ddr addr, unsigned int size)
>>>      }
>>>  }
>>>
>>> +typedef struct AspeedDmaCo {
>>> +    AspeedSMCState *s;
>>> +    int len;
>>> +    uint32_t flash_addr;
>>> +    uint32_t dram_addr;
>>> +    uint32_t checksum;
>>> +    bool direction;
>>> +} AspeedDmaCo;
>>
>> What does the "Co" part mean?
>
> For Coroutine.
>
> We could do without Coroutines but I think it makes the code a little
> cleaner when we spawn the DMAs to do the flash access or the checksum
> calculation.

Cool, that's what I thought. I agree, sounds like a good idea.

Cheers,

Joel
