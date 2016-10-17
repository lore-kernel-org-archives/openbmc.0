Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x242.google.com (mail-vk0-x242.google.com
 [IPv6:2607:f8b0:400c:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3syC9H6nBwzDvJY
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 20:10:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=jgo6wRNs; 
 dkim-atps=neutral
Received: by mail-vk0-x242.google.com with SMTP id 2so7577150vkb.1
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 02:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=mT0VJwvz/0Y7Pt0AD+6Uwo/eG6zAsAfR/8a5uaAiCYo=;
 b=jgo6wRNs81LfvFbviod4zecrW/L4a72GIuCZT3VMM52Z8LukWG5tKRpeyXuJEe581k
 RA8Ncrzfgf9Curj75/JFWVL3VGvj3obfYYw0KbqZSEfwZInCtVm3eA985awjqV2fukLN
 QPYte1qIEKkQkdQhvGwqhpSRoB46SdRTtBk+1Fqyk73M2tlnW6cMDkSzpDhADlIVbuGv
 VHSu5nEAgRhyHpWGNIbfXjsa998lNPsVGY+5yoV0TowYF8fkKTumH4Wc6nTSdnQZPguR
 0cyaTPCpWErBIO/sRxElHBEdKAmKHBuLLGtonqfW1A5caJMZCxShfHD2HTkCSiGxmkb/
 59fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=mT0VJwvz/0Y7Pt0AD+6Uwo/eG6zAsAfR/8a5uaAiCYo=;
 b=L6kSj1AvXhzmGrJDTtiTwBYdINg8tLwMRIdlmR6vkWlqpsdp23QTGf+2doRidFdIWJ
 uz2pdmfBXOP/l9qc/lNEAfbM+UYQXwIWD+KZFzVJ1wA1ZqfC4j0M2b6wPVZtjQor8sAs
 F8Tf3rX2lsnp6jodYpjWpQFRN5wXTWsgI/IHR+0Oyk2/mq7q6jS24uT+QaqMtBxWtyA9
 5R4tQvbl5j1V5uu6c4JnPK3l6Xi2ET8RjpMXUJ7qTA9tl36+Gj5zuJKaM6j75I30fUnk
 b6wfWg0I/ecLHRPl/InNQfu8YvB42KX8xC2rIln3FsP0pikyp2YGbYDUNIO56m7eYpJc
 dSkA==
X-Gm-Message-State: AA6/9RnTjDhCmB5hgy0JD31EQI/C4t0EoyVzDQbSp12GVfUxDcuy878GpzjWoBz2LPTCE1sJZvC5IQzmmwD+7A==
X-Received: by 10.31.138.143 with SMTP id m137mr2657594vkd.148.1476695441511; 
 Mon, 17 Oct 2016 02:10:41 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Mon, 17 Oct 2016 02:10:21 -0700 (PDT)
In-Reply-To: <15dbb415-1b10-da15-ede9-184e99304ab3@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
 <1476448684-6149-13-git-send-email-clg@kaod.org>
 <CACPK8Xf0sLXLkfV_rGVZ6ppLN0590d3TTugYCTrT4sMNe5XBAA@mail.gmail.com>
 <15dbb415-1b10-da15-ede9-184e99304ab3@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Oct 2016 19:40:21 +1030
X-Google-Sender-Auth: _jLPrdYX_tUkxLKKTfHMoxmiePc
Message-ID: <CACPK8XdpcR354-1=PW8YEz1FL5P9g+gNua7wCiqpTEJTB6Dsuw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 12/12] mtd: spi-nor: aspeed: use fast read
 when doing DMAs
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Milton Miller <miltonm@us.ibm.com>
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
X-List-Received-Date: Mon, 17 Oct 2016 09:10:44 -0000

On Mon, Oct 17, 2016 at 5:12 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> Hello Joel,
>
> On 10/17/2016 07:04 AM, Joel Stanley wrote:
>> On Fri, Oct 14, 2016 at 11:08 PM, C=C3=A9dric Le Goater <clg@kaod.org> w=
rote:
>>> Try to improve the speed of transfers when doing DMAs
>>
>> This could get squashed into the DMA adding patch I think.
>
> If you haven't pushed yet, you can drop this one, it does not
> change anything in fact.
>
> I am currently looking at introducing some timing support
> to speed up reading on the SPI, like pflash does and I am
> shuffling the code quite a lot to isolate the different settings.
>
>
> Just to say they are more changes to come to cleanup the driver.

Okay, great.

I will hold off merging the patches for a little white. We will need
to commit them some time this week though. If they are not the final
version then that is okay.

Once you have something ready for upstream, we should cc Ben H (who as
you know wrote pflash) for his thoughts. We need to do that this week
as he won't have much time next week.

Cheers,

Joel
