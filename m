Return-Path: <mine260309@gmail.com>
Received: from mail-io0-x241.google.com (mail-io0-x241.google.com
 [IPv6:2607:f8b0:4001:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wSHJl2lQHzDq9m
 for <openbmc@lists.ozlabs.org>; Wed, 17 May 2017 11:48:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Chjlr/dI"; 
 dkim-atps=neutral
Received: by mail-io0-x241.google.com with SMTP id f102so166337ioi.3
 for <openbmc@lists.ozlabs.org>; Tue, 16 May 2017 18:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=doETI3+RTFP0SVF/A+jOk9vBCpjQmuNfI91bVCKi2L4=;
 b=Chjlr/dIPj/+2ZW+ofjOOUR/slw8xnI071al2YdkaqGg0ZDVJgChgtYVkVanpKbP0s
 xlkPITDZTMMmCbXd6dYKwtuf8K9RIM3SUJqtD35jzEdjBI5HwxvMlYAd25aWFOZM3OGF
 iBw5Qx2I+bahPUUqxqkQikH7ha3ZRwPIaw1p7CcGoB4bIDKLFvCgt11TQbdEFismIPAr
 QcbRCNn+XQAyAaqdRk0QQW6TOFh/Wmfu9uQydOHOuwADBTqYp1UB9S8PR6k2m+ZRUm7d
 /D1ggW91Lcs2wZ9PTeO9hanfIHGUFyvcRmiSkckr+MUA25qnj4Isc8Uo+mtiYlFg1Wva
 tdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=doETI3+RTFP0SVF/A+jOk9vBCpjQmuNfI91bVCKi2L4=;
 b=Joi+CcLIw5prQEosiKolmnaCLsh9kIYsUiihh7e/96WjnVMp8oqW3KJYgFYapUmATA
 mQITGcfHPVE1qixx0cEst6nEzIrwt6EnMzOYwM5wKOihtq1zagOSdWow1s5x22IX/t7+
 S/RQY3bSlw7oBSxMS5SPZ68yhCf77xB/a/PBuaxTGj/HUZPPSdHFvu5gW6JamoycpzQb
 MyQHcQsbkv1movAanPOHr90gj0kEz8WuAnPl9NtUp1+teLUcnZHa3Rw/UcSFqdaziibf
 qg45a4zJM+UzVbHzoJQDGBdvv02x8x2yOd+9/TsOdF5B3g5ht/8kiG8bME0umbtohB3k
 P/pw==
X-Gm-Message-State: AODbwcB9VfL3VAV/dwqCQNv4f5EJKp84lCQ4nmhZKc+8kr2xvV9X9G1h
 DCI3BXvhUVfHal/B8VlnB3hjn7kWyw==
X-Received: by 10.107.169.207 with SMTP id f76mr923107ioj.71.1494985685126;
 Tue, 16 May 2017 18:48:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.150.10 with HTTP; Tue, 16 May 2017 18:48:04 -0700 (PDT)
In-Reply-To: <7de4ad45-f675-b691-f3de-b7c02c5e5bfd@kaod.org>
References: <1493913487-7482-1-git-send-email-anoo@linux.vnet.ibm.com>
 <14B306E8-EFC9-4BD5-B2DD-D892CB459439@linux.vnet.ibm.com>
 <CACPK8XeNtDWLmx2qeHshd=Bg4JCNLd45CriVYLuNmGOMb-qqdg@mail.gmail.com>
 <f47cd08e-5ceb-5d41-4975-d689d2ebba3b@kaod.org>
 <7B0513B8-3B71-42AD-B9D5-2F05E7B000C2@linux.vnet.ibm.com>
 <3a8ba892-7560-a028-2441-61fe546792ed@kaod.org>
 <D4C24912-6520-4ECB-B80C-B13D1D3515AB@linux.vnet.ibm.com>
 <7de4ad45-f675-b691-f3de-b7c02c5e5bfd@kaod.org>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 17 May 2017 09:48:04 +0800
Message-ID: <CAARXrt=zd2H+4Xq+EwsqF=22RJsY3XpCP3pGeYpao3XkakFCQw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] arm: configs: aspeed: Disable
 CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 17 May 2017 01:48:08 -0000

On Tue, May 16, 2017 at 9:59 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> On 05/16/2017 03:30 PM, Adriana Kobylak wrote:
>>
>>> On May 16, 2017, at 1:01 AM, C=C3=A9dric Le Goater <clg@kaod.org <mailt=
o:clg@kaod.org>> wrote:
>>>
>>> On 05/15/2017 02:41 AM, Adriana Kobylak wrote:
>>>>
>>>>> On May 13, 2017, at 3:49 PM, C=C3=A9dric Le Goater <clg@kaod.org <mai=
lto:clg@kaod.org>> wrote:
>>>>>
>>>>> On 05/11/2017 02:12 PM, Joel Stanley wrote:
>>>>>> On Thu, May 11, 2017 at 7:31 AM, Adriana Kobylak
>>>>>> <anoo@linux.vnet.ibm.com <mailto:anoo@linux.vnet.ibm.com>> wrote:
>>>>>>> Milton stopped by and mentioned that you had tried to modify the 4K=
 erase
>>>>>>> sector previously for a perhaps bmc chip and saw some flash corrupt=
ion when
>>>>>>> moving to an image that changed it?
>>>>>>>
>>>>>>> Just wanted to add that this change only changes the pnor setting a=
nd I
>>>>>>> didn=E2=80=99t see any issues powering on a system after updating t=
he BMC with an
>>>>>>> image with this change. Then I updated the pnor with an image that =
had the
>>>>>>> mbox enabled. Also checked with AndrewJ and the hostboot team and t=
here=E2=80=99s no
>>>>>>> hard-coded assumptions in their side about the erase size.
>>>>>>>
>>>>>>> With all this info let me know if you have any thoughts or concerns=
.
>>>>>>
>>>>>> I recall issues relating to this option. I didn't record what they w=
ere
>>>>>> though.
>>>>>
>>>>> We tried to activate 4K erase on some chips, which supported it,
>>>>> and that the OpenPOWER systems use. That was because the PNOR
>>>>> sections were not aligned with the erase size and that caused
>>>>> some issues in pflash. But it breaks the compatibility with
>>>>> previously created jffs2 filesystems. jffs2 stores the erase
>>>>> size. So we stepped back.
>>>>>
>>>>>> Cedric, can you remind me what the issues are with the 4K kconfig op=
tion?
>>>>>
>>>>> CONFIG_MTD_SPI_NOR_USE_4K_SECTORS enables the 4K erase commands,
>>>>> and without it, the driver will use the sector erase command, most
>>>>> likely 64K. I suppose we could have the same problem as described
>>>>> above, as it can change the default erase size of a chip. to be
>>>>> checked.

The same question as Cedric, PNOR has sections that are not 64K
aligned but 4K aligned,
e.g. HBEL, GARD:
ID=3D02            HBEL 000a0000..000c4000 (actual=3D00024000) [ECC]
ID=3D03           GUARD 000d0000..000d5000 (actual=3D00005000) [ECC]

When using gard tool to clear GARD partition, it will fail if erasing
size is 64K.

Do we have a plan to support this case?

>>>>>
>>>> Thanks Cedric for the info. It appears there are no issues when
>>>> disabling the 4K sectors for the pnor chip (yes, the erase size
>>>> is then 64K), probably because the pnor is not formatted with
>>>> a jffs2 filesystem. We might need to clear the pnor chip anyways
>>>> to be able to format it as a UBI volume. So would you say we=E2=80=99r=
e
>>>> ok with this patch?
>>>
>>> Well, what if the BMC is using a flash module with a 4K erase size ?
>>
>> All the mtd devices except PNOR in the P8 and P9 systems running openbmc
>> have already an erase size of 64K.
>
> So everything is fine for these.
>
> Cheers,
>
> C.
>
>
>> Ex witherspoon:
>> root@witherspoon:~# cat /proc/mtd
>> dev:    size   erasesize  name
>> mtd0: 02000000 00010000 "bmc"
>> mtd1: 00060000 00010000 "u-boot"
>> mtd2: 00020000 00010000 "u-boot-env"
>> mtd3: 00440000 00010000 "kernel"
>> mtd4: 01740000 00010000 "rofs"
>> mtd5: 00400000 00010000 "rwfs"
>> mtd6: 02000000 00010000 "alt"
>> mtd7: 08000000 00001000 =E2=80=9Cpnor=E2=80=9D
>>
>> Ex barreleye:
>> root@barreleye:~# cat /proc/mtd
>> dev:    size   erasesize  name
>> mtd0: 02000000 00010000 "bmc"
>> mtd1: 00060000 00010000 "u-boot"
>> mtd2: 00020000 00010000 "u-boot-env"
>> mtd3: 00440000 00010000 "kernel"
>> mtd4: 01740000 00010000 "rofs"
>> mtd5: 00400000 00010000 "rwfs"
>> mtd6: 04000000 00001000 "pnor"
>>
>>>
>>> C.
>>
>
