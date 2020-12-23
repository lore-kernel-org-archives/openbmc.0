Return-Path: <SRS0=v2cC=F3=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 790CEC433DB
	for <openbmc@archiver.kernel.org>; Wed, 23 Dec 2020 16:56:13 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCF682229C
	for <openbmc@archiver.kernel.org>; Wed, 23 Dec 2020 16:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCF682229C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D1K954CrtzDqQB
	for <openbmc@archiver.kernel.org>; Thu, 24 Dec 2020 03:56:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=dhruvaraj@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ViA0Px33; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D1K7g2SNjzDqDd
 for <openbmc@lists.ozlabs.org>; Thu, 24 Dec 2020 03:54:51 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id l23so82531pjg.1
 for <openbmc@lists.ozlabs.org>; Wed, 23 Dec 2020 08:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=c4PpWyo32IpEBzau40djgzDQ9FsBe4bS8q2DUVvOE3E=;
 b=ViA0Px33FIoiDeww6J0g9gvtEO2opdWUpBGMuWBbJ0OzjUtPYVjZLuERJChMKU6MMS
 vdCEaSye0fTGgnV7jyt0h6posjp+9WEcpsheSv+501nKLt7HhlxT37UoWixRCoB03K+9
 m6un0hYLuRTWksvrbcSkQfbDdeWjK4fpk+p8njGNi+2h+V1UQ5NKqFxnp+vgSY6zZ6s8
 HsT4zcIFL/yqA+hD3UrSuc9Z7C1WUmFngcYwahvZFLtqa3JLd4AbsnE6zi7FVnyjdx1f
 oHrjZenkdDUij9N+RbyH41qFJEnB5osR92WJ5tgdKt6nmuqLgtQnH1Tj1Pzkv5cAMue+
 hTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c4PpWyo32IpEBzau40djgzDQ9FsBe4bS8q2DUVvOE3E=;
 b=L0DjupqgGCs90WjtVDu+Up9JVzKSH4B0qsJfbfJmbnpdYSSrzcJrOwQfoq5arcGdvB
 OtSqHhQmjbu6LCs/B/0MkohF3OScHLiQDaKCsfdoj9nckHADfXvKf2bAhl1v10NCT25m
 gveSZ2+mqQYFUEV0yYOE0hpoI/znbilqMrHe71DOWr3yRsXZrqLw39MVDhIMfJe7kmfs
 fZID/8Fney80ohcIl1MnM1Fp9M7Mp30pl+ZA8e39X/M5hO+7WMSKxG1peaTs1M1khg8i
 Rl585FC0lYWUJOqdqYWhSlZd/uFJLrbeA/dY0WZiyTT3fO81B8v7gtSzbiW8FTJTQ4vL
 46Mw==
X-Gm-Message-State: AOAM53113kqAm5kutzpslGxDEhpvwIlq8TiUQQxadIT0vFJ2PWMIR/Xb
 j7qa6sWsbvTqMtA992u8Y6IKAx4CTNr8IDJpSJA=
X-Google-Smtp-Source: ABdhPJxEmQpNeP3+GGwT49MLUt3dZGPKkoKu0WspB8umdWme7AOjVTv9BJHGuZhPbln7I/uPzWzkm7DmIXW2RUBIaLM=
X-Received: by 2002:a17:90a:9f44:: with SMTP id
 q4mr550475pjv.226.1608742487635; 
 Wed, 23 Dec 2020 08:54:47 -0800 (PST)
MIME-Version: 1.0
References: <CAK7WosgZtEj_fp_Jx8rqWKHJb7AF8cPHR-_33jo_5vQx645_Bg@mail.gmail.com>
 <CACWQX8050TCOT8z5efOWQ_q7b9Ucqv6+w1X1J1NRwba9AGKq8g@mail.gmail.com>
 <e925631f-54db-ae7e-21c2-3d1600349299@linux.vnet.ibm.com>
In-Reply-To: <e925631f-54db-ae7e-21c2-3d1600349299@linux.vnet.ibm.com>
From: dhruvaraj S <dhruvaraj@gmail.com>
Date: Wed, 23 Dec 2020 22:24:36 +0530
Message-ID: <CAK7WosiXL8pW59CEvo2Xh0KCOJutrXq7rgOwA6p7eUvKowZXJQ@mail.gmail.com>
Subject: Re: Proposal for operations on isolated hardware units using Redfish
 logging
To: Gunnar Mills <gmills@linux.vnet.ibm.com>
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 openbmc <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

HI,

Updated, instead of using LogService.CollectDiagnosticDatato manually
isolate the hardware, new proposal is to  set the property
ReadyToRemove to True"
redfish =C2=BB v1 =C2=BB Systems =C2=BB system =C2=BB Processors =C2=BB CPU=
1
{
  "@odata.type": "#Processor.v1_7_0.Processor",
  "Id":view details "CPU1",
  "Name": "Processor",
   "Socket": "CPU 1",
  "ProcessorType": "CPU",
  "ProcessorId":
   {
       "VendorId": "XXXX",
       "IdentificationRegisters": "XXXX",
   } ,
   "MaxSpeedMHz": 3700,
   "TotalCores": 8,
   "TotalThreads": 16,
   "Status":
   {
        "State": "Enabled",
        "Health": "OK"
       "ReadyToRemove": "True" <---
    } ,
"@odata.id":view details "/redfish/v1/Systems/system/Processors/CPU1"
}

On Fri, Dec 11, 2020 at 9:42 PM Gunnar Mills <gmills@linux.vnet.ibm.com> wr=
ote:
>
> On 12/10/2020 10:29 AM, Ed Tanous wrote:
> > On Thu, Dec 10, 2020 at 7:49 AM dhruvaraj S <dhruvaraj@gmail.com> wrote=
:
> >>
> >>
> >> Listing isolated hardware units.
> >> redfish >> v1 >> Systems >> system >> LogServices >> IsolatedHardware =
>> Entries
> >> {
> >>    "@odata.id": "/redfish/v1/Systems/system/LogServices/IsolatedHardwa=
re/Entries",
> >>    "@odata.type": "#LogEntryCollection.LogEntryCollection",
> >>    "Description": "Collection of Isolated Hardware Components",
> >>    "Members": [
> >>      {
> >>        "@odata.id":
> >> "/redfish/v1/Systems/system/LogServices/IsolatedHardware/Entries/1",
> >>        "@odata.type": "#LogEntry.v1_7_0.LogEntry",
> >>        "Created": "2020-10-15T10:30:08+00:00",
> >>        "EntryType": "Event",
> >>        "Id": "1",
> >>        "Resolved": "false",
> >
> > LogEntry doesn't have a "Resolved" field that I can see.
>
> Part of Redfish's 2020.4. Matches OpenBMC's
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/05dd96872560bc6f=
11616be48b1873f539904142/xyz/openbmc_project/Logging/Entry.interface.yaml#L=
29
>
> >
> >>        "Name": "Processor 1",
> >>        "links":  {
> >>                   "OriginOfCondition": {
> >>                          "@odata.id":
> >> "/redfish/v1/Systems/system/Processors/cpu1"
> >>                      },
> >>        "Severity": "Critical",
> >>         "SensorType" : "Processor",
> >
>
>


--=20
--------------
Dhruvaraj S
