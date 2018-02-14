Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::230; helo=mail-ua0-x230.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RmAm6IkJ"; 
 dkim-atps=neutral
Received: from mail-ua0-x230.google.com (mail-ua0-x230.google.com
 [IPv6:2607:f8b0:400c:c08::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhSmZ5VYHzF0q4
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 05:36:46 +1100 (AEDT)
Received: by mail-ua0-x230.google.com with SMTP id m43so1489622uah.1
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 10:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kDeaLDKzPz/epzcdrDP0NUshbMP1jADvB1euTxZWJuk=;
 b=RmAm6IkJzzumYvcpiWwwEwkKnccBL/g1hKVBzL1csLnrLY7Ua3uJvHUXlkYGdJ5uzn
 6vZbzWJm75SuUkvoiM9oyba3XK3vDWEi+4kwC6Qoe6cIvrS45EbVe9MxJtWNE0km0H5e
 A4QRriX5lVLAg/XetNNCnWnKoafUulGgRYRTJn6e9Rb+8dm6EaNO+dyYc+MLshVCqMln
 RWBXmLvRlk+xL+hkKIQkXbYGrveSDUm7k3+SzQDNkE3XrvQoSKbBO3QIWwMleowT6Rel
 cGGpCsRx2tC0DsEAX9eyA2FoQ3sriUEvoOOShUdN4A2GnCkR2XuDjypT8yQOSNjzA/Z3
 kF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kDeaLDKzPz/epzcdrDP0NUshbMP1jADvB1euTxZWJuk=;
 b=q/F4eiSgs6YoSjhOTo1YuI+i9nWGbte68rBn19mEPMny2Gr+6HGTzPqeSMp3SqhDQj
 9uptfzcl3VIFAQxVOopGlxE0atuyvXKxEQyQuApmHU7yE9gLt5Ds1BPrHgqdziEEjUNj
 eADJF8aQehl/qpWTsrXJV5Dksw7iMEX6eNZcjfIRrLI24VEVYOv0o7E13OfYpXPA1sHJ
 z2D35su/B9H14hAKckC4sqK2YYgwJqc+OMeS2bYlkkvsE0tzOBhCEOBdSt7VDbAxZdlf
 Ryvli39yE7x8rDRcM5ejIqD0kWVGP5g+4yMwKJE5RG9BjGiByTGFV5TTf2sPjI8l/HN5
 QOug==
X-Gm-Message-State: APf1xPAqalKPhm8nJRLgkZdNzvBmgUX3Dhd9+stqyINpDjAEouL+sxwf
 yd2B9Ybk/4XzclD4y6CcmvAg5igOyvd5nzazm3lYMA==
X-Google-Smtp-Source: AH8x224i3vHKPY/x+S7cVH4+OrWQ+GLQeVh2FzISGSAVxxw9cfKGdSOG7EnDmxxy2X3ndSDCfhhljLqCvltGFzM2vnc=
X-Received: by 10.159.59.41 with SMTP id i41mr185907uah.38.1518633403945; Wed,
 14 Feb 2018 10:36:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.167.207 with HTTP; Wed, 14 Feb 2018 10:36:23 -0800 (PST)
In-Reply-To: <CAARXrt=r8C5WvWKb33C4LDuJi9KW61aHp0G3+a3RzF7ArKe+Tg@mail.gmail.com>
References: <32335E8B-FAAF-4B96-9B2E-57FF1FAFDD1A@cisco.com>
 <CAARXrt=r8C5WvWKb33C4LDuJi9KW61aHp0G3+a3RzF7ArKe+Tg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 14 Feb 2018 10:36:23 -0800
Message-ID: <CAO=notwMecK=GhvVUtgeVUZFV38K71Q5SSF0TeCS0CxY2W+axw@mail.gmail.com>
Subject: Re: Porting hwmon sensors to openBMC
To: Lei YU <mine260309@gmail.com>
Cc: "Sachin Naik (sachnaik)" <sachnaik@cisco.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Feb 2018 18:36:47 -0000

Lei is correct. If you want, however, to read the sensors over IPMI
you'll need to add a yaml configuration for the sensors as well for
phosphor-host-ipmid.
See https://github.com/openbmc/openbmc/blob/master/meta-openbmc-machines/me=
ta-x86/meta-quanta/meta-q71l/recipes-phosphor/ipmi/q71l-ipmi-sensor-map/con=
fig.yaml
for an example.

On Tue, Jan 23, 2018 at 11:04 PM, Lei YU <mine260309@gmail.com> wrote:
> On Tue, Jan 23, 2018 at 3:33 PM, Sachin Naik (sachnaik)
> <sachnaik@cisco.com> wrote:
>> Hi All
>>
>> I am porting a new board to openbmc.
>> I have question on mapping hwmon type sensors to Dbus
>>
>> So far I have created machine layer and added U-boot config, Kernel conf=
ig and device tree. In kernel config I have enabled lm75 hwmon driver for L=
M75 temperature device. Corresponding entry added in device tree.
>>
>> Right now I have created hwmon temperature sensors entry in our machine =
layer by extending recipes-phosphor/sensors/phosphor-hwmon%.bbappend
>> and created conf file with temperature sensors label.
>>
>> Now my question is how do implement/map dbus temperature sensor value in=
terface to our hwmon temperature sensors? Is above implementation is enough=
 or it requires
>> Some mapping for dbus to hwmon instance?
>
> After you added config files for the temperature sensors with
> phosphor-hwmon%.bbappend, phosphor-hwmon will read from
> hwmon instance and create dbus objects at
> /xyz/openbmc_project/sensors/, which will at least have "Value",
> =E2=80=9CScale" and "Unit" properties.
>
> I do not think it requires other configs, unless I misunderstand
> your case?
>
>>
>> Thanks and regards
>> Sachin
>>
>>
