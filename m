Return-Path: <SRS0=NZc7=JS=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F1CC433ED
	for <openbmc@archiver.kernel.org>; Wed, 21 Apr 2021 19:19:26 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44D5661454
	for <openbmc@archiver.kernel.org>; Wed, 21 Apr 2021 19:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44D5661454
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQVjR3Cbgz3035
	for <openbmc@archiver.kernel.org>; Thu, 22 Apr 2021 05:19:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=gzHkcvIu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::431;
 helo=mail-wr1-x431.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=gzHkcvIu; dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQVj12f3Kz2y0C
 for <openbmc@lists.ozlabs.org>; Thu, 22 Apr 2021 05:18:59 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id e7so33468985wrs.11
 for <openbmc@lists.ozlabs.org>; Wed, 21 Apr 2021 12:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fFL5I4rtWL1K/Fk9smbyAlRoltAjTkM7vrzPwNWNqY0=;
 b=gzHkcvIun8plpR9a5fXrCNqU/hheQD3q5bArA6Qv0ZCFBNo3/b8KZwyG6i6w17NU6S
 pPg9Qa9xCVUmSrA7jGszG3Mvo6nBB7M2PGxgsz3RZgIn++ve2wN/3cZqiuQli6n0ZvLF
 ZTtFn4uMrb1h1gpjiDfsaUwljCYtLmsn3Kcf0GVfXJhp6YUic6f0px8PRVNZU542siTN
 EBpFZOS6MmMv5cJUvVHuQEXSGnZ319nIE8JGLnx1aYxeUFoCwP/Tn7NvWeTa3+7Q4NZh
 KAwgpJQ78yx46vECcimzV8XnksTI485RFN0Ja2v6bl4HgKPuFKK5i560dzIrM4ryMPlW
 CknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fFL5I4rtWL1K/Fk9smbyAlRoltAjTkM7vrzPwNWNqY0=;
 b=SG1A3YTgLCuOvGugZ/txQNIRJvtfh+eXKfOoNGtagDM1Qt1tnm+IBvb89TF7d9nXUI
 3IPw1B/3egPLGIagEPhVdLD56Qf/wYjNUaHfGpJokkRUbE+10fCLp5YjYE/jAP12FhYl
 uGdwmk656fZgAlD0gnHan46+e57fw4uBcaNOdy3QI/8u7MLBIOo9yHYKUG2z1ZAaNkHg
 7qPydhL4Oif0qII1pBhokmwXnluTdfiiexmgp3PD8xUFOuL9yL/aU70uyacv2PH2E3oI
 ZjymcX4vOawo87veblnz3MWZ1biM+HtDzqxjc6IN0sFv4BYqI5nR+NwOFCCpwBs8p++y
 pd0g==
X-Gm-Message-State: AOAM531cTVxmL4Z8OLPqSofaAqZZaipLwTIeOAZ551Db/0NywblVBzeQ
 vwXQ3za2/GgpjWUG6XlG0FonjDJo53JbEBQ4J3m6KjNsyhpTBnhL
X-Google-Smtp-Source: ABdhPJxaTlYD2aaSL8tZ7SR7nv2UyfFStly/c2T6I6MRA75sg50Qa0jcgQFktz7PfjWBC7eX2uzpy+64OGeKy+eDJtA=
X-Received: by 2002:a05:6000:1204:: with SMTP id
 e4mr28716266wrx.424.1619032732786; 
 Wed, 21 Apr 2021 12:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR01MB47582E93CAFD772A1EF5E5649E4E9@BYAPR01MB4758.prod.exchangelabs.com>
In-Reply-To: <BYAPR01MB47582E93CAFD772A1EF5E5649E4E9@BYAPR01MB4758.prod.exchangelabs.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 21 Apr 2021 12:18:41 -0700
Message-ID: <CAH2-KxDj6CnRAXWFzkKThEW4KfXjVdVrgF40ROQ-RrB_XnPn_g@mail.gmail.com>
Subject: Re: entity-manager FruDevice & eeprom questions
To: "Srinivasan, Usha" <usha.srinivasan@cornelisnetworks.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, Apr 14, 2021 at 2:04 PM Srinivasan, Usha
<usha.srinivasan@cornelisnetworks.com> wrote:
>
> Hello.
>
> This is my first-time using entity-manager for inventory & the ability to=
 create one binary image with different json files for different platform c=
onfigurations.
>

Can you put your patches up somewhere we can see them (ideally gerrit
as a WIP).  That'll help us a lot in helping you troubleshoot.

>
>
> But, first, I am trying to initialize the eeprom on my development board =
and have it picked up by FruDevice.
>
> I defined the eeprom in my dts file but as 24lc128 so at24 driver didn=E2=
=80=99t pick it up but that allowed me to use i2ctransfer to initialize the=
 eeprom contents.
> I initialized the eeprom contents following the layout in this doc:

Technically you don't have to declare your eeproms in your dts if you
don't want to, but it doesn't hurt anything to have them there.

> https://www.intel.com/content/dam/www/public/us/en/documents/product-brie=
fs/platform-management-fru-document-rev-1-2-feb-2013.pdf
> I fixed the dts file to define the eeprom using generic =E2=80=9C24c128=
=E2=80=9D and now at24 is picking it up and I see:
> ls /sys/bus/i2c/devices/8-0051/
> 8-00510    eeprom     name       subsystem
> driver     modalias   of_node    uevent
>
> cat /sys/bus/i2c/devices/8-0051/name
>
> 24c128
>
> But I also see this:
> ls /sys/bus/i2c/devices/8-0051/8-00510/
> nvmem      of_node    subsystem  type       uevent
> In the json file for entity manager I have:
>
>         {
>
>             "Address": "0x51",
>
>             "Bus": 8,
>
>             "Name": "CN FRU EEPROM",
>
>             "Type": "EEPROM"
>
>         },
>
> But, FruDevice fails looking for "/etc/fru/baseboard.fru.bin".

FruDevice is set up (by default) to have the BMC store the baseboard
fru itself for ID 0.  That file can be written by using ipmitool (or
your favorite ipmi client) to write the content to fru ID 0.

>
> Questions:
>
> Can someone who has used entity-manager & FruDevice explain the reading/p=
rocessing of the contents of the eeprom & the of "/etc/fru/baseboard.fru.bi=
n=E2=80=9D or in other words, what am I doing wrong that FruDevice won=E2=
=80=99t get off the ground?

Hard to say without seeing your config files;  The above looks right.

> Is there a recommended method for how to initialize the eeprom in manufac=
turing?

I don't know of any such "recommended" method, every manufacturing
line seems to have its own flow and requirements.

> Has someone developed a script or an application which given the importan=
t pieces of info(see pdf above) formats the contents of the eeprom?

Fru device makes the "important" sections of the fru available on dbus.

> In general, does one define the eeprom in the dts as well as in the entit=
y-manager json?

Hard to make a general rule here, there are cases of both.  If EM
detects the device already exists, it won't try to create it a second
time.

>
>
>
> Thanks,
> Usha
>
>
>
>
>
> __________________________
>
> Usha Srinivasan
> Embedded Software Engineer
> Cornelis Networks
>
> 1500 Liberty Ridge Dr
>
> Chesterbrook, PA, 19087
>
> 484-498-8425
>
> 610-703-8475 (cell)
>
>
